0x1001975c0: push rbp
0x1001975c1: mov rbp, rsp
0x1001975c4: push r15
0x1001975c6: push r14
0x1001975c8: push r13
0x1001975ca: push r12
0x1001975cc: push rbx
0x1001975cd: sub rsp, 0x108
0x1001975d4: mov qword ptr [rbp - 0x58], r9
0x1001975d8: mov r13, r8
0x1001975db: mov rbx, rcx
0x1001975de: mov r14d, edi
0x1001975e1: call 0x1007c6c20 ; 0x1007c6c20
0x1001975e6: mov dword ptr [rbp - 0x34], r14d
0x1001975ea: mov r14d, r14d
0x1001975ed: mov qword ptr [rbp - 0x50], r14
0x1001975f1: shl r14, 4
0x1001975f5: lea r15, [rip + 0x1eb1554] ; 0x102048b50
0x1001975fc: mov rdx, qword ptr [r15]
0x1001975ff: mov ecx, 0x10
0x100197604: mov rdi, rax
0x100197607: mov rsi, r14
0x10019760a: call 0x100795530 ; 0x100795530
0x10019760f: mov qword ptr [rbp - 0x40], rax
0x100197613: call 0x1007c6c20 ; 0x1007c6c20
0x100197618: mov rdx, qword ptr [r15]
0x10019761b: mov ecx, 0x10
0x100197620: mov rdi, rax
0x100197623: mov rsi, r14
0x100197626: call 0x100795530 ; 0x100795530
0x10019762b: mov qword ptr [rbp - 0x30], rax
0x10019762f: mov eax, dword ptr [rbp - 0x34]
0x100197632: test eax, eax
0x100197634: mov r9, qword ptr [rbp - 0x50]
0x100197638: je 0x10019781c
0x10019763e: mov r8b, byte ptr [rbp + 0x18]
0x100197642: add rbx, 2
0x100197646: vmovdqa xmm0, xmmword ptr [rip + 0x915f32] ; 0x100aad580
0x10019764e: vmovaps xmm1, xmmword ptr [rip + 0x915f3a] ; 0x100aad590
0x100197656: vxorps xmm2, xmm2, xmm2
0x10019765a: vmovaps xmm3, xmmword ptr [rip + 0x915f3e] ; 0x100aad5a0
0x100197662: vmovaps xmm4, xmmword ptr [rip + 0x915f46] ; 0x100aad5b0
0x10019766a: mov rcx, r9
0x10019766d: mov rdx, qword ptr [rbp - 0x40]
0x100197671: nop word ptr cs:[rax + rax]
0x100197680: movzx esi, byte ptr [rbx - 2]
0x100197684: vmovd xmm5, esi
0x100197688: vpinsrb xmm5, xmm5, byte ptr [rbx - 1], 4
0x10019768f: vpinsrb xmm5, xmm5, byte ptr [rbx], 8
0x100197695: vpslld xmm5, xmm5, 0x18
0x10019769a: vpsrad xmm5, xmm5, 0x18
0x10019769f: vpaddd xmm5, xmm5, xmm0
0x1001976a3: vaddps xmm5, xmm5, xmm1
0x1001976a7: vcmpleps xmm6, xmm2, xmm5
0x1001976ac: vblendvps xmm6, xmm3, xmm4, xmm6
0x1001976b2: vmulps xmm5, xmm6, xmm5
0x1001976b6: vmovaps xmmword ptr [rdx], xmm5
0x1001976ba: add rdx, 0x10
0x1001976be: add rbx, 4
0x1001976c2: dec rcx
0x1001976c5: jne 0x100197680
0x1001976c7: test eax, eax
0x1001976c9: je 0x10019781c
0x1001976cf: mov ecx, r9d
0x1001976d2: and ecx, 1
0x1001976d5: cmp eax, 1
0x1001976d8: jne 0x1001976e3
0x1001976da: xor esi, esi
0x1001976dc: test rcx, rcx
0x1001976df: jne 0x100197736
0x1001976e1: jmp 0x100197752 ; 0x100197752
0x1001976e3: mov rdi, r9
0x1001976e6: sub rdi, rcx
0x1001976e9: mov rdx, qword ptr [rbp - 0x30]
0x1001976ed: lea rdx, [rdx + 0x10]
0x1001976f1: lea rbx, [r13 + 0x18]
0x1001976f5: xor esi, esi
0x1001976f7: nop word ptr [rax + rax]
0x100197700: vmovsd xmm0, qword ptr [rbx - 0x18]
0x100197705: vinsertps xmm0, xmm0, dword ptr [rbx - 0x10], 0x20
0x10019770c: vmovaps xmmword ptr [rdx - 0x10], xmm0
0x100197711: vmovsd xmm0, qword ptr [rbx - 8]
0x100197716: vinsertps xmm0, xmm0, dword ptr [rbx], 0x20
0x10019771c: vmovaps xmmword ptr [rdx], xmm0
0x100197720: add rsi, 2
0x100197724: add rdx, 0x20
0x100197728: add rbx, 0x20
0x10019772c: cmp rdi, rsi
0x10019772f: jne 0x100197700
0x100197731: test rcx, rcx
0x100197734: je 0x100197752
0x100197736: shl rsi, 4
0x10019773a: vmovsd xmm0, qword ptr [r13 + rsi]
0x100197741: vinsertps xmm0, xmm0, dword ptr [r13 + rsi + 8], 0x20
0x100197749: mov rcx, qword ptr [rbp - 0x30]
0x10019774d: vmovaps xmmword ptr [rcx + rsi], xmm0
0x100197752: test eax, eax
0x100197754: je 0x10019781c
0x10019775a: test r8b, r8b
0x10019775d: je 0x10019781c
0x100197763: vmovaps xmm8, xmmword ptr [rip + 0x910935] ; 0x100aa80a0
0x10019776b: vxorps xmm1, xmm1, xmm1
0x10019776f: vmovss xmm2, dword ptr [rip + 0x90d949] ; 0x100aa50c0
0x100197777: vmovss xmm9, dword ptr [rip + 0x911a55] ; 0x100aa91d4
0x10019777f: vmovss xmm10, dword ptr [rip + 0x915e51] ; 0x100aad5d8
0x100197787: vmovss xmm11, dword ptr [rip + 0x90f315] ; 0x100aa6aa4
0x10019778f: vmovss xmm6, dword ptr [rip + 0x911ee5] ; 0x100aa967c
0x100197797: vmovss xmm7, dword ptr [rip + 0x91003d] ; 0x100aa77dc
0x10019779f: mov rax, r9
0x1001977a2: mov rcx, qword ptr [rbp + 0x10]
0x1001977a6: mov rdx, qword ptr [rbp - 0x40]
0x1001977aa: nop word ptr [rax + rax]
0x1001977b0: vinsertps xmm0, xmm8, xmm0, 0xf5
0x1001977b6: vmulps xmm3, xmm0, xmmword ptr [rdx]
0x1001977ba: vmovshdup xmm4, xmm3
0x1001977be: vaddss xmm4, xmm3, xmm4
0x1001977c2: vpermilpd xmm3, xmm3, 1
0x1001977c8: vaddss xmm3, xmm3, xmm4
0x1001977cc: vmaxss xmm3, xmm1, xmm3
0x1001977d0: vminss xmm3, xmm2, xmm3
0x1001977d4: vaddss xmm3, xmm3, xmm9
0x1001977d9: vdivss xmm3, xmm3, xmm10
0x1001977de: vmaxss xmm3, xmm1, xmm3
0x1001977e2: vminss xmm3, xmm2, xmm3
0x1001977e6: vmulss xmm4, xmm3, xmm3
0x1001977ea: vmulss xmm5, xmm3, xmm11
0x1001977ef: vaddss xmm5, xmm5, xmm6
0x1001977f3: vmulss xmm5, xmm3, xmm5
0x1001977f7: vmulss xmm3, xmm3, xmm4
0x1001977fb: vaddss xmm4, xmm5, xmm7
0x1001977ff: vmulss xmm3, xmm3, xmm4
0x100197803: vmovss xmm4, dword ptr [rcx]
0x100197807: vmaxss xmm3, xmm4, xmm3
0x10019780b: vmovss dword ptr [rcx], xmm3
0x10019780f: add rdx, 0x10
0x100197813: add rcx, 4
0x100197817: dec rax
0x10019781a: jne 0x1001977b0
0x10019781c: call 0x1007c6c20 ; 0x1007c6c20
0x100197821: mov rdx, qword ptr [r15]
0x100197824: mov esi, 0x800
0x100197829: mov ecx, 0x10
0x10019782e: mov rdi, rax
0x100197831: call 0x100795530 ; 0x100795530
0x100197836: mov r13, rax
0x100197839: mov rcx, qword ptr [rbp - 0x58]
0x10019783d: cmp dword ptr [rcx + 0x185110], 0
0x100197844: je 0x1001979c9
0x10019784a: xor r14d, r14d
0x10019784d: lea r12, [rbp - 0x130]
0x100197854: xor r15d, r15d
0x100197857: nop word ptr [rax + rax]
0x100197860: mov eax, r14d
0x100197863: imul rax, rax, 0xa60
0x10019786a: lea rbx, [rcx + rax + 0x10]
0x10019786f: mov rax, qword ptr [rcx + rax + 0x10]
0x100197874: mov rdi, rbx
0x100197877: call qword ptr [rax + 0x38]
0x10019787a: mov rdi, rax
0x10019787d: lea rsi, [rip + 0x9dfba8] ; 0x100b7742c UnitCube
0x100197884: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100197889: test eax, eax
0x10019788b: jne 0x100197902
0x10019788d: mov rax, qword ptr [rbx]
0x100197890: lea rdi, [rbp - 0xf0]
0x100197897: mov rsi, rbx
0x10019789a: call qword ptr [rax + 0x18]
0x10019789d: mov rax, qword ptr [rbx]
0x1001978a0: mov rdi, r12
0x1001978a3: mov rsi, rbx
0x1001978a6: call qword ptr [rax + 0x20]
0x1001978a9: lea rdi, [rbp - 0xb0]
0x1001978b0: lea rsi, [rbp - 0xf0]
0x1001978b7: mov rdx, r12
0x1001978ba: call 0x100076df0 ; 0x100076df0
0x1001978bf: mov eax, r15d
0x1001978c2: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x1001978ca: shl rax, 6
0x1001978ce: vmovaps xmmword ptr [r13 + rax], xmm0
0x1001978d5: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x1001978dd: vmovaps xmmword ptr [r13 + rax + 0x10], xmm0
0x1001978e4: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x1001978ec: vmovaps xmmword ptr [r13 + rax + 0x20], xmm0
0x1001978f3: vmovdqa xmm0, xmmword ptr [rbp - 0x80]
0x1001978f8: vmovdqa xmmword ptr [r13 + rax + 0x30], xmm0
0x1001978ff: inc r15d
0x100197902: inc r14d
0x100197905: mov rcx, qword ptr [rbp - 0x58]
0x100197909: cmp r14d, dword ptr [rcx + 0x185110]
0x100197910: jb 0x100197860
0x100197916: cmp dword ptr [rbp - 0x34], 0
0x10019791a: je 0x1001979d6
0x100197920: test r15d, r15d
0x100197923: je 0x1001979d6
0x100197929: mov r15d, r15d
0x10019792c: xor r12d, r12d
0x10019792f: mov qword ptr [rbp - 0x48], r13
0x100197933: mov r14, r12
0x100197936: shl r14, 4
0x10019793a: add r14, qword ptr [rbp - 0x30]
0x10019793e: mov rbx, r13
0x100197941: xor r13d, r13d
0x100197944: nop word ptr cs:[rax + rax]
0x100197950: vmovdqa xmm0, xmmword ptr [r14]
0x100197955: vmovdqa xmmword ptr [rbp - 0x70], xmm0
0x10019795a: lea rdi, [rbp - 0x70]
0x10019795e: mov rsi, rbx
0x100197961: call 0x10078ce10 ; 0x10078ce10
0x100197966: vcvtss2sd xmm0, xmm0, xmm0
0x10019796a: vdivsd xmm0, xmm0, qword ptr [rip + 0x9142d6] ; 0x100aabc48
0x100197972: vxorps xmm1, xmm1, xmm1
0x100197976: vmaxsd xmm0, xmm1, xmm0
0x10019797a: vmovsd xmm1, qword ptr [rip + 0x90e52e] ; 0x100aa5eb0
0x100197982: vminsd xmm0, xmm1, xmm0
0x100197986: vcvtsd2ss xmm0, xmm0, xmm0
0x10019798a: vmovss xmm1, dword ptr [rip + 0x90d72e] ; 0x100aa50c0
0x100197992: vsubss xmm0, xmm1, xmm0
0x100197996: mov rax, qword ptr [rbp + 0x10]
0x10019799a: vmovss xmm1, dword ptr [rax + r12*4]
0x1001979a0: vmaxss xmm0, xmm1, xmm0
0x1001979a4: vmovss dword ptr [rax + r12*4], xmm0
0x1001979aa: inc r13
0x1001979ad: add rbx, 0x40
0x1001979b1: cmp r13, r15
0x1001979b4: jb 0x100197950
0x1001979b6: inc r12
0x1001979b9: cmp r12, qword ptr [rbp - 0x50]
0x1001979bd: mov r13, qword ptr [rbp - 0x48]
0x1001979c1: jb 0x100197933
0x1001979c7: jmp 0x1001979d6 ; 0x1001979d6
0x1001979c9: xor r15d, r15d
0x1001979cc: cmp dword ptr [rbp - 0x34], 0
0x1001979d0: jne 0x100197920
0x1001979d6: call 0x1007c6c20 ; 0x1007c6c20
0x1001979db: mov rdi, rax
0x1001979de: mov rsi, r13
0x1001979e1: call 0x100795a70 ; 0x100795a70
0x1001979e6: call 0x1007c6c20 ; 0x1007c6c20
0x1001979eb: mov rdi, rax
0x1001979ee: mov rsi, qword ptr [rbp - 0x30]
0x1001979f2: call 0x100795a70 ; 0x100795a70
0x1001979f7: call 0x1007c6c20 ; 0x1007c6c20
0x1001979fc: mov rdi, rax
0x1001979ff: mov rsi, qword ptr [rbp - 0x40]
0x100197a03: call 0x100795a70 ; 0x100795a70
0x100197a08: add rsp, 0x108
0x100197a0f: pop rbx
0x100197a10: pop r12
0x100197a12: pop r13
0x100197a14: pop r14
0x100197a16: pop r15
0x100197a18: pop rbp
0x100197a19: ret 
0x100197a1a: mov rdi, rax
0x100197a1d: call 0x100011bf0 ; 0x100011bf0
0x100197a22: mov rdi, rax
0x100197a25: call 0x100011bf0 ; 0x100011bf0
0x100197a2a: mov rdi, rax
0x100197a2d: call 0x100011bf0 ; 0x100011bf0
0x100197a32: mov rbx, rax
0x100197a35: jmp 0x100197a62 ; 0x100197a62
0x100197a37: mov rbx, rax
0x100197a3a: jmp 0x100197a73 ; 0x100197a73
0x100197a3c: mov rbx, rax
0x100197a3f: jmp 0x100197a52 ; 0x100197a52
0x100197a41: mov rbx, rax
0x100197a44: jmp 0x100197a52 ; 0x100197a52
0x100197a46: mov rbx, rax
0x100197a49: jmp 0x100197a52 ; 0x100197a52
0x100197a4b: mov rbx, rax
0x100197a4e: mov r13, qword ptr [rbp - 0x48]
0x100197a52: call 0x1007c6c20 ; 0x1007c6c20
0x100197a57: mov rdi, rax
0x100197a5a: mov rsi, r13
0x100197a5d: call 0x100795a70 ; 0x100795a70
0x100197a62: call 0x1007c6c20 ; 0x1007c6c20
0x100197a67: mov rdi, rax
0x100197a6a: mov rsi, qword ptr [rbp - 0x30]
0x100197a6e: call 0x100795a70 ; 0x100795a70
0x100197a73: call 0x1007c6c20 ; 0x1007c6c20
0x100197a78: mov rdi, rax
0x100197a7b: mov rsi, qword ptr [rbp - 0x40]
0x100197a7f: call 0x100795a70 ; 0x100795a70
0x100197a84: mov rdi, rbx
0x100197a87: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100197a8c: mov rdi, rax
0x100197a8f: call 0x100011bf0 ; 0x100011bf0
0x100197a94: mov rdi, rax
0x100197a97: call 0x100011bf0 ; 0x100011bf0
0x100197a9c: mov rdi, rax
0x100197a9f: call 0x100011bf0 ; 0x100011bf0
0x100197aa4: nop word ptr cs:[rax + rax]
