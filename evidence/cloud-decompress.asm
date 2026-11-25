0x100780880: push rbp
0x100780881: mov rbp, rsp
0x100780884: push r14
0x100780886: push rbx
0x100780887: sub rsp, 0x10
0x10078088b: mov r14d, r8d
0x10078088e: mov r9d, edi
0x100780891: test rsi, rsi
0x100780894: je 0x1007808c3
0x100780896: test rdx, rdx
0x100780899: je 0x1007808c3
0x10078089b: cmp r9d, 1
0x10078089f: ja 0x1007808e2
0x1007808a1: mov rdi, rsi
0x1007808a4: mov rsi, rdx
0x1007808a7: mov edx, ecx
0x1007808a9: mov ecx, r14d
0x1007808ac: call 0x1007fd764 ; 0x1007fd764
0x1007808b1: mov ebx, eax
0x1007808b3: cmp ebx, r14d
0x1007808b6: ja 0x10078090a
0x1007808b8: mov eax, ebx
0x1007808ba: add rsp, 0x10
0x1007808be: pop rbx
0x1007808bf: pop r14
0x1007808c1: pop rbp
0x1007808c2: ret 
0x1007808c3: lea rdi, [rip + 0x41e227] ; 0x100b9eaf1 input && output
0x1007808ca: lea rsi, [rip + 0x41e230] ; 0x100b9eb01 Compression.cpp
0x1007808d1: mov edx, 0x21
0x1007808d6: mov ecx, 3
0x1007808db: call 0x1007e5f70 ; 0x1007e5f70
0x1007808e0: ud2 
0x1007808e2: lea rdi, [rip + 0x422743] ; 0x100ba302c false
0x1007808e9: lea rsi, [rip + 0x41e211] ; 0x100b9eb01 Compression.cpp
0x1007808f0: lea r8, [rip + 0x41e21a] ; 0x100b9eb11 Invalid compression type: %u
0x1007808f7: mov edx, 0x2b
0x1007808fc: mov ecx, 4
0x100780901: xor eax, eax
0x100780903: call 0x1007e6030 ; 0x1007e6030
0x100780908: ud2 
0x10078090a: mov dword ptr [rsp], r14d
0x10078090e: lea rdi, [rip + 0x41e219] ; 0x100b9eb2e outputSize <= maxOutputSize
0x100780915: lea rsi, [rip + 0x41e1e5] ; 0x100b9eb01 Compression.cpp
0x10078091c: lea r8, [rip + 0x41e227] ; 0x100b9eb4a Decompress exceeds maximum output size : %lu > %lu.
0x100780923: mov edx, 0x2f
0x100780928: mov ecx, 4
0x10078092d: xor eax, eax
0x10078092f: mov r9d, ebx
0x100780932: call 0x1007e6030 ; 0x1007e6030
0x100780937: ud2 
0x100780939: nop 
0x10078093a: nop 
0x10078093b: nop 
0x10078093c: nop 
0x10078093d: nop 
0x10078093e: nop 
0x10078093f: nop 
