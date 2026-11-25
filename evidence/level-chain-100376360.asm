0x100376360: push rbp
0x100376361: mov rbp, rsp
0x100376364: push r14
0x100376366: push rbx
0x100376367: sub rsp, 0x10
0x10037636b: mov r14, rsi
0x10037636e: mov rbx, rdi
0x100376371: mov qword ptr [rbp - 0x20], r8
0x100376375: lea rdi, [rbp - 0x20]
0x100376379: call 0x1007b04e0 ; 0x1007b04e0
0x10037637e: mov qword ptr [rbp - 0x18], 0
0x100376386: mov rdi, qword ptr [rip + 0x1c830c3] ; 0x101ff9450
0x10037638d: mov rax, qword ptr [rdi]
0x100376390: lea rsi, [rbp - 0x18]
0x100376394: mov rdx, rbx
0x100376397: mov rcx, r14
0x10037639a: call qword ptr [rax + 0x40]
0x10037639d: mov rbx, qword ptr [rbp - 0x18]
0x1003763a1: mov rdi, qword ptr [rbx + 0x140]
0x1003763a8: mov rsi, qword ptr [rbx + 0x18]
0x1003763ac: mov rdx, qword ptr [rbx + 0xf8]
0x1003763b3: lea rcx, [rip + 0x80d401] ; 0x100b837bb Data/Resources/ImageDefs.lua
0x1003763ba: xor r8d, r8d
0x1003763bd: call 0x100375e40 ; 0x100375e40
0x1003763c2: mov rdi, qword ptr [rbx + 0x140]
0x1003763c9: mov rsi, qword ptr [rbx + 0x18]
0x1003763cd: mov rdx, qword ptr [rbx + 0xf8]
0x1003763d4: lea rcx, [rip + 0x80d3fd] ; 0x100b837d8 Data/Resources/SoundDefs.lua
0x1003763db: xor r8d, r8d
0x1003763de: call 0x100375e40 ; 0x100375e40
0x1003763e3: mov rdi, qword ptr [rbx + 0x140]
0x1003763ea: mov rsi, qword ptr [rbx + 0x18]
0x1003763ee: mov rdx, qword ptr [rbx + 0xf8]
0x1003763f5: lea rcx, [rip + 0x80d3f9] ; 0x100b837f5 Data/Resources/Boot.lua
0x1003763fc: xor r8d, r8d
0x1003763ff: call 0x100375e40 ; 0x100375e40
0x100376404: add rsp, 0x10
0x100376408: pop rbx
0x100376409: pop r14
0x10037640b: pop rbp
0x10037640c: ret 
0x10037640d: nop dword ptr [rax]
