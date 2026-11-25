0x100719390: push rbp
0x100719391: mov rbp, rsp
0x100719394: push rbx
0x100719395: push rax
0x100719396: mov rbx, rsi
0x100719399: mov rdi, rbx
0x10071939c: call 0x10032eea0 ; 0x10032eea0
0x1007193a1: mov rax, qword ptr [rip + 0x1921ec8] ; 0x10203b270
0x1007193a8: mov eax, dword ptr [rax + 0x38]
0x1007193ab: mov dword ptr [rbx + 8], eax
0x1007193ae: mov rax, qword ptr [rip + 0x4f4153] ; 0x100c0d508
0x1007193b5: add rax, 0x10
0x1007193b9: mov qword ptr [rbx], rax
0x1007193bc: mov rax, rbx
0x1007193bf: add rsp, 8
0x1007193c3: pop rbx
0x1007193c4: pop rbp
0x1007193c5: ret 
0x1007193c6: nop word ptr cs:[rax + rax]
