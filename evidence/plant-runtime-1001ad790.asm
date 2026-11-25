0x1001ad790: push rbp
0x1001ad791: mov rbp, rsp
0x1001ad794: push r15
0x1001ad796: push r14
0x1001ad798: push r13
0x1001ad79a: push r12
0x1001ad79c: push rbx
0x1001ad79d: sub rsp, 0x128
0x1001ad7a4: mov r12, rsi
0x1001ad7a7: mov r13, rdi
0x1001ad7aa: mov rax, qword ptr [rip + 0xa60127] ; 0x100c0d8d8
0x1001ad7b1: mov rax, qword ptr [rax]
0x1001ad7b4: mov qword ptr [rbp - 0x30], rax
0x1001ad7b8: cmp byte ptr [r13 + 0xc], 0
0x1001ad7bd: jne 0x1001ad7c4
0x1001ad7bf: mov byte ptr [r13 + 0xc], 1
0x1001ad7c4: xor eax, eax
0x1001ad7c6: mov qword ptr [rbp - 0x108], r12
0x1001ad7cd: mov qword ptr [rbp - 0xe8], r13
0x1001ad7d4: jmp 0x1001ad7f0 ; 0x1001ad7f0
0x1001ad7d6: lea rax, [r13 + rbx + 0x66]
0x1001ad7db: cmp byte ptr [rax], 0
0x1001ad7de: jne 0x1001ad9ce
0x1001ad7e4: jmp 0x1001ad9f3 ; 0x1001ad9f3
0x1001ad7e9: nop dword ptr [rax]
0x1001ad7f0: lea rbx, [rax + rax*8]
0x1001ad7f4: shl rbx, 5
0x1001ad7f8: cmp byte ptr [r13 + rbx + 0xb1], 0
0x1001ad801: je 0x1001adcd5
0x1001ad807: mov qword ptr [rbp - 0xf0], rax
0x1001ad80e: lea r15, [r13 + rbx + 0x10]
0x1001ad813: mov rdi, qword ptr [r12 + 0x280]
0x1001ad81b: call 0x1000fc260 ; 0x1000fc260
0x1001ad820: mov rdi, r15
0x1001ad823: mov rsi, r12
0x1001ad826: mov rcx, rax
0x1001ad829: call 0x1001af400 ; 0x1001af400
0x1001ad82e: cmp byte ptr [rip + 0xadd9eb], 0 ; 0x100c8b220
0x1001ad835: je 0x1001adcce
0x1001ad83b: call 0x1002acd30 ; 0x1002acd30
0x1001ad840: test rax, rax
0x1001ad843: je 0x1001adcce
0x1001ad849: vmovaps xmm0, xmmword ptr [r13 + rbx + 0x50]
0x1001ad850: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x1001ad858: mov ecx, dword ptr [r13 + rbx + 0xb8]
0x1001ad860: mov esi, 0x80
0x1001ad865: xor eax, eax
0x1001ad867: lea r15, [rbp - 0xb0]
0x1001ad86e: mov rdi, r15
0x1001ad871: lea rdx, [rip + 0x9ca76d] ; 0x100b77fe5 %i
0x1001ad878: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1001ad87d: vmovaps xmm0, xmmword ptr [rip + 0x8fa81b] ; 0x100aa80a0
0x1001ad885: vmovaps xmm1, xmmword ptr [rbp - 0x120]
0x1001ad88d: vinsertps xmm1, xmm0, xmm1, 0xf5
0x1001ad893: vmovaps xmmword ptr [rbp - 0x120], xmm1
0x1001ad89b: vaddps xmm0, xmm1, xmmword ptr [rbp - 0xe0]
0x1001ad8a3: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x1001ad8ab: mov rcx, qword ptr [r12 + 0x60]
0x1001ad8b0: mov rdx, qword ptr [r12 + 0x70]
0x1001ad8b5: mov byte ptr [rbp - 0xb8], 1
0x1001ad8bc: lea rdi, [rbp - 0xd0]
0x1001ad8c3: lea rsi, [rbp - 0x100]
0x1001ad8ca: lea r8, [rbp - 0xb8]
0x1001ad8d1: call 0x10076c470 ; 0x10076c470
0x1001ad8d6: mov dword ptr [rbp - 0xc8], 0
0x1001ad8e0: call 0x1002acd30 ; 0x1002acd30
0x1001ad8e5: lea rdi, [rax + 0xcd170]
0x1001ad8ec: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x1001ad8f4: vmovaps xmmword ptr [rbp - 0x150], xmm0
0x1001ad8fc: mov rsi, r15
0x1001ad8ff: lea rdx, [rbp - 0x150]
0x1001ad906: vmovss xmm0, dword ptr [rip + 0x8f9ece] ; 0x100aa77dc
0x1001ad90e: lea rcx, [rip + 0x1e91d9b] ; 0x10203f6b0
0x1001ad915: call 0x1006c1fb0 ; 0x1006c1fb0
0x1001ad91a: cmp byte ptr [r13 + rbx + 0xb4], 0
0x1001ad923: je 0x1001ad94a
0x1001ad925: call 0x1002b9810 ; 0x1002b9810
0x1001ad92a: xor ecx, ecx
0x1001ad92c: mov rdi, rax
0x1001ad92f: lea rsi, [rbp - 0xe0]
0x1001ad936: vmovss xmm0, dword ptr [rip + 0x8f9eaa] ; 0x100aa77e8
0x1001ad93e: lea rdx, [rip + 0x1e91ceb] ; 0x10203f630
0x1001ad945: call 0x1002bb510 ; 0x1002bb510
0x1001ad94a: cmp byte ptr [r13 + rbx + 0xb3], 0
0x1001ad953: je 0x1001ad97a
0x1001ad955: call 0x1002b9810 ; 0x1002b9810
0x1001ad95a: xor ecx, ecx
0x1001ad95c: mov rdi, rax
0x1001ad95f: lea rsi, [rbp - 0xe0]
0x1001ad966: vmovss xmm0, dword ptr [rip + 0x8fac62] ; 0x100aa85d0
0x1001ad96e: lea rdx, [rip + 0x1e91cab] ; 0x10203f620
0x1001ad975: call 0x1002bb510 ; 0x1002bb510
0x1001ad97a: cmp byte ptr [r13 + rbx + 0xb2], 0
0x1001ad983: je 0x1001ad9aa
0x1001ad985: call 0x1002b9810 ; 0x1002b9810
0x1001ad98a: xor ecx, ecx
0x1001ad98c: mov rdi, rax
0x1001ad98f: lea rsi, [rbp - 0xe0]
0x1001ad996: vmovss xmm0, dword ptr [rip + 0x8fac6a] ; 0x100aa8608
0x1001ad99e: lea rdx, [rip + 0x1e91cab] ; 0x10203f650
0x1001ad9a5: call 0x1002bb510 ; 0x1002bb510
0x1001ad9aa: cmp byte ptr [r13 + rbx + 0xa8], 0
0x1001ad9b3: je 0x1001ad7d6
0x1001ad9b9: mov rax, qword ptr [r13 + rbx + 0x120]
0x1001ad9c1: mov ecx, 0xb6
0x1001ad9c6: add rax, rcx
0x1001ad9c9: cmp byte ptr [rax], 0
0x1001ad9cc: je 0x1001ad9f3
0x1001ad9ce: call 0x1002b9810 ; 0x1002b9810
0x1001ad9d3: xor ecx, ecx
0x1001ad9d5: mov rdi, rax
0x1001ad9d8: lea rsi, [rbp - 0xe0]
0x1001ad9df: vmovss xmm0, dword ptr [rip + 0x8fca9d] ; 0x100aaa484
0x1001ad9e7: lea rdx, [rip + 0x1e91cc2] ; 0x10203f6b0
0x1001ad9ee: call 0x1002bb510 ; 0x1002bb510
0x1001ad9f3: mov rax, qword ptr [r13 + rbx + 0x80]
0x1001ad9fb: test rax, rax
0x1001ad9fe: je 0x1001adcc0
0x1001ada04: mov rcx, qword ptr [rbp - 0xe8]
0x1001ada0b: lea rcx, [rcx + rbx + 0xb1]
0x1001ada13: cmp byte ptr [rcx], 0
0x1001ada16: je 0x1001adcc0
0x1001ada1c: cmp dword ptr [rax + 0x10], 0
0x1001ada20: je 0x1001adcc0
0x1001ada26: mov rcx, qword ptr [rbp - 0xe8]
0x1001ada2d: lea r14, [rcx + rbx + 0x80]
0x1001ada35: xor r13d, r13d
0x1001ada38: mov qword ptr [rbp - 0x110], r14
0x1001ada3f: nop 
0x1001ada40: mov rax, qword ptr [rax + 8]
0x1001ada44: mov ecx, r13d
0x1001ada47: mov rax, qword ptr [rax + rcx*8]
0x1001ada4b: mov qword ptr [rbp - 0xd0], rax
0x1001ada52: call 0x1007abc10 ; 0x1007abc10
0x1001ada57: mov qword ptr [rbp - 0xb0], 0
0x1001ada62: mov rdi, qword ptr [rip + 0x1c2d397] ; 0x101ddae00
0x1001ada69: mov rbx, qword ptr [rdi]
0x1001ada6c: lea rsi, [rbp - 0xb0]
0x1001ada73: lea rdx, [rbp - 0xd0]
0x1001ada7a: mov rcx, rax
0x1001ada7d: call qword ptr [rbx + 0x40]
0x1001ada80: mov r12, qword ptr [rbp - 0xb0]
0x1001ada87: test r12, r12
0x1001ada8a: je 0x1001add0b
0x1001ada90: mov rax, qword ptr [r14 + 0x50]
0x1001ada94: test rax, rax
0x1001ada97: je 0x1001adaa5
0x1001ada99: mov r12, rax
0x1001ada9c: test r13d, r13d
0x1001ada9f: jne 0x1001adcc0
0x1001adaa5: lea rax, [rip + 0x1e91b74] ; 0x10203f620
0x1001adaac: vmovaps xmm0, xmmword ptr [rax]
0x1001adab0: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1001adab8: cmp byte ptr [r12 + 0x54], 0
0x1001adabe: je 0x1001adcab
0x1001adac4: call 0x1002b9810 ; 0x1002b9810
0x1001adac9: vmovaps xmm0, xmmword ptr [r12 + 0x40]
0x1001adad0: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1001adad8: xor r8d, r8d
0x1001adadb: mov rdi, rax
0x1001adade: lea rsi, [rbp - 0xe0]
0x1001adae5: lea rdx, [rbp - 0xd0]
0x1001adaec: lea rcx, [rbp - 0xb0]
0x1001adaf3: call 0x1002b9d50 ; 0x1002b9d50
0x1001adaf8: vmovaps xmm0, xmmword ptr [rbp - 0xe0]
0x1001adb00: vsubps xmm0, xmm0, xmmword ptr [r12 + 0x40]
0x1001adb07: vpermilps xmm1, xmm0, 0xd2
0x1001adb0d: vmulps xmm1, xmm1, xmmword ptr [rip + 0x8fa58b] ; 0x100aa80a0
0x1001adb15: vmulps xmm2, xmm0, xmmword ptr [rip + 0x8faf13] ; 0x100aa8a30
0x1001adb1d: vsubps xmm2, xmm1, xmm2
0x1001adb21: vpermilps xmm1, xmm2, 0xd2
0x1001adb27: vmulps xmm2, xmm2, xmm2
0x1001adb2b: vpermilpd xmm3, xmm2, 1
0x1001adb31: vaddss xmm3, xmm3, xmm2
0x1001adb35: vmovshdup xmm2, xmm2
0x1001adb39: vaddss xmm2, xmm2, xmm3
0x1001adb3d: vsqrtss xmm2, xmm2, xmm2
0x1001adb41: vucomiss xmm2, dword ptr [rip + 0x8f9d7b] ; 0x100aa78c4
0x1001adb49: jbe 0x1001adb55
0x1001adb4b: vpermilps xmm2, xmm2, 0xc0
0x1001adb51: vdivps xmm1, xmm1, xmm2
0x1001adb55: vmulps xmm2, xmm0, xmm0
0x1001adb59: vmovshdup xmm3, xmm2
0x1001adb5d: vaddss xmm3, xmm2, xmm3
0x1001adb61: vpermilpd xmm2, xmm2, 1
0x1001adb67: vaddss xmm2, xmm2, xmm3
0x1001adb6b: vsqrtss xmm2, xmm2, xmm2
0x1001adb6f: vucomiss xmm2, dword ptr [rip + 0x8f9d4d] ; 0x100aa78c4
0x1001adb77: vmovaps xmm3, xmm0
0x1001adb7b: jbe 0x1001adb87
0x1001adb7d: vpermilps xmm3, xmm2, 0xc0
0x1001adb83: vdivps xmm3, xmm0, xmm3
0x1001adb87: vmulps xmm3, xmm3, xmmword ptr [rip + 0x8fa501] ; 0x100aa8090
0x1001adb8f: vaddps xmm5, xmm1, xmm3
0x1001adb93: vmulps xmm3, xmm5, xmm5
0x1001adb97: vmovshdup xmm4, xmm3
0x1001adb9b: vaddss xmm4, xmm3, xmm4
0x1001adb9f: vpermilpd xmm3, xmm3, 1
0x1001adba5: vaddss xmm3, xmm3, xmm4
0x1001adba9: vsqrtss xmm3, xmm3, xmm3
0x1001adbad: vucomiss xmm3, dword ptr [rip + 0x8f9d0f] ; 0x100aa78c4
0x1001adbb5: jbe 0x1001adbc1
0x1001adbb7: vpermilps xmm3, xmm3, 0xc0
0x1001adbbd: vdivps xmm5, xmm5, xmm3
0x1001adbc1: vucomiss xmm2, dword ptr [rip + 0x8f9cfb] ; 0x100aa78c4
0x1001adbc9: jbe 0x1001adbd5
0x1001adbcb: vpermilps xmm2, xmm2, 0xc0
0x1001adbd1: vdivps xmm0, xmm0, xmm2
0x1001adbd5: vmovaps xmmword ptr [rbp - 0x140], xmm5
0x1001adbdd: vmulps xmm0, xmm0, xmmword ptr [rip + 0x8fa4ab] ; 0x100aa8090
0x1001adbe5: vsubps xmm2, xmm0, xmm1
0x1001adbe9: vmulps xmm0, xmm2, xmm2
0x1001adbed: vmovshdup xmm1, xmm0
0x1001adbf1: vaddss xmm1, xmm0, xmm1
0x1001adbf5: vpermilpd xmm0, xmm0, 1
0x1001adbfb: vaddss xmm0, xmm0, xmm1
0x1001adbff: vsqrtss xmm0, xmm0, xmm0
0x1001adc03: vucomiss xmm0, dword ptr [rip + 0x8f9cb9] ; 0x100aa78c4
0x1001adc0b: jbe 0x1001adc17
0x1001adc0d: vpermilps xmm0, xmm0, 0xc0
0x1001adc13: vdivps xmm2, xmm2, xmm0
0x1001adc17: vmovaps xmmword ptr [rbp - 0x130], xmm2
0x1001adc1f: call 0x1002b9810 ; 0x1002b9810
0x1001adc24: vmovaps xmm0, xmmword ptr [r12 + 0x40]
0x1001adc2b: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1001adc33: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x140]
0x1001adc3b: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x1001adc43: xor r8d, r8d
0x1001adc46: mov rdi, rax
0x1001adc49: lea r15, [rbp - 0xd0]
0x1001adc50: mov rsi, r15
0x1001adc53: lea r14, [rbp - 0x100]
0x1001adc5a: mov rdx, r14
0x1001adc5d: lea rbx, [rbp - 0xb0]
0x1001adc64: mov rcx, rbx
0x1001adc67: call 0x1002b9d50 ; 0x1002b9d50
0x1001adc6c: call 0x1002b9810 ; 0x1002b9810
0x1001adc71: vmovaps xmm0, xmmword ptr [r12 + 0x40]
0x1001adc78: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1001adc80: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x130]
0x1001adc88: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x1001adc90: xor r8d, r8d
0x1001adc93: mov rdi, rax
0x1001adc96: mov rsi, r15
0x1001adc99: mov rdx, r14
0x1001adc9c: mov rcx, rbx
0x1001adc9f: call 0x1002b9d50 ; 0x1002b9d50
0x1001adca4: mov r14, qword ptr [rbp - 0x110]
0x1001adcab: inc r13d
0x1001adcae: mov rax, qword ptr [r14]
0x1001adcb1: cmp r13d, dword ptr [rax + 0x10]
0x1001adcb5: jb 0x1001ada40
0x1001adcbb: nop dword ptr [rax + rax]
0x1001adcc0: mov r12, qword ptr [rbp - 0x108]
0x1001adcc7: mov r13, qword ptr [rbp - 0xe8]
0x1001adcce: mov rax, qword ptr [rbp - 0xf0]
0x1001adcd5: inc rax
0x1001adcd8: cmp rax, 0x100
0x1001adcde: jb 0x1001ad7f0
0x1001adce4: mov rax, qword ptr [rip + 0xa5fbed] ; 0x100c0d8d8
0x1001adceb: mov rax, qword ptr [rax]
0x1001adcee: cmp rax, qword ptr [rbp - 0x30]
0x1001adcf2: jne 0x1001add06
0x1001adcf4: add rsp, 0x128
0x1001adcfb: pop rbx
0x1001adcfc: pop r12
0x1001adcfe: pop r13
0x1001add00: pop r14
0x1001add02: pop r15
0x1001add04: pop rbp
0x1001add05: ret 
0x1001add06: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001add0b: lea rdi, [rip + 0x9b3de6] ; 0x100b61af8 ret
0x1001add12: lea rsi, [rip + 0x9b3c4a] ; 0x100b61963 ./Clump.h
0x1001add19: mov edx, 0x47
0x1001add1e: mov ecx, 3
0x1001add23: call 0x1007e5f70 ; 0x1007e5f70
0x1001add28: ud2 
0x1001add2a: nop word ptr [rax + rax]
