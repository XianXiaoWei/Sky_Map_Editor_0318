0x100716930: push rbp
0x100716931: mov rbp, rsp
0x100716934: push rbx
0x100716935: push rax
0x100716936: mov rbx, rsi
0x100716939: call 0x1007abc10 ; 0x1007abc10
0x10071693e: mov rax, qword ptr [rip + 0x19240eb] ; 0x10203aa30
0x100716945: mov eax, dword ptr [rax + 0x38]
0x100716948: mov dword ptr [rbx], eax
0x10071694a: mov rax, rbx
0x10071694d: add rsp, 8
0x100716951: pop rbx
0x100716952: pop rbp
0x100716953: ret 
0x100716954: nop word ptr cs:[rax + rax]
