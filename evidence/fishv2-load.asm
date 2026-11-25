0x1003370c0: push rbp
0x1003370c1: mov rbp, rsp
0x1003370c4: push r15
0x1003370c6: push r14
0x1003370c8: push rbx
0x1003370c9: sub rsp, 0x48
0x1003370cd: mov r14, rdx
0x1003370d0: mov rbx, rdi
0x1003370d3: vmovaps xmm2, xmmword ptr [rbx + 0x80]
0x1003370db: vmovaps xmm1, xmmword ptr [rbx + 0x90]
0x1003370e3: vmovaps xmm0, xmmword ptr [rbx + 0xa0]
0x1003370eb: vmovaps xmm3, xmmword ptr [rbx + 0xb0]
0x1003370f3: vmovaps xmmword ptr [rbx + 0x10], xmm3
0x1003370f8: vmovaps xmmword ptr [rbx + 0x20], xmm2
0x1003370fd: vmovaps xmmword ptr [rbx + 0x30], xmm1
0x100337102: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x100337107: vmulps xmm3, xmm2, xmm2
0x10033710b: vmovshdup xmm4, xmm3
0x10033710f: vaddss xmm4, xmm3, xmm4
0x100337113: vpermilpd xmm3, xmm3, 1
0x100337119: vaddss xmm3, xmm3, xmm4
0x10033711d: vsqrtss xmm3, xmm3, xmm3
0x100337121: vucomiss xmm3, dword ptr [rip + 0x77079b] ; 0x100aa78c4
0x100337129: jbe 0x100337135
0x10033712b: vpermilps xmm3, xmm3, 0xc0
0x100337131: vdivps xmm2, xmm2, xmm3
0x100337135: vmovaps xmmword ptr [rbx + 0x20], xmm2
0x10033713a: vmulps xmm2, xmm1, xmm1
0x10033713e: vmovshdup xmm3, xmm2
0x100337142: vaddss xmm3, xmm2, xmm3
0x100337146: vpermilpd xmm2, xmm2, 1
0x10033714c: vaddss xmm2, xmm2, xmm3
0x100337150: vsqrtss xmm2, xmm2, xmm2
0x100337154: vucomiss xmm2, dword ptr [rip + 0x770768] ; 0x100aa78c4
0x10033715c: jbe 0x100337168
0x10033715e: vpermilps xmm2, xmm2, 0xc0
0x100337164: vdivps xmm1, xmm1, xmm2
0x100337168: vmovaps xmmword ptr [rbx + 0x30], xmm1
0x10033716d: vmulps xmm1, xmm0, xmm0
0x100337171: vmovshdup xmm2, xmm1
0x100337175: vaddss xmm2, xmm1, xmm2
0x100337179: vpermilpd xmm1, xmm1, 1
0x10033717f: vaddss xmm1, xmm1, xmm2
0x100337183: vsqrtss xmm1, xmm1, xmm1
0x100337187: vucomiss xmm1, dword ptr [rip + 0x770735] ; 0x100aa78c4
0x10033718f: jbe 0x10033719b
0x100337191: vpermilps xmm1, xmm1, 0xc0
0x100337197: vdivps xmm0, xmm0, xmm1
0x10033719b: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1003371a0: vxorps xmm0, xmm0, xmm0
0x1003371a4: vmovaps xmmword ptr [rbx + 0x50], xmm0
0x1003371a9: mov rax, qword ptr [rbx + 0x78]
0x1003371ad: mov ecx, dword ptr [rax + 0x10]
0x1003371b0: mov dword ptr [rbx + 0x60], ecx
0x1003371b3: mov eax, dword ptr [rax + 0x14]
0x1003371b6: mov dword ptr [rbx + 0x64], eax
0x1003371b9: mov dword ptr [rbx + 0x68], 0x3f800000
0x1003371c0: mov rax, qword ptr [rip + 0x8d6941] ; 0x100c0db08
0x1003371c7: vmovaps xmm0, xmmword ptr [rax]
0x1003371cb: vmovaps xmm1, xmmword ptr [rax + 0x10]
0x1003371d0: vmovaps xmm2, xmmword ptr [rax + 0x20]
0x1003371d5: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1003371da: vmovaps xmmword ptr [rbx + 0x30], xmm1
0x1003371df: vmovaps xmmword ptr [rbx + 0x40], xmm2
0x1003371e4: mov qword ptr [rbx + 0x170], 0
0x1003371ef: lea rdi, [rbx + 0x2a0]
0x1003371f6: mov rcx, qword ptr [r14 + 0x138]
0x1003371fd: mov rsi, qword ptr [r14 + 0x220]
0x100337204: mov rdx, qword ptr [r14 + 0x398]
0x10033720b: call 0x10062e5b0 ; 0x10062e5b0
0x100337210: lea rdi, [rbx + 0xd0]
0x100337217: call 0x100192520 ; 0x100192520
0x10033721c: mov qword ptr [rbx + 0x110], 0
0x100337227: mov rax, qword ptr [rbx + 0x78]
0x10033722b: mov rax, qword ptr [rax + 8]
0x10033722f: test rax, rax
0x100337232: je 0x1003374e1
0x100337238: mov rdi, qword ptr [r14 + 0x5a8]
0x10033723f: mov rsi, qword ptr [rax + 0x228]
0x100337246: call 0x10046ccc0 ; 0x10046ccc0
0x10033724b: mov qword ptr [rbx + 0x110], rax
0x100337252: test rax, rax
0x100337255: je 0x1003374e1
0x10033725b: vmovaps xmm0, xmmword ptr [rip + 0x77365d] ; 0x100aaa8c0
0x100337263: vmovaps xmmword ptr [rbx + 0x120], xmm0
0x10033726b: mov rax, qword ptr [rbx + 0x78]
0x10033726f: mov rsi, qword ptr [rax + 8]
0x100337273: mov rax, qword ptr [rsi]
0x100337276: lea r15, [rbp - 0x60]
0x10033727a: mov rdi, r15
0x10033727d: call qword ptr [rax + 0x18]
0x100337280: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x100337285: vmulps xmm0, xmm0, xmm0
0x100337289: vmovshdup xmm1, xmm0
0x10033728d: vaddss xmm1, xmm0, xmm1
0x100337291: vpermilpd xmm0, xmm0, 1
0x100337297: vaddss xmm0, xmm0, xmm1
0x10033729b: vsqrtss xmm0, xmm0, xmm0
0x10033729f: vmovaps xmm1, xmmword ptr [rbx + 0x80]
0x1003372a7: vmulps xmm1, xmm1, xmm1
0x1003372ab: vmovshdup xmm2, xmm1
0x1003372af: vaddss xmm2, xmm1, xmm2
0x1003372b3: vpermilpd xmm1, xmm1, 1
0x1003372b9: vaddss xmm1, xmm1, xmm2
0x1003372bd: vsqrtss xmm1, xmm1, xmm1
0x1003372c1: vmulss xmm0, xmm0, xmm1
0x1003372c5: vmovss dword ptr [rbx + 0x120], xmm0
0x1003372cd: mov rax, qword ptr [rbx + 0x78]
0x1003372d1: mov rsi, qword ptr [rax + 8]
0x1003372d5: mov rax, qword ptr [rsi]
0x1003372d8: mov rdi, r15
0x1003372db: call qword ptr [rax + 0x18]
0x1003372de: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1003372e3: vmulps xmm0, xmm0, xmm0
0x1003372e7: vmovshdup xmm1, xmm0
0x1003372eb: vaddss xmm1, xmm0, xmm1
0x1003372ef: vpermilpd xmm0, xmm0, 1
0x1003372f5: vaddss xmm0, xmm0, xmm1
0x1003372f9: vsqrtss xmm0, xmm0, xmm0
0x1003372fd: vmovaps xmm1, xmmword ptr [rbx + 0x90]
0x100337305: vmulps xmm1, xmm1, xmm1
0x100337309: vmovshdup xmm2, xmm1
0x10033730d: vaddss xmm2, xmm1, xmm2
0x100337311: vpermilpd xmm1, xmm1, 1
0x100337317: vaddss xmm1, xmm1, xmm2
0x10033731b: vsqrtss xmm1, xmm1, xmm1
0x10033731f: vmulss xmm0, xmm0, xmm1
0x100337323: vmovss dword ptr [rbx + 0x124], xmm0
0x10033732b: mov rax, qword ptr [rbx + 0x78]
0x10033732f: mov rsi, qword ptr [rax + 8]
0x100337333: mov rax, qword ptr [rsi]
0x100337336: mov rdi, r15
0x100337339: call qword ptr [rax + 0x18]
0x10033733c: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100337341: vmulps xmm0, xmm0, xmm0
0x100337345: vmovshdup xmm1, xmm0
0x100337349: vaddss xmm1, xmm0, xmm1
0x10033734d: vpermilpd xmm0, xmm0, 1
0x100337353: vaddss xmm0, xmm0, xmm1
0x100337357: vsqrtss xmm0, xmm0, xmm0
0x10033735b: vmovaps xmm1, xmmword ptr [rbx + 0xa0]
0x100337363: vmulps xmm1, xmm1, xmm1
0x100337367: vmovshdup xmm2, xmm1
0x10033736b: vaddss xmm2, xmm1, xmm2
0x10033736f: vpermilpd xmm1, xmm1, 1
0x100337375: vaddss xmm1, xmm1, xmm2
0x100337379: vsqrtss xmm1, xmm1, xmm1
0x10033737d: vmulss xmm0, xmm0, xmm1
0x100337381: vmovss dword ptr [rbx + 0x128], xmm0
0x100337389: mov rax, qword ptr [rbx + 0x110]
0x100337390: mov r15, qword ptr [rax + 0x68]
0x100337394: test r15, r15
0x100337397: je 0x100337455
0x10033739d: lea rsi, [rip + 0x83383b] ; 0x100b6abdf critterIdle
0x1003373a4: vmovss xmm0, dword ptr [rip + 0x76dd14] ; 0x100aa50c0
0x1003373ac: mov rdi, r15
0x1003373af: call 0x1000959b0 ; 0x1000959b0
0x1003373b4: mov dword ptr [rbx + 0x130], eax
0x1003373ba: lea rsi, [rip + 0x8408cd] ; 0x100b77c8e critterMove
0x1003373c1: mov rdi, r15
0x1003373c4: vmovss xmm0, dword ptr [rip + 0x76dcf4] ; 0x100aa50c0
0x1003373cc: call 0x1000959b0 ; 0x1000959b0
0x1003373d1: mov dword ptr [rbx + 0x134], eax
0x1003373d7: lea rsi, [rip + 0x84a175] ; 0x100b81553 critterChase
0x1003373de: mov rdi, r15
0x1003373e1: vmovss xmm0, dword ptr [rip + 0x76dcd7] ; 0x100aa50c0
0x1003373e9: call 0x1000959b0 ; 0x1000959b0
0x1003373ee: mov dword ptr [rbx + 0x138], eax
0x1003373f4: lea rsi, [rip + 0x84a165] ; 0x100b81560 critterFlee
0x1003373fb: mov rdi, r15
0x1003373fe: vmovss xmm0, dword ptr [rip + 0x76dcba] ; 0x100aa50c0
0x100337406: call 0x1000959b0 ; 0x1000959b0
0x10033740b: mov dword ptr [rbx + 0x13c], eax
0x100337411: mov esi, dword ptr [rbx + 0x134]
0x100337417: mov rdi, r15
0x10033741a: call 0x100097d30 ; 0x100097d30
0x10033741f: mov esi, dword ptr [rbx + 0x130]
0x100337425: mov rdi, r15
0x100337428: call 0x100097d30 ; 0x100097d30
0x10033742d: mov esi, dword ptr [rbx + 0x138]
0x100337433: mov rdi, r15
0x100337436: call 0x100097d30 ; 0x100097d30
0x10033743b: mov esi, dword ptr [rbx + 0x13c]
0x100337441: mov rdi, r15
0x100337444: call 0x100097d30 ; 0x100097d30
0x100337449: vxorps xmm0, xmm0, xmm0
0x10033744d: vmovaps xmmword ptr [rbx + 0x140], xmm0
0x100337455: mov dword ptr [rbx + 0x150], 0
0x10033745f: mov rax, qword ptr [rbx + 0x78]
0x100337463: cmp byte ptr [rax + 0x20], 0
0x100337467: je 0x10033747e
0x100337469: mov rdi, qword ptr [r14 + 0x3f0]
0x100337470: call 0x10039a7f0 ; 0x10039a7f0
0x100337475: mov dword ptr [rax + 0x54], 4
0x10033747c: jmp 0x100337480 ; 0x100337480
0x10033747e: xor eax, eax
0x100337480: mov qword ptr [rbx + 0x158], rax
0x100337487: mov dword ptr [rbx + 0x160], 0x42c80000
0x100337491: mov byte ptr [rbx + 0x164], 0
0x100337498: mov dword ptr [rbx + 0x168], 0
0x1003374a2: mov dword ptr [rbx + 0x294], 0
0x1003374ac: mov dword ptr [rbx + 0x188], 0
0x1003374b6: mov dword ptr [rbx + 0x17c], 1
0x1003374c0: mov qword ptr [rbx + 0x180], 0
0x1003374cb: mov qword ptr [rbx + 0x490], 0
0x1003374d6: add rsp, 0x48
0x1003374da: pop rbx
0x1003374db: pop r14
0x1003374dd: pop r15
0x1003374df: pop rbp
0x1003374e0: ret 
0x1003374e1: lea rdi, [rip + 0x840793] ; 0x100b77c7b m_model
0x1003374e8: lea rsi, [rip + 0x84a059] ; 0x100b81548 FishV2.cpp
0x1003374ef: mov edx, 0x22a
0x1003374f4: mov ecx, 3
0x1003374f9: call 0x1007e5f70 ; 0x1007e5f70
0x1003374fe: ud2 
