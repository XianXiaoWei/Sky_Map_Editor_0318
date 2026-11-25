0x100a6ede0: push rbp
0x100a6ede1: mov rbp, rsp
0x100a6ede4: push r15
0x100a6ede6: push r14
0x100a6ede8: push r13
0x100a6edea: push r12
0x100a6edec: push rbx
0x100a6eded: sub rsp, 0x18
0x100a6edf1: mov r13, rdi
0x100a6edf4: mov eax, dword ptr [r13 + 0x5c]
0x100a6edf8: cmp eax, dword ptr [r13 + 0x58]
0x100a6edfc: jae 0x100a6efef
0x100a6ee02: inc eax
0x100a6ee04: mov dword ptr [r13 + 0x5c], eax
0x100a6ee08: mov rbx, qword ptr [r13 + 0x68]
0x100a6ee0c: mov eax, 0xffffffff
0x100a6ee11: mov r8d, 0xffffffe0
0x100a6ee17: nop word ptr [rax + rax]
0x100a6ee20: inc eax
0x100a6ee22: mov edi, dword ptr [rbx + rax*4]
0x100a6ee25: add r8d, 0x20
0x100a6ee29: cmp edi, -1
0x100a6ee2c: je 0x100a6ee20
0x100a6ee2e: mov r9d, eax
0x100a6ee31: mov ecx, edi
0x100a6ee33: not ecx
0x100a6ee35: bsf ecx, ecx
0x100a6ee38: mov edx, 1
0x100a6ee3d: shl edx, cl
0x100a6ee3f: or edi, edx
0x100a6ee41: mov dword ptr [rbx + r9*4], edi
0x100a6ee45: or r8d, ecx
0x100a6ee48: mov rcx, qword ptr [r13 + 0x60]
0x100a6ee4c: lea r15, [r8 + r8*4]
0x100a6ee50: shl r15, 4
0x100a6ee54: mov qword ptr [rcx + r15 + 0x20], 0
0x100a6ee5d: mov qword ptr [rcx + r15 + 0x30], 0
0x100a6ee66: mov qword ptr [rcx + r15 + 0x28], 0
0x100a6ee6f: mov qword ptr [rcx + r15 + 0x40], 0
0x100a6ee78: mov qword ptr [rcx + r15 + 0x38], 0
0x100a6ee81: mov qword ptr [rcx + r15 + 0x48], 0
0x100a6ee8a: mov qword ptr [rcx + r15 + 0x18], 0
0x100a6ee93: mov qword ptr [rcx + r15 + 0x10], 0
0x100a6ee9c: mov qword ptr [rcx + r15 + 8], 0
0x100a6eea5: lea rdi, [rip + 0x1cae04] ; 0x100c39cb0
0x100a6eeac: mov qword ptr [rcx + r15], rdi
0x100a6eeb0: mov dword ptr [rcx + r15 + 0x20], 0xffffffff
0x100a6eeb9: mov word ptr [rcx + r15 + 0x34], 0
0x100a6eec1: mov qword ptr [rcx + r15 + 0x2c], 0
0x100a6eeca: mov qword ptr [rcx + r15 + 0x24], 0
0x100a6eed3: cmp dword ptr [r13 + 0x58], r8d
0x100a6eed7: jbe 0x100a6f013
0x100a6eedd: mov qword ptr [rbp - 0x40], rsi
0x100a6eee1: mov rcx, qword ptr [r13 + 0x68]
0x100a6eee5: and eax, 0x7ffffff
0x100a6eeea: test dword ptr [rcx + rax*4], edx
0x100a6eeed: je 0x100a6f037
0x100a6eef3: mov rdi, qword ptr [r13 + 0x10]
0x100a6eef7: mov r14, qword ptr [r13 + 0x60]
0x100a6eefb: mov rsi, qword ptr [rip + 0x1fb166] ; 0x100c6a068
0x100a6ef02: mov rbx, qword ptr [rip + 0x19ec07] ; 0x100c0db10
0x100a6ef09: call rbx
0x100a6ef0b: mov qword ptr [rbp - 0x38], rax
0x100a6ef0f: mov rdi, rax
0x100a6ef12: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6ef17: mov r12, rax
0x100a6ef1a: mov rdi, qword ptr [rip + 0x1fc03f] ; 0x100c6af60
0x100a6ef21: mov rsi, qword ptr [rip + 0x1f8700] ; 0x100c67628
0x100a6ef28: mov rdx, qword ptr [rbp - 0x40]
0x100a6ef2c: mov qword ptr [rbp - 0x30], r12
0x100a6ef30: call rbx
0x100a6ef32: mov rdi, rax
0x100a6ef35: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6ef3a: mov rbx, rax
0x100a6ef3d: mov rsi, qword ptr [rip + 0x1fae54] ; 0x100c69d98
0x100a6ef44: mov rdi, r12
0x100a6ef47: mov rdx, rbx
0x100a6ef4a: call qword ptr [rip + 0x19ebc0] ; 0x100c0db10
0x100a6ef50: mov rdi, rbx
0x100a6ef53: call qword ptr [rip + 0x19ebbf] ; 0x100c0db18
0x100a6ef59: mov rsi, qword ptr [rip + 0x1fb240] ; 0x100c6a1a0
0x100a6ef60: mov rdi, r12
0x100a6ef63: call qword ptr [rip + 0x19eba7] ; 0x100c0db10
0x100a6ef69: cmp byte ptr [r13 + 0x21e8], 0
0x100a6ef71: je 0x100a6ef80
0x100a6ef73: mov eax, dword ptr [r13 + 0x98]
0x100a6ef7a: imul rbx, rax, 0x38
0x100a6ef7e: jmp 0x100a6ef82 ; 0x100a6ef82
0x100a6ef80: xor ebx, ebx
0x100a6ef82: mov r12, qword ptr [rbp - 0x30]
0x100a6ef86: mov rsi, qword ptr [rbp - 0x38]
0x100a6ef8a: mov rax, qword ptr [rip + 0x12f936f] ; 0x101d68300
0x100a6ef91: mov qword ptr [r14 + r15 + 8], rax
0x100a6ef96: lea rdi, [r14 + r15 + 0x48]
0x100a6ef9b: call 0x100aa29e4 ; 0x100aa29e4 _objc_storeStrong
0x100a6efa0: mov rdi, qword ptr [r14 + r15 + 0x38]
0x100a6efa5: mov qword ptr [r14 + r15 + 0x38], 0
0x100a6efae: call qword ptr [rip + 0x19eb64] ; 0x100c0db18
0x100a6efb4: mov dword ptr [r14 + r15 + 0x10], 0
0x100a6efbd: mov rax, qword ptr [r14 + r15 + 8]
0x100a6efc2: mov rdi, rbx
0x100a6efc5: call qword ptr [rax + 0x21d8]
0x100a6efcb: lea rbx, [r14 + r15]
0x100a6efcf: mov qword ptr [r14 + r15 + 0x18], rax
0x100a6efd4: mov rdi, r12
0x100a6efd7: call qword ptr [rip + 0x19eb3b] ; 0x100c0db18
0x100a6efdd: mov rax, rbx
0x100a6efe0: add rsp, 0x18
0x100a6efe4: pop rbx
0x100a6efe5: pop r12
0x100a6efe7: pop r13
0x100a6efe9: pop r14
0x100a6efeb: pop r15
0x100a6efed: pop rbp
0x100a6efee: ret 
0x100a6efef: mov rcx, qword ptr [r13 + 0x50]
0x100a6eff3: lea rdi, [rip + 0x1529a6] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6effa: lea rdx, [rip + 0x1529c6] ; 0x100bc19c7 %s: Exceeded maximum capacity
0x100a6f001: mov esi, 0x6c
0x100a6f006: xor eax, eax
0x100a6f008: call qword ptr [rip + 0x12f92fa] ; 0x101d68308
0x100a6f00e: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6f013: mov rcx, qword ptr [r13 + 0x50]
0x100a6f017: lea rdi, [rip + 0x152982] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6f01e: lea rdx, [rip + 0x1529c0] ; 0x100bc19e5 %s: Attempted to access out of bounds [%u]
0x100a6f025: mov esi, 0x64
0x100a6f02a: xor eax, eax
0x100a6f02c: call qword ptr [rip + 0x12f92d6] ; 0x101d68308
0x100a6f032: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6f037: mov rcx, qword ptr [r13 + 0x50]
0x100a6f03b: lea rdi, [rip + 0x15295e] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6f042: lea rdx, [rip + 0x1529c7] ; 0x100bc1a10 %s: Attempted to access unallocated slot [%u]
0x100a6f049: mov esi, 0x65
0x100a6f04e: xor eax, eax
0x100a6f050: call qword ptr [rip + 0x12f92b2] ; 0x101d68308
0x100a6f056: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6f05b: jmp 0x100a6f06b ; 0x100a6f06b
0x100a6f05d: mov r15, rax
0x100a6f060: mov rdi, rbx
0x100a6f063: call qword ptr [rip + 0x19eaaf] ; 0x100c0db18
0x100a6f069: jmp 0x100a6f06e ; 0x100a6f06e
0x100a6f06b: mov r15, rax
0x100a6f06e: mov rdi, qword ptr [rbp - 0x30]
0x100a6f072: call qword ptr [rip + 0x19eaa0] ; 0x100c0db18
0x100a6f078: mov rdi, r15
0x100a6f07b: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100a6f080: ud2 
0x100a6f082: nop word ptr cs:[rax + rax]
