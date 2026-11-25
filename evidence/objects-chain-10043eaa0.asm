0x10043eaa0: push rbp
0x10043eaa1: mov rbp, rsp
0x10043eaa4: push rbx
0x10043eaa5: push rax
0x10043eaa6: mov rbx, rsi
0x10043eaa9: call 0x1007abc10 ; 0x1007abc10
0x10043eaae: mov eax, dword ptr [rax + 0x38]
0x10043eab1: mov dword ptr [rbx], eax
0x10043eab3: call 0x1007b0280 ; 0x1007b0280
0x10043eab8: mov rax, qword ptr [rip + 0x1bc5d71] ; 0x102004830
0x10043eabf: mov eax, dword ptr [rax + 0x38]
0x10043eac2: mov dword ptr [rbx], eax
0x10043eac4: vmovq xmm0, rbx
0x10043eac9: vpshufd xmm0, xmm0, 0x44
0x10043eace: vpaddq xmm0, xmm0, xmmword ptr [rip + 0x6831ea] ; 0x100ac1cc0 0
0x10043ead6: movabs rax, 0x8000000400
0x10043eae0: mov qword ptr [rbx + 0x10], rax
0x10043eae4: mov dword ptr [rbx + 0x18], 0
0x10043eaeb: vmovdqu xmmword ptr [rbx + 0x20], xmm0
0x10043eaf0: mov rax, rbx
0x10043eaf3: add rsp, 8
0x10043eaf7: pop rbx
0x10043eaf8: pop rbp
0x10043eaf9: ret 
0x10043eafa: nop word ptr [rax + rax]
