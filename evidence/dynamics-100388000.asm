0x100388000: push rbp
0x100388001: mov rbp, rsp
0x100388004: push rbx
0x100388005: push rax
0x100388006: mov rbx, rdi
0x100388009: call 0x1007abc10 ; 0x1007abc10
0x10038800e: mov eax, dword ptr [rax + 0x38]
0x100388011: mov dword ptr [rbx], eax
0x100388013: call 0x1007b0280 ; 0x1007b0280
0x100388018: mov rax, qword ptr [rip + 0x1c72e99] ; 0x101ffaeb8
0x10038801f: mov eax, dword ptr [rax + 0x38]
0x100388022: mov dword ptr [rbx], eax
0x100388024: add rsp, 8
0x100388028: pop rbx
0x100388029: pop rbp
0x10038802a: ret 
0x10038802b: nop dword ptr [rax + rax]
