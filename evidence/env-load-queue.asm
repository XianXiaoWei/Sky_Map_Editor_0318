0x1003198d0: push rbp
0x1003198d1: mov rbp, rsp
0x1003198d4: push r15
0x1003198d6: push r14
0x1003198d8: push r12
0x1003198da: push rbx
0x1003198db: mov r14, rsi
0x1003198de: mov r15, rdi
0x1003198e1: cmp byte ptr [r15 + 0x2e264], 0
0x1003198e9: je 0x100319985
0x1003198ef: cmp dword ptr [r15 + 0x90], 0
0x1003198f7: je 0x100319985
0x1003198fd: xor ebx, ebx
0x1003198ff: nop 
0x100319900: mov rdx, qword ptr [rip + 0x1ad7159] ; 0x101df0a60
0x100319907: mov esi, 0x18
0x10031990c: mov ecx, 8
0x100319911: mov rdi, r14
0x100319914: call 0x100795530 ; 0x100795530
0x100319919: mov r12, rax
0x10031991c: vxorps xmm0, xmm0, xmm0
0x100319920: vmovups xmmword ptr [r12], xmm0
0x100319926: mov qword ptr [r12 + 0x10], 0
0x10031992f: mov eax, ebx
0x100319931: mov qword ptr [r15 + rax*8 + 0x50], r12
0x100319936: mov rax, qword ptr [r15 + rax*8 + 0x10]
0x10031993b: test rax, rax
0x10031993e: je 0x100319950
0x100319940: mov edi, dword ptr [rax]
0x100319942: call 0x1007abd30 ; 0x1007abd30
0x100319947: jmp 0x100319955 ; 0x100319955
0x100319949: nop dword ptr [rax]
0x100319950: call 0x1007abbf0 ; 0x1007abbf0
0x100319955: mov rdi, rax
0x100319958: mov rax, qword ptr [rdi]
0x10031995b: call qword ptr [rax + 0x68]
0x10031995e: test rax, rax
0x100319961: jne 0x100319968
0x100319963: call 0x1007abc60 ; 0x1007abc60
0x100319968: mov rdi, r12
0x10031996b: mov rsi, r14
0x10031996e: mov rdx, rax
0x100319971: call 0x100319d90 ; 0x100319d90
0x100319976: inc ebx
0x100319978: cmp ebx, dword ptr [r15 + 0x90]
0x10031997f: jb 0x100319900
0x100319985: vxorps ymm0, ymm0, ymm0
0x100319989: vmovups ymmword ptr [r15 + 0xb8], ymm0
0x100319992: vmovups ymmword ptr [r15 + 0x98], ymm0
0x10031999b: vmovups ymmword ptr [r15 + 0x2a138], ymm0
0x1003199a4: vmovups ymmword ptr [r15 + 0x2a118], ymm0
0x1003199ad: vmovups ymmword ptr [r15 + 0x2a0f8], ymm0
0x1003199b6: vmovups ymmword ptr [r15 + 0x2a0d8], ymm0
0x1003199bf: mov byte ptr [r15 + 0x2e264], 0
0x1003199c7: cmp dword ptr [r15 + 0x2e260], 0
0x1003199cf: je 0x100319a07
0x1003199d1: xor ebx, ebx
0x1003199d3: nop word ptr cs:[rax + rax]
0x1003199e0: mov eax, ebx
0x1003199e2: imul rax, rax, 0x410
0x1003199e9: lea rdi, [r15 + rax + 0x2a160]
0x1003199f1: mov rsi, r15
0x1003199f4: vzeroupper 
0x1003199f7: call 0x10031acb0 ; 0x10031acb0
0x1003199fc: inc ebx
0x1003199fe: cmp ebx, dword ptr [r15 + 0x2e260]
0x100319a05: jb 0x1003199e0
0x100319a07: pop rbx
0x100319a08: pop r12
0x100319a0a: pop r14
0x100319a0c: pop r15
0x100319a0e: pop rbp
0x100319a0f: vzeroupper 
0x100319a12: ret 
0x100319a13: nop word ptr cs:[rax + rax]
