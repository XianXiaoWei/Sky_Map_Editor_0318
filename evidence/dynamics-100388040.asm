0x100388040: push rbp
0x100388041: mov rbp, rsp
0x100388044: push rbx
0x100388045: push rax
0x100388046: mov rbx, rdi
0x100388049: mov dword ptr [rbx + 0x20], 0x3f800000
0x100388050: call 0x100aa285e ; 0x100aa285e _mach_absolute_time
0x100388055: mov qword ptr [rbx + 0x90], rax
0x10038805c: add rsp, 8
0x100388060: pop rbx
0x100388061: pop rbp
0x100388062: ret 
0x100388063: nop word ptr cs:[rax + rax]
