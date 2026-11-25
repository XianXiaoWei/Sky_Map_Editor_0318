"""Address-safe, SHA-gated inspection of the supplied x64 Mach-O executable.

Function boundaries come from LC_FUNCTION_STARTS, rather than prologue searches.
This module does not execute the original program.
"""
import bisect
import hashlib
import pathlib
import struct
import capstone
from capstone.x86 import X86_OP_IMM, X86_OP_MEM, X86_REG_RIP

SHA256 = '3fa493e2542638299fd54d64e1b62aeb5b81c8f290176d955c3e38a27fa72b20'


class Native:
    def __init__(self, path):
        self.data = pathlib.Path(path).read_bytes()
        self.digest = hashlib.sha256(self.data).hexdigest()
        if self.digest != SHA256:
            raise ValueError('Requires the original supplied Sky 0.3.18 executable')
        self.segments, self.sections, self.symbols = [], [], {}
        self.by_address, self.starts = {}, []
        at, table, functions, indirect = 32, None, None, None
        stubs = []
        for _ in range(struct.unpack_from('<I', self.data, 16)[0]):
            cmd, size = struct.unpack_from('<II', self.data, at)
            if cmd == 0x19:
                name = self.data[at + 8:at + 24].split(b'\0')[0].decode()
                vm, vs, fo, fs = struct.unpack_from('<4Q', self.data, at + 24)
                self.segments.append((name, vm, fo, fs))
                for i in range(struct.unpack_from('<I', self.data, at + 64)[0]):
                    p = at + 72 + i * 80
                    sn = self.data[p:p + 16].split(b'\0')[0].decode()
                    addr, length = struct.unpack_from('<QQ', self.data, p + 32)
                    self.sections.append((sn, addr, length))
                    flags, reserved1, reserved2 = struct.unpack_from('<III', self.data, p + 64)
                    if flags & 255 == 8:
                        stubs.append((addr, length, reserved1, reserved2))
            elif cmd == 2:
                table = struct.unpack_from('<4I', self.data, at + 8)
            elif cmd == 0x26:
                functions = struct.unpack_from('<II', self.data, at + 8)
            elif cmd == 0xb:
                indirect = struct.unpack_from('<II', self.data, at + 56)
            at += size
        symoff, count, stroff, _ = table
        symbol_names = []
        for i in range(count):
            strx, typ, sec, desc, value = struct.unpack_from('<IBBHQ', self.data, symoff + i * 16)
            name = self.data[stroff + strx:self.data.index(0, stroff + strx)].decode(errors='replace')
            symbol_names.append(name)
            if value:
                self.symbols[name] = value
                self.by_address[value] = name
        if indirect:
            indirect_offset, indirect_count = indirect
            for addr, length, first, stride in stubs:
                for i in range(length // stride):
                    index = struct.unpack_from('<I', self.data, indirect_offset + (first + i) * 4)[0]
                    if index < len(symbol_names):
                        self.by_address[addr + i * stride] = symbol_names[index]
        p, length = functions
        end = p + length
        address = next(vm for name, vm, fo, fs in self.segments if name == '__TEXT')
        while p < end:
            delta, shift = 0, 0
            while True:
                byte = self.data[p]; p += 1
                delta |= (byte & 127) << shift
                if byte < 128:
                    break
                shift += 7
            if not delta:
                break
            address += delta
            self.starts.append(address)
        self.cs = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64)
        self.cs.detail = True

    def offset(self, address):
        return next(fo + address - vm for name, vm, fo, size in self.segments if vm <= address < vm + size)

    def read(self, address, size):
        p = self.offset(address)
        return self.data[p:p + size]

    def string(self, address):
        try:
            p = self.offset(address)
        except StopIteration:
            return None
        end = self.data.find(b'\0', p, p + 4096)
        s = self.data[p:end] if end >= 0 else b''
        return s.decode() if s and all(32 <= c < 127 for c in s) else None

    def bounds(self, address):
        i = bisect.bisect_right(self.starts, address) - 1
        if i < 0 or i + 1 >= len(self.starts):
            raise ValueError('No function boundary for address')
        return self.starts[i], self.starts[i + 1]

    def instructions(self, address, code_end=None):
        start, end = self.bounds(address)
        if code_end is not None:
            if not start < code_end <= end:
                raise ValueError('Explicit code end must be inside the native function')
            end = code_end
        instructions = list(self.cs.disasm(self.read(start, end - start), start))
        if not instructions or instructions[-1].address + instructions[-1].size != end:
            raise ValueError(f'Incomplete disassembly at {start:#x}; inspect boundary manually')
        return instructions

    def annotated(self, address, code_end=None):
        lines = []
        for ins in self.instructions(address, code_end):
            refs = []
            for op in ins.operands:
                target = None
                if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP:
                    target = ins.address + ins.size + op.mem.disp
                elif op.type == X86_OP_IMM and ins.mnemonic in ('call', 'jmp'):
                    target = op.imm
                if target is None:
                    continue
                label = self.by_address.get(target) or self.string(target)
                if not label:
                    try:
                        pointer = struct.unpack('<Q', self.read(target, 8))[0]
                        if pointer in self.by_address:
                            label = f'-> {pointer:#x} {self.by_address[pointer]}'
                    except StopIteration:
                        pass
                refs.append(f'{target:#x}' + (f' {label}' if label else ''))
            lines.append(f'{ins.address:#x}: {ins.mnemonic} {ins.op_str}' + (' ; ' + ' | '.join(refs) if refs else ''))
        return '\n'.join(lines) + '\n'
