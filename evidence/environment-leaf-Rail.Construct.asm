0x1005626b0: push rbp
0x1005626b1: mov rbp, rsp
0x1005626b4: push rbx
0x1005626b5: push rax
0x1005626b6: mov rbx, rsi
0x1005626b9: call 0x1007abc10 ; 0x1007abc10
0x1005626be: mov rax, qword ptr [rip + 0x1aba1c3] ; 0x10201c888
0x1005626c5: mov eax, dword ptr [rax + 0x38]
0x1005626c8: mov dword ptr [rbx], eax
0x1005626ca: mov qword ptr [rbx + 8], 0
0x1005626d2: mov qword ptr [rbx + 0x10], 0x10
0x1005626da: mov dword ptr [rbx + 0x18], 0
0x1005626e1: mov qword ptr [rbx + 0x20], 0
0x1005626e9: mov dword ptr [rbx + 0x28], 0
0x1005626f0: mov byte ptr [rbx + 0x2c], 0
0x1005626f4: lea rax, [rip + 0x1adcf65] ; 0x10203f660
0x1005626fb: vmovaps xmm0, xmmword ptr [rax]
0x1005626ff: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x100562704: mov byte ptr [rbx + 0x40], 0
0x100562708: vxorps ymm0, ymm0, ymm0
0x10056270c: vmovups ymmword ptr [rbx + 0xa0], ymm0
0x100562714: vmovups ymmword ptr [rbx + 0x90], ymm0
0x10056271c: mov byte ptr [rbx + 0xe0], 1
0x100562723: mov dword ptr [rbx + 0xec], 0
0x10056272d: mov qword ptr [rbx + 0xf0], 0
0x100562738: mov rax, rbx
0x10056273b: add rsp, 8
0x10056273f: pop rbx
0x100562740: pop rbp
0x100562741: vzeroupper 
0x100562744: ret 
0x100562745: nop word ptr cs:[rax + rax]
