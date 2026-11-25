0x1001a74c0: push rbp
0x1001a74c1: mov rbp, rsp
0x1001a74c4: push rbx
0x1001a74c5: push rax
0x1001a74c6: mov rbx, rsi
0x1001a74c9: call 0x1007abc10 ; 0x1007abc10
0x1001a74ce: mov eax, dword ptr [rax + 0x38]
0x1001a74d1: mov dword ptr [rbx], eax
0x1001a74d3: call 0x1003f0590 ; 0x1003f0590
0x1001a74d8: mov rax, qword ptr [rip + 0x1c32bc1] ; 0x101dda0a0
0x1001a74df: mov eax, dword ptr [rax + 0x38]
0x1001a74e2: mov dword ptr [rbx], eax
0x1001a74e4: mov rax, rbx
0x1001a74e7: add rsp, 8
0x1001a74eb: pop rbx
0x1001a74ec: pop rbp
0x1001a74ed: ret 
