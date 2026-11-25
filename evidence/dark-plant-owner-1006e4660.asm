0x1006e4660: push rbp
0x1006e4661: mov rbp, rsp
0x1006e4664: push r15
0x1006e4666: push r14
0x1006e4668: push r13
0x1006e466a: push r12
0x1006e466c: push rbx
0x1006e466d: sub rsp, 0x48
0x1006e4671: mov r15, rcx
0x1006e4674: mov r14, rdx
0x1006e4677: mov rbx, rsi
0x1006e467a: mov r12, rdi
0x1006e467d: lea rdi, [rbp - 0x50]
0x1006e4681: call 0x1007c2530 ; 0x1007c2530
0x1006e4686: lea rsi, [rip + 0x496dcd] ; 0x100b7b45a AtlasPlayGround
0x1006e468d: mov rdi, rbx
0x1006e4690: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1006e4695: test eax, eax
0x1006e4697: jne 0x1006e4b67
0x1006e469d: call 0x1004559d0 ; 0x1004559d0
0x1006e46a2: lea rdx, [rip + 0x4b7157] ; 0x100b9b800 Darkshroom_SporeA_02
0x1006e46a9: mov rdi, r14
0x1006e46ac: mov rsi, rax
0x1006e46af: call 0x1007c4360 ; 0x1007c4360
0x1006e46b4: test rax, rax
0x1006e46b7: je 0x1006e4b67
0x1006e46bd: lea rsi, [rbp - 0x50]
0x1006e46c1: mov rdi, rax
0x1006e46c4: call 0x1007c2310 ; 0x1007c2310
0x1006e46c9: mov qword ptr [rbp - 0x30], r15
0x1006e46cd: mov rax, qword ptr [rbp - 0x50]
0x1006e46d1: test rax, rax
0x1006e46d4: je 0x1006e4b88
0x1006e46da: mov rax, qword ptr [rax + 0x10]
0x1006e46de: test rax, rax
0x1006e46e1: je 0x1006e4b88
0x1006e46e7: mov r13, qword ptr [rax + 0xf0]
0x1006e46ee: mov r15d, dword ptr [r13 + 0x34]
0x1006e46f2: call 0x1007c6c20 ; 0x1007c6c20
0x1006e46f7: lea rcx, [r15*4]
0x1006e46ff: lea rbx, [rcx + rcx*8]
0x1006e4703: lea rcx, [rip + 0x1964446] ; 0x102048b50
0x1006e470a: mov rdx, qword ptr [rcx]
0x1006e470d: mov ecx, 4
0x1006e4712: mov rdi, rax
0x1006e4715: mov rsi, rbx
0x1006e4718: call 0x100795530 ; 0x100795530
0x1006e471d: mov r14, rax
0x1006e4720: test r15d, r15d
0x1006e4723: je 0x1006e473e
0x1006e4725: lea rax, [r14 + 0x14]
0x1006e4729: vxorps xmm0, xmm0, xmm0
0x1006e472d: nop dword ptr [rax]
0x1006e4730: vmovups xmmword ptr [rax], xmm0
0x1006e4734: add rax, 0x24
0x1006e4738: add rbx, -0x24
0x1006e473c: jne 0x1006e4730
0x1006e473e: cmp dword ptr [r13 + 0x34], 0
0x1006e4743: mov rdi, qword ptr [rbp - 0x30]
0x1006e4747: je 0x1006e4795
0x1006e4749: xor eax, eax
0x1006e474b: nop dword ptr [rax + rax]
0x1006e4750: mov rcx, qword ptr [r13 + 0x60]
0x1006e4754: mov edx, eax
0x1006e4756: mov rsi, rdx
0x1006e4759: shl rsi, 4
0x1006e475d: lea rbx, [rdx + rdx*8]
0x1006e4761: vmovups xmm0, xmmword ptr [rcx + rsi]
0x1006e4766: vmovups xmmword ptr [r14 + rbx*4], xmm0
0x1006e476c: mov rcx, qword ptr [r13 + 0x68]
0x1006e4770: mov ecx, dword ptr [rcx + rdx*4]
0x1006e4773: mov dword ptr [r14 + rbx*4 + 0x10], ecx
0x1006e4778: mov rcx, qword ptr [r13 + 0x70]
0x1006e477c: vmovups xmm0, xmmword ptr [rcx + rsi]
0x1006e4781: vmovups xmmword ptr [r14 + rbx*4 + 0x14], xmm0
0x1006e4788: inc eax
0x1006e478a: mov r8d, dword ptr [r13 + 0x34]
0x1006e478e: cmp eax, r8d
0x1006e4791: jb 0x1006e4750
0x1006e4793: jmp 0x1006e4798 ; 0x1006e4798
0x1006e4795: xor r8d, r8d
0x1006e4798: mov r9, qword ptr [r13 + 0x80]
0x1006e479f: mov eax, dword ptr [r13 + 0x38]
0x1006e47a3: mov dword ptr [rsp], eax
0x1006e47a6: mov dword ptr [rsp + 0x10], 1
0x1006e47ae: mov dword ptr [rsp + 8], 0x40
0x1006e47b6: lea rsi, [rip + 0x4b7058] ; 0x100b9b815 DirectionalLightingRail
0x1006e47bd: mov edx, 1
0x1006e47c2: mov rcx, r14
0x1006e47c5: call 0x1006e57c0 ; 0x1006e57c0
0x1006e47ca: mov qword ptr [r12 + 0x1110], rax
0x1006e47d2: mov esi, 0x40
0x1006e47d7: mov rdi, rax
0x1006e47da: call 0x100473d40 ; 0x100473d40
0x1006e47df: mov eax, dword ptr [r13 + 0x14]
0x1006e47e3: mov dword ptr [r12 + 0x40], eax
0x1006e47e8: mov eax, dword ptr [r13 + 0x14]
0x1006e47ec: mov dword ptr [r12 + 0x80], eax
0x1006e47f4: mov eax, dword ptr [r13 + 0x14]
0x1006e47f8: mov dword ptr [r12 + 0xc0], eax
0x1006e4800: mov eax, dword ptr [r13 + 0x14]
0x1006e4804: mov dword ptr [r12 + 0x100], eax
0x1006e480c: mov eax, dword ptr [r13 + 0x14]
0x1006e4810: mov dword ptr [r12 + 0x140], eax
0x1006e4818: mov eax, dword ptr [r13 + 0x14]
0x1006e481c: mov dword ptr [r12 + 0x180], eax
0x1006e4824: mov eax, dword ptr [r13 + 0x14]
0x1006e4828: mov dword ptr [r12 + 0x1c0], eax
0x1006e4830: mov eax, dword ptr [r13 + 0x14]
0x1006e4834: mov dword ptr [r12 + 0x200], eax
0x1006e483c: mov eax, dword ptr [r13 + 0x14]
0x1006e4840: mov dword ptr [r12 + 0x240], eax
0x1006e4848: mov eax, dword ptr [r13 + 0x14]
0x1006e484c: mov dword ptr [r12 + 0x280], eax
0x1006e4854: mov eax, dword ptr [r13 + 0x14]
0x1006e4858: mov dword ptr [r12 + 0x2c0], eax
0x1006e4860: mov eax, dword ptr [r13 + 0x14]
0x1006e4864: mov dword ptr [r12 + 0x300], eax
0x1006e486c: mov eax, dword ptr [r13 + 0x14]
0x1006e4870: mov dword ptr [r12 + 0x340], eax
0x1006e4878: mov eax, dword ptr [r13 + 0x14]
0x1006e487c: mov dword ptr [r12 + 0x380], eax
0x1006e4884: mov eax, dword ptr [r13 + 0x14]
0x1006e4888: mov dword ptr [r12 + 0x3c0], eax
0x1006e4890: mov eax, dword ptr [r13 + 0x14]
0x1006e4894: mov dword ptr [r12 + 0x400], eax
0x1006e489c: mov eax, dword ptr [r13 + 0x14]
0x1006e48a0: mov dword ptr [r12 + 0x440], eax
0x1006e48a8: mov eax, dword ptr [r13 + 0x14]
0x1006e48ac: mov dword ptr [r12 + 0x480], eax
0x1006e48b4: mov eax, dword ptr [r13 + 0x14]
0x1006e48b8: mov dword ptr [r12 + 0x4c0], eax
0x1006e48c0: mov eax, dword ptr [r13 + 0x14]
0x1006e48c4: mov dword ptr [r12 + 0x500], eax
0x1006e48cc: mov eax, dword ptr [r13 + 0x14]
0x1006e48d0: mov dword ptr [r12 + 0x540], eax
0x1006e48d8: mov eax, dword ptr [r13 + 0x14]
0x1006e48dc: mov dword ptr [r12 + 0x580], eax
0x1006e48e4: mov eax, dword ptr [r13 + 0x14]
0x1006e48e8: mov dword ptr [r12 + 0x5c0], eax
0x1006e48f0: mov eax, dword ptr [r13 + 0x14]
0x1006e48f4: mov dword ptr [r12 + 0x600], eax
0x1006e48fc: mov eax, dword ptr [r13 + 0x14]
0x1006e4900: mov dword ptr [r12 + 0x640], eax
0x1006e4908: mov eax, dword ptr [r13 + 0x14]
0x1006e490c: mov dword ptr [r12 + 0x680], eax
0x1006e4914: mov eax, dword ptr [r13 + 0x14]
0x1006e4918: mov dword ptr [r12 + 0x6c0], eax
0x1006e4920: mov eax, dword ptr [r13 + 0x14]
0x1006e4924: mov dword ptr [r12 + 0x700], eax
0x1006e492c: mov eax, dword ptr [r13 + 0x14]
0x1006e4930: mov dword ptr [r12 + 0x740], eax
0x1006e4938: mov eax, dword ptr [r13 + 0x14]
0x1006e493c: mov dword ptr [r12 + 0x780], eax
0x1006e4944: mov eax, dword ptr [r13 + 0x14]
0x1006e4948: mov dword ptr [r12 + 0x7c0], eax
0x1006e4950: mov eax, dword ptr [r13 + 0x14]
0x1006e4954: mov dword ptr [r12 + 0x800], eax
0x1006e495c: mov eax, dword ptr [r13 + 0x14]
0x1006e4960: mov dword ptr [r12 + 0x840], eax
0x1006e4968: mov eax, dword ptr [r13 + 0x14]
0x1006e496c: mov dword ptr [r12 + 0x880], eax
0x1006e4974: mov eax, dword ptr [r13 + 0x14]
0x1006e4978: mov dword ptr [r12 + 0x8c0], eax
0x1006e4980: mov eax, dword ptr [r13 + 0x14]
0x1006e4984: mov dword ptr [r12 + 0x900], eax
0x1006e498c: mov eax, dword ptr [r13 + 0x14]
0x1006e4990: mov dword ptr [r12 + 0x940], eax
0x1006e4998: mov eax, dword ptr [r13 + 0x14]
0x1006e499c: mov dword ptr [r12 + 0x980], eax
0x1006e49a4: mov eax, dword ptr [r13 + 0x14]
0x1006e49a8: mov dword ptr [r12 + 0x9c0], eax
0x1006e49b0: mov eax, dword ptr [r13 + 0x14]
0x1006e49b4: mov dword ptr [r12 + 0xa00], eax
0x1006e49bc: mov eax, dword ptr [r13 + 0x14]
0x1006e49c0: mov dword ptr [r12 + 0xa40], eax
0x1006e49c8: mov eax, dword ptr [r13 + 0x14]
0x1006e49cc: mov dword ptr [r12 + 0xa80], eax
0x1006e49d4: mov eax, dword ptr [r13 + 0x14]
0x1006e49d8: mov dword ptr [r12 + 0xac0], eax
0x1006e49e0: mov eax, dword ptr [r13 + 0x14]
0x1006e49e4: mov dword ptr [r12 + 0xb00], eax
0x1006e49ec: mov eax, dword ptr [r13 + 0x14]
0x1006e49f0: mov dword ptr [r12 + 0xb40], eax
0x1006e49f8: mov eax, dword ptr [r13 + 0x14]
0x1006e49fc: mov dword ptr [r12 + 0xb80], eax
0x1006e4a04: mov eax, dword ptr [r13 + 0x14]
0x1006e4a08: mov dword ptr [r12 + 0xbc0], eax
0x1006e4a10: mov eax, dword ptr [r13 + 0x14]
0x1006e4a14: mov dword ptr [r12 + 0xc00], eax
0x1006e4a1c: mov eax, dword ptr [r13 + 0x14]
0x1006e4a20: mov dword ptr [r12 + 0xc40], eax
0x1006e4a28: mov eax, dword ptr [r13 + 0x14]
0x1006e4a2c: mov dword ptr [r12 + 0xc80], eax
0x1006e4a34: mov eax, dword ptr [r13 + 0x14]
0x1006e4a38: mov dword ptr [r12 + 0xcc0], eax
0x1006e4a40: mov eax, dword ptr [r13 + 0x14]
0x1006e4a44: mov dword ptr [r12 + 0xd00], eax
0x1006e4a4c: mov eax, dword ptr [r13 + 0x14]
0x1006e4a50: mov dword ptr [r12 + 0xd40], eax
0x1006e4a58: mov eax, dword ptr [r13 + 0x14]
0x1006e4a5c: mov dword ptr [r12 + 0xd80], eax
0x1006e4a64: mov eax, dword ptr [r13 + 0x14]
0x1006e4a68: mov dword ptr [r12 + 0xdc0], eax
0x1006e4a70: mov eax, dword ptr [r13 + 0x14]
0x1006e4a74: mov dword ptr [r12 + 0xe00], eax
0x1006e4a7c: mov eax, dword ptr [r13 + 0x14]
0x1006e4a80: mov dword ptr [r12 + 0xe40], eax
0x1006e4a88: mov eax, dword ptr [r13 + 0x14]
0x1006e4a8c: mov dword ptr [r12 + 0xe80], eax
0x1006e4a94: mov eax, dword ptr [r13 + 0x14]
0x1006e4a98: mov dword ptr [r12 + 0xec0], eax
0x1006e4aa0: mov eax, dword ptr [r13 + 0x14]
0x1006e4aa4: mov dword ptr [r12 + 0xf00], eax
0x1006e4aac: mov eax, dword ptr [r13 + 0x14]
0x1006e4ab0: mov dword ptr [r12 + 0xf40], eax
0x1006e4ab8: mov eax, dword ptr [r13 + 0x14]
0x1006e4abc: mov dword ptr [r12 + 0xf80], eax
0x1006e4ac4: mov eax, dword ptr [r13 + 0x14]
0x1006e4ac8: mov dword ptr [r12 + 0xfc0], eax
0x1006e4ad0: mov eax, dword ptr [r13 + 0x14]
0x1006e4ad4: mov dword ptr [r12 + 0x1000], eax
0x1006e4adc: mov rdi, qword ptr [r12 + 0x1110]
0x1006e4ae4: xor esi, esi
0x1006e4ae6: call 0x100474020 ; 0x100474020
0x1006e4aeb: lea rdx, [r12 + 0x1018]
0x1006e4af3: lea rsi, [rip + 0x4b6d33] ; 0x100b9b82d u_railCPTex
0x1006e4afa: xor ecx, ecx
0x1006e4afc: mov rdi, rax
0x1006e4aff: call 0x1007be8b0 ; 0x1007be8b0
0x1006e4b04: mov rdi, qword ptr [r12 + 0x1110]
0x1006e4b0c: xor esi, esi
0x1006e4b0e: call 0x100474020 ; 0x100474020
0x1006e4b13: lea rdx, [r12 + 0x1090]
0x1006e4b1b: lea rsi, [rip + 0x4b6d17] ; 0x100b9b839 u_railUpTex
0x1006e4b22: xor ecx, ecx
0x1006e4b24: mov rdi, rax
0x1006e4b27: call 0x1007be8b0 ; 0x1007be8b0
0x1006e4b2c: mov rdi, qword ptr [r12 + 0x1110]
0x1006e4b34: xor esi, esi
0x1006e4b36: call 0x100474020 ; 0x100474020
0x1006e4b3b: lea rdx, [r12 + 0x1108]
0x1006e4b43: lea rsi, [rip + 0x4b6cfb] ; 0x100b9b845 u_railTexDim
0x1006e4b4a: mov ecx, 2
0x1006e4b4f: mov rdi, rax
0x1006e4b52: call 0x1007be7f0 ; 0x1007be7f0
0x1006e4b57: call 0x1007c6c20 ; 0x1007c6c20
0x1006e4b5c: mov rdi, rax
0x1006e4b5f: mov rsi, r14
0x1006e4b62: call 0x100795a70 ; 0x100795a70
0x1006e4b67: mov byte ptr [r12 + 0x1010], 0
0x1006e4b70: lea rdi, [rbp - 0x50]
0x1006e4b74: call 0x1007c2570 ; 0x1007c2570
0x1006e4b79: add rsp, 0x48
0x1006e4b7d: pop rbx
0x1006e4b7e: pop r12
0x1006e4b80: pop r13
0x1006e4b82: pop r14
0x1006e4b84: pop r15
0x1006e4b86: pop rbp
0x1006e4b87: ret 
0x1006e4b88: lea rdi, [rip + 0x4812d6] ; 0x100b65e65 Observed()
0x1006e4b8f: lea rsi, [rip + 0x4812da] ; 0x100b65e70 ./Mesh.h
0x1006e4b96: mov edx, 0x6d
0x1006e4b9b: mov ecx, 3
0x1006e4ba0: call 0x1007e5f70 ; 0x1007e5f70
0x1006e4ba5: ud2 
0x1006e4ba7: jmp 0x1006e4bb3 ; 0x1006e4bb3
0x1006e4ba9: mov rdi, rax
0x1006e4bac: call 0x100011bf0 ; 0x100011bf0
0x1006e4bb1: jmp 0x1006e4bb3 ; 0x1006e4bb3
0x1006e4bb3: mov rbx, rax
0x1006e4bb6: jmp 0x1006e4bcb ; 0x1006e4bcb
0x1006e4bb8: mov rbx, rax
0x1006e4bbb: call 0x1007c6c20 ; 0x1007c6c20
0x1006e4bc0: mov rdi, rax
0x1006e4bc3: mov rsi, r14
0x1006e4bc6: call 0x100795a70 ; 0x100795a70
0x1006e4bcb: lea rdi, [rbp - 0x50]
0x1006e4bcf: call 0x1007c2570 ; 0x1007c2570
0x1006e4bd4: mov rdi, rbx
0x1006e4bd7: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006e4bdc: mov rdi, rax
0x1006e4bdf: call 0x100011bf0 ; 0x100011bf0
0x1006e4be4: nop word ptr cs:[rax + rax]
