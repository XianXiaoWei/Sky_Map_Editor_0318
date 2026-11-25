0x10055d200: push rbp
0x10055d201: mov rbp, rsp
0x10055d204: push rbx
0x10055d205: push rax
0x10055d206: mov rbx, rdi
0x10055d209: mov rsi, qword ptr [rbx + 0x20]
0x10055d20d: mov rdi, qword ptr [rbx + 0xf0]
0x10055d214: call 0x100795a70 ; 0x100795a70
0x10055d219: mov rsi, qword ptr [rbx + 0x90]
0x10055d220: mov rdi, qword ptr [rbx + 0xf0]
0x10055d227: call 0x100795a70 ; 0x100795a70
0x10055d22c: mov rsi, qword ptr [rbx + 0x98]
0x10055d233: mov rdi, qword ptr [rbx + 0xf0]
0x10055d23a: call 0x100795a70 ; 0x100795a70
0x10055d23f: mov rsi, qword ptr [rbx + 0xa0]
0x10055d246: mov rdi, qword ptr [rbx + 0xf0]
0x10055d24d: call 0x100795a70 ; 0x100795a70
0x10055d252: mov rsi, qword ptr [rbx + 0xa8]
0x10055d259: mov rdi, qword ptr [rbx + 0xf0]
0x10055d260: call 0x100795a70 ; 0x100795a70
0x10055d265: mov rsi, qword ptr [rbx + 0xb0]
0x10055d26c: mov rdi, qword ptr [rbx + 0xf0]
0x10055d273: call 0x100795a70 ; 0x100795a70
0x10055d278: mov rsi, qword ptr [rbx + 0xb8]
0x10055d27f: mov rdi, qword ptr [rbx + 0xf0]
0x10055d286: call 0x100795a70 ; 0x100795a70
0x10055d28b: mov rsi, qword ptr [rbx + 8]
0x10055d28f: mov rdi, qword ptr [rbx + 0xf0]
0x10055d296: call 0x100795a70 ; 0x100795a70
0x10055d29b: mov qword ptr [rbx + 0x20], 0
0x10055d2a3: mov qword ptr [rbx + 8], 0
0x10055d2ab: mov dword ptr [rbx + 0x28], 0
0x10055d2b2: vxorps ymm0, ymm0, ymm0
0x10055d2b6: vmovups ymmword ptr [rbx + 0xa0], ymm0
0x10055d2be: vmovups ymmword ptr [rbx + 0x90], ymm0
0x10055d2c6: add rsp, 8
0x10055d2ca: pop rbx
0x10055d2cb: pop rbp
0x10055d2cc: vzeroupper 
0x10055d2cf: ret 
