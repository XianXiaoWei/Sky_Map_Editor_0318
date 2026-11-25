0x1000e42d0: push rbp
0x1000e42d1: mov rbp, rsp
0x1000e42d4: push r14
0x1000e42d6: push rbx
0x1000e42d7: mov r10d, edx
0x1000e42da: mov r11, qword ptr [rbp + 0x18]
0x1000e42de: mov r14d, dword ptr [rbp + 0x10]
0x1000e42e2: mov ebx, dword ptr [r11 + 0x78]
0x1000e42e6: cmp ebx, 1
0x1000e42e9: jne 0x1000e42fa
0x1000e42eb: mov rax, qword ptr [r11 + 0x70]
0x1000e42ef: mov qword ptr [rdi + 0x30], rax
0x1000e42f3: test rax, rax
0x1000e42f6: jne 0x1000e4359
0x1000e42f8: jmp 0x1000e4318 ; 0x1000e4318
0x1000e42fa: test r14d, r14d
0x1000e42fd: js 0x1000e4350
0x1000e42ff: cmp ebx, r14d
0x1000e4302: jbe 0x1000e4350
0x1000e4304: movsxd rax, r14d
0x1000e4307: shl rax, 7
0x1000e430b: add rax, qword ptr [r11 + 0x70]
0x1000e430f: mov qword ptr [rdi + 0x30], rax
0x1000e4313: test rax, rax
0x1000e4316: jne 0x1000e4359
0x1000e4318: sub rsp, 8
0x1000e431c: lea rdi, [rip + 0xa8e441] ; 0x100b72764 anim != nullptr
0x1000e4323: lea rsi, [rip + 0xa8e44a] ; 0x100b72774 AnimationPack.cpp
0x1000e432a: lea r8, [rip + 0xa8e455] ; 0x100b72786 pack=%s frame=%d animIdx=%d animCount=%d
0x1000e4331: mov edx, 0x31
0x1000e4336: mov ecx, 4
0x1000e433b: xor eax, eax
0x1000e433d: mov r9, r11
0x1000e4340: push rbx
0x1000e4341: push r14
0x1000e4343: push r10
0x1000e4345: call 0x1007e6030 ; 0x1007e6030
0x1000e434a: add rsp, 0x20
0x1000e434e: ud2 
0x1000e4350: mov rax, qword ptr [rdi + 0x30]
0x1000e4354: test rax, rax
0x1000e4357: je 0x1000e4318
0x1000e4359: vmovd xmm1, esi
0x1000e435d: vpinsrd xmm1, xmm1, r10d, 1
0x1000e4363: vpinsrd xmm1, xmm1, ecx, 2
0x1000e4369: vpinsrd xmm1, xmm1, r8d, 3
0x1000e436f: vmovd xmm2, dword ptr [rax]
0x1000e4373: vpshufd xmm2, xmm2, 0
0x1000e4378: vpsubd xmm1, xmm1, xmm2
0x1000e437c: vmovdqu xmmword ptr [rdi + 0x18], xmm1
0x1000e4381: cmp r8d, r10d
0x1000e4384: setl al
0x1000e4387: cmp ecx, r10d
0x1000e438a: setl cl
0x1000e438d: or cl, al
0x1000e438f: and cl, r9b
0x1000e4392: mov byte ptr [rdi + 0x28], cl
0x1000e4395: vpxor xmm1, xmm1, xmm1
0x1000e4399: vmaxss xmm1, xmm1, xmm0
0x1000e439d: vmovss xmm2, dword ptr [rip + 0x9c0d1b] ; 0x100aa50c0
0x1000e43a5: vminss xmm1, xmm2, xmm1
0x1000e43a9: vmulss xmm3, xmm1, xmm1
0x1000e43ad: vmulss xmm3, xmm1, xmm3
0x1000e43b1: vmulss xmm4, xmm1, dword ptr [rip + 0x9c26eb] ; 0x100aa6aa4
0x1000e43b9: vaddss xmm4, xmm4, dword ptr [rip + 0x9c52bb] ; 0x100aa967c
0x1000e43c1: vmulss xmm1, xmm1, xmm4
0x1000e43c5: vaddss xmm1, xmm1, dword ptr [rip + 0x9c340f] ; 0x100aa77dc
0x1000e43cd: vmulss xmm1, xmm3, xmm1
0x1000e43d1: vmovss dword ptr [rdi + 0x10], xmm1
0x1000e43d6: vsubss xmm1, xmm2, xmm1
0x1000e43da: vmovss dword ptr [rdi + 0x14], xmm1
0x1000e43df: vmulss xmm1, xmm0, dword ptr [rip + 0x9c01d1] ; 0x100aa45b8
0x1000e43e7: vmovss xmm3, dword ptr [rip + 0x9c26bd] ; 0x100aa6aac
0x1000e43ef: vsubss xmm3, xmm3, xmm0
0x1000e43f3: vmulss xmm3, xmm3, xmm0
0x1000e43f7: vmovss xmm4, dword ptr [rip + 0x9c0cc5] ; 0x100aa50c4
0x1000e43ff: vaddss xmm3, xmm3, xmm4
0x1000e4403: vmulss xmm3, xmm1, xmm3
0x1000e4407: vmovss dword ptr [rdi], xmm3
0x1000e440b: vmulss xmm3, xmm0, dword ptr [rip + 0x9c33dd] ; 0x100aa77f0
0x1000e4413: vaddss xmm5, xmm3, dword ptr [rip + 0x9c4245] ; 0x100aa8660
0x1000e441b: vmulss xmm5, xmm5, xmm0
0x1000e441f: vmulss xmm5, xmm1, xmm5
0x1000e4423: vaddss xmm5, xmm5, xmm2
0x1000e4427: vmovss dword ptr [rdi + 4], xmm5
0x1000e442c: vmovss xmm5, dword ptr [rip + 0x9c3488] ; 0x100aa78bc
0x1000e4434: vsubss xmm3, xmm5, xmm3
0x1000e4438: vmulss xmm3, xmm3, xmm0
0x1000e443c: vaddss xmm2, xmm3, xmm2
0x1000e4440: vmulss xmm2, xmm1, xmm2
0x1000e4444: vmovss dword ptr [rdi + 8], xmm2
0x1000e4449: vaddss xmm2, xmm0, xmm4
0x1000e444d: vmulss xmm0, xmm2, xmm0
0x1000e4451: vmulss xmm0, xmm1, xmm0
0x1000e4455: vmovss dword ptr [rdi + 0xc], xmm0
0x1000e445a: pop rbx
0x1000e445b: pop r14
0x1000e445d: pop rbp
0x1000e445e: ret 
0x1000e445f: nop 
