0x10032eea0: push rbp
0x10032eea1: mov rbp, rsp
0x10032eea4: push rbx
0x10032eea5: push rax
0x10032eea6: mov rbx, rdi
0x10032eea9: call 0x1007abc10 ; 0x1007abc10
0x10032eeae: mov rax, qword ptr [rip + 0x1ac5353] ; 0x101df4208
0x10032eeb5: mov eax, dword ptr [rax + 0x38]
0x10032eeb8: mov dword ptr [rbx + 8], eax
0x10032eebb: lea rax, [rip + 0x8e5fde] ; 0x100c14ea0
0x10032eec2: mov qword ptr [rbx], rax
0x10032eec5: mov byte ptr [rbx + 0xc], 0
0x10032eec9: mov qword ptr [rbx + 0x18], 0
0x10032eed1: mov dword ptr [rbx + 0x21], 0x1000000
0x10032eed8: mov byte ptr [rbx + 0x25], 0
0x10032eedc: mov dword ptr [rbx + 0x28], 0
0x10032eee3: mov word ptr [rbx + 0x2c], 0xffff
0x10032eee9: mov byte ptr [rbx + 0x2e], 0xff
0x10032eeed: add rsp, 8
0x10032eef1: pop rbx
0x10032eef2: pop rbp
0x10032eef3: ret 
0x10032eef4: nop word ptr cs:[rax + rax]
