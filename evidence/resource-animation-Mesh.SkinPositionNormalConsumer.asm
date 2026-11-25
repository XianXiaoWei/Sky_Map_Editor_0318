0x100458570: push rbp
0x100458571: mov rbp, rsp
0x100458574: push r15
0x100458576: push r14
0x100458578: push r13
0x10045857a: push r12
0x10045857c: push rbx
0x10045857d: sub rsp, 0x48
0x100458581: mov qword ptr [rbp - 0x50], r9
0x100458585: mov qword ptr [rbp - 0x40], r8
0x100458589: mov rbx, rcx
0x10045858c: mov r13, rdx
0x10045858f: mov r15, rsi
0x100458592: mov qword ptr [rbp - 0x48], rdi
0x100458596: mov r14, qword ptr [rbp + 0x18]
0x10045859a: mov r12d, dword ptr [rbp + 0x10]
0x10045859e: call 0x1007c6c20 ; 0x1007c6c20
0x1004585a3: mov rsi, r12
0x1004585a6: shl rsi, 4
0x1004585aa: lea rcx, [rip + 0x1bf059f] ; 0x102048b50
0x1004585b1: mov rdx, qword ptr [rcx]
0x1004585b4: mov ecx, 0x10
0x1004585b9: mov rdi, rax
0x1004585bc: call 0x100795530 ; 0x100795530
0x1004585c1: mov r8, rbx
0x1004585c4: mov r11, qword ptr [rbp - 0x40]
0x1004585c8: mov rdi, qword ptr [rbp - 0x48]
0x1004585cc: mov r9, qword ptr [rbp - 0x50]
0x1004585d0: mov ebx, dword ptr [r9]
0x1004585d3: xor r10d, r10d
0x1004585d6: mov edx, 0
0x1004585db: test rbx, rbx
0x1004585de: je 0x1004586c7
0x1004585e4: xor edx, edx
0x1004585e6: vmovss xmm8, dword ptr [rip + 0x658c32] ; 0x100ab1220
0x1004585ee: nop 
0x1004585f0: movsx esi, byte ptr [r8 + rdx]
0x1004585f5: vcvtsi2ss xmm1, xmm10, esi
0x1004585f9: movsx esi, byte ptr [r8 + rdx + 1]
0x1004585ff: vcvtsi2ss xmm2, xmm10, esi
0x100458603: movsx esi, byte ptr [r8 + rdx + 2]
0x100458609: vcvtsi2ss xmm9, xmm10, esi
0x10045860d: movzx esi, byte ptr [r11 + rdx*2]
0x100458612: shl rsi, 6
0x100458616: vmovaps xmm4, xmmword ptr [r14 + rsi]
0x10045861c: vmovaps xmm5, xmmword ptr [r14 + rsi + 0x10]
0x100458623: vmovaps xmm6, xmmword ptr [r14 + rsi + 0x20]
0x10045862a: movzx ecx, byte ptr [r11 + rdx*2 + 4]
0x100458630: vcvtsi2ss xmm7, xmm10, ecx
0x100458634: vmulss xmm7, xmm7, xmm8
0x100458639: vbroadcastss xmm0, dword ptr [r15 + rdx*4]
0x10045863f: vmulps xmm0, xmm0, xmm4
0x100458643: vbroadcastss xmm3, dword ptr [r15 + rdx*4 + 4]
0x10045864a: vmulps xmm3, xmm5, xmm3
0x10045864e: vaddps xmm0, xmm3, xmm0
0x100458652: vbroadcastss xmm3, dword ptr [r15 + rdx*4 + 8]
0x100458659: vmulps xmm3, xmm6, xmm3
0x10045865d: vaddps xmm0, xmm3, xmm0
0x100458661: vaddps xmm0, xmm0, xmmword ptr [r14 + rsi + 0x30]
0x100458668: vpermilps xmm3, xmm7, 0xc0
0x10045866e: vmulps xmm0, xmm3, xmm0
0x100458672: vpermilps xmm1, xmm1, 0
0x100458678: vmulps xmm1, xmm1, xmm4
0x10045867c: vpermilps xmm2, xmm2, 0
0x100458682: vmulps xmm2, xmm5, xmm2
0x100458686: vaddps xmm1, xmm2, xmm1
0x10045868a: vpermilps xmm2, xmm9, 0
0x100458690: vmulps xmm2, xmm6, xmm2
0x100458694: vaddps xmm1, xmm2, xmm1
0x100458698: vmulps xmm1, xmm1, xmm3
0x10045869c: vextractps dword ptr [rdi + rdx*4 + 8], xmm0, 2
0x1004586a4: vmovlps qword ptr [rdi + rdx*4], xmm0
0x1004586a9: mov esi, dword ptr [r15 + rdx*4 + 0xc]
0x1004586ae: mov dword ptr [rdi + rdx*4 + 0xc], esi
0x1004586b2: vmovaps xmmword ptr [rax + rdx*4], xmm1
0x1004586b7: add rdx, 4
0x1004586bb: dec rbx
0x1004586be: jne 0x1004585f0
0x1004586c4: mov edx, dword ptr [r9]
0x1004586c7: mov rsi, rax
0x1004586ca: mov edx, edx
0x1004586cc: mov eax, dword ptr [r9 + 4]
0x1004586d0: test rax, rax
0x1004586d3: mov qword ptr [rbp - 0x30], rsi
0x1004586d7: mov qword ptr [rbp - 0x58], r8
0x1004586db: je 0x10045888c
0x1004586e1: mov rcx, rdx
0x1004586e4: shl rdx, 4
0x1004586e8: lea r10, [rdi + rdx]
0x1004586ec: lea r9, [rsi + rdx]
0x1004586f0: lea rsi, [r15 + rdx + 0xc]
0x1004586f5: lea rdi, [r11 + rcx*8 + 5]
0x1004586fa: mov qword ptr [rbp - 0x38], rcx
0x1004586fe: lea r11, [r8 + rcx*4 + 2]
0x100458703: xor edx, edx
0x100458705: vmovss xmm8, dword ptr [rip + 0x658b13] ; 0x100ab1220
0x10045870d: nop dword ptr [rax]
0x100458710: movsx ecx, byte ptr [r11 + rdx - 2]
0x100458716: vxorps xmm11, xmm11, xmm11
0x10045871b: vcvtsi2ss xmm10, xmm11, ecx
0x10045871f: movsx ecx, byte ptr [r11 + rdx - 1]
0x100458725: vxorps xmm11, xmm11, xmm11
0x10045872a: vcvtsi2ss xmm11, xmm11, ecx
0x10045872e: movsx ecx, byte ptr [r11 + rdx]
0x100458733: vxorps xmm12, xmm12, xmm12
0x100458738: vcvtsi2ss xmm9, xmm12, ecx
0x10045873c: movzx ecx, byte ptr [rdi + rdx*2 - 5]
0x100458741: shl rcx, 6
0x100458745: vmovaps xmm4, xmmword ptr [r14 + rcx]
0x10045874b: vmovaps xmm5, xmmword ptr [r14 + rcx + 0x10]
0x100458752: vmovaps xmm6, xmmword ptr [r14 + rcx + 0x20]
0x100458759: movzx ebx, byte ptr [rdi + rdx*2 - 1]
0x10045875e: vxorps xmm12, xmm12, xmm12
0x100458763: vcvtsi2ss xmm7, xmm12, ebx
0x100458767: vmulss xmm7, xmm7, xmm8
0x10045876c: vbroadcastss xmm12, dword ptr [rsi + rdx*4 - 0xc]
0x100458773: vmulps xmm3, xmm12, xmm4
0x100458777: vbroadcastss xmm14, dword ptr [rsi + rdx*4 - 8]
0x10045877e: vmulps xmm2, xmm5, xmm14
0x100458783: vaddps xmm2, xmm2, xmm3
0x100458787: vbroadcastss xmm15, dword ptr [rsi + rdx*4 - 4]
0x10045878e: vmulps xmm0, xmm6, xmm15
0x100458793: vaddps xmm0, xmm0, xmm2
0x100458797: vaddps xmm0, xmm0, xmmword ptr [r14 + rcx + 0x30]
0x10045879e: vpermilps xmm2, xmm7, 0xc0
0x1004587a4: vmulps xmm13, xmm2, xmm0
0x1004587a8: vpermilps xmm10, xmm10, 0
0x1004587ae: vmulps xmm4, xmm10, xmm4
0x1004587b2: vpermilps xmm0, xmm11, 0
0x1004587b8: vmulps xmm5, xmm5, xmm0
0x1004587bc: vaddps xmm4, xmm5, xmm4
0x1004587c0: vpermilps xmm5, xmm9, 0
0x1004587c6: vmulps xmm6, xmm6, xmm5
0x1004587ca: vaddps xmm4, xmm6, xmm4
0x1004587ce: vmulps xmm9, xmm4, xmm2
0x1004587d2: movzx ecx, byte ptr [rdi + rdx*2 - 4]
0x1004587d7: shl rcx, 6
0x1004587db: vmovaps xmm4, xmmword ptr [r14 + rcx]
0x1004587e1: vmovaps xmm6, xmmword ptr [r14 + rcx + 0x10]
0x1004587e8: vmovaps xmm2, xmmword ptr [r14 + rcx + 0x20]
0x1004587ef: movzx ebx, byte ptr [rdi + rdx*2]
0x1004587f3: vxorps xmm1, xmm1, xmm1
0x1004587f7: vcvtsi2ss xmm1, xmm1, ebx
0x1004587fb: vmulss xmm1, xmm1, xmm8
0x100458800: vmulps xmm3, xmm12, xmm4
0x100458804: vmulps xmm7, xmm6, xmm14
0x100458809: vaddps xmm3, xmm7, xmm3
0x10045880d: vmulps xmm7, xmm2, xmm15
0x100458812: vaddps xmm3, xmm7, xmm3
0x100458816: vaddps xmm3, xmm3, xmmword ptr [r14 + rcx + 0x30]
0x10045881d: vpermilps xmm1, xmm1, 0xc0
0x100458823: vmulps xmm3, xmm1, xmm3
0x100458827: vaddps xmm3, xmm13, xmm3
0x10045882b: vmulps xmm4, xmm10, xmm4
0x10045882f: vmulps xmm0, xmm6, xmm0
0x100458833: vaddps xmm0, xmm0, xmm4
0x100458837: vmulps xmm2, xmm2, xmm5
0x10045883b: vaddps xmm0, xmm2, xmm0
0x10045883f: vmulps xmm0, xmm0, xmm1
0x100458843: vaddps xmm0, xmm9, xmm0
0x100458847: vextractps dword ptr [r10 + rdx*4 + 8], xmm3, 2
0x10045884f: vmovlps qword ptr [r10 + rdx*4], xmm3
0x100458855: mov ecx, dword ptr [rsi + rdx*4]
0x100458858: mov dword ptr [r10 + rdx*4 + 0xc], ecx
0x10045885d: vmovaps xmmword ptr [r9 + rdx*4], xmm0
0x100458863: add rdx, 4
0x100458867: dec rax
0x10045886a: jne 0x100458710
0x100458870: mov r9, qword ptr [rbp - 0x50]
0x100458874: mov r10d, dword ptr [r9 + 4]
0x100458878: mov rsi, qword ptr [rbp - 0x30]
0x10045887c: mov rdi, qword ptr [rbp - 0x48]
0x100458880: mov r11, qword ptr [rbp - 0x40]
0x100458884: mov r8, qword ptr [rbp - 0x58]
0x100458888: mov rdx, qword ptr [rbp - 0x38]
0x10045888c: add edx, r10d
0x10045888f: mov ecx, dword ptr [r9 + 8]
0x100458893: test rcx, rcx
0x100458896: mov qword ptr [rbp - 0x38], rdx
0x10045889a: je 0x100458ab8
0x1004588a0: mov rax, rdx
0x1004588a3: shl rax, 4
0x1004588a7: lea r10, [rdi + rax]
0x1004588ab: lea r9, [rsi + rax]
0x1004588af: lea rdi, [r15 + rax + 0xc]
0x1004588b4: lea rax, [r11 + rdx*8 + 6]
0x1004588b9: lea r11, [r8 + rdx*4 + 2]
0x1004588be: xor ebx, ebx
0x1004588c0: vmovss xmm8, dword ptr [rip + 0x658958] ; 0x100ab1220
0x1004588c8: nop dword ptr [rax + rax]
0x1004588d0: movsx edx, byte ptr [r11 + rbx - 2]
0x1004588d6: vxorps xmm15, xmm15, xmm15
0x1004588db: vcvtsi2ss xmm11, xmm15, edx
0x1004588df: movsx edx, byte ptr [r11 + rbx - 1]
0x1004588e5: vxorps xmm15, xmm15, xmm15
0x1004588ea: vcvtsi2ss xmm12, xmm15, edx
0x1004588ee: movsx edx, byte ptr [r11 + rbx]
0x1004588f3: vxorps xmm15, xmm15, xmm15
0x1004588f8: vcvtsi2ss xmm10, xmm15, edx
0x1004588fc: movzx edx, byte ptr [rax + rbx*2 - 6]
0x100458901: shl rdx, 6
0x100458905: vmovaps xmm7, xmmword ptr [r14 + rdx]
0x10045890b: vmovaps xmm0, xmmword ptr [r14 + rdx + 0x10]
0x100458912: vmovaps xmm1, xmmword ptr [r14 + rdx + 0x20]
0x100458919: movzx esi, byte ptr [rax + rbx*2 - 2]
0x10045891e: vxorps xmm15, xmm15, xmm15
0x100458923: vcvtsi2ss xmm2, xmm15, esi
0x100458927: vmulss xmm6, xmm2, xmm8
0x10045892c: vbroadcastss xmm9, dword ptr [rdi + rbx*4 - 0xc]
0x100458933: vmulps xmm3, xmm9, xmm7
0x100458937: vbroadcastss xmm13, dword ptr [rdi + rbx*4 - 8]
0x10045893e: vmulps xmm4, xmm0, xmm13
0x100458943: vaddps xmm4, xmm4, xmm3
0x100458947: vbroadcastss xmm15, dword ptr [rdi + rbx*4 - 4]
0x10045894e: vmulps xmm5, xmm1, xmm15
0x100458953: vaddps xmm4, xmm5, xmm4
0x100458957: vaddps xmm4, xmm4, xmmword ptr [r14 + rdx + 0x30]
0x10045895e: vpermilps xmm2, xmm6, 0xc0
0x100458964: vmulps xmm14, xmm2, xmm4
0x100458968: vpermilps xmm11, xmm11, 0
0x10045896e: vmulps xmm6, xmm11, xmm7
0x100458972: vpermilps xmm5, xmm12, 0
0x100458978: vmulps xmm0, xmm0, xmm5
0x10045897c: vaddps xmm0, xmm0, xmm6
0x100458980: vpermilps xmm6, xmm10, 0
0x100458986: vmulps xmm1, xmm1, xmm6
0x10045898a: vaddps xmm0, xmm1, xmm0
0x10045898e: vmulps xmm10, xmm0, xmm2
0x100458992: movzx edx, byte ptr [rax + rbx*2 - 5]
0x100458997: shl rdx, 6
0x10045899b: vmovaps xmm1, xmmword ptr [r14 + rdx]
0x1004589a1: vmovaps xmm2, xmmword ptr [r14 + rdx + 0x10]
0x1004589a8: vmovaps xmm7, xmmword ptr [r14 + rdx + 0x20]
0x1004589af: movzx esi, byte ptr [rax + rbx*2 - 1]
0x1004589b4: vcvtsi2ss xmm0, xmm8, esi
0x1004589b8: vmulss xmm0, xmm0, xmm8
0x1004589bd: vmulps xmm3, xmm9, xmm1
0x1004589c1: vmulps xmm4, xmm2, xmm13
0x1004589c6: vaddps xmm3, xmm4, xmm3
0x1004589ca: vmulps xmm4, xmm7, xmm15
0x1004589cf: vaddps xmm3, xmm4, xmm3
0x1004589d3: vaddps xmm3, xmm3, xmmword ptr [r14 + rdx + 0x30]
0x1004589da: vpermilps xmm0, xmm0, 0xc0
0x1004589e0: vmulps xmm3, xmm0, xmm3
0x1004589e4: vaddps xmm12, xmm14, xmm3
0x1004589e8: vmulps xmm1, xmm11, xmm1
0x1004589ec: vmulps xmm2, xmm2, xmm5
0x1004589f0: vaddps xmm1, xmm2, xmm1
0x1004589f4: vmulps xmm2, xmm7, xmm6
0x1004589f8: vaddps xmm1, xmm2, xmm1
0x1004589fc: vmulps xmm0, xmm1, xmm0
0x100458a00: vaddps xmm10, xmm10, xmm0
0x100458a04: movzx edx, byte ptr [rax + rbx*2 - 4]
0x100458a09: shl rdx, 6
0x100458a0d: vmovaps xmm1, xmmword ptr [r14 + rdx]
0x100458a13: vmovaps xmm2, xmmword ptr [r14 + rdx + 0x10]
0x100458a1a: vmovaps xmm4, xmmword ptr [r14 + rdx + 0x20]
0x100458a21: movzx esi, byte ptr [rax + rbx*2]
0x100458a25: vcvtsi2ss xmm7, xmm8, esi
0x100458a29: vmulss xmm7, xmm7, xmm8
0x100458a2e: vmulps xmm0, xmm9, xmm1
0x100458a32: vmulps xmm3, xmm2, xmm13
0x100458a37: vaddps xmm0, xmm3, xmm0
0x100458a3b: vmulps xmm3, xmm4, xmm15
0x100458a40: vaddps xmm0, xmm3, xmm0
0x100458a44: vaddps xmm0, xmm0, xmmword ptr [r14 + rdx + 0x30]
0x100458a4b: vpermilps xmm3, xmm7, 0xc0
0x100458a51: vmulps xmm0, xmm3, xmm0
0x100458a55: vaddps xmm0, xmm12, xmm0
0x100458a59: vmulps xmm1, xmm11, xmm1
0x100458a5d: vmulps xmm2, xmm2, xmm5
0x100458a61: vaddps xmm1, xmm2, xmm1
0x100458a65: vmulps xmm2, xmm4, xmm6
0x100458a69: vaddps xmm1, xmm2, xmm1
0x100458a6d: vmulps xmm1, xmm1, xmm3
0x100458a71: vaddps xmm1, xmm10, xmm1
0x100458a75: vextractps dword ptr [r10 + rbx*4 + 8], xmm0, 2
0x100458a7d: vmovlps qword ptr [r10 + rbx*4], xmm0
0x100458a83: mov edx, dword ptr [rdi + rbx*4]
0x100458a86: mov dword ptr [r10 + rbx*4 + 0xc], edx
0x100458a8b: vmovaps xmmword ptr [r9 + rbx*4], xmm1
0x100458a91: add rbx, 4
0x100458a95: dec rcx
0x100458a98: jne 0x1004588d0
0x100458a9e: mov r9, qword ptr [rbp - 0x50]
0x100458aa2: mov eax, dword ptr [r9 + 8]
0x100458aa6: mov rdx, qword ptr [rbp - 0x30]
0x100458aaa: mov rdi, qword ptr [rbp - 0x48]
0x100458aae: mov r11, qword ptr [rbp - 0x40]
0x100458ab2: mov r8, qword ptr [rbp - 0x58]
0x100458ab6: jmp 0x100458abd ; 0x100458abd
0x100458ab8: xor eax, eax
0x100458aba: mov rdx, rsi
0x100458abd: mov rsi, qword ptr [rbp - 0x38]
0x100458ac1: add esi, eax
0x100458ac3: mov rax, rsi
0x100458ac6: shl rax, 4
0x100458aca: add rdi, rax
0x100458acd: add r15, rax
0x100458ad0: add rdx, rax
0x100458ad3: lea rcx, [r8 + rsi*4]
0x100458ad7: lea r8, [r11 + rsi*8]
0x100458adb: mov r9d, dword ptr [r9 + 0xc]
0x100458adf: mov qword ptr [rsp], r14
0x100458ae3: mov rsi, r15
0x100458ae6: call 0x100458bd0 ; 0x100458bd0
0x100458aeb: test r12d, r12d
0x100458aee: je 0x100458b78
0x100458af4: vmovaps xmm0, xmmword ptr [rip + 0x669c54] ; 0x100ac2750
0x100458afc: vmovaps xmm1, xmmword ptr [rip + 0x65903c] ; 0x100ab1b40
0x100458b04: vmovaps xmm2, xmmword ptr [rip + 0x658724] ; 0x100ab1230
0x100458b0c: vmovdqa xmm3, xmmword ptr [rip + 0x669c4c] ; 0x100ac2760
0x100458b14: mov rax, qword ptr [rbp - 0x30]
0x100458b18: nop dword ptr [rax + rax]
0x100458b20: vmovaps xmm4, xmmword ptr [rax]
0x100458b24: vmulps xmm5, xmm4, xmm4
0x100458b28: vmovshdup xmm6, xmm5
0x100458b2c: vaddss xmm6, xmm5, xmm6
0x100458b30: vpermilpd xmm5, xmm5, 1
0x100458b36: vaddss xmm5, xmm5, xmm6
0x100458b3a: vrsqrtss xmm5, xmm5, xmm5
0x100458b3e: vpermilps xmm5, xmm5, 0xc0
0x100458b44: vmulps xmm4, xmm4, xmm5
0x100458b48: vmulps xmm4, xmm4, xmm0
0x100458b4c: vmaxps xmm4, xmm4, xmm1
0x100458b50: vminps xmm4, xmm4, xmm2
0x100458b54: vcvttps2dq xmm4, xmm4
0x100458b58: vpshufb xmm5, xmm4, xmm3
0x100458b5d: vpextrb byte ptr [r13 + 2], xmm4, 8
0x100458b64: vpextrw word ptr [r13], xmm5, 0
0x100458b6b: add r13, 4
0x100458b6f: add rax, 0x10
0x100458b73: dec r12
0x100458b76: jne 0x100458b20
0x100458b78: call 0x1007c6c20 ; 0x1007c6c20
0x100458b7d: mov rdi, rax
0x100458b80: mov rsi, qword ptr [rbp - 0x30]
0x100458b84: call 0x100795a70 ; 0x100795a70
0x100458b89: add rsp, 0x48
0x100458b8d: pop rbx
0x100458b8e: pop r12
0x100458b90: pop r13
0x100458b92: pop r14
0x100458b94: pop r15
0x100458b96: pop rbp
0x100458b97: ret 
0x100458b98: mov rbx, qword ptr [rbp - 0x30]
0x100458b9c: mov r14, rax
0x100458b9f: call 0x1007c6c20 ; 0x1007c6c20
0x100458ba4: mov rdi, rax
0x100458ba7: mov rsi, rbx
0x100458baa: call 0x100795a70 ; 0x100795a70
0x100458baf: mov rdi, r14
0x100458bb2: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100458bb7: mov rdi, rax
0x100458bba: call 0x100011bf0 ; 0x100011bf0
0x100458bbf: mov rdi, rax
0x100458bc2: call 0x100011bf0 ; 0x100011bf0
0x100458bc7: nop word ptr [rax + rax]
