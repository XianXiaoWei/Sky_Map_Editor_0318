0x1001aa870: push rbp
0x1001aa871: mov rbp, rsp
0x1001aa874: push r15
0x1001aa876: push r14
0x1001aa878: push r13
0x1001aa87a: push r12
0x1001aa87c: push rbx
0x1001aa87d: sub rsp, 0x38
0x1001aa881: mov qword ptr [rbp - 0x30], rsi
0x1001aa885: mov rbx, rdi
0x1001aa888: mov rax, qword ptr [rbx + 0x38]
0x1001aa88c: test rax, rax
0x1001aa88f: je 0x1001aaa1a
0x1001aa895: mov ecx, dword ptr [rax + 0x10]
0x1001aa898: mov qword ptr [rbp - 0x50], rcx
0x1001aa89c: test rcx, rcx
0x1001aa89f: je 0x1001aa9e4
0x1001aa8a5: mov qword ptr [rbp - 0x48], rbx
0x1001aa8a9: xor r15d, r15d
0x1001aa8ac: lea r14, [rbp - 0x40]
0x1001aa8b0: mov rax, qword ptr [rax + 8]
0x1001aa8b4: mov rax, qword ptr [rax + r15*8]
0x1001aa8b8: mov qword ptr [rbp - 0x58], rax
0x1001aa8bc: call 0x1007abc10 ; 0x1007abc10
0x1001aa8c1: mov qword ptr [rbp - 0x40], 0
0x1001aa8c9: mov rdi, qword ptr [rip + 0x1c2ff00] ; 0x101dda7d0
0x1001aa8d0: mov rbx, qword ptr [rdi]
0x1001aa8d3: mov rsi, r14
0x1001aa8d6: lea rdx, [rbp - 0x58]
0x1001aa8da: mov rcx, rax
0x1001aa8dd: call qword ptr [rbx + 0x40]
0x1001aa8e0: mov rbx, qword ptr [rbp - 0x40]
0x1001aa8e4: test rbx, rbx
0x1001aa8e7: je 0x1001aa9fb
0x1001aa8ed: mov byte ptr [rbx + 0x164], 0
0x1001aa8f4: mov rax, qword ptr [rbx + 0x3a0]
0x1001aa8fb: mov rdi, qword ptr [rax + 0x68]
0x1001aa8ff: mov esi, 1
0x1001aa904: vxorps xmm1, xmm1, xmm1
0x1001aa908: mov edx, 1
0x1001aa90d: vmovss xmm0, dword ptr [rip + 0x8fdd1f] ; 0x100aa8634
0x1001aa915: call 0x100096d50 ; 0x100096d50
0x1001aa91a: mov rax, qword ptr [rbx + 0x3a0]
0x1001aa921: mov byte ptr [rax + 0x348], 1
0x1001aa928: mov rax, qword ptr [rbp - 0x30]
0x1001aa92c: mov rdi, qword ptr [rax + 0x280]
0x1001aa933: call 0x1000fc260 ; 0x1000fc260
0x1001aa938: mov r12, qword ptr [rax + 0x18]
0x1001aa93c: mov rax, qword ptr [rbx]
0x1001aa93f: mov r13, r14
0x1001aa942: mov rdi, r14
0x1001aa945: mov rsi, rbx
0x1001aa948: call qword ptr [rax + 0x58]
0x1001aa94b: vmovaps xmm0, xmmword ptr [r12 + 0x10]
0x1001aa952: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x1001aa957: vmulps xmm0, xmm0, xmm0
0x1001aa95b: vmovshdup xmm1, xmm0
0x1001aa95f: vaddss xmm1, xmm0, xmm1
0x1001aa963: vpermilpd xmm0, xmm0, 1
0x1001aa969: vaddss xmm0, xmm0, xmm1
0x1001aa96d: mov rbx, qword ptr [rbp - 0x48]
0x1001aa971: vmovss xmm1, dword ptr [rbx + 0x40]
0x1001aa976: vucomiss xmm1, xmm0
0x1001aa97a: jbe 0x1001aa9a9
0x1001aa97c: mov rax, qword ptr [rbp - 0x30]
0x1001aa980: mov r14, qword ptr [rax + 0x240]
0x1001aa987: mov esi, 0x24
0x1001aa98c: mov rdi, r14
0x1001aa98f: call 0x1000438e0 ; 0x1000438e0
0x1001aa994: vaddss xmm0, xmm0, dword ptr [rip + 0x8fa724] ; 0x100aa50c0
0x1001aa99c: mov esi, 0x24
0x1001aa9a1: mov rdi, r14
0x1001aa9a4: call 0x100044920 ; 0x100044920
0x1001aa9a9: inc r15
0x1001aa9ac: cmp r15, qword ptr [rbp - 0x50]
0x1001aa9b0: jae 0x1001aa9e4
0x1001aa9b2: mov rax, qword ptr [rbx + 0x38]
0x1001aa9b6: mov ecx, dword ptr [rax + 0x10]
0x1001aa9b9: cmp r15, rcx
0x1001aa9bc: mov r14, r13
0x1001aa9bf: jb 0x1001aa8b0
0x1001aa9c5: lea rdi, [rip + 0x9b6f8c] ; 0x100b61958 idx < size
0x1001aa9cc: lea rsi, [rip + 0x9b6f90] ; 0x100b61963 ./Clump.h
0x1001aa9d3: mov edx, 0x36
0x1001aa9d8: mov ecx, 3
0x1001aa9dd: call 0x1007e5f70 ; 0x1007e5f70
0x1001aa9e2: ud2 
0x1001aa9e4: mov rdi, rbx
0x1001aa9e7: call 0x10032ef60 ; 0x10032ef60
0x1001aa9ec: add rsp, 0x38
0x1001aa9f0: pop rbx
0x1001aa9f1: pop r12
0x1001aa9f3: pop r13
0x1001aa9f5: pop r14
0x1001aa9f7: pop r15
0x1001aa9f9: pop rbp
0x1001aa9fa: ret 
0x1001aa9fb: lea rdi, [rip + 0x9b70f6] ; 0x100b61af8 ret
0x1001aaa02: lea rsi, [rip + 0x9b6f5a] ; 0x100b61963 ./Clump.h
0x1001aaa09: mov edx, 0x47
0x1001aaa0e: mov ecx, 3
0x1001aaa13: call 0x1007e5f70 ; 0x1007e5f70
0x1001aaa18: ud2 
0x1001aaa1a: lea rdi, [rip + 0x9cd35a] ; 0x100b77d7b birds
0x1001aaa21: lea rsi, [rip + 0x9cd25b] ; 0x100b77c83 BirdV2.cpp
0x1001aaa28: mov edx, 0x85a
0x1001aaa2d: mov ecx, 3
0x1001aaa32: call 0x1007e5f70 ; 0x1007e5f70
0x1001aaa37: ud2 
0x1001aaa39: nop dword ptr [rax]
