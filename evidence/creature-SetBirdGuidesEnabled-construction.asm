0x1001a98c0: push rbp
0x1001a98c1: mov rbp, rsp
0x1001a98c4: push rbx
0x1001a98c5: push rax
0x1001a98c6: mov rbx, rsi
0x1001a98c9: mov rdi, rbx
0x1001a98cc: call 0x10032eea0 ; 0x10032eea0
0x1001a98d1: mov rax, qword ptr [rip + 0x1c311c0] ; 0x101ddaa98
0x1001a98d8: mov eax, dword ptr [rax + 0x38]
0x1001a98db: mov dword ptr [rbx + 8], eax
0x1001a98de: mov rax, qword ptr [rip + 0xa639a3] ; 0x100c0d288
0x1001a98e5: add rax, 0x10
0x1001a98e9: mov qword ptr [rbx], rax
0x1001a98ec: mov qword ptr [rbx + 0x38], 0
0x1001a98f4: mov byte ptr [rbx + 0x40], 1
0x1001a98f8: mov rax, rbx
0x1001a98fb: add rsp, 8
0x1001a98ff: pop rbx
0x1001a9900: pop rbp
0x1001a9901: ret 
