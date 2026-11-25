0x100457f70: push rbp
0x100457f71: mov rbp, rsp
0x100457f74: push r14
0x100457f76: push rbx
0x100457f77: test rdx, rdx
0x100457f7a: je 0x100458260
0x100457f80: mov r8d, dword ptr [rcx]
0x100457f83: xor r11d, r11d
0x100457f86: mov eax, 0
0x100457f8b: test r8, r8
0x100457f8e: je 0x100458029
0x100457f94: lea rbx, [rsi + 0xc]
0x100457f98: lea r10, [rdx + 4]
0x100457f9c: vmovaps xmm0, xmmword ptr [rip + 0x66a79c] ; 0x100ac2740
0x100457fa4: mov r14, rdi
0x100457fa7: nop word ptr [rax + rax]
0x100457fb0: movzx eax, byte ptr [r10 - 4]
0x100457fb5: shl rax, 6
0x100457fb9: vbroadcastss xmm1, dword ptr [rbx - 0xc]
0x100457fbf: vmulps xmm1, xmm1, xmmword ptr [r9 + rax]
0x100457fc5: vbroadcastss xmm2, dword ptr [rbx - 8]
0x100457fcb: vmulps xmm2, xmm2, xmmword ptr [r9 + rax + 0x10]
0x100457fd2: vaddps xmm1, xmm2, xmm1
0x100457fd6: vbroadcastss xmm2, dword ptr [rbx - 4]
0x100457fdc: vmulps xmm2, xmm2, xmmword ptr [r9 + rax + 0x20]
0x100457fe3: vaddps xmm1, xmm2, xmm1
0x100457fe7: vaddps xmm1, xmm1, xmmword ptr [r9 + rax + 0x30]
0x100457fee: movzx eax, byte ptr [r10]
0x100457ff2: vcvtsi2ss xmm2, xmm3, eax
0x100457ff6: vpermilps xmm2, xmm2, 0xc0
0x100457ffc: vmulps xmm1, xmm2, xmm1
0x100458000: vmulps xmm1, xmm1, xmm0
0x100458004: vextractps dword ptr [r14 + 8], xmm1, 2
0x10045800b: vmovlps qword ptr [r14], xmm1
0x100458010: mov eax, dword ptr [rbx]
0x100458012: mov dword ptr [r14 + 0xc], eax
0x100458016: add r14, 0x10
0x10045801a: add rbx, 0x10
0x10045801e: add r10, 8
0x100458022: dec r8
0x100458025: jne 0x100457fb0
0x100458027: mov eax, dword ptr [rcx]
0x100458029: mov r8d, eax
0x10045802c: mov r10d, dword ptr [rcx + 4]
0x100458030: test r10, r10
0x100458033: je 0x10045811f
0x100458039: mov rax, r8
0x10045803c: shl rax, 4
0x100458040: lea r11, [rdi + rax]
0x100458044: lea r14, [rsi + rax + 0xc]
0x100458049: lea rbx, [rdx + r8*8 + 5]
0x10045804e: vmovaps xmm0, xmmword ptr [rip + 0x66a6ea] ; 0x100ac2740
0x100458056: nop word ptr cs:[rax + rax]
0x100458060: movzx eax, byte ptr [rbx - 5]
0x100458064: shl rax, 6
0x100458068: vbroadcastss xmm1, dword ptr [r14 - 0xc]
0x10045806e: vmulps xmm2, xmm1, xmmword ptr [r9 + rax]
0x100458074: vbroadcastss xmm3, dword ptr [r14 - 8]
0x10045807a: vmulps xmm4, xmm3, xmmword ptr [r9 + rax + 0x10]
0x100458081: vaddps xmm2, xmm4, xmm2
0x100458085: vbroadcastss xmm4, dword ptr [r14 - 4]
0x10045808b: vmulps xmm5, xmm4, xmmword ptr [r9 + rax + 0x20]
0x100458092: vaddps xmm2, xmm5, xmm2
0x100458096: vaddps xmm2, xmm2, xmmword ptr [r9 + rax + 0x30]
0x10045809d: movzx eax, byte ptr [rbx - 1]
0x1004580a1: vcvtsi2ss xmm5, xmm6, eax
0x1004580a5: vpermilps xmm5, xmm5, 0xc0
0x1004580ab: vmulps xmm2, xmm5, xmm2
0x1004580af: movzx eax, byte ptr [rbx - 4]
0x1004580b3: shl rax, 6
0x1004580b7: vmulps xmm1, xmm1, xmmword ptr [r9 + rax]
0x1004580bd: vmulps xmm3, xmm3, xmmword ptr [r9 + rax + 0x10]
0x1004580c4: vaddps xmm1, xmm3, xmm1
0x1004580c8: vmulps xmm3, xmm4, xmmword ptr [r9 + rax + 0x20]
0x1004580cf: vaddps xmm1, xmm3, xmm1
0x1004580d3: vaddps xmm1, xmm1, xmmword ptr [r9 + rax + 0x30]
0x1004580da: movzx eax, byte ptr [rbx]
0x1004580dd: vcvtsi2ss xmm3, xmm6, eax
0x1004580e1: vpermilps xmm3, xmm3, 0xc0
0x1004580e7: vmulps xmm1, xmm3, xmm1
0x1004580eb: vaddps xmm1, xmm2, xmm1
0x1004580ef: vmulps xmm1, xmm1, xmm0
0x1004580f3: vextractps dword ptr [r11 + 8], xmm1, 2
0x1004580fa: vmovlps qword ptr [r11], xmm1
0x1004580ff: mov eax, dword ptr [r14]
0x100458102: mov dword ptr [r11 + 0xc], eax
0x100458106: add r11, 0x10
0x10045810a: add r14, 0x10
0x10045810e: add rbx, 8
0x100458112: dec r10
0x100458115: jne 0x100458060
0x10045811b: mov r11d, dword ptr [rcx + 4]
0x10045811f: add r8d, r11d
0x100458122: mov r10d, dword ptr [rcx + 8]
0x100458126: test r10, r10
0x100458129: je 0x100458340
0x10045812f: mov rax, r8
0x100458132: shl rax, 4
0x100458136: lea r11, [rdi + rax]
0x10045813a: lea r14, [rsi + rax + 0xc]
0x10045813f: lea rbx, [rdx + r8*8 + 6]
0x100458144: vmovaps xmm0, xmmword ptr [rip + 0x66a5f4] ; 0x100ac2740
0x10045814c: nop dword ptr [rax]
0x100458150: movzx eax, byte ptr [rbx - 6]
0x100458154: shl rax, 6
0x100458158: vbroadcastss xmm1, dword ptr [r14 - 0xc]
0x10045815e: vmulps xmm2, xmm1, xmmword ptr [r9 + rax]
0x100458164: vbroadcastss xmm3, dword ptr [r14 - 8]
0x10045816a: vmulps xmm4, xmm3, xmmword ptr [r9 + rax + 0x10]
0x100458171: vaddps xmm2, xmm4, xmm2
0x100458175: vbroadcastss xmm4, dword ptr [r14 - 4]
0x10045817b: vmulps xmm5, xmm4, xmmword ptr [r9 + rax + 0x20]
0x100458182: vaddps xmm2, xmm5, xmm2
0x100458186: vaddps xmm2, xmm2, xmmword ptr [r9 + rax + 0x30]
0x10045818d: movzx eax, byte ptr [rbx - 2]
0x100458191: vcvtsi2ss xmm5, xmm7, eax
0x100458195: vpermilps xmm5, xmm5, 0xc0
0x10045819b: vmulps xmm2, xmm5, xmm2
0x10045819f: movzx eax, byte ptr [rbx - 5]
0x1004581a3: shl rax, 6
0x1004581a7: vmulps xmm5, xmm1, xmmword ptr [r9 + rax]
0x1004581ad: vmulps xmm6, xmm3, xmmword ptr [r9 + rax + 0x10]
0x1004581b4: vaddps xmm5, xmm6, xmm5
0x1004581b8: vmulps xmm6, xmm4, xmmword ptr [r9 + rax + 0x20]
0x1004581bf: vaddps xmm5, xmm6, xmm5
0x1004581c3: vaddps xmm5, xmm5, xmmword ptr [r9 + rax + 0x30]
0x1004581ca: movzx eax, byte ptr [rbx - 1]
0x1004581ce: vcvtsi2ss xmm6, xmm7, eax
0x1004581d2: vpermilps xmm6, xmm6, 0xc0
0x1004581d8: vmulps xmm5, xmm6, xmm5
0x1004581dc: vaddps xmm2, xmm2, xmm5
0x1004581e0: movzx eax, byte ptr [rbx - 4]
0x1004581e4: shl rax, 6
0x1004581e8: vmulps xmm1, xmm1, xmmword ptr [r9 + rax]
0x1004581ee: vmulps xmm3, xmm3, xmmword ptr [r9 + rax + 0x10]
0x1004581f5: vaddps xmm1, xmm3, xmm1
0x1004581f9: vmulps xmm3, xmm4, xmmword ptr [r9 + rax + 0x20]
0x100458200: vaddps xmm1, xmm3, xmm1
0x100458204: vaddps xmm1, xmm1, xmmword ptr [r9 + rax + 0x30]
0x10045820b: movzx eax, byte ptr [rbx]
0x10045820e: vcvtsi2ss xmm3, xmm7, eax
0x100458212: vpermilps xmm3, xmm3, 0xc0
0x100458218: vmulps xmm1, xmm3, xmm1
0x10045821c: vaddps xmm1, xmm2, xmm1
0x100458220: vmulps xmm1, xmm1, xmm0
0x100458224: vextractps dword ptr [r11 + 8], xmm1, 2
0x10045822b: vmovlps qword ptr [r11], xmm1
0x100458230: mov eax, dword ptr [r14]
0x100458233: mov dword ptr [r11 + 0xc], eax
0x100458237: add r11, 0x10
0x10045823b: add r14, 0x10
0x10045823f: add rbx, 8
0x100458243: dec r10
0x100458246: jne 0x100458150
0x10045824c: mov ebx, dword ptr [rcx + 8]
0x10045824f: mov ecx, dword ptr [rcx + 0xc]
0x100458252: test rcx, rcx
0x100458255: jne 0x10045834e
0x10045825b: jmp 0x1004584aa ; 0x1004584aa
0x100458260: test r8d, r8d
0x100458263: je 0x1004584aa
0x100458269: mov eax, r8d
0x10045826c: add rdi, 0xc
0x100458270: lea rcx, [rsi + 8]
0x100458274: nop word ptr cs:[rax + rax]
0x100458280: vmovss xmm0, dword ptr [rcx - 8]
0x100458285: vmovss xmm1, dword ptr [rcx - 4]
0x10045828a: vmovss xmm2, dword ptr [rcx]
0x10045828e: vmovaps xmm3, xmmword ptr [r9]
0x100458293: vmovaps xmm4, xmmword ptr [r9 + 0x10]
0x100458299: vmovaps xmm5, xmmword ptr [r9 + 0x20]
0x10045829f: vmovaps xmm6, xmmword ptr [r9 + 0x30]
0x1004582a5: vmulss xmm8, xmm0, xmm3
0x1004582a9: vmulss xmm7, xmm1, xmm4
0x1004582ad: vaddss xmm8, xmm8, xmm7
0x1004582b1: vmulss xmm7, xmm2, xmm5
0x1004582b5: vaddss xmm7, xmm8, xmm7
0x1004582b9: vaddss xmm8, xmm6, xmm7
0x1004582bd: vmovshdup xmm7, xmm3
0x1004582c1: vmulss xmm9, xmm0, xmm7
0x1004582c5: vmovshdup xmm7, xmm4
0x1004582c9: vmulss xmm7, xmm1, xmm7
0x1004582cd: vaddss xmm9, xmm9, xmm7
0x1004582d1: vmovshdup xmm7, xmm5
0x1004582d5: vmulss xmm7, xmm2, xmm7
0x1004582d9: vaddss xmm9, xmm9, xmm7
0x1004582dd: vmovshdup xmm7, xmm6
0x1004582e1: vaddss xmm7, xmm7, xmm9
0x1004582e6: vpermilpd xmm3, xmm3, 1
0x1004582ec: vmulss xmm0, xmm0, xmm3
0x1004582f0: vpermilpd xmm3, xmm4, 1
0x1004582f6: vmulss xmm1, xmm1, xmm3
0x1004582fa: vaddss xmm0, xmm0, xmm1
0x1004582fe: vpermilpd xmm1, xmm5, 1
0x100458304: vmulss xmm1, xmm2, xmm1
0x100458308: vaddss xmm0, xmm0, xmm1
0x10045830c: vpermilpd xmm1, xmm6, 1
0x100458312: vaddss xmm0, xmm1, xmm0
0x100458316: vmovss dword ptr [rdi - 0xc], xmm8
0x10045831b: vmovss dword ptr [rdi - 8], xmm7
0x100458320: vmovss dword ptr [rdi - 4], xmm0
0x100458325: mov edx, dword ptr [rsi + 0xc]
0x100458328: mov dword ptr [rdi], edx
0x10045832a: add rdi, 0x10
0x10045832e: add rcx, 0x10
0x100458332: dec rax
0x100458335: jne 0x100458280
0x10045833b: jmp 0x1004584aa ; 0x1004584aa
0x100458340: xor ebx, ebx
0x100458342: mov ecx, dword ptr [rcx + 0xc]
0x100458345: test rcx, rcx
0x100458348: je 0x1004584aa
0x10045834e: add ebx, r8d
0x100458351: lea rax, [rdx + rbx*8 + 7]
0x100458356: shl rbx, 4
0x10045835a: add rdi, rbx
0x10045835d: lea rdx, [rsi + rbx + 0xc]
0x100458362: vmovaps xmm0, xmmword ptr [rip + 0x66a3d6] ; 0x100ac2740
0x10045836a: nop word ptr [rax + rax]
0x100458370: movzx esi, byte ptr [rax - 7]
0x100458374: shl rsi, 6
0x100458378: vbroadcastss xmm1, dword ptr [rdx - 0xc]
0x10045837e: vmulps xmm3, xmm1, xmmword ptr [r9 + rsi]
0x100458384: vbroadcastss xmm2, dword ptr [rdx - 8]
0x10045838a: vmulps xmm4, xmm2, xmmword ptr [r9 + rsi + 0x10]
0x100458391: vaddps xmm4, xmm4, xmm3
0x100458395: vbroadcastss xmm3, dword ptr [rdx - 4]
0x10045839b: vmulps xmm5, xmm3, xmmword ptr [r9 + rsi + 0x20]
0x1004583a2: vaddps xmm4, xmm5, xmm4
0x1004583a6: vaddps xmm4, xmm4, xmmword ptr [r9 + rsi + 0x30]
0x1004583ad: movzx esi, byte ptr [rax - 3]
0x1004583b1: vcvtsi2ss xmm5, xmm7, esi
0x1004583b5: vpermilps xmm5, xmm5, 0xc0
0x1004583bb: vmulps xmm4, xmm5, xmm4
0x1004583bf: movzx esi, byte ptr [rax - 6]
0x1004583c3: shl rsi, 6
0x1004583c7: vmulps xmm5, xmm1, xmmword ptr [r9 + rsi]
0x1004583cd: vmulps xmm6, xmm2, xmmword ptr [r9 + rsi + 0x10]
0x1004583d4: vaddps xmm5, xmm6, xmm5
0x1004583d8: vmulps xmm6, xmm3, xmmword ptr [r9 + rsi + 0x20]
0x1004583df: vaddps xmm5, xmm6, xmm5
0x1004583e3: vaddps xmm5, xmm5, xmmword ptr [r9 + rsi + 0x30]
0x1004583ea: movzx esi, byte ptr [rax - 2]
0x1004583ee: vcvtsi2ss xmm6, xmm7, esi
0x1004583f2: vpermilps xmm6, xmm6, 0xc0
0x1004583f8: vmulps xmm5, xmm6, xmm5
0x1004583fc: vaddps xmm4, xmm4, xmm5
0x100458400: movzx esi, byte ptr [rax - 5]
0x100458404: shl rsi, 6
0x100458408: vmulps xmm5, xmm1, xmmword ptr [r9 + rsi]
0x10045840e: vmulps xmm6, xmm2, xmmword ptr [r9 + rsi + 0x10]
0x100458415: vaddps xmm5, xmm6, xmm5
0x100458419: vmulps xmm6, xmm3, xmmword ptr [r9 + rsi + 0x20]
0x100458420: vaddps xmm5, xmm6, xmm5
0x100458424: vaddps xmm5, xmm5, xmmword ptr [r9 + rsi + 0x30]
0x10045842b: movzx esi, byte ptr [rax - 1]
0x10045842f: vcvtsi2ss xmm6, xmm7, esi
0x100458433: vpermilps xmm6, xmm6, 0xc0
0x100458439: vmulps xmm5, xmm6, xmm5
0x10045843d: vaddps xmm4, xmm4, xmm5
0x100458441: movzx esi, byte ptr [rax - 4]
0x100458445: shl rsi, 6
0x100458449: vmulps xmm1, xmm1, xmmword ptr [r9 + rsi]
0x10045844f: vmulps xmm2, xmm2, xmmword ptr [r9 + rsi + 0x10]
0x100458456: vaddps xmm1, xmm2, xmm1
0x10045845a: vmulps xmm2, xmm3, xmmword ptr [r9 + rsi + 0x20]
0x100458461: vaddps xmm1, xmm2, xmm1
0x100458465: vaddps xmm1, xmm1, xmmword ptr [r9 + rsi + 0x30]
0x10045846c: movzx esi, byte ptr [rax]
0x10045846f: vcvtsi2ss xmm2, xmm7, esi
0x100458473: vpermilps xmm2, xmm2, 0xc0
0x100458479: vmulps xmm1, xmm2, xmm1
0x10045847d: vaddps xmm1, xmm4, xmm1
0x100458481: vmulps xmm1, xmm1, xmm0
0x100458485: vextractps dword ptr [rdi + 8], xmm1, 2
0x10045848c: vmovlps qword ptr [rdi], xmm1
0x100458490: mov esi, dword ptr [rdx]
0x100458492: mov dword ptr [rdi + 0xc], esi
0x100458495: add rdi, 0x10
0x100458499: add rdx, 0x10
0x10045849d: add rax, 8
0x1004584a1: dec rcx
0x1004584a4: jne 0x100458370
0x1004584aa: pop rbx
0x1004584ab: pop r14
0x1004584ad: pop rbp
0x1004584ae: ret 
0x1004584af: nop 
