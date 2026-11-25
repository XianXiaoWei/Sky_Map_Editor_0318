0x100720dd0: push rbp
0x100720dd1: mov rbp, rsp
0x100720dd4: push r15
0x100720dd6: push r14
0x100720dd8: push r13
0x100720dda: push r12
0x100720ddc: push rbx
0x100720ddd: sub rsp, 0x2f8
0x100720de4: mov r14, rcx
0x100720de7: mov qword ptr [rbp - 0x90], rdi
0x100720dee: mov rax, qword ptr [rip + 0x4ecae3] ; 0x100c0d8d8
0x100720df5: mov rax, qword ptr [rax]
0x100720df8: mov qword ptr [rbp - 0x30], rax
0x100720dfc: test edx, edx
0x100720dfe: je 0x100721b66
0x100720e04: test r14, r14
0x100720e07: je 0x100721b66
0x100720e0d: cmp byte ptr [rip + 0x191b07c], 0 ; 0x10203be90
0x100720e14: jne 0x100721b8f
0x100720e1a: mov rax, qword ptr [rbp - 0x90]
0x100720e21: cmp qword ptr [rax + 0x10], 0
0x100720e26: je 0x100721b8f
0x100720e2c: mov rax, qword ptr [rbp - 0x90]
0x100720e33: cmp dword ptr [rax + 0x218], 0
0x100720e3a: jne 0x100720e49
0x100720e3c: cmp byte ptr [rip + 0x191b0c5], 1 ; 0x10203bf08
0x100720e43: jne 0x100721b8f
0x100720e49: mov qword ptr [rbp - 0x98], rsi
0x100720e50: vstmxcsr dword ptr [rbp - 0x80]
0x100720e55: mov eax, dword ptr [rbp - 0x80]
0x100720e58: mov dword ptr [rbp - 0x9c], eax
0x100720e5e: or eax, 0xe040
0x100720e63: mov dword ptr [rbp - 0x40], eax
0x100720e66: vldmxcsr dword ptr [rbp - 0x40]
0x100720e6b: mov dword ptr [rbp - 0xa0], edx
0x100720e71: and edx, 0xfffffffc
0x100720e74: mov dword ptr [rbp - 0x88], edx
0x100720e7a: je 0x100721871
0x100720e80: mov rcx, qword ptr [rbp - 0x90]
0x100720e87: mov rax, qword ptr [rcx + 0x10]
0x100720e8b: vmovupd xmm8, xmmword ptr [rax + 0x140]
0x100720e93: vmovupd xmm1, xmmword ptr [rax + 0x150]
0x100720e9b: vmovupd xmm2, xmmword ptr [rax + 0x160]
0x100720ea3: vmovupd xmm3, xmmword ptr [rax + 0x170]
0x100720eab: vbroadcastss xmm4, dword ptr [rax + 0x180]
0x100720eb4: vmovaps xmmword ptr [rbp - 0x1f0], xmm4
0x100720ebc: vbroadcastss xmm4, dword ptr [rax + 0x194]
0x100720ec5: vmovaps xmmword ptr [rbp - 0x1e0], xmm4
0x100720ecd: vbroadcastss xmm4, dword ptr [rax + 0x1a8]
0x100720ed6: vmovaps xmmword ptr [rbp - 0x100], xmm4
0x100720ede: vbroadcastss xmm4, dword ptr [rax + 0x1b8]
0x100720ee7: vmovaps xmmword ptr [rbp - 0xf0], xmm4
0x100720eef: vmovddup xmm4, xmm8
0x100720ef4: vmovddup xmm5, xmm1
0x100720ef8: vmovddup xmm6, xmm2
0x100720efc: vpermilps xmm7, xmm4, 0
0x100720f02: vmovaps xmmword ptr [rbp - 0x1d0], xmm7
0x100720f0a: vpermilps xmm7, xmm5, 0
0x100720f10: vmovaps xmmword ptr [rbp - 0x1c0], xmm7
0x100720f18: vpermilps xmm7, xmm6, 0
0x100720f1e: vmovaps xmmword ptr [rbp - 0x1b0], xmm7
0x100720f26: vmovddup xmm7, xmm3
0x100720f2a: vpermilps xmm0, xmm7, 0
0x100720f30: vmovaps xmmword ptr [rbp - 0x1a0], xmm0
0x100720f38: vpermilps xmm0, xmm4, 0x55
0x100720f3e: vmovaps xmmword ptr [rbp - 0x190], xmm0
0x100720f46: vpermilps xmm0, xmm5, 0x55
0x100720f4c: vmovaps xmmword ptr [rbp - 0x180], xmm0
0x100720f54: vpermilps xmm0, xmm6, 0x55
0x100720f5a: vmovaps xmmword ptr [rbp - 0x170], xmm0
0x100720f62: vpermilps xmm0, xmm7, 0x55
0x100720f68: vmovaps xmmword ptr [rbp - 0x160], xmm0
0x100720f70: vpermilps xmm0, xmm8, 0xaa
0x100720f76: vmovaps xmmword ptr [rbp - 0x150], xmm0
0x100720f7e: vpermilps xmm0, xmm1, 0xaa
0x100720f84: vmovaps xmmword ptr [rbp - 0x140], xmm0
0x100720f8c: vpermilps xmm0, xmm2, 0xaa
0x100720f92: vmovaps xmmword ptr [rbp - 0x130], xmm0
0x100720f9a: vpermilps xmm0, xmm3, 0xaa
0x100720fa0: vmovaps xmmword ptr [rbp - 0x120], xmm0
0x100720fa8: mov al, byte ptr [rip + 0x191af5a] ; 0x10203bf08
0x100720fae: mov byte ptr [rbp - 0x81], al
0x100720fb4: mov eax, dword ptr [rbp - 0x88]
0x100720fba: mov qword ptr [rbp - 0xd8], rax
0x100720fc1: xor r11d, r11d
0x100720fc4: xor r13d, r13d
0x100720fc7: vbroadcastss xmm0, dword ptr [rcx + 0x18]
0x100720fcd: vmovaps xmmword ptr [rbp - 0x110], xmm0
0x100720fd5: vmovdqa xmm12, xmmword ptr [rip + 0x390623] ; 0x100ab1600
0x100720fdd: nop dword ptr [rax]
0x100720fe0: mov rdx, r13
0x100720fe3: shl rdx, 4
0x100720fe7: mov rsi, r13
0x100720fea: or rsi, 1
0x100720fee: mov rdi, rsi
0x100720ff1: shl rdi, 4
0x100720ff5: mov r9, r13
0x100720ff8: or r9, 2
0x100720ffc: mov rcx, r9
0x100720fff: shl rcx, 4
0x100721003: mov r8, r13
0x100721006: or r8, 3
0x10072100a: mov rax, r8
0x10072100d: shl rax, 4
0x100721011: mov rbx, qword ptr [rbp - 0x98]
0x100721018: vmovss xmm0, dword ptr [rbx + rdx]
0x10072101d: vmovss xmm1, dword ptr [rbx + rdx + 4]
0x100721023: vinsertps xmm0, xmm0, dword ptr [rbx + rdi], 0x10
0x10072102a: vinsertps xmm0, xmm0, dword ptr [rbx + rcx], 0x20
0x100721031: vinsertps xmm0, xmm0, dword ptr [rbx + rax], 0x30
0x100721038: vinsertps xmm1, xmm1, dword ptr [rbx + rdi + 4], 0x10
0x100721040: vinsertps xmm1, xmm1, dword ptr [rbx + rcx + 4], 0x20
0x100721048: vinsertps xmm1, xmm1, dword ptr [rbx + rax + 4], 0x30
0x100721050: vmovss xmm2, dword ptr [rbx + rdx + 8]
0x100721056: vinsertps xmm2, xmm2, dword ptr [rbx + rdi + 8], 0x10
0x10072105e: vinsertps xmm2, xmm2, dword ptr [rbx + rcx + 8], 0x20
0x100721066: vinsertps xmm2, xmm2, dword ptr [rbx + rax + 8], 0x30
0x10072106e: vmovss xmm3, dword ptr [rbx + rdx + 0xc]
0x100721074: vinsertps xmm3, xmm3, dword ptr [rbx + rdi + 0xc], 0x10
0x10072107c: vinsertps xmm3, xmm3, dword ptr [rbx + rcx + 0xc], 0x20
0x100721084: vinsertps xmm3, xmm3, dword ptr [rbx + rax + 0xc], 0x30
0x10072108c: vmulps xmm4, xmm0, xmmword ptr [rbp - 0x1d0]
0x100721094: vmulps xmm5, xmm1, xmmword ptr [rbp - 0x1c0]
0x10072109c: vaddps xmm4, xmm4, xmm5
0x1007210a0: vmulps xmm5, xmm2, xmmword ptr [rbp - 0x1b0]
0x1007210a8: vaddps xmm4, xmm4, xmm5
0x1007210ac: vaddps xmm5, xmm4, xmmword ptr [rbp - 0x1a0]
0x1007210b4: vmulps xmm4, xmm0, xmmword ptr [rbp - 0x190]
0x1007210bc: vmulps xmm6, xmm1, xmmword ptr [rbp - 0x180]
0x1007210c4: vaddps xmm4, xmm4, xmm6
0x1007210c8: vmulps xmm6, xmm2, xmmword ptr [rbp - 0x170]
0x1007210d0: vaddps xmm4, xmm4, xmm6
0x1007210d4: vaddps xmm6, xmm4, xmmword ptr [rbp - 0x160]
0x1007210dc: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x150]
0x1007210e4: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x140]
0x1007210ec: vaddps xmm0, xmm0, xmm1
0x1007210f0: vmulps xmm1, xmm2, xmmword ptr [rbp - 0x130]
0x1007210f8: vaddps xmm0, xmm0, xmm1
0x1007210fc: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x120]
0x100721104: vaddps xmm13, xmm3, xmm5
0x100721108: vsubps xmm11, xmm5, xmm3
0x10072110c: vaddps xmm10, xmm3, xmm6
0x100721110: vsubps xmm9, xmm6, xmm3
0x100721114: vaddps xmm2, xmm3, xmm0
0x100721118: vsubps xmm7, xmm0, xmm3
0x10072111c: vmulps xmm5, xmm5, xmm5
0x100721120: vmulps xmm6, xmm6, xmm6
0x100721124: vaddps xmm5, xmm6, xmm5
0x100721128: vmulps xmm0, xmm0, xmm0
0x10072112c: vaddps xmm0, xmm0, xmm5
0x100721130: vaddps xmm3, xmm3, xmmword ptr [rbp - 0x110]
0x100721138: vxorps xmm15, xmm15, xmm15
0x10072113d: vcmpltps xmm6, xmm15, xmm7
0x100721142: vmulps xmm3, xmm3, xmm3
0x100721146: vcmpltps xmm4, xmm3, xmm0
0x10072114b: vmovaps xmm3, xmmword ptr [rbp - 0x1f0]
0x100721153: vmulps xmm8, xmm3, xmm13
0x100721158: vcmpltps xmm0, xmm8, xmm7
0x10072115d: vorps xmm1, xmm0, xmm6
0x100721161: vmovaps xmm5, xmmword ptr [rbp - 0x1e0]
0x100721169: vmulps xmm14, xmm5, xmm10
0x10072116e: vcmpltps xmm6, xmm14, xmm7
0x100721173: vmulps xmm3, xmm3, xmm11
0x100721178: vxorps xmm0, xmm7, xmmword ptr [rip + 0x386780] ; 0x100aa7900
0x100721180: vcmpltps xmm7, xmm0, xmm3
0x100721185: vorps xmm6, xmm6, xmm7
0x100721189: vorps xmm1, xmm1, xmm6
0x10072118d: vmulps xmm5, xmm5, xmm9
0x100721192: vcmpltps xmm6, xmm0, xmm5
0x100721197: vorps xmm1, xmm1, xmm6
0x10072119b: vorps xmm4, xmm1, xmm4
0x10072119f: vcmpltps xmm15, xmm15, xmm2
0x1007211a4: vorps xmm7, xmm4, xmm15
0x1007211a9: vpshufd xmm1, xmm7, 0xee
0x1007211ae: vpand xmm1, xmm7, xmm1
0x1007211b2: vmovd eax, xmm1
0x1007211b6: vpextrd ecx, xmm1, 1
0x1007211bc: test eax, ecx
0x1007211be: je 0x100721200
0x1007211c0: lea rax, [r14 + r13*4]
0x1007211c4: vandnps xmm0, xmm4, xmm15
0x1007211c9: vpslld xmm0, xmm0, 0x1f
0x1007211ce: vpsrad xmm0, xmm0, 0x1f
0x1007211d3: test al, 0xf
0x1007211d5: je 0x1007217c0
0x1007211db: vmovdqu xmmword ptr [rax], xmm0
0x1007211df: add r13, 4
0x1007211e3: cmp r13, qword ptr [rbp - 0xd8]
0x1007211ea: jb 0x100720fe0
0x1007211f0: jmp 0x100721871 ; 0x100721871
0x1007211f5: nop word ptr cs:[rax + rax]
0x100721200: vmovaps xmmword ptr [rbp - 0xd0], xmm14
0x100721208: cmp byte ptr [rbp - 0x81], 0
0x10072120f: jne 0x1007217da
0x100721215: vxorps xmm1, xmm2, xmmword ptr [rip + 0x3866e3] ; 0x100aa7900
0x10072121d: vrcpps xmm1, xmm1
0x100721221: vmovaps xmmword ptr [rbp - 0xb0], xmm4
0x100721229: vmulps xmm4, xmm1, xmm2
0x10072122d: vmovaps xmm14, xmm5
0x100721231: vmovaps xmm5, xmmword ptr [rip + 0x398007] ; 0x100ab9240
0x100721239: vaddps xmm4, xmm4, xmm5
0x10072123d: vmulps xmm1, xmm1, xmm4
0x100721241: vmulps xmm4, xmm1, xmm2
0x100721245: vaddps xmm4, xmm4, xmm5
0x100721249: vmulps xmm4, xmm1, xmm4
0x10072124d: vrcpps xmm1, xmm0
0x100721251: vmulps xmm6, xmm1, xmm0
0x100721255: vsubps xmm6, xmm5, xmm6
0x100721259: vmulps xmm1, xmm1, xmm6
0x10072125d: vmulps xmm0, xmm1, xmm0
0x100721261: vsubps xmm0, xmm5, xmm0
0x100721265: vmulps xmm6, xmm1, xmm0
0x100721269: vxorps xmm1, xmm1, xmm1
0x10072126d: vcmpltps xmm0, xmm13, xmm1
0x100721272: vblendvps xmm0, xmm4, xmm6, xmm0
0x100721278: vmulps xmm5, xmm8, xmm0
0x10072127c: vcmpltps xmm0, xmm11, xmm1
0x100721281: vblendvps xmm0, xmm6, xmm4, xmm0
0x100721287: vmulps xmm11, xmm3, xmm0
0x10072128b: vcmpltps xmm0, xmm10, xmm1
0x100721290: vblendvps xmm0, xmm4, xmm6, xmm0
0x100721296: vmulps xmm13, xmm0, xmmword ptr [rbp - 0xd0]
0x10072129e: vcmpltps xmm3, xmm9, xmm1
0x1007212a3: vblendvps xmm3, xmm6, xmm4, xmm3
0x1007212a9: vmulps xmm8, xmm14, xmm3
0x1007212ad: vmulps xmm2, xmm2, xmmword ptr [rbp - 0x100]
0x1007212b5: vaddps xmm2, xmm2, xmmword ptr [rbp - 0xf0]
0x1007212bd: vmulps xmm0, xmm2, xmm4
0x1007212c1: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1007212c9: vsubps xmm2, xmm5, xmm11
0x1007212ce: vmovaps xmm9, xmm5
0x1007212d2: mov rdi, qword ptr [rbp - 0x90]
0x1007212d9: vbroadcastss xmm4, dword ptr [rdi + 0xd8]
0x1007212e2: vmovdqa xmm6, xmmword ptr [rip + 0x3877a6] ; 0x100aa8a90
0x1007212ea: vmovdqa xmm5, xmm6
0x1007212ee: vpblendw xmm6, xmm4, xmm5, 0xaa
0x1007212f4: vpsrld xmm4, xmm4, 0x10
0x1007212f9: vmovdqa xmm0, xmmword ptr [rip + 0x38779f] ; 0x100aa8aa0
0x100721301: vpblendw xmm4, xmm4, xmm0, 0xaa
0x100721307: vmovaps xmm3, xmmword ptr [rip + 0x3877a1] ; 0x100aa8ab0
0x10072130f: vaddps xmm4, xmm4, xmm3
0x100721313: vaddps xmm4, xmm6, xmm4
0x100721317: vmulps xmm2, xmm4, xmm2
0x10072131b: vbroadcastss xmm4, dword ptr [rdi + 0x128]
0x100721324: vpblendw xmm6, xmm4, xmm5, 0xaa
0x10072132a: vpsrld xmm4, xmm4, 0x10
0x10072132f: vpblendw xmm4, xmm4, xmm0, 0xaa
0x100721335: vaddps xmm4, xmm4, xmm3
0x100721339: vaddps xmm4, xmm6, xmm4
0x10072133d: vsubps xmm6, xmm13, xmm8
0x100721342: vmulps xmm4, xmm4, xmm6
0x100721346: vmaxps xmm2, xmm2, xmm4
0x10072134a: vpsrad xmm2, xmm2, 0x17
0x10072134f: vpaddq xmm2, xmm2, xmmword ptr [rip + 0x3b8549] ; 0x100ad98a0
0x100721357: vpmaxsd xmm2, xmm2, xmm1
0x10072135c: mov eax, dword ptr [rdi + 0x218]
0x100721362: dec eax
0x100721364: vmovd xmm4, eax
0x100721368: vpshufd xmm4, xmm4, 0
0x10072136d: vpminsd xmm0, xmm2, xmm4
0x100721372: vmovd eax, xmm0
0x100721376: cdqe 
0x100721378: vpextrd ecx, xmm0, 1
0x10072137e: movsxd rcx, ecx
0x100721381: vpextrd edx, xmm0, 2
0x100721387: movsxd rdx, edx
0x10072138a: vmovdqa xmmword ptr [rbp - 0x200], xmm0
0x100721392: vpextrd esi, xmm0, 3
0x100721398: movsxd rsi, esi
0x10072139b: vmovss xmm2, dword ptr [rdi + rax*4 + 0x178]
0x1007213a4: vinsertps xmm2, xmm2, dword ptr [rdi + rcx*4 + 0x178], 0x10
0x1007213af: vinsertps xmm2, xmm2, dword ptr [rdi + rdx*4 + 0x178], 0x20
0x1007213ba: vinsertps xmm2, xmm2, dword ptr [rdi + rsi*4 + 0x178], 0x30
0x1007213c5: vmovaps xmm0, xmmword ptr [rip + 0x3882f3] ; 0x100aa96c0
0x1007213cd: vmovaps xmm6, xmm0
0x1007213d1: vmulps xmm4, xmm11, xmm6
0x1007213d5: vaddps xmm4, xmm4, xmm6
0x1007213d9: vmulps xmm4, xmm2, xmm4
0x1007213dd: vmulps xmm1, xmm9, xmm6
0x1007213e1: vaddps xmm1, xmm1, xmm6
0x1007213e5: vmulps xmm1, xmm2, xmm1
0x1007213e9: vmovss xmm2, dword ptr [rdi + rax*4 + 0x1c8]
0x1007213f2: vinsertps xmm2, xmm2, dword ptr [rdi + rcx*4 + 0x1c8], 0x10
0x1007213fd: vinsertps xmm2, xmm2, dword ptr [rdi + rdx*4 + 0x1c8], 0x20
0x100721408: vinsertps xmm2, xmm2, dword ptr [rdi + rsi*4 + 0x1c8], 0x30
0x100721413: vmulps xmm3, xmm8, xmm6
0x100721417: vaddps xmm3, xmm3, xmm6
0x10072141b: vmulps xmm3, xmm3, xmm2
0x10072141f: vmulps xmm0, xmm13, xmm6
0x100721423: vaddps xmm0, xmm0, xmm6
0x100721427: vmulps xmm0, xmm0, xmm2
0x10072142b: vmovd xmm2, dword ptr [rdi + rax*4 + 0xd8]
0x100721434: vpinsrd xmm2, xmm2, dword ptr [rdi + rcx*4 + 0xd8], 1
0x10072143f: vpinsrd xmm2, xmm2, dword ptr [rdi + rdx*4 + 0xd8], 2
0x10072144a: vpinsrd xmm2, xmm2, dword ptr [rdi + rsi*4 + 0xd8], 3
0x100721455: vcvtps2dq xmm4, xmm4
0x100721459: vcvtps2dq xmm1, xmm1
0x10072145d: vpcmpeqd xmm5, xmm5, xmm5
0x100721461: vpaddd xmm2, xmm2, xmm5
0x100721465: vpminsd xmm4, xmm4, xmm2
0x10072146a: vmovdqa xmmword ptr [rbp - 0x240], xmm4
0x100721472: vmovaps xmm4, xmmword ptr [rbp - 0xb0]
0x10072147a: vpminsd xmm1, xmm1, xmm2
0x10072147f: vmovdqa xmmword ptr [rbp - 0x230], xmm1
0x100721487: vmovd xmm1, dword ptr [rdi + rax*4 + 0x128]
0x100721490: vpinsrd xmm1, xmm1, dword ptr [rdi + rcx*4 + 0x128], 1
0x10072149b: vpinsrd xmm1, xmm1, dword ptr [rdi + rdx*4 + 0x128], 2
0x1007214a6: vpinsrd xmm1, xmm1, dword ptr [rdi + rsi*4 + 0x128], 3
0x1007214b1: vcvtps2dq xmm2, xmm3
0x1007214b5: vcvtps2dq xmm0, xmm0
0x1007214b9: vpaddd xmm1, xmm1, xmm5
0x1007214bd: vpminsd xmm2, xmm2, xmm1
0x1007214c2: vmovdqa xmmword ptr [rbp - 0x220], xmm2
0x1007214ca: vpminsd xmm0, xmm0, xmm1
0x1007214cf: vmovdqa xmmword ptr [rbp - 0x210], xmm0
0x1007214d7: xor eax, eax
0x1007214d9: nop dword ptr [rax]
0x1007214e0: vmovdqa xmmword ptr [rbp - 0x310], xmm7
0x1007214e8: mov ecx, eax
0x1007214ea: and ecx, 3
0x1007214ed: cmp dword ptr [rbp + rcx*4 - 0x310], 0
0x1007214f5: je 0x100721530
0x1007214f7: vmovaps xmmword ptr [rbp - 0x300], xmm4
0x1007214ff: mov edx, eax
0x100721501: and edx, 3
0x100721504: mov ecx, dword ptr [rbp + rdx*4 - 0x300]
0x10072150b: not ecx
0x10072150d: vmovdqa xmmword ptr [rbp - 0x2f0], xmm15
0x100721515: and ecx, dword ptr [rbp + rdx*4 - 0x2f0]
0x10072151c: jmp 0x100721791 ; 0x100721791
0x100721521: nop word ptr cs:[rax + rax]
0x100721530: vmovaps xmm3, xmm7
0x100721534: vmovdqa xmm2, xmm15
0x100721538: mov r15, r14
0x10072153b: vxorps xmm8, xmm8, xmm8
0x100721540: vmovdqa xmm7, xmmword ptr [rbp - 0x220]
0x100721548: vpcmpgtd xmm0, xmm7, xmm8
0x10072154d: vmovdqa xmm6, xmmword ptr [rbp - 0x230]
0x100721555: vpcmpgtd xmm1, xmm6, xmm8
0x10072155a: vmovdqa xmm5, xmmword ptr [rbp - 0x240]
0x100721562: vpcmpgtd xmm4, xmm5, xmm8
0x100721567: vmovdqa xmmword ptr [rbp - 0x2a0], xmm4
0x10072156f: mov ecx, eax
0x100721571: and ecx, 3
0x100721574: vmovdqa xmmword ptr [rbp - 0x2e0], xmm5
0x10072157c: test byte ptr [rbp + rcx*4 - 0x2a0], 1
0x100721584: mov r9d, dword ptr [rbp + rcx*4 - 0x2e0]
0x10072158c: cmove r9d, r11d
0x100721590: vmovdqa xmmword ptr [rbp - 0x290], xmm1
0x100721598: vmovdqa xmmword ptr [rbp - 0x2d0], xmm6
0x1007215a0: test byte ptr [rbp + rcx*4 - 0x290], 1
0x1007215a8: mov r10d, dword ptr [rbp + rcx*4 - 0x2d0]
0x1007215b0: cmove r10d, r11d
0x1007215b4: vmovdqa xmmword ptr [rbp - 0x280], xmm0
0x1007215bc: vmovdqa xmmword ptr [rbp - 0x2c0], xmm7
0x1007215c4: test byte ptr [rbp + rcx*4 - 0x280], 1
0x1007215cc: vmovdqa xmm1, xmmword ptr [rbp - 0x210]
0x1007215d4: vpcmpgtd xmm0, xmm1, xmm8
0x1007215d9: mov r8d, dword ptr [rbp + rcx*4 - 0x2c0]
0x1007215e1: cmove r8d, r11d
0x1007215e5: vmovdqa xmmword ptr [rbp - 0x270], xmm0
0x1007215ed: vmovdqa xmmword ptr [rbp - 0x2b0], xmm1
0x1007215f5: test byte ptr [rbp + rcx*4 - 0x270], 1
0x1007215fd: mov edi, dword ptr [rbp + rcx*4 - 0x2b0]
0x100721604: cmove edi, r11d
0x100721608: mov ecx, r8d
0x10072160b: and ecx, 0x7ffffffe
0x100721611: mov esi, edi
0x100721613: and esi, 0x7ffffffe
0x100721619: cmp ecx, esi
0x10072161b: ja 0x100721734
0x100721621: mov r14d, r9d
0x100721624: and r14d, 0x7ffffffe
0x10072162b: vmovdqa xmm0, xmmword ptr [rbp - 0x200]
0x100721633: vmovdqa xmmword ptr [rbp - 0x260], xmm0
0x10072163b: mov edx, r10d
0x10072163e: and edx, 0x7ffffffe
0x100721644: cmp r14d, edx
0x100721647: ja 0x100721734
0x10072164d: vmovd xmm0, r9d
0x100721652: vpshufd xmm11, xmm0, 0
0x100721657: vmovd xmm0, r10d
0x10072165c: vpshufd xmm10, xmm0, 0
0x100721661: vmovd xmm0, r8d
0x100721666: vpshufd xmm0, xmm0, 0
0x10072166b: vmovd xmm1, edi
0x10072166f: vpshufd xmm1, xmm1, 0
0x100721674: vmovdqa xmm4, xmmword ptr [rip + 0x3b8234] ; 0x100ad98b0
0x10072167c: vmovdqa xmm5, xmm4
0x100721680: vpand xmm4, xmm0, xmm5
0x100721684: vpor xmm9, xmm4, xmmword ptr [rip + 0x3b8204] ; 0x100ad9890
0x10072168c: mov edi, eax
0x10072168e: and edi, 3
0x100721691: movsxd r9, dword ptr [rbp + rdi*4 - 0x260]
0x100721699: vpand xmm4, xmm11, xmm5
0x10072169d: vpor xmm13, xmm4, xmmword ptr [rip + 0x3b81db] ; 0x100ad9880 -> 0x100000000 __mh_execute_header
0x1007216a5: mov rbx, qword ptr [rbp - 0x90]
0x1007216ac: mov edi, dword ptr [rbx + r9*4 + 0xd8]
0x1007216b4: add edi, edi
0x1007216b6: shr r8d, 1
0x1007216b9: imul r8d, edi
0x1007216bd: lea r8d, [r8 + r14*2]
0x1007216c1: mov r9, qword ptr [rbx + r9*8 + 0x38]
0x1007216c6: vxorps xmm8, xmm8, xmm8
0x1007216cb: nop dword ptr [rax + rax]
0x1007216d0: movsxd rbx, r8d
0x1007216d3: lea r10, [r9 + rbx*4]
0x1007216d7: vpsubd xmm4, xmm9, xmm0
0x1007216db: vpsubd xmm5, xmm1, xmm9
0x1007216e0: vpor xmm4, xmm4, xmm5
0x1007216e4: mov r12d, r14d
0x1007216e7: vmovdqa xmm5, xmm13
0x1007216eb: nop dword ptr [rax + rax]
0x1007216f0: vpsubd xmm14, xmm5, xmm11
0x1007216f5: vpsubd xmm15, xmm10, xmm5
0x1007216f9: vpor xmm6, xmm4, xmm15
0x1007216fe: vpor xmm6, xmm6, xmm14
0x100721703: vpsrad xmm6, xmm6, 0x1f
0x100721708: vmaxps xmm7, xmm8, xmmword ptr [r10]
0x10072170d: vpblendvb xmm8, xmm7, xmm8, xmm6
0x100721713: vpaddd xmm5, xmm5, xmm12
0x100721718: add r12d, 2
0x10072171c: add r10, 0x10
0x100721720: cmp r12d, edx
0x100721723: jbe 0x1007216f0
0x100721725: vpaddd xmm9, xmm9, xmm12
0x10072172a: add ecx, 2
0x10072172d: add r8d, edi
0x100721730: cmp ecx, esi
0x100721732: jbe 0x1007216d0
0x100721734: vpermilpd xmm0, xmm8, 3
0x10072173a: vmovddup xmm1, xmm8
0x10072173f: vmovshdup xmm4, xmm0
0x100721743: vmaxss xmm0, xmm4, xmm0
0x100721747: vmovshdup xmm4, xmm1
0x10072174b: vmaxss xmm1, xmm4, xmm1
0x10072174f: vmaxss xmm0, xmm1, xmm0
0x100721753: vmovdqa xmm1, xmmword ptr [rbp - 0xd0]
0x10072175b: vmovdqa xmmword ptr [rbp - 0x250], xmm1
0x100721763: mov ecx, eax
0x100721765: and ecx, 3
0x100721768: vucomiss xmm0, dword ptr [rbp + rcx*4 - 0x250]
0x100721771: mov ecx, 0
0x100721776: mov edx, 0xffffffff
0x10072177b: cmovae ecx, edx
0x10072177e: mov r14, r15
0x100721781: vmovdqa xmm15, xmm2
0x100721785: vmovaps xmm4, xmmword ptr [rbp - 0xb0]
0x10072178d: vmovaps xmm7, xmm3
0x100721791: lea rdx, [rax + r13]
0x100721795: mov dword ptr [r14 + rdx*4], ecx
0x100721799: inc rax
0x10072179c: cmp rax, 4
0x1007217a0: jne 0x1007214e0
0x1007217a6: add r13, 4
0x1007217aa: cmp r13, qword ptr [rbp - 0xd8]
0x1007217b1: jb 0x100720fe0
0x1007217b7: jmp 0x100721871 ; 0x100721871
0x1007217bc: nop dword ptr [rax]
0x1007217c0: vmovdqa xmmword ptr [rax], xmm0
0x1007217c4: add r13, 4
0x1007217c8: cmp r13, qword ptr [rbp - 0xd8]
0x1007217cf: jb 0x100720fe0
0x1007217d5: jmp 0x100721871 ; 0x100721871
0x1007217da: vmovd eax, xmm7
0x1007217de: mov edx, 0xffffffff
0x1007217e3: mov edi, 0xffffffff
0x1007217e8: test eax, eax
0x1007217ea: je 0x1007217f8
0x1007217ec: vmovd eax, xmm4
0x1007217f0: not eax
0x1007217f2: vmovd edi, xmm15
0x1007217f6: and edi, eax
0x1007217f8: mov dword ptr [r14 + r13*4], edi
0x1007217fc: vpextrd eax, xmm7, 1
0x100721802: test eax, eax
0x100721804: je 0x100721816
0x100721806: vpextrd eax, xmm4, 1
0x10072180c: not eax
0x10072180e: vpextrd edx, xmm15, 1
0x100721814: and edx, eax
0x100721816: mov dword ptr [r14 + rsi*4], edx
0x10072181a: vpextrd eax, xmm7, 2
0x100721820: mov edx, 0xffffffff
0x100721825: mov esi, 0xffffffff
0x10072182a: test eax, eax
0x10072182c: je 0x10072183e
0x10072182e: vpextrd eax, xmm4, 2
0x100721834: not eax
0x100721836: vpextrd esi, xmm15, 2
0x10072183c: and esi, eax
0x10072183e: mov dword ptr [r14 + r9*4], esi
0x100721842: vpextrd eax, xmm7, 3
0x100721848: test eax, eax
0x10072184a: je 0x10072185c
0x10072184c: vpextrd eax, xmm4, 3
0x100721852: not eax
0x100721854: vpextrd edx, xmm15, 3
0x10072185a: and edx, eax
0x10072185c: mov dword ptr [r14 + r8*4], edx
0x100721860: add r13, 4
0x100721864: cmp r13, qword ptr [rbp - 0xd8]
0x10072186b: jb 0x100720fe0
0x100721871: mov ebx, dword ptr [rbp - 0xa0]
0x100721877: mov ecx, dword ptr [rbp - 0x88]
0x10072187d: cmp ecx, ebx
0x10072187f: mov rax, qword ptr [rbp - 0x98]
0x100721886: je 0x100721b4f
0x10072188c: mov r13d, ecx
0x10072188f: mov rsi, r13
0x100721892: shl rsi, 4
0x100721896: add rsi, rax
0x100721899: mov r15d, ebx
0x10072189c: sub r15d, ecx
0x10072189f: mov r12, r15
0x1007218a2: shl r12, 4
0x1007218a6: lea rdi, [rbp - 0x80]
0x1007218aa: mov rdx, r12
0x1007218ad: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1007218b2: mov r9d, dword ptr [rbp - 0x88]
0x1007218b9: cmp ebx, r9d
0x1007218bc: je 0x100721995
0x1007218c2: lea rcx, [r15 - 1]
0x1007218c6: mov eax, r15d
0x1007218c9: and eax, 3
0x1007218cc: cmp rcx, 3
0x1007218d0: jae 0x1007218e9
0x1007218d2: xor ecx, ecx
0x1007218d4: mov r8, qword ptr [rbp - 0x98]
0x1007218db: test rax, rax
0x1007218de: jne 0x10072195d
0x1007218e4: jmp 0x10072198b ; 0x10072198b
0x1007218e9: mov rdx, r15
0x1007218ec: sub rdx, rax
0x1007218ef: lea rsi, [rbp - 0x50]
0x1007218f3: xor ecx, ecx
0x1007218f5: mov r8, qword ptr [rbp - 0x98]
0x1007218fc: nop dword ptr [rax]
0x100721900: lea rdi, [r13 + rcx]
0x100721905: mov ebx, edi
0x100721907: shl rbx, 4
0x10072190b: vmovaps xmm0, xmmword ptr [r8 + rbx]
0x100721911: vmovaps xmmword ptr [rsi - 0x30], xmm0
0x100721916: lea ebx, [rdi + 1]
0x100721919: shl rbx, 4
0x10072191d: vmovaps xmm0, xmmword ptr [r8 + rbx]
0x100721923: vmovaps xmmword ptr [rsi - 0x20], xmm0
0x100721928: lea ebx, [rdi + 2]
0x10072192b: shl rbx, 4
0x10072192f: vmovaps xmm0, xmmword ptr [r8 + rbx]
0x100721935: vmovaps xmmword ptr [rsi - 0x10], xmm0
0x10072193a: add edi, 3
0x10072193d: shl rdi, 4
0x100721941: vmovaps xmm0, xmmword ptr [r8 + rdi]
0x100721947: vmovaps xmmword ptr [rsi], xmm0
0x10072194b: add rcx, 4
0x10072194f: add rsi, 0x40
0x100721953: cmp rdx, rcx
0x100721956: jne 0x100721900
0x100721958: test rax, rax
0x10072195b: je 0x10072198b
0x10072195d: mov rdx, rcx
0x100721960: shl rdx, 4
0x100721964: lea rdx, [rbp + rdx - 0x80]
0x100721969: add ecx, r9d
0x10072196c: neg rax
0x10072196f: nop 
0x100721970: mov esi, ecx
0x100721972: shl rsi, 4
0x100721976: vmovaps xmm0, xmmword ptr [r8 + rsi]
0x10072197c: vmovaps xmmword ptr [rdx], xmm0
0x100721980: add rdx, 0x10
0x100721984: inc ecx
0x100721986: inc rax
0x100721989: jne 0x100721970
0x10072198b: cmp r15d, 3
0x10072198f: ja 0x100721a2d
0x100721995: lea eax, [r15 - 1]
0x100721999: shl rax, 4
0x10072199d: lea rax, [rbp + rax - 0x80]
0x1007219a2: mov ecx, 3
0x1007219a7: sub rcx, r15
0x1007219aa: mov esi, r15d
0x1007219ad: neg esi
0x1007219af: mov rdx, r15
0x1007219b2: and esi, 3
0x1007219b5: je 0x1007219e4
0x1007219b7: mov esi, esi
0x1007219b9: lea rdi, [rbp + r12 - 0x80]
0x1007219be: neg rsi
0x1007219c1: mov rdx, r15
0x1007219c4: nop word ptr cs:[rax + rax]
0x1007219d0: vmovaps xmm0, xmmword ptr [rax]
0x1007219d4: vmovaps xmmword ptr [rdi], xmm0
0x1007219d8: inc rdx
0x1007219db: add rdi, 0x10
0x1007219df: inc rsi
0x1007219e2: jne 0x1007219d0
0x1007219e4: cmp rcx, 3
0x1007219e8: jb 0x100721a2d
0x1007219ea: mov ecx, 4
0x1007219ef: sub rcx, rdx
0x1007219f2: shl rdx, 4
0x1007219f6: lea rdx, [rbp + rdx - 0x50]
0x1007219fb: nop dword ptr [rax + rax]
0x100721a00: vmovaps xmm0, xmmword ptr [rax]
0x100721a04: vmovaps xmmword ptr [rdx - 0x30], xmm0
0x100721a09: vmovaps xmm0, xmmword ptr [rax]
0x100721a0d: vmovaps xmmword ptr [rdx - 0x20], xmm0
0x100721a12: vmovaps xmm0, xmmword ptr [rax]
0x100721a16: vmovaps xmmword ptr [rdx - 0x10], xmm0
0x100721a1b: vmovaps xmm0, xmmword ptr [rax]
0x100721a1f: vmovaps xmmword ptr [rdx], xmm0
0x100721a23: add rdx, 0x40
0x100721a27: add rcx, -4
0x100721a2b: jne 0x100721a00
0x100721a2d: lea rsi, [rbp - 0x80]
0x100721a31: lea rcx, [rbp - 0x40]
0x100721a35: mov edx, 4
0x100721a3a: mov r8d, 1
0x100721a40: mov rdi, qword ptr [rbp - 0x90]
0x100721a47: call 0x100720dd0 ; 0x100720dd0
0x100721a4c: test r15d, r15d
0x100721a4f: mov ebx, dword ptr [rbp - 0x88]
0x100721a55: je 0x100721b49
0x100721a5b: cmp r15d, 0x1f
0x100721a5f: ja 0x100721a65
0x100721a61: xor ecx, ecx
0x100721a63: jmp 0x100721ad1 ; 0x100721ad1
0x100721a65: lea rax, [r15 - 1]
0x100721a69: xor ecx, ecx
0x100721a6b: mov edx, ebx
0x100721a6d: add edx, eax
0x100721a6f: jb 0x100721ad1
0x100721a71: shr rax, 0x20
0x100721a75: jne 0x100721ad1
0x100721a77: mov eax, r15d
0x100721a7a: and eax, 0x1f
0x100721a7d: mov rcx, r15
0x100721a80: sub rcx, rax
0x100721a83: lea rdx, [rbp + 0x20]
0x100721a87: mov rsi, rcx
0x100721a8a: nop word ptr [rax + rax]
0x100721a90: vmovups ymm0, ymmword ptr [rdx - 0x60]
0x100721a95: vmovups ymm1, ymmword ptr [rdx - 0x40]
0x100721a9a: vmovups ymm2, ymmword ptr [rdx - 0x20]
0x100721a9f: vmovups ymm3, ymmword ptr [rdx]
0x100721aa3: mov edi, ebx
0x100721aa5: vmovups ymmword ptr [r14 + rdi*4], ymm0
0x100721aab: vmovups ymmword ptr [r14 + rdi*4 + 0x20], ymm1
0x100721ab2: vmovups ymmword ptr [r14 + rdi*4 + 0x40], ymm2
0x100721ab9: vmovups ymmword ptr [r14 + rdi*4 + 0x60], ymm3
0x100721ac0: sub rdx, -0x80
0x100721ac4: add ebx, 0x20
0x100721ac7: add rsi, -0x20
0x100721acb: jne 0x100721a90
0x100721acd: test eax, eax
0x100721acf: je 0x100721b49
0x100721ad1: mov edx, r15d
0x100721ad4: sub edx, ecx
0x100721ad6: lea rax, [r15 - 1]
0x100721ada: sub rax, rcx
0x100721add: and rdx, 3
0x100721ae1: je 0x100721b05
0x100721ae3: neg rdx
0x100721ae6: nop word ptr cs:[rax + rax]
0x100721af0: mov esi, dword ptr [rbp + rcx*4 - 0x40]
0x100721af4: lea edi, [r13 + rcx]
0x100721af9: mov dword ptr [r14 + rdi*4], esi
0x100721afd: inc rcx
0x100721b00: inc rdx
0x100721b03: jne 0x100721af0
0x100721b05: cmp rax, 3
0x100721b09: jb 0x100721b49
0x100721b0b: nop dword ptr [rax + rax]
0x100721b10: mov eax, dword ptr [rbp + rcx*4 - 0x40]
0x100721b14: lea rdx, [r13 + rcx]
0x100721b19: mov esi, edx
0x100721b1b: mov dword ptr [r14 + rsi*4], eax
0x100721b1f: mov eax, dword ptr [rbp + rcx*4 - 0x3c]
0x100721b23: lea esi, [rdx + 1]
0x100721b26: mov dword ptr [r14 + rsi*4], eax
0x100721b2a: mov eax, dword ptr [rbp + rcx*4 - 0x38]
0x100721b2e: lea esi, [rdx + 2]
0x100721b31: mov dword ptr [r14 + rsi*4], eax
0x100721b35: mov eax, dword ptr [rbp + rcx*4 - 0x34]
0x100721b39: add edx, 3
0x100721b3c: mov dword ptr [r14 + rdx*4], eax
0x100721b40: add rcx, 4
0x100721b44: cmp r15, rcx
0x100721b47: jne 0x100721b10
0x100721b49: mov ebx, dword ptr [rbp - 0xa0]
0x100721b4f: cmp byte ptr [rip + 0x191a572], 0 ; 0x10203c0c8
0x100721b56: jne 0x100721bcc
0x100721b58: mov eax, dword ptr [rbp - 0x9c]
0x100721b5e: mov dword ptr [rbp - 0x80], eax
0x100721b61: vldmxcsr dword ptr [rbp - 0x80]
0x100721b66: mov rax, qword ptr [rip + 0x4ebd6b] ; 0x100c0d8d8
0x100721b6d: mov rax, qword ptr [rax]
0x100721b70: cmp rax, qword ptr [rbp - 0x30]
0x100721b74: jne 0x100721c74
0x100721b7a: add rsp, 0x2f8
0x100721b81: pop rbx
0x100721b82: pop r12
0x100721b84: pop r13
0x100721b86: pop r14
0x100721b88: pop r15
0x100721b8a: pop rbp
0x100721b8b: vzeroupper 
0x100721b8e: ret 
0x100721b8f: test r8b, r8b
0x100721b92: je 0x100721b66
0x100721b94: mov rax, qword ptr [rip + 0x4ebd3d] ; 0x100c0d8d8
0x100721b9b: mov rax, qword ptr [rax]
0x100721b9e: cmp rax, qword ptr [rbp - 0x30]
0x100721ba2: jne 0x100721c74
0x100721ba8: mov edx, edx
0x100721baa: shl rdx, 2
0x100721bae: mov esi, 0xff
0x100721bb3: mov rdi, r14
0x100721bb6: add rsp, 0x2f8
0x100721bbd: pop rbx
0x100721bbe: pop r12
0x100721bc0: pop r13
0x100721bc2: pop r14
0x100721bc4: pop r15
0x100721bc6: pop rbp
0x100721bc7: jmp 0x100aa2900 ; 0x100aa2900 _memset
0x100721bcc: vzeroupper 
0x100721bcf: call 0x1002b9810 ; 0x1002b9810
0x100721bd4: mov r12, rax
0x100721bd7: mov r13d, ebx
0x100721bda: xor ebx, ebx
0x100721bdc: mov rcx, qword ptr [rbp - 0x98]
0x100721be3: cmp dword ptr [r14 + rbx*4], 0
0x100721be8: je 0x100721c5f
0x100721bea: mov r15, rcx
0x100721bed: vmovaps xmm0, xmmword ptr [rcx]
0x100721bf1: vextractps dword ptr [rbp - 0xb8], xmm0, 2
0x100721bfb: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x100721c03: vmovlps qword ptr [rbp - 0xc0], xmm0
0x100721c0b: vmovaps xmm0, xmmword ptr [rip + 0x3b7cad] ; 0x100ad98c0
0x100721c13: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x100721c18: lea rdi, [rbp - 0x80]
0x100721c1c: lea rsi, [rbp - 0x40]
0x100721c20: vmovss xmm0, dword ptr [rip + 0x386990] ; 0x100aa85b8
0x100721c28: call 0x10077d310 ; 0x10077d310
0x100721c2d: vpermilps xmm0, xmmword ptr [rbp - 0xb0], 0xe7
0x100721c37: vmovaps xmm1, xmmword ptr [rbp - 0x80]
0x100721c3c: vmovaps xmmword ptr [rbp - 0x320], xmm1
0x100721c44: xor ecx, ecx
0x100721c46: mov rdi, r12
0x100721c49: lea rsi, [rbp - 0xc0]
0x100721c50: lea rdx, [rbp - 0x320]
0x100721c57: call 0x1002bb510 ; 0x1002bb510
0x100721c5c: mov rcx, r15
0x100721c5f: add rcx, 0x10
0x100721c63: inc rbx
0x100721c66: cmp rbx, r13
0x100721c69: jb 0x100721be3
0x100721c6f: jmp 0x100721b58 ; 0x100721b58
0x100721c74: vzeroupper 
0x100721c77: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100721c7c: jmp 0x100721c80 ; 0x100721c80
0x100721c7e: jmp 0x100721c80 ; 0x100721c80
0x100721c80: mov ecx, dword ptr [rbp - 0x9c]
0x100721c86: mov dword ptr [rbp - 0xc0], ecx
0x100721c8c: vldmxcsr dword ptr [rbp - 0xc0]
0x100721c94: mov rdi, rax
0x100721c97: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100721c9c: nop dword ptr [rax]
