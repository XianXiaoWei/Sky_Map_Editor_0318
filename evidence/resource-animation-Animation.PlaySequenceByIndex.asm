0x1000968e0: push rbp
0x1000968e1: mov rbp, rsp
0x1000968e4: push r15
0x1000968e6: push r14
0x1000968e8: push r13
0x1000968ea: push r12
0x1000968ec: push rbx
0x1000968ed: sub rsp, 0x38
0x1000968f1: mov qword ptr [rbp - 0x60], rdx
0x1000968f5: vmovss dword ptr [rbp - 0x40], xmm0
0x1000968fa: mov r12, rdi
0x1000968fd: lea rax, [rip + 0x1d3962c] ; 0x101dcff30
0x100096904: cmp dword ptr [rax], esi
0x100096906: jle 0x100096b43
0x10009690c: vmovss dword ptr [rbp - 0x30], xmm1
0x100096911: mov ecx, dword ptr [r12 + 0x5868]
0x100096919: lea edx, [rcx + 1]
0x10009691c: add ecx, 2
0x10009691f: test edx, edx
0x100096921: cmovne ecx, edx
0x100096924: mov dword ptr [r12 + 0x5868], ecx
0x10009692c: movsxd rcx, esi
0x10009692f: mov rbx, qword ptr [rax + rcx*8 + 8]
0x100096934: cmp dword ptr [rbx + 0x18], 0
0x100096938: jle 0x100096b14
0x10009693e: xor r14d, r14d
0x100096941: vxorps xmm0, xmm0, xmm0
0x100096945: vmovss dword ptr [rbp - 0x2c], xmm0
0x10009694a: mov qword ptr [rbp - 0x58], r12
0x10009694e: mov qword ptr [rbp - 0x50], rbx
0x100096952: nop word ptr cs:[rax + rax]
0x100096960: mov r15, qword ptr [rbx + r14*8 + 0x20]
0x100096965: mov rsi, qword ptr [r15 + 8]
0x100096969: mov r9d, 1
0x10009696f: mov rdi, r12
0x100096972: lea rdx, [rbp - 0x3c]
0x100096976: lea rcx, [rbp - 0x48]
0x10009697a: lea r8, [rbp - 0x44]
0x10009697e: call 0x100095690 ; 0x100095690
0x100096983: mov r13, rax
0x100096986: test r14, r14
0x100096989: je 0x1000969b0
0x10009698b: vmovss xmm0, dword ptr [r15]
0x100096990: vmovss xmm3, dword ptr [rbp - 0x30]
0x100096995: vdivss xmm0, xmm0, xmm3
0x100096999: vmovss xmm1, dword ptr [rbp - 0x2c]
0x10009699e: vsubss xmm1, xmm1, xmm0
0x1000969a2: vmovss dword ptr [rbp - 0x2c], xmm1
0x1000969a7: jmp 0x1000969d3 ; 0x1000969d3
0x1000969a9: nop dword ptr [rax]
0x1000969b0: movsxd rax, dword ptr [r13 + 0x30]
0x1000969b4: lea rcx, [rip + 0xa12d4d] ; 0x100aa9708 -> 0x100000000 __mh_execute_header
0x1000969bb: mov esi, dword ptr [rcx + rax*4]
0x1000969be: mov edx, dword ptr [rbx + 0x18]
0x1000969c1: inc edx
0x1000969c3: mov rdi, r12
0x1000969c6: mov dword ptr [rbp - 0x34], esi
0x1000969c9: call 0x100096b60 ; 0x100096b60
0x1000969ce: vmovss xmm3, dword ptr [rbp - 0x30]
0x1000969d3: mov rax, rbx
0x1000969d6: mov esi, dword ptr [r13 + 4]
0x1000969da: mov edx, dword ptr [r13 + 8]
0x1000969de: mov r10d, dword ptr [r13 + 0x38]
0x1000969e2: vmovss xmm5, dword ptr [r13 + 0x3c]
0x1000969e8: mov edi, edx
0x1000969ea: sub edi, esi
0x1000969ec: lea ebx, [rdi + 1]
0x1000969ef: movzx r9d, byte ptr [r13 + 0x40]
0x1000969f4: movzx r11d, byte ptr [r13 + 0x41]
0x1000969f9: movzx r13d, byte ptr [r13 + 0x42]
0x1000969fe: movzx ecx, byte ptr [rax + 0xa4]
0x100096a05: vmovss xmm0, dword ptr [r15 + 0x20]
0x100096a0b: vucomiss xmm0, dword ptr [rip + 0xa106d1] ; 0x100aa70e4
0x100096a13: jbe 0x100096a50
0x100096a15: vdivss xmm2, xmm0, xmm3
0x100096a19: vcvtsi2ss xmm0, xmm6, ebx
0x100096a1d: vdivss xmm1, xmm0, xmm2
0x100096a21: movsxd r8, dword ptr [rbp - 0x3c]
0x100096a25: mov rbx, qword ptr [r12 + r8*8 + 0x6020]
0x100096a2d: vcvtsi2ss xmm0, xmm6, dword ptr [rbx + 0x50]
0x100096a32: vdivss xmm0, xmm1, xmm0
0x100096a36: vmulss xmm4, xmm2, dword ptr [r15 + 0x18]
0x100096a3c: test edi, edi
0x100096a3e: jg 0x100096a7d
0x100096a40: jmp 0x100096a8d ; 0x100096a8d
0x100096a42: nop word ptr cs:[rax + rax]
0x100096a50: vmulss xmm0, xmm3, dword ptr [r15 + 0x1c]
0x100096a56: movsxd r8, dword ptr [rbp - 0x3c]
0x100096a5a: mov rax, qword ptr [r12 + r8*8 + 0x6020]
0x100096a62: vcvtsi2ss xmm1, xmm6, dword ptr [rax + 0x50]
0x100096a67: vmulss xmm1, xmm0, xmm1
0x100096a6b: vcvtsi2ss xmm2, xmm6, ebx
0x100096a6f: vdivss xmm2, xmm2, xmm1
0x100096a73: vmulss xmm4, xmm2, dword ptr [r15 + 0x18]
0x100096a79: test edi, edi
0x100096a7b: jle 0x100096a8d
0x100096a7d: vmovss xmm2, dword ptr [rip + 0xa0e63f] ; 0x100aa50c4
0x100096a85: vdivss xmm1, xmm2, xmm1
0x100096a89: vaddss xmm4, xmm4, xmm1
0x100096a8d: vmovss dword ptr [rbp - 0x38], xmm4
0x100096a92: and cl, 8
0x100096a95: shr cl, 3
0x100096a98: vdivss xmm4, xmm3, dword ptr [r15]
0x100096a9d: mov r15d, dword ptr [rbp - 0x48]
0x100096aa1: mov ebx, dword ptr [rbp - 0x44]
0x100096aa4: sub rsp, 8
0x100096aa8: movzx eax, cl
0x100096aab: movzx r13d, r13b
0x100096aaf: movzx r11d, r11b
0x100096ab3: movzx r12d, r9b
0x100096ab7: vxorps xmm1, xmm1, xmm1
0x100096abb: mov r9d, 1
0x100096ac1: mov rdi, qword ptr [rbp - 0x58]
0x100096ac5: mov ecx, dword ptr [rbp - 0x34]
0x100096ac8: vmovss xmm2, dword ptr [rbp - 0x40]
0x100096acd: vmovss xmm3, dword ptr [rbp - 0x2c]
0x100096ad2: push -1
0x100096ad4: push qword ptr [rbp - 0x60]
0x100096ad7: push r10
0x100096ad9: push rbx
0x100096ada: push r15
0x100096adc: push rax
0x100096add: push r13
0x100096adf: push r11
0x100096ae1: push r12
0x100096ae3: mov r12, rdi
0x100096ae6: call 0x100095c70 ; 0x100095c70
0x100096aeb: add rsp, 0x50
0x100096aef: vmovss xmm0, dword ptr [rbp - 0x2c]
0x100096af4: vaddss xmm0, xmm0, dword ptr [rbp - 0x38]
0x100096af9: vmovss dword ptr [rbp - 0x2c], xmm0
0x100096afe: inc r14
0x100096b01: mov rbx, qword ptr [rbp - 0x50]
0x100096b05: movsxd rax, dword ptr [rbx + 0x18]
0x100096b09: cmp r14, rax
0x100096b0c: jl 0x100096960
0x100096b12: jmp 0x100096b1d ; 0x100096b1d
0x100096b14: vxorps xmm0, xmm0, xmm0
0x100096b18: vmovss dword ptr [rbp - 0x2c], xmm0
0x100096b1d: vmovss xmm0, dword ptr [rbp - 0x30]
0x100096b22: vmulss xmm0, xmm0, dword ptr [rbx + 0xa0]
0x100096b2a: vmovss xmm1, dword ptr [rbp - 0x2c]
0x100096b2f: vsubss xmm1, xmm1, xmm0
0x100096b33: mov edx, 1
0x100096b38: mov rdi, r12
0x100096b3b: mov esi, dword ptr [rbp - 0x34]
0x100096b3e: call 0x100096d50 ; 0x100096d50
0x100096b43: add rsp, 0x38
0x100096b47: pop rbx
0x100096b48: pop r12
0x100096b4a: pop r13
0x100096b4c: pop r14
0x100096b4e: pop r15
0x100096b50: pop rbp
0x100096b51: ret 
0x100096b52: nop word ptr cs:[rax + rax]
