0x1003ee990: push rbp
0x1003ee991: mov rbp, rsp
0x1003ee994: push rbx
0x1003ee995: push rax
0x1003ee996: mov rbx, rsi
0x1003ee999: call 0x1007abc10 ; 0x1007abc10
0x1003ee99e: mov rax, qword ptr [rip + 0x1c113cb] ; 0x101fffd70
0x1003ee9a5: mov eax, dword ptr [rax + 0x38]
0x1003ee9a8: mov dword ptr [rbx], eax
0x1003ee9aa: mov byte ptr [rbx + 0xbb], 1
0x1003ee9b1: mov dword ptr [rbx + 0xdc], 0
0x1003ee9bb: mov qword ptr [rbx + 0xe0], 0
0x1003ee9c6: vxorps xmm0, xmm0, xmm0
0x1003ee9ca: vmovups xmmword ptr [rbx + 0xc9], xmm0
0x1003ee9d2: vmovups xmmword ptr [rbx + 0xc0], xmm0
0x1003ee9da: mov rax, rbx
0x1003ee9dd: add rsp, 8
0x1003ee9e1: pop rbx
0x1003ee9e2: pop rbp
0x1003ee9e3: ret 
