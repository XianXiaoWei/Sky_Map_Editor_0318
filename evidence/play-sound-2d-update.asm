0x100534410: push rbp
0x100534411: mov rbp, rsp
0x100534414: push r14
0x100534416: push rbx
0x100534417: and rsp, 0xffffffffffffffe0
0x10053441b: sub rsp, 0x260
0x100534422: mov rbx, rdi
0x100534425: mov rax, qword ptr [rip + 0x6d94ac] ; 0x100c0d8d8
0x10053442c: mov rax, qword ptr [rax]
0x10053442f: mov qword ptr [rsp + 0x258], rax
0x100534437: cmp byte ptr [rbx + 0x70], 0
0x10053443b: je 0x1005345b7
0x100534441: cmp qword ptr [rbx + 0x58], 0
0x100534446: je 0x1005346bb
0x10053444c: mov rdi, qword ptr [rbx + 0x60]
0x100534450: test rdi, rdi
0x100534453: je 0x1005346bb
0x100534459: mov r14, qword ptr [rbx + 0x68]
0x10053445d: test r14, r14
0x100534460: je 0x1005346bb
0x100534466: mov rax, qword ptr [rdi]
0x100534469: call qword ptr [rax]
0x10053446b: cmp r14, rax
0x10053446e: jne 0x1005346bb
0x100534474: mov rdi, qword ptr [rbx + 0x60]
0x100534478: mov rax, qword ptr [rdi]
0x10053447b: call qword ptr [rax + 0x10]
0x10053447e: test al, al
0x100534480: je 0x1005346bb
0x100534486: mov rdi, qword ptr [rbx + 0x60]
0x10053448a: test rdi, rdi
0x10053448d: je 0x1005346bb
0x100534493: mov r14, qword ptr [rbx + 0x68]
0x100534497: test r14, r14
0x10053449a: je 0x1005346bb
0x1005344a0: mov rax, qword ptr [rdi]
0x1005344a3: call qword ptr [rax]
0x1005344a5: cmp r14, rax
0x1005344a8: jne 0x1005346bb
0x1005344ae: mov rdi, qword ptr [rbx + 0x60]
0x1005344b2: mov rax, qword ptr [rdi]
0x1005344b5: call qword ptr [rax + 8]
0x1005344b8: mov rcx, qword ptr [rax]
0x1005344bb: mov rdi, rax
0x1005344be: call qword ptr [rcx + 0x48]
0x1005344c1: test al, al
0x1005344c3: je 0x1005346bb
0x1005344c9: mov rax, qword ptr [rbx + 0x58]
0x1005344cd: vmovss xmm0, dword ptr [rax + 0x108c]
0x1005344d5: vdivss xmm1, xmm0, dword ptr [rax + 0x18]
0x1005344da: vxorps ymm2, ymm2, ymm2
0x1005344de: vmovaps ymmword ptr [rsp], ymm2
0x1005344e3: vmovaps ymmword ptr [rsp + 0x20], ymm2
0x1005344e9: vmovups ymmword ptr [rsp + 0x18c], ymm2
0x1005344f2: vmovaps ymmword ptr [rsp + 0x180], ymm2
0x1005344fb: vmovaps ymmword ptr [rsp + 0x160], ymm2
0x100534504: vmovaps ymmword ptr [rsp + 0x140], ymm2
0x10053450d: vmovaps ymmword ptr [rsp + 0x120], ymm2
0x100534516: vmovaps ymmword ptr [rsp + 0x100], ymm2
0x10053451f: vmovaps ymmword ptr [rsp + 0xe0], ymm2
0x100534528: vmovaps ymmword ptr [rsp + 0xc0], ymm2
0x100534531: vmovaps ymmword ptr [rsp + 0xa0], ymm2
0x10053453a: vmovaps ymmword ptr [rsp + 0x80], ymm2
0x100534543: vmovaps ymmword ptr [rsp + 0x60], ymm2
0x100534549: vmovaps ymmword ptr [rsp + 0x40], ymm2
0x10053454f: mov word ptr [rsp], 0x7475
0x100534555: vmovss dword ptr [rsp + 0x20], xmm0
0x10053455b: vmovss dword ptr [rsp + 0x24], xmm1
0x100534561: mov dword ptr [rsp + 0x1a0], 3
0x10053456c: mov dword ptr [rsp + 0x1ac], 2
0x100534577: mov rdi, qword ptr [rbx + 0x60]
0x10053457b: test rdi, rdi
0x10053457e: je 0x1005346c3
0x100534584: mov r14, qword ptr [rbx + 0x68]
0x100534588: test r14, r14
0x10053458b: je 0x1005346c3
0x100534591: mov rax, qword ptr [rdi]
0x100534594: vzeroupper 
0x100534597: call qword ptr [rax]
0x100534599: cmp r14, rax
0x10053459c: jne 0x1005346c3
0x1005345a2: mov rdi, qword ptr [rbx + 0x60]
0x1005345a6: mov rax, qword ptr [rdi]
0x1005345a9: mov rsi, rsp
0x1005345ac: call qword ptr [rax + 0x88]
0x1005345b2: jmp 0x1005346c3 ; 0x1005346c3
0x1005345b7: mov rdi, qword ptr [rsi + 0x5c8]
0x1005345be: test byte ptr [rbx + 0x38], 1
0x1005345c2: jne 0x1005345cd
0x1005345c4: lea rsi, [rbx + 0x38]
0x1005345c8: inc rsi
0x1005345cb: jmp 0x1005345d1 ; 0x1005345d1
0x1005345cd: mov rsi, qword ptr [rbx + 0x48]
0x1005345d1: vxorps ymm0, ymm0, ymm0
0x1005345d5: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x1005345de: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x1005345e7: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x1005345f0: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x1005345f9: mov eax, dword ptr [rbx + 0x50]
0x1005345fc: mov byte ptr [rsp + 0x1cd], 0
0x100534604: mov dword ptr [rsp + 0x1c0], eax
0x10053460b: mov eax, dword ptr [rbx + 0x54]
0x10053460e: mov dword ptr [rsp + 0x22c], eax
0x100534615: mov dword ptr [rsp + 0x230], 0x40011
0x100534620: vmovups ymmword ptr [rsp + 0x190], ymm0
0x100534629: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x100534632: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x10053463b: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x100534644: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10053464d: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x100534656: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x10053465f: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x100534668: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x100534671: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x10053467a: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x100534680: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x100534686: vmovaps ymmword ptr [rsp + 0x20], ymm0
0x10053468c: vmovaps ymmword ptr [rsp], ymm0
0x100534691: lea rdx, [rsp + 0x1c0]
0x100534699: mov rcx, rsp
0x10053469c: vzeroupper 
0x10053469f: call 0x1006018a0 ; 0x1006018a0
0x1005346a4: mov qword ptr [rbx + 0x60], rax
0x1005346a8: mov qword ptr [rbx + 0x68], rdx
0x1005346ac: mov byte ptr [rbx + 0x70], 1
0x1005346b0: cmp qword ptr [rbx + 0x58], 0
0x1005346b5: jne 0x10053444c
0x1005346bb: mov rdi, rbx
0x1005346be: call 0x10032ef60 ; 0x10032ef60
0x1005346c3: mov rax, qword ptr [rip + 0x6d920e] ; 0x100c0d8d8
0x1005346ca: mov rax, qword ptr [rax]
0x1005346cd: cmp rax, qword ptr [rsp + 0x258]
0x1005346d5: jne 0x1005346e3
0x1005346d7: lea rsp, [rbp - 0x10]
0x1005346db: pop rbx
0x1005346dc: pop r14
0x1005346de: pop rbp
0x1005346df: vzeroupper 
0x1005346e2: ret 
0x1005346e3: vzeroupper 
0x1005346e6: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1005346eb: nop dword ptr [rax + rax]
