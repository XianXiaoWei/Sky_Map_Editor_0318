0x100216530: push rbp
0x100216531: mov rbp, rsp
0x100216534: mov r8, rdx
0x100216537: vcvtsi2ss xmm0, xmm0, dword ptr [r8]
0x10021653c: mov eax, ecx
0x10021653e: vcvtsi2ss xmm1, xmm1, rax
0x100216543: vdivss xmm0, xmm0, xmm1
0x100216547: vroundss xmm0, xmm0, xmm0, 9
0x10021654d: vcvtsi2ss xmm2, xmm2, dword ptr [rdi]
0x100216551: vaddss xmm0, xmm0, xmm2
0x100216555: vcvttss2si edx, xmm0
0x100216559: mov dword ptr [rdi], edx
0x10021655b: vcvtsi2ss xmm0, xmm3, dword ptr [r8 + 4]
0x100216561: vdivss xmm0, xmm0, xmm1
0x100216565: vroundss xmm0, xmm0, xmm0, 9
0x10021656b: vcvtsi2ss xmm2, xmm3, dword ptr [rdi + 4]
0x100216570: vaddss xmm0, xmm0, xmm2
0x100216574: vcvttss2si eax, xmm0
0x100216578: mov dword ptr [rdi + 4], eax
0x10021657b: vcvtsi2ss xmm0, xmm3, dword ptr [r8 + 8]
0x100216581: vdivss xmm0, xmm0, xmm1
0x100216585: vroundss xmm0, xmm0, xmm0, 9
0x10021658b: vcvtsi2ss xmm1, xmm3, dword ptr [rdi + 8]
0x100216590: vaddss xmm0, xmm0, xmm1
0x100216594: vcvttss2si r10d, xmm0
0x100216598: mov dword ptr [rdi + 8], r10d
0x10021659c: mov dil, 1
0x10021659f: mov r9b, 1
0x1002165a2: test edx, edx
0x1002165a4: js 0x1002165ac
0x1002165a6: cmp dword ptr [rsi], edx
0x1002165a8: setbe r9b
0x1002165ac: test eax, eax
0x1002165ae: js 0x1002165b7
0x1002165b0: cmp dword ptr [rsi + 4], eax
0x1002165b3: setbe dil
0x1002165b7: xor eax, eax
0x1002165b9: test r10d, r10d
0x1002165bc: js 0x1002165ef
0x1002165be: or r9b, dil
0x1002165c1: jne 0x1002165ef
0x1002165c3: cmp dword ptr [rsi + 8], r10d
0x1002165c7: jbe 0x1002165ef
0x1002165c9: mov eax, dword ptr [r8]
0x1002165cc: mov esi, dword ptr [r8 + 4]
0x1002165d0: xor edx, edx
0x1002165d2: div ecx
0x1002165d4: mov dword ptr [r8], edx
0x1002165d7: xor edx, edx
0x1002165d9: mov eax, esi
0x1002165db: div ecx
0x1002165dd: mov dword ptr [r8 + 4], edx
0x1002165e1: mov eax, dword ptr [r8 + 8]
0x1002165e5: xor edx, edx
0x1002165e7: div ecx
0x1002165e9: mov dword ptr [r8 + 8], edx
0x1002165ed: mov al, 1
0x1002165ef: pop rbp
0x1002165f0: ret 
0x1002165f1: nop word ptr cs:[rax + rax]
