0x100720560: push rbp
0x100720561: mov rbp, rsp
0x100720564: push r15
0x100720566: push r14
0x100720568: push r13
0x10072056a: push r12
0x10072056c: push rbx
0x10072056d: mov r10, rdx
0x100720570: mov qword ptr [rbp - 0x70], rsi
0x100720574: mov qword ptr [rbp - 0x68], rdi
0x100720578: cmp ecx, 2
0x10072057b: jb 0x10072096e
0x100720581: mov r11d, ecx
0x100720584: mov r9d, 1
0x10072058a: vmovdqa xmm0, xmmword ptr [rip + 0x387b5e] ; 0x100aa80f0
0x100720592: mov qword ptr [rbp - 0x58], r10
0x100720596: mov qword ptr [rbp - 0x50], r11
0x10072059a: nop word ptr [rax + rax]
0x1007205a0: mov rax, qword ptr [rbp - 0x68]
0x1007205a4: mov rcx, qword ptr [rax + r9*8 - 8]
0x1007205a9: mov r15, qword ptr [rax + r9*8]
0x1007205ad: mov rax, qword ptr [rbp - 0x70]
0x1007205b1: mov r12d, dword ptr [rax + r9*4 - 4]
0x1007205b6: mov eax, dword ptr [rax + r9*4]
0x1007205ba: mov qword ptr [rbp - 0x38], rax
0x1007205be: mov edx, dword ptr [r10 + r9*4 - 4]
0x1007205c3: mov eax, dword ptr [r10 + r9*4]
0x1007205c7: mov qword ptr [rbp - 0x48], rax
0x1007205cb: mov qword ptr [rbp - 0x40], rdx
0x1007205cf: mov eax, edx
0x1007205d1: shr eax, 1
0x1007205d3: mov dword ptr [rbp - 0x2c], eax
0x1007205d6: je 0x100720717
0x1007205dc: mov ebx, r12d
0x1007205df: shr ebx, 1
0x1007205e1: je 0x100720717
0x1007205e7: xor r13d, r13d
0x1007205ea: nop word ptr [rax + rax]
0x1007205f0: lea edx, [r13 + r13]
0x1007205f5: mov esi, edx
0x1007205f7: imul esi, r12d
0x1007205fb: or edx, 2
0x1007205fe: imul edx, r12d
0x100720602: vmovd xmm1, esi
0x100720606: add esi, 4
0x100720609: vpinsrd xmm1, xmm1, esi, 1
0x10072060f: vpinsrd xmm1, xmm1, edx, 2
0x100720615: add edx, 4
0x100720618: vpinsrd xmm1, xmm1, edx, 3
0x10072061e: mov r8d, r13d
0x100720621: imul r8d, dword ptr [rbp - 0x38]
0x100720626: xor r14d, r14d
0x100720629: nop dword ptr [rax]
0x100720630: vpextrq rdx, xmm1, 1
0x100720636: mov esi, edx
0x100720638: shr rdx, 0x20
0x10072063c: vmovq rdi, xmm1
0x100720641: mov eax, edi
0x100720643: shr rdi, 0x20
0x100720647: prefetcht0 byte ptr [rcx + rax*4 + 0x200]
0x10072064f: prefetcht0 byte ptr [rcx + rsi*4 + 0x200]
0x100720657: vmovss xmm2, dword ptr [rcx + rax*4]
0x10072065c: vmovss xmm3, dword ptr [rcx + rax*4 + 4]
0x100720662: vinsertps xmm2, xmm2, dword ptr [rcx + rdi*4], 0x10
0x100720669: vinsertps xmm2, xmm2, dword ptr [rcx + rsi*4], 0x20
0x100720670: vinsertps xmm2, xmm2, dword ptr [rcx + rdx*4], 0x30
0x100720677: vinsertps xmm3, xmm3, dword ptr [rcx + rdi*4 + 4], 0x10
0x10072067f: vinsertps xmm3, xmm3, dword ptr [rcx + rsi*4 + 4], 0x20
0x100720687: vinsertps xmm3, xmm3, dword ptr [rcx + rdx*4 + 4], 0x30
0x10072068f: vmaxps xmm2, xmm2, xmm3
0x100720693: vmovss xmm3, dword ptr [rcx + rax*4 + 8]
0x100720699: vinsertps xmm3, xmm3, dword ptr [rcx + rdi*4 + 8], 0x10
0x1007206a1: vinsertps xmm3, xmm3, dword ptr [rcx + rsi*4 + 8], 0x20
0x1007206a9: vinsertps xmm3, xmm3, dword ptr [rcx + rdx*4 + 8], 0x30
0x1007206b1: vmovss xmm4, dword ptr [rcx + rax*4 + 0xc]
0x1007206b7: vinsertps xmm4, xmm4, dword ptr [rcx + rdi*4 + 0xc], 0x10
0x1007206bf: vinsertps xmm4, xmm4, dword ptr [rcx + rsi*4 + 0xc], 0x20
0x1007206c7: vinsertps xmm4, xmm4, dword ptr [rcx + rdx*4 + 0xc], 0x30
0x1007206cf: vmaxps xmm3, xmm3, xmm4
0x1007206d3: vmaxps xmm2, xmm2, xmm3
0x1007206d7: mov eax, r8d
0x1007206da: lea rdx, [r15 + rax*4]
0x1007206de: test dl, 0xf
0x1007206e1: je 0x1007206f0
0x1007206e3: vmovups xmmword ptr [rdx], xmm2
0x1007206e7: jmp 0x1007206f4 ; 0x1007206f4
0x1007206e9: nop dword ptr [rax]
0x1007206f0: vmovaps xmmword ptr [rdx], xmm2
0x1007206f4: vpaddd xmm1, xmm1, xmm0
0x1007206f8: add r8d, 4
0x1007206fc: add r14d, 2
0x100720700: cmp r14d, ebx
0x100720703: jb 0x100720630
0x100720709: add r13d, 2
0x10072070d: cmp r13d, dword ptr [rbp - 0x2c]
0x100720711: jb 0x1007205f0
0x100720717: mov rsi, qword ptr [rbp - 0x48]
0x10072071b: cmp dword ptr [rbp - 0x2c], esi
0x10072071e: je 0x100720800
0x100720724: mov r8d, r12d
0x100720727: shr r8d, 1
0x10072072a: je 0x10072093d
0x100720730: mov r14, r9
0x100720733: mov rax, qword ptr [rbp - 0x40]
0x100720737: lea eax, [rax - 2]
0x10072073a: imul eax, r12d
0x10072073e: lea rdx, [rcx + rax*4]
0x100720742: lea eax, [rsi - 2]
0x100720745: imul eax, dword ptr [rbp - 0x38]
0x100720749: lea rsi, [r15 + rax*4]
0x10072074d: mov r9d, r8d
0x100720750: mov ebx, 4
0x100720755: xor edi, edi
0x100720757: nop word ptr [rax + rax]
0x100720760: lea eax, [rbx - 4]
0x100720763: vmovupd xmm1, xmmword ptr [rdx + rax*4]
0x100720768: mov eax, ebx
0x10072076a: vmovupd xmm2, xmmword ptr [rdx + rax*4]
0x10072076f: vpermilpd xmm3, xmm1, 3
0x100720775: vmovddup xmm1, xmm1
0x100720779: vmovshdup xmm4, xmm3
0x10072077d: vmaxss xmm3, xmm4, xmm3
0x100720781: vmovshdup xmm4, xmm1
0x100720785: vmaxss xmm1, xmm4, xmm1
0x100720789: vpermilpd xmm4, xmm2, 3
0x10072078f: vmovddup xmm2, xmm2
0x100720793: vmovshdup xmm5, xmm4
0x100720797: vmaxss xmm4, xmm5, xmm4
0x10072079b: vmovshdup xmm5, xmm2
0x10072079f: vmaxss xmm2, xmm5, xmm2
0x1007207a3: vmaxss xmm1, xmm1, xmm3
0x1007207a7: vmaxss xmm2, xmm2, xmm4
0x1007207ab: vinsertps xmm1, xmm1, xmm2, 0x10
0x1007207b1: vmovddup xmm1, xmm1
0x1007207b5: test sil, 0xf
0x1007207b9: je 0x1007207d0
0x1007207bb: vmovupd xmmword ptr [rsi], xmm1
0x1007207bf: jmp 0x1007207d4 ; 0x1007207d4
0x1007207c1: nop word ptr cs:[rax + rax]
0x1007207d0: vmovapd xmmword ptr [rsi], xmm1
0x1007207d4: add rdi, 2
0x1007207d8: add ebx, 8
0x1007207db: add rsi, 0x10
0x1007207df: cmp rdi, r9
0x1007207e2: jb 0x100720760
0x1007207e8: mov r9, r14
0x1007207eb: cmp r8d, dword ptr [rbp - 0x38]
0x1007207ef: jne 0x100720810
0x1007207f1: jmp 0x100720950 ; 0x100720950
0x1007207f6: nop word ptr cs:[rax + rax]
0x100720800: mov r8d, r12d
0x100720803: shr r8d, 1
0x100720806: cmp r8d, dword ptr [rbp - 0x38]
0x10072080a: je 0x100720950
0x100720810: mov qword ptr [rbp - 0x60], r9
0x100720814: cmp dword ptr [rbp - 0x2c], 0
0x100720818: je 0x1007208d7
0x10072081e: lea eax, [r12 + r12 - 4]
0x100720823: lea rbx, [rcx + rax*4]
0x100720827: mov rdx, qword ptr [rbp - 0x38]
0x10072082b: lea eax, [rdx + rdx - 4]
0x10072082f: lea r8, [r15 + rax*4]
0x100720833: mov r13d, dword ptr [rbp - 0x2c]
0x100720837: lea r14d, [r12 + r12]
0x10072083b: lea esi, [r12*4]
0x100720843: lea edi, [rdx + rdx]
0x100720846: xor edx, edx
0x100720848: xor r9d, r9d
0x10072084b: xor r10d, r10d
0x10072084e: nop 
0x100720850: mov eax, r9d
0x100720853: vmovupd xmm1, xmmword ptr [rbx + rax*4]
0x100720858: lea eax, [r14 + r9]
0x10072085c: vmovupd xmm2, xmmword ptr [rbx + rax*4]
0x100720861: vpermilpd xmm3, xmm1, 3
0x100720867: vmovddup xmm1, xmm1
0x10072086b: vmovshdup xmm4, xmm3
0x10072086f: vmaxss xmm3, xmm4, xmm3
0x100720873: vmovshdup xmm4, xmm1
0x100720877: vmaxss xmm1, xmm4, xmm1
0x10072087b: vpermilpd xmm4, xmm2, 3
0x100720881: vmovddup xmm2, xmm2
0x100720885: vmovshdup xmm5, xmm4
0x100720889: vmaxss xmm4, xmm5, xmm4
0x10072088d: vmovshdup xmm5, xmm2
0x100720891: vmaxss xmm2, xmm5, xmm2
0x100720895: vmaxss xmm1, xmm1, xmm3
0x100720899: vmaxss xmm2, xmm2, xmm4
0x10072089d: mov eax, edx
0x10072089f: lea r11, [r8 + rax*4]
0x1007208a3: vshufps xmm1, xmm1, xmm2, 0
0x1007208a8: test r11b, 0xf
0x1007208ac: je 0x1007208c0
0x1007208ae: vmovups xmmword ptr [r11], xmm1
0x1007208b3: jmp 0x1007208c5 ; 0x1007208c5
0x1007208b5: nop word ptr cs:[rax + rax]
0x1007208c0: vmovaps xmmword ptr [r11], xmm1
0x1007208c5: add r10, 2
0x1007208c9: add r9d, esi
0x1007208cc: add edx, edi
0x1007208ce: cmp r10, r13
0x1007208d1: jb 0x100720850
0x1007208d7: mov rax, qword ptr [rbp - 0x48]
0x1007208db: cmp dword ptr [rbp - 0x2c], eax
0x1007208de: mov r10, qword ptr [rbp - 0x58]
0x1007208e2: mov r11, qword ptr [rbp - 0x50]
0x1007208e6: mov r9, qword ptr [rbp - 0x60]
0x1007208ea: je 0x100720950
0x1007208ec: mov rdx, qword ptr [rbp - 0x40]
0x1007208f0: imul edx, r12d
0x1007208f4: vmovupd xmm1, xmmword ptr [rcx + rdx*4 - 0x10]
0x1007208fa: vpermilpd xmm2, xmm1, 3
0x100720900: vmovddup xmm1, xmm1
0x100720904: vmovshdup xmm3, xmm2
0x100720908: vmaxss xmm2, xmm3, xmm2
0x10072090c: vmovshdup xmm3, xmm1
0x100720910: vmaxss xmm1, xmm3, xmm1
0x100720914: imul eax, dword ptr [rbp - 0x38]
0x100720918: lea rax, [r15 + rax*4 - 0x10]
0x10072091d: vmaxss xmm1, xmm2, xmm1
0x100720921: vpermilps xmm1, xmm1, 0
0x100720927: test al, 0xf
0x100720929: je 0x10072095e
0x10072092b: vmovups xmmword ptr [rax], xmm1
0x10072092f: inc r9
0x100720932: cmp r9, r11
0x100720935: jne 0x1007205a0
0x10072093b: jmp 0x10072096e ; 0x10072096e
0x10072093d: xor r8d, r8d
0x100720940: cmp r8d, dword ptr [rbp - 0x38]
0x100720944: jne 0x100720810
0x10072094a: nop word ptr [rax + rax]
0x100720950: inc r9
0x100720953: cmp r9, r11
0x100720956: jne 0x1007205a0
0x10072095c: jmp 0x10072096e ; 0x10072096e
0x10072095e: vmovaps xmmword ptr [rax], xmm1
0x100720962: inc r9
0x100720965: cmp r9, r11
0x100720968: jne 0x1007205a0
0x10072096e: pop rbx
0x10072096f: pop r12
0x100720971: pop r13
0x100720973: pop r14
0x100720975: pop r15
0x100720977: pop rbp
0x100720978: ret 
0x100720979: nop dword ptr [rax]
