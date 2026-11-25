0x10031a450: push rbp
0x10031a451: mov rbp, rsp
0x10031a454: push r14
0x10031a456: push rbx
0x10031a457: sub rsp, 0x20
0x10031a45b: vmovaps xmm4, xmm0
0x10031a45f: mov rbx, rdi
0x10031a462: vmovss xmm0, dword ptr [rbx + 0x28]
0x10031a467: vsubss xmm0, xmm0, xmm4
0x10031a46b: vxorps xmm1, xmm1, xmm1
0x10031a46f: vmaxss xmm0, xmm0, xmm1
0x10031a473: vmovss dword ptr [rbx + 0x28], xmm0
0x10031a478: mov rax, qword ptr [rbx + 0x10]
0x10031a47c: test rax, rax
0x10031a47f: je 0x10031a49f
0x10031a481: cmp byte ptr [rax + 0x50], 0
0x10031a485: je 0x10031a549
0x10031a48b: cmp byte ptr [rbx + 0x30], 0
0x10031a48f: je 0x10031a522
0x10031a495: vmovss xmm1, dword ptr [rbx + 0x24]
0x10031a49a: jmp 0x10031a531 ; 0x10031a531
0x10031a49f: mov rax, qword ptr [rbx + 8]
0x10031a4a3: test rax, rax
0x10031a4a6: je 0x10031a67d
0x10031a4ac: vmovss dword ptr [rbp - 0x14], xmm4
0x10031a4b1: cmp dword ptr [rax + 0x10], 0
0x10031a4b5: je 0x10031a686
0x10031a4bb: mov rax, qword ptr [rax + 8]
0x10031a4bf: mov rax, qword ptr [rax]
0x10031a4c2: mov qword ptr [rbp - 0x28], rax
0x10031a4c6: call 0x1007abc10 ; 0x1007abc10
0x10031a4cb: mov r14, rax
0x10031a4ce: mov qword ptr [rbp - 0x20], 0
0x10031a4d6: call 0x10043ccc0 ; 0x10043ccc0
0x10031a4db: mov r8, qword ptr [rax]
0x10031a4de: lea rsi, [rbp - 0x20]
0x10031a4e2: lea rdx, [rbp - 0x28]
0x10031a4e6: mov rdi, rax
0x10031a4e9: mov rcx, r14
0x10031a4ec: call qword ptr [r8 + 0x40]
0x10031a4f0: mov r14, qword ptr [rbp - 0x20]
0x10031a4f4: test r14, r14
0x10031a4f7: je 0x10031a6a5
0x10031a4fd: mov rax, qword ptr [r14]
0x10031a500: mov rdi, r14
0x10031a503: call qword ptr [rax + 0x10]
0x10031a506: test al, al
0x10031a508: je 0x10031a5ef
0x10031a50e: cmp byte ptr [rbx + 0x30], 0
0x10031a512: je 0x10031a5c2
0x10031a518: vmovss xmm0, dword ptr [rbx + 0x24]
0x10031a51d: jmp 0x10031a5d1 ; 0x10031a5d1
0x10031a522: vmovss xmm1, dword ptr [rbx + 0x24]
0x10031a527: vaddss xmm0, xmm1, dword ptr [rbx + 0x1c]
0x10031a52c: vmovss dword ptr [rbx + 0x28], xmm0
0x10031a531: vxorps xmm2, xmm2, xmm2
0x10031a535: vucomiss xmm1, xmm2
0x10031a539: jne 0x10031a53d
0x10031a53b: jnp 0x10031a577
0x10031a53d: vucomiss xmm0, xmm2
0x10031a541: jne 0x10031a577
0x10031a543: jp 0x10031a577
0x10031a545: mov byte ptr [rax + 0x50], 0
0x10031a549: vmovss xmm0, dword ptr [rbx + 0x20]
0x10031a54e: vmovss xmm1, dword ptr [rip + 0x78c546] ; 0x100aa6a9c
0x10031a556: vcmpunordss xmm2, xmm0, xmm0
0x10031a55b: vandps xmm3, xmm2, xmm1
0x10031a55f: vmaxss xmm0, xmm1, xmm0
0x10031a563: vandnps xmm0, xmm2, xmm0
0x10031a567: vorps xmm0, xmm0, xmm3
0x10031a56b: vxorps xmm0, xmm0, xmmword ptr [rip + 0x78d38d] ; 0x100aa7900
0x10031a573: xor eax, eax
0x10031a575: jmp 0x10031a59b ; 0x10031a59b
0x10031a577: vmovss xmm0, dword ptr [rbx + 0x1c]
0x10031a57c: vmovss xmm1, dword ptr [rip + 0x78c518] ; 0x100aa6a9c
0x10031a584: vcmpunordss xmm2, xmm0, xmm0
0x10031a589: vandps xmm3, xmm2, xmm1
0x10031a58d: vmaxss xmm0, xmm1, xmm0
0x10031a591: vandnps xmm0, xmm2, xmm0
0x10031a595: vorps xmm0, xmm0, xmm3
0x10031a599: mov al, 1
0x10031a59b: vdivss xmm0, xmm4, xmm0
0x10031a59f: vaddss xmm0, xmm0, dword ptr [rbx + 0x2c]
0x10031a5a4: vxorps xmm1, xmm1, xmm1
0x10031a5a8: vmaxss xmm0, xmm1, xmm0
0x10031a5ac: vmovss xmm1, dword ptr [rip + 0x78ab0c] ; 0x100aa50c0
0x10031a5b4: vminss xmm0, xmm1, xmm0
0x10031a5b8: vmovss dword ptr [rbx + 0x2c], xmm0
0x10031a5bd: jmp 0x10031a67a ; 0x10031a67a
0x10031a5c2: vmovss xmm0, dword ptr [rbx + 0x24]
0x10031a5c7: vaddss xmm1, xmm0, dword ptr [rbx + 0x1c]
0x10031a5cc: vmovss dword ptr [rbx + 0x28], xmm1
0x10031a5d1: vxorps xmm1, xmm1, xmm1
0x10031a5d5: vucomiss xmm0, xmm1
0x10031a5d9: jne 0x10031a5dd
0x10031a5db: jnp 0x10031a5ef
0x10031a5dd: vmovss xmm0, dword ptr [rbx + 0x28]
0x10031a5e2: vucomiss xmm0, xmm1
0x10031a5e6: jne 0x10031a5ef
0x10031a5e8: jp 0x10031a5ef
0x10031a5ea: mov byte ptr [r14 + 0x40], 0
0x10031a5ef: mov rax, qword ptr [r14]
0x10031a5f2: mov rdi, r14
0x10031a5f5: call qword ptr [rax + 0x10]
0x10031a5f8: test al, al
0x10031a5fa: je 0x10031a620
0x10031a5fc: vmovss xmm0, dword ptr [rbx + 0x1c]
0x10031a601: vmovss xmm1, dword ptr [rip + 0x78c493] ; 0x100aa6a9c
0x10031a609: vcmpunordss xmm2, xmm0, xmm0
0x10031a60e: vandps xmm3, xmm2, xmm1
0x10031a612: vmaxss xmm0, xmm1, xmm0
0x10031a616: vandnps xmm0, xmm2, xmm0
0x10031a61a: vorps xmm0, xmm0, xmm3
0x10031a61e: jmp 0x10031a64a ; 0x10031a64a
0x10031a620: vmovss xmm0, dword ptr [rbx + 0x20]
0x10031a625: vmovss xmm1, dword ptr [rip + 0x78c46f] ; 0x100aa6a9c
0x10031a62d: vcmpunordss xmm2, xmm0, xmm0
0x10031a632: vandps xmm3, xmm2, xmm1
0x10031a636: vmaxss xmm0, xmm1, xmm0
0x10031a63a: vandnps xmm0, xmm2, xmm0
0x10031a63e: vorps xmm0, xmm0, xmm3
0x10031a642: vxorps xmm0, xmm0, xmmword ptr [rip + 0x78d2b6] ; 0x100aa7900
0x10031a64a: vmovss xmm1, dword ptr [rbp - 0x14]
0x10031a64f: vdivss xmm0, xmm1, xmm0
0x10031a653: vaddss xmm0, xmm0, dword ptr [rbx + 0x2c]
0x10031a658: vxorps xmm1, xmm1, xmm1
0x10031a65c: vmaxss xmm0, xmm1, xmm0
0x10031a660: vmovss xmm1, dword ptr [rip + 0x78aa58] ; 0x100aa50c0
0x10031a668: vminss xmm0, xmm1, xmm0
0x10031a66c: vmovss dword ptr [rbx + 0x2c], xmm0
0x10031a671: mov rax, qword ptr [r14]
0x10031a674: mov rdi, r14
0x10031a677: call qword ptr [rax + 0x10]
0x10031a67a: mov byte ptr [rbx + 0x30], al
0x10031a67d: add rsp, 0x20
0x10031a681: pop rbx
0x10031a682: pop r14
0x10031a684: pop rbp
0x10031a685: ret 
0x10031a686: lea rdi, [rip + 0x8472cb] ; 0x100b61958 idx < size
0x10031a68d: lea rsi, [rip + 0x8472cf] ; 0x100b61963 ./Clump.h
0x10031a694: mov edx, 0x36
0x10031a699: mov ecx, 3
0x10031a69e: call 0x1007e5f70 ; 0x1007e5f70
0x10031a6a3: ud2 
0x10031a6a5: lea rdi, [rip + 0x84744c] ; 0x100b61af8 ret
0x10031a6ac: lea rsi, [rip + 0x8472b0] ; 0x100b61963 ./Clump.h
0x10031a6b3: mov edx, 0x47
0x10031a6b8: mov ecx, 3
0x10031a6bd: call 0x1007e5f70 ; 0x1007e5f70
0x10031a6c2: ud2 
0x10031a6c4: nop word ptr cs:[rax + rax]
