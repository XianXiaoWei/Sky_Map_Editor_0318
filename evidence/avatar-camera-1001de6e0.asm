0x1001de6e0: push rbp
0x1001de6e1: mov rbp, rsp
0x1001de6e4: push r15
0x1001de6e6: push r14
0x1001de6e8: push r13
0x1001de6ea: push r12
0x1001de6ec: push rbx
0x1001de6ed: sub rsp, 0x228
0x1001de6f4: mov r12, rdi
0x1001de6f7: mov rax, qword ptr [rip + 0xa2f1da] ; 0x100c0d8d8
0x1001de6fe: mov rax, qword ptr [rax]
0x1001de701: mov qword ptr [rbp - 0x30], rax
0x1001de705: cmp dword ptr [r12 + 0x8ad0], 0
0x1001de70e: je 0x1001de80a
0x1001de714: xor eax, eax
0x1001de716: vmovss xmm0, dword ptr [rip + 0x8c91a6] ; 0x100aa78c4
0x1001de71e: nop 
0x1001de720: mov ecx, eax
0x1001de722: lea rcx, [rcx + rcx*8]
0x1001de726: shl rcx, 4
0x1001de72a: vmovaps xmm3, xmmword ptr [r12 + rcx + 0x42e0]
0x1001de734: vmovaps xmm2, xmmword ptr [r12 + rcx + 0x42f0]
0x1001de73e: vmovaps xmm1, xmmword ptr [r12 + rcx + 0x4300]
0x1001de748: vmulps xmm4, xmm3, xmm3
0x1001de74c: vmovshdup xmm5, xmm4
0x1001de750: vaddss xmm5, xmm4, xmm5
0x1001de754: vpermilpd xmm4, xmm4, 1
0x1001de75a: vaddss xmm4, xmm4, xmm5
0x1001de75e: vsqrtss xmm5, xmm4, xmm4
0x1001de762: vucomiss xmm5, xmm0
0x1001de766: vmovaps xmm4, xmm3
0x1001de76a: jbe 0x1001de776
0x1001de76c: vpermilps xmm4, xmm5, 0xc0
0x1001de772: vdivps xmm4, xmm3, xmm4
0x1001de776: vmulps xmm5, xmm2, xmm2
0x1001de77a: vmovshdup xmm6, xmm5
0x1001de77e: vaddss xmm6, xmm5, xmm6
0x1001de782: vpermilpd xmm5, xmm5, 1
0x1001de788: vaddss xmm5, xmm5, xmm6
0x1001de78c: vsqrtss xmm6, xmm5, xmm5
0x1001de790: vucomiss xmm6, xmm0
0x1001de794: vmovaps xmm5, xmm2
0x1001de798: jbe 0x1001de7a4
0x1001de79a: vpermilps xmm5, xmm6, 0xc0
0x1001de7a0: vdivps xmm5, xmm2, xmm5
0x1001de7a4: lea rcx, [r12 + rcx + 0x42e0]
0x1001de7ac: vmulps xmm6, xmm1, xmm1
0x1001de7b0: vmovshdup xmm7, xmm6
0x1001de7b4: vaddss xmm7, xmm6, xmm7
0x1001de7b8: vpermilpd xmm6, xmm6, 1
0x1001de7be: vaddss xmm6, xmm6, xmm7
0x1001de7c2: vsqrtss xmm7, xmm6, xmm6
0x1001de7c6: vucomiss xmm7, xmm0
0x1001de7ca: vmovaps xmm6, xmm1
0x1001de7ce: jbe 0x1001de7da
0x1001de7d0: vpermilps xmm6, xmm7, 0xc0
0x1001de7d6: vdivps xmm6, xmm1, xmm6
0x1001de7da: vblendps xmm3, xmm4, xmm3, 8
0x1001de7e0: vmovaps xmmword ptr [rcx], xmm3
0x1001de7e4: vblendps xmm2, xmm5, xmm2, 8
0x1001de7ea: vmovaps xmmword ptr [rcx + 0x10], xmm2
0x1001de7ef: vblendps xmm1, xmm6, xmm1, 8
0x1001de7f5: vmovaps xmmword ptr [rcx + 0x20], xmm1
0x1001de7fa: inc eax
0x1001de7fc: cmp eax, dword ptr [r12 + 0x8ad0]
0x1001de804: jb 0x1001de720
0x1001de80a: lea r15, [rbp - 0xc8]
0x1001de811: lea rbx, [rbp - 0x210]
0x1001de818: lea r13, [rbp - 0x210]
0x1001de81f: lea rax, [r12 + 0x270]
0x1001de827: mov qword ptr [rbp - 0x250], rax
0x1001de82e: mov rdx, qword ptr [rip + 0xa2bceb] ; 0x100c0a520
0x1001de835: lea rsi, [rdx + 0x18]
0x1001de839: add rdx, 0x40
0x1001de83d: mov rax, qword ptr [rip + 0xa2ed84] ; 0x100c0d5c8
0x1001de844: lea rcx, [rax + 0x18]
0x1001de848: mov qword ptr [rbp - 0x228], rcx
0x1001de84f: add rax, 0x40
0x1001de853: mov qword ptr [rbp - 0x230], rax
0x1001de85a: mov rax, qword ptr [rip + 0xa2bd1f] ; 0x100c0a580
0x1001de861: add rax, 8
0x1001de865: mov qword ptr [rbp - 0x220], rax
0x1001de86c: mov qword ptr [rbp - 0x248], rdx
0x1001de873: mov r14, rsi
0x1001de876: mov qword ptr [rbp - 0x218], rsi
0x1001de87d: mov qword ptr [rbp - 0xc8], rdx
0x1001de884: mov rdi, r15
0x1001de887: mov rsi, rbx
0x1001de88a: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1001de88f: mov qword ptr [rbp - 0x40], 0
0x1001de897: mov dword ptr [rbp - 0x38], 0xffffffff
0x1001de89e: mov rax, qword ptr [rbp - 0x228]
0x1001de8a5: mov qword ptr [rbp - 0x218], rax
0x1001de8ac: mov rax, qword ptr [rbp - 0x230]
0x1001de8b3: mov qword ptr [rbp - 0xc8], rax
0x1001de8ba: mov edx, 2
0x1001de8bf: mov rdi, rbx
0x1001de8c2: lea rsi, [rip + 0x99a74c] ; 0x100b79015 CameraSystem
0x1001de8c9: call 0x1007a56a0 ; 0x1007a56a0
0x1001de8ce: mov edx, 0x31
0x1001de8d3: lea r15, [rbp - 0x218]
0x1001de8da: mov rdi, r15
0x1001de8dd: lea rsi, [rip + 0x99a92e] ; 0x100b79212 Starting a scanning pass for orphaned CameraNodes
0x1001de8e4: call 0x100011930 ; 0x100011930
0x1001de8e9: mov rax, qword ptr [rbp - 0x228]
0x1001de8f0: mov qword ptr [rbp - 0x218], rax
0x1001de8f7: mov rax, qword ptr [rbp - 0x230]
0x1001de8fe: mov qword ptr [rbp - 0xc8], rax
0x1001de905: mov rdi, rbx
0x1001de908: call 0x1007a58d0 ; 0x1007a58d0
0x1001de90d: mov rdi, r15
0x1001de910: mov rsi, qword ptr [rbp - 0x220]
0x1001de917: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1001de91c: lea rdi, [rbp - 0xc8]
0x1001de923: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1001de928: xor r15d, r15d
0x1001de92b: mov dword ptr [rbp - 0x234], 0
0x1001de935: mov rbx, qword ptr [rbp - 0x248]
0x1001de93c: mov rsi, r14
0x1001de93f: jmp 0x1001deac0 ; 0x1001deac0
0x1001de944: mov qword ptr [rbp - 0x218], rsi
0x1001de94b: mov qword ptr [rbp - 0xc8], rbx
0x1001de952: lea rdi, [rbp - 0xc8]
0x1001de959: mov rsi, r13
0x1001de95c: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1001de961: mov qword ptr [rbp - 0x40], 0
0x1001de969: mov dword ptr [rbp - 0x38], 0xffffffff
0x1001de970: mov rax, qword ptr [rbp - 0x228]
0x1001de977: mov qword ptr [rbp - 0x218], rax
0x1001de97e: mov rax, qword ptr [rbp - 0x230]
0x1001de985: mov qword ptr [rbp - 0xc8], rax
0x1001de98c: mov edx, 2
0x1001de991: mov rdi, r13
0x1001de994: lea rsi, [rip + 0x99a67a] ; 0x100b79015 CameraSystem
0x1001de99b: call 0x1007a56a0 ; 0x1007a56a0
0x1001de9a0: mov edx, 0x1c
0x1001de9a5: lea rdi, [rbp - 0x218]
0x1001de9ac: lea rsi, [rip + 0x99a891] ; 0x100b79244 Deleting CameraNode of type 
0x1001de9b3: call 0x100011930 ; 0x100011930
0x1001de9b8: mov r13, rax
0x1001de9bb: mov rax, qword ptr [rbp - 0x240]
0x1001de9c2: test rax, rax
0x1001de9c5: je 0x1001de9d1
0x1001de9c7: mov edi, dword ptr [rax + 8]
0x1001de9ca: call 0x1007abd30 ; 0x1007abd30
0x1001de9cf: jmp 0x1001de9d6 ; 0x1001de9d6
0x1001de9d1: call 0x1007abbf0 ; 0x1007abbf0
0x1001de9d6: mov rcx, qword ptr [rax]
0x1001de9d9: mov rdi, rax
0x1001de9dc: call qword ptr [rcx + 0x68]
0x1001de9df: test rax, rax
0x1001de9e2: jne 0x1001de9e9
0x1001de9e4: call 0x1007abc60 ; 0x1007abc60
0x1001de9e9: mov rbx, qword ptr [rax + 8]
0x1001de9ed: mov rdi, rbx
0x1001de9f0: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1001de9f5: mov rdi, r13
0x1001de9f8: mov rsi, rbx
0x1001de9fb: lea rbx, [rbp - 0x218]
0x1001dea02: mov rdx, rax
0x1001dea05: call 0x100011930 ; 0x100011930
0x1001dea0a: mov rax, qword ptr [rbp - 0x228]
0x1001dea11: mov qword ptr [rbp - 0x218], rax
0x1001dea18: mov rax, qword ptr [rbp - 0x230]
0x1001dea1f: mov qword ptr [rbp - 0xc8], rax
0x1001dea26: lea rdi, [rbp - 0x210]
0x1001dea2d: call 0x1007a58d0 ; 0x1007a58d0
0x1001dea32: mov rdi, rbx
0x1001dea35: mov rsi, qword ptr [rbp - 0x220]
0x1001dea3c: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1001dea41: lea r13, [rbp - 0xc8]
0x1001dea48: mov rdi, r13
0x1001dea4b: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1001dea50: mov rbx, qword ptr [rbp - 0x240]
0x1001dea57: mov rax, qword ptr [rbx + 0x10]
0x1001dea5b: test rax, rax
0x1001dea5e: je 0x1001dea68
0x1001dea60: mov rcx, qword ptr [rbx + 0x18]
0x1001dea64: mov qword ptr [rax + 0x18], rcx
0x1001dea68: lea rcx, [rbx + 0x10]
0x1001dea6c: mov rdx, qword ptr [rbx + 0x18]
0x1001dea70: test rdx, rdx
0x1001dea73: je 0x1001dea79
0x1001dea75: mov qword ptr [rdx + 0x10], rax
0x1001dea79: vxorps xmm0, xmm0, xmm0
0x1001dea7d: vmovups xmmword ptr [rcx], xmm0
0x1001dea81: mov rax, qword ptr [rbx]
0x1001dea84: mov rdi, rbx
0x1001dea87: call qword ptr [rax]
0x1001dea89: mov rdi, qword ptr [rbp - 0x250]
0x1001dea90: mov rsi, rbx
0x1001dea93: call 0x100795a70 ; 0x100795a70
0x1001dea98: mov qword ptr [r12 + r15*8 + 0x10], 0
0x1001deaa1: inc dword ptr [rbp - 0x234]
0x1001deaa7: lea r13, [rbp - 0x210]
0x1001deaae: mov rbx, qword ptr [rbp - 0x248]
0x1001deab5: jmp 0x1001deb08 ; 0x1001deb08
0x1001deab7: nop word ptr [rax + rax]
0x1001deac0: mov rax, qword ptr [r12 + r15*8 + 0x10]
0x1001deac5: mov qword ptr [rbp - 0x240], rax
0x1001deacc: test rax, rax
0x1001deacf: je 0x1001deb40
0x1001dead1: mov rcx, qword ptr [rip + 0x1bff378] ; 0x101ddde50
0x1001dead8: mov qword ptr [rbp - 0x218], 0
0x1001deae3: mov rdi, qword ptr [rip + 0x1bffabe] ; 0x101dde5a8
0x1001deaea: mov rax, qword ptr [rdi]
0x1001deaed: lea rsi, [rbp - 0x218]
0x1001deaf4: lea rdx, [rbp - 0x240]
0x1001deafb: call qword ptr [rax + 0x40]
0x1001deafe: cmp qword ptr [rbp - 0x218], 0
0x1001deb06: je 0x1001deb20
0x1001deb08: mov rsi, r14
0x1001deb0b: inc r15
0x1001deb0e: cmp r15, 0x20
0x1001deb12: jb 0x1001deac0
0x1001deb14: jmp 0x1001deb4d ; 0x1001deb4d
0x1001deb16: nop word ptr cs:[rax + rax]
0x1001deb20: mov rax, qword ptr [rbp - 0x240]
0x1001deb27: cmp qword ptr [rax + 0xe8], 0
0x1001deb2f: mov rsi, r14
0x1001deb32: je 0x1001de944
0x1001deb38: nop dword ptr [rax + rax]
0x1001deb40: inc r15
0x1001deb43: cmp r15, 0x20
0x1001deb47: jb 0x1001deac0
0x1001deb4d: cmp dword ptr [rbp - 0x234], 0
0x1001deb54: mov rdx, rbx
0x1001deb57: lea r15, [rbp - 0xc8]
0x1001deb5e: lea rbx, [rbp - 0x210]
0x1001deb65: jne 0x1001de873
0x1001deb6b: mov rax, qword ptr [rip + 0xa2ed66] ; 0x100c0d8d8
0x1001deb72: mov rax, qword ptr [rax]
0x1001deb75: cmp rax, qword ptr [rbp - 0x30]
0x1001deb79: jne 0x1001deb8d
0x1001deb7b: add rsp, 0x228
0x1001deb82: pop rbx
0x1001deb83: pop r12
0x1001deb85: pop r13
0x1001deb87: pop r14
0x1001deb89: pop r15
0x1001deb8b: pop rbp
0x1001deb8c: ret 
0x1001deb8d: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001deb92: mov rdi, rbx
0x1001deb95: mov rbx, rax
0x1001deb98: mov rax, qword ptr [rbp - 0x228]
0x1001deb9f: mov qword ptr [rbp - 0x218], rax
0x1001deba6: mov rax, qword ptr [rbp - 0x230]
0x1001debad: mov qword ptr [rbp - 0xc8], rax
0x1001debb4: jmp 0x1001dec25 ; 0x1001dec25
0x1001debb6: mov rbx, rax
0x1001debb9: lea rdi, [rbp - 0x218]
0x1001debc0: mov rsi, qword ptr [rbp - 0x220]
0x1001debc7: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1001debcc: jmp 0x1001debd1 ; 0x1001debd1
0x1001debce: mov rbx, rax
0x1001debd1: mov rdi, r15
0x1001debd4: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1001debd9: mov rdi, rbx
0x1001debdc: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001debe1: jmp 0x1001debff ; 0x1001debff
0x1001debe3: mov rbx, rax
0x1001debe6: jmp 0x1001dec2a ; 0x1001dec2a
0x1001debe8: mov rbx, rax
0x1001debeb: lea rdi, [rbp - 0xc8]
0x1001debf2: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1001debf7: mov rdi, rbx
0x1001debfa: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001debff: mov rbx, rax
0x1001dec02: mov rax, qword ptr [rbp - 0x228]
0x1001dec09: mov qword ptr [rbp - 0x218], rax
0x1001dec10: mov rax, qword ptr [rbp - 0x230]
0x1001dec17: mov qword ptr [rbp - 0xc8], rax
0x1001dec1e: lea rdi, [rbp - 0x210]
0x1001dec25: call 0x1007a58d0 ; 0x1007a58d0
0x1001dec2a: lea rdi, [rbp - 0x218]
0x1001dec31: mov rsi, qword ptr [rbp - 0x220]
0x1001dec38: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1001dec3d: lea rdi, [rbp - 0xc8]
0x1001dec44: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1001dec49: mov rdi, rbx
0x1001dec4c: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001dec51: nop word ptr cs:[rax + rax]
