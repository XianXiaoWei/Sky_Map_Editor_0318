0x1003fffc0: push rbp
0x1003fffc1: mov rbp, rsp
0x1003fffc4: push r15
0x1003fffc6: push r14
0x1003fffc8: push r13
0x1003fffca: push r12
0x1003fffcc: push rbx
0x1003fffcd: push rax
0x1003fffce: mov rbx, rcx
0x1003fffd1: mov r14, rdi
0x1003fffd4: mov ecx, 2
0x1003fffd9: call 0x100400c80 ; 0x100400c80
0x1003fffde: mov r15, rax
0x1003fffe1: movzx ecx, byte ptr [rbx]
0x1003fffe4: mov r13, rcx
0x1003fffe7: shr r13, 1
0x1003fffea: test cl, 1
0x1003fffed: cmovne r13, qword ptr [rbx + 8]
0x1003ffff2: cmp r13, 0x1c
0x1003ffff6: jae 0x1004000cc
0x1003ffffc: mov r12, r15
0x1003fffff: add r12, 0x40
0x100400003: cmp r12, rbx
0x100400006: je 0x1004000a8
0x10040000c: lea rax, [rbx + 1]
0x100400010: test cl, 1
0x100400013: cmovne rax, qword ptr [rbx + 0x10]
0x100400018: movzx ecx, byte ptr [r12]
0x10040001d: test cl, 1
0x100400020: jne 0x100400040
0x100400022: mov esi, 0x16
0x100400027: mov rdx, r13
0x10040002a: sub rdx, rsi
0x10040002d: ja 0x100400053
0x10040002f: test cl, 1
0x100400032: jne 0x10040005d
0x100400034: lea rbx, [r12 + 1]
0x100400039: test r13, r13
0x10040003c: jne 0x100400066
0x10040003e: jmp 0x100400074 ; 0x100400074
0x100400040: mov rsi, qword ptr [r12]
0x100400044: and rsi, 0xfffffffffffffffe
0x100400048: dec rsi
0x10040004b: mov rdx, r13
0x10040004e: sub rdx, rsi
0x100400051: jbe 0x10040002f
0x100400053: test cl, 1
0x100400056: jne 0x100400089
0x100400058: shr rcx, 1
0x10040005b: jmp 0x10040008d ; 0x10040008d
0x10040005d: mov rbx, qword ptr [r15 + 0x50]
0x100400061: test r13, r13
0x100400064: je 0x100400074
0x100400066: mov rdi, rbx
0x100400069: mov rsi, rax
0x10040006c: mov rdx, r13
0x10040006f: call 0x100aa28fa ; 0x100aa28fa _memmove
0x100400074: mov byte ptr [rbx + r13], 0
0x100400079: test byte ptr [r12], 1
0x10040007e: jne 0x1004000a4
0x100400080: add r13b, r13b
0x100400083: mov byte ptr [r12], r13b
0x100400087: jmp 0x1004000a8 ; 0x1004000a8
0x100400089: mov rcx, qword ptr [r15 + 0x48]
0x10040008d: xor r8d, r8d
0x100400090: mov rdi, r12
0x100400093: mov r9, rcx
0x100400096: push rax
0x100400097: push r13
0x100400099: call 0x1000198c0 ; 0x1000198c0
0x10040009e: add rsp, 0x10
0x1004000a2: jmp 0x1004000a8 ; 0x1004000a8
0x1004000a4: mov qword ptr [r15 + 0x48], r13
0x1004000a8: mov qword ptr [r15 + 0x70], 0
0x1004000b0: mov byte ptr [r15 + 0x78], 1
0x1004000b5: mov byte ptr [r14 + 0xa32], 1
0x1004000bd: add rsp, 8
0x1004000c1: pop rbx
0x1004000c2: pop r12
0x1004000c4: pop r13
0x1004000c6: pop r14
0x1004000c8: pop r15
0x1004000ca: pop rbp
0x1004000cb: ret 
0x1004000cc: lea r10, [rbx + 1]
0x1004000d0: test cl, 1
0x1004000d3: cmovne r10, qword ptr [rbx + 0x10]
0x1004000d8: sub rsp, 8
0x1004000dc: lea rdi, [rip + 0x787320] ; 0x100b87403 value.length() < sizeof( ShaderUniformDef::name )
0x1004000e3: lea rsi, [rip + 0x78734b] ; 0x100b87435 LevelMesh.cpp
0x1004000ea: lea r8, [rip + 0x787352] ; 0x100b87443 Texture name longer than %i chars: %s
0x1004000f1: mov edx, 0x160
0x1004000f6: mov ecx, 4
0x1004000fb: mov r9d, 0x1c
0x100400101: xor eax, eax
0x100400103: push r10
0x100400105: call 0x1007e6030 ; 0x1007e6030
0x10040010a: add rsp, 0x10
0x10040010e: ud2 
