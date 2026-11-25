0x100719090: push rbp
0x100719091: mov rbp, rsp
0x100719094: push rbx
0x100719095: push rax
0x100719096: mov rbx, rsi
0x100719099: mov rdi, rbx
0x10071909c: call 0x10032eea0 ; 0x10032eea0
0x1007190a1: mov rax, qword ptr [rip + 0x1922148] ; 0x10203b1f0
0x1007190a8: mov eax, dword ptr [rax + 0x38]
0x1007190ab: mov dword ptr [rbx + 8], eax
0x1007190ae: mov rax, qword ptr [rip + 0x4f44fb] ; 0x100c0d5b0
0x1007190b5: add rax, 0x10
0x1007190b9: mov qword ptr [rbx], rax
0x1007190bc: mov rax, rbx
0x1007190bf: add rsp, 8
0x1007190c3: pop rbx
0x1007190c4: pop rbp
0x1007190c5: ret 
0x1007190c6: nop word ptr cs:[rax + rax]
