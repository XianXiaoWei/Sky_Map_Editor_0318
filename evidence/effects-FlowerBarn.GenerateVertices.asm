0x100350c40: push rbp
0x100350c41: mov rbp, rsp
0x100350c44: push r15
0x100350c46: push r14
0x100350c48: push r13
0x100350c4a: push r12
0x100350c4c: push rbx
0x100350c4d: sub rsp, 0xb138
0x100350c54: mov r14, r9
0x100350c57: mov qword ptr [rbp - 0xb0d8], r8
0x100350c5e: mov r8, rcx
0x100350c61: mov rbx, rdx
0x100350c64: mov qword ptr [rbp - 0xb0c8], rsi
0x100350c6b: mov r15, rdi
0x100350c6e: mov edi, dword ptr [rbp + 0x10]
0x100350c71: mov rax, qword ptr [rip + 0x8bcc60] ; 0x100c0d8d8
0x100350c78: mov rax, qword ptr [rax]
0x100350c7b: mov qword ptr [rbp - 0x30], rax
0x100350c7f: test edi, edi
0x100350c81: mov qword ptr [rbp - 0xb090], r8
0x100350c88: je 0x100350ca2
0x100350c8a: lea esi, [rdi - 1]
0x100350c8d: inc rsi
0x100350c90: mov rdi, r14
0x100350c93: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x100350c98: mov edi, dword ptr [rbp + 0x10]
0x100350c9b: mov r8, qword ptr [rbp - 0xb090]
0x100350ca2: mov qword ptr [rbp - 0xb078], r14
0x100350ca9: mov al, byte ptr [rbp + 0x20]
0x100350cac: mov byte ptr [rbp - 0xb041], al
0x100350cb2: vxorps xmm0, xmm0, xmm0
0x100350cb6: vmovaps xmmword ptr [rbp - 0xb040], xmm0
0x100350cbe: test edi, edi
0x100350cc0: je 0x1003511b8
0x100350cc6: movzx eax, byte ptr [rbx + 0xa]
0x100350cca: imul rax, rax, 0x110
0x100350cd1: vmovapd xmm7, xmmword ptr [r8]
0x100350cd6: lea r9, [r15 + rax + 0xed0]
0x100350cde: vpermilpd xmm8, xmm7, 1
0x100350ce4: vpermilps xmm0, xmm7, 0x55
0x100350cea: vmovaps xmmword ptr [rbp - 0xb100], xmm0
0x100350cf2: xor r10d, r10d
0x100350cf5: vmovss xmm12, dword ptr [rip + 0x759ebb] ; 0x100aaabb8
0x100350cfd: vmovss xmm6, dword ptr [rip + 0x7543bb] ; 0x100aa50c0
0x100350d05: vmovss xmm9, dword ptr [rip + 0x7538ab] ; 0x100aa45b8
0x100350d0d: vxorps xmm10, xmm10, xmm10
0x100350d12: vmovss xmm11, dword ptr [rip + 0x755d92] ; 0x100aa6aac
0x100350d1a: mov r11d, 1
0x100350d20: vmovaps xmm0, xmm7
0x100350d24: xor r14d, r14d
0x100350d27: vmovaps xmmword ptr [rbp - 0xb0a0], xmm7
0x100350d2f: mov qword ptr [rbp - 0xb0d0], r15
0x100350d36: vmovapd xmmword ptr [rbp - 0xb110], xmm8
0x100350d3e: jmp 0x100350ff5 ; 0x100350ff5
0x100350d43: nop word ptr cs:[rax + rax]
0x100350d50: lea r13, [r15 + rdx + 0xed0]
0x100350d58: vblendps xmm5, xmm0, xmm7, 2
0x100350d5e: mov eax, dword ptr [r13 + 0x7c]
0x100350d62: cmp eax, 1
0x100350d65: je 0x100350f80
0x100350d6b: cmp eax, 2
0x100350d6e: jne 0x100350e20
0x100350d74: vmovaps xmmword ptr [rbp - 0xb030], xmm5
0x100350d7c: lea rsi, [r13 + 0x90]
0x100350d83: lea rdi, [rbp - 0xb030]
0x100350d8a: mov r15, r9
0x100350d8d: vmovaps xmmword ptr [rbp - 0xb060], xmm4
0x100350d95: vmovaps xmmword ptr [rbp - 0xb070], xmm3
0x100350d9d: vmovaps xmmword ptr [rbp - 0xb0b0], xmm5
0x100350da5: call 0x10078ccc0 ; 0x10078ccc0
0x100350daa: vmovaps xmm5, xmmword ptr [rbp - 0xb0b0]
0x100350db2: vmovaps xmm3, xmmword ptr [rbp - 0xb070]
0x100350dba: vmovaps xmm4, xmmword ptr [rbp - 0xb060]
0x100350dc2: mov r11d, 1
0x100350dc8: vmovss xmm11, dword ptr [rip + 0x755cdc] ; 0x100aa6aac
0x100350dd0: vxorps xmm10, xmm10, xmm10
0x100350dd5: vmovss xmm9, dword ptr [rip + 0x7537db] ; 0x100aa45b8
0x100350ddd: vmovss xmm6, dword ptr [rip + 0x7542db] ; 0x100aa50c0
0x100350de5: vmovss xmm7, dword ptr [rip + 0x759dcb] ; 0x100aaabb8
0x100350ded: vmovaps xmm12, xmm7
0x100350df1: xor r10d, r10d
0x100350df4: vmovaps xmm8, xmmword ptr [rbp - 0xb110]
0x100350dfc: mov r9, r15
0x100350dff: mov r15, qword ptr [rbp - 0xb0d0]
0x100350e06: vmovaps xmm7, xmmword ptr [rbp - 0xb0a0]
0x100350e0e: mov edi, dword ptr [rbp + 0x10]
0x100350e11: mov r8, qword ptr [rbp - 0xb090]
0x100350e18: test al, al
0x100350e1a: je 0x100350f6f
0x100350e20: vmovss xmm0, dword ptr [r13 + 0x74]
0x100350e26: vucomiss xmm0, xmm10
0x100350e2b: jbe 0x100350eb9
0x100350e31: lea eax, [r12 + 1]
0x100350e36: mov ecx, r12d
0x100350e39: shl ecx, 0xd
0x100350e3c: xor ecx, r12d
0x100350e3f: mov edx, ecx
0x100350e41: imul edx, edx
0x100350e44: imul edx, edx, 0x3d73
0x100350e4a: add edx, 0xc0ae5
0x100350e50: imul edx, ecx
0x100350e53: add edx, 0x5208dd0d
0x100350e59: and edx, 0x7fffffff
0x100350e5f: vcvtsi2ss xmm1, xmm13, edx
0x100350e63: vmulss xmm1, xmm1, xmm12
0x100350e68: vsubss xmm1, xmm6, xmm1
0x100350e6c: vmulss xmm1, xmm1, xmm0
0x100350e70: vaddss xmm1, xmm4, xmm1
0x100350e74: vblendps xmm1, xmm5, xmm1, 1
0x100350e7a: mov ecx, eax
0x100350e7c: shl ecx, 0xd
0x100350e7f: xor ecx, eax
0x100350e81: mov eax, ecx
0x100350e83: imul eax, eax
0x100350e86: imul eax, eax, 0x3d73
0x100350e8c: add eax, 0xc0ae5
0x100350e91: imul eax, ecx
0x100350e94: add eax, 0x5208dd0d
0x100350e99: and eax, 0x7fffffff
0x100350e9e: vcvtsi2ss xmm2, xmm13, eax
0x100350ea2: vmulss xmm2, xmm2, xmm12
0x100350ea7: vsubss xmm2, xmm6, xmm2
0x100350eab: vmulss xmm0, xmm2, xmm0
0x100350eaf: vaddss xmm0, xmm3, xmm0
0x100350eb3: vinsertps xmm5, xmm1, xmm0, 0x20
0x100350eb9: vmovshdup xmm0, xmm5
0x100350ebd: vaddss xmm0, xmm0, xmm11
0x100350ec2: vbroadcastss xmm1, dword ptr [r8 + 0xc]
0x100350ec8: vaddss xmm2, xmm5, xmm1
0x100350ecc: vpermilpd xmm3, xmm5, 1
0x100350ed2: vinsertps xmm0, xmm5, xmm0, 0x10
0x100350ed8: vsubss xmm2, xmm2, xmm7
0x100350edc: vaddss xmm4, xmm1, xmm1
0x100350ee0: vdivss xmm2, xmm2, xmm4
0x100350ee4: vaddss xmm1, xmm3, xmm1
0x100350ee8: vsubss xmm1, xmm1, xmm8
0x100350eed: vdivss xmm1, xmm1, xmm4
0x100350ef1: vaddss xmm2, xmm2, xmm2
0x100350ef5: vcvttss2si eax, xmm2
0x100350ef9: test eax, eax
0x100350efb: cmovs eax, r10d
0x100350eff: cmp eax, 2
0x100350f02: cmovge eax, r11d
0x100350f06: vaddss xmm1, xmm1, xmm1
0x100350f0a: vcvttss2si ecx, xmm1
0x100350f0e: test ecx, ecx
0x100350f10: cmovs ecx, r10d
0x100350f14: cmp ecx, 2
0x100350f17: cmovge ecx, r11d
0x100350f1b: add ecx, ecx
0x100350f1d: or ecx, eax
0x100350f1f: mov eax, dword ptr [rbp + rcx*4 - 0xb040]
0x100350f26: lea edx, [rax + 1]
0x100350f29: mov dword ptr [rbp + rcx*4 - 0xb040], edx
0x100350f30: mov rdx, rcx
0x100350f33: shl rdx, 0xb
0x100350f37: lea rdx, [rbp + rdx - 0x2030]
0x100350f3f: mov qword ptr [rdx + rax*8], r13
0x100350f43: mov rdx, rcx
0x100350f46: shl rdx, 0xc
0x100350f4a: lea rdx, [rbp + rdx - 0x6030]
0x100350f52: shl rcx, 0xa
0x100350f56: lea rcx, [rbp + rcx - 0x7030]
0x100350f5e: mov dword ptr [rcx + rax*4], r14d
0x100350f62: shl rax, 4
0x100350f66: vmovaps xmmword ptr [rax + rdx], xmm0
0x100350f6b: vmovaps xmm5, xmm0
0x100350f6f: inc r14d
0x100350f72: cmp r14d, edi
0x100350f75: jne 0x100350ff0
0x100350f77: jmp 0x100351190 ; 0x100351190
0x100350f7c: nop dword ptr [rax]
0x100350f80: vpermilps xmm0, xmm4, 0
0x100350f86: vmulps xmm0, xmm0, xmmword ptr [r13 + 0xd0]
0x100350f8f: vmovaps xmm1, xmmword ptr [rbp - 0xb100]
0x100350f97: vmulps xmm1, xmm1, xmmword ptr [r13 + 0xe0]
0x100350fa0: vaddps xmm0, xmm0, xmm1
0x100350fa4: vpermilps xmm1, xmm3, 0
0x100350faa: vmulps xmm1, xmm1, xmmword ptr [r13 + 0xf0]
0x100350fb3: vaddps xmm0, xmm0, xmm1
0x100350fb7: vaddps xmm0, xmm0, xmmword ptr [r13 + 0x100]
0x100350fc0: vmulps xmm0, xmm0, xmm0
0x100350fc4: vmovshdup xmm1, xmm0
0x100350fc8: vaddss xmm1, xmm0, xmm1
0x100350fcc: vpermilpd xmm0, xmm0, 1
0x100350fd2: vaddss xmm0, xmm0, xmm1
0x100350fd6: vucomiss xmm6, xmm0
0x100350fda: jae 0x100350e20
0x100350fe0: jmp 0x100350f6f ; 0x100350f6f
0x100350fe2: nop word ptr cs:[rax + rax]
0x100350ff0: vmovaps xmm0, xmmword ptr [r8]
0x100350ff5: mov eax, dword ptr [rbp + 0x18]
0x100350ff8: lea eax, [r14 + rax]
0x100350ffc: lea ecx, [rax + rax]
0x100350fff: lea r12d, [rcx + rcx*4]
0x100351003: vpermilps xmm0, xmm0, 0xe7
0x100351009: shl eax, 0xe
0x10035100c: lea eax, [rax + rax*4]
0x10035100f: xor eax, r12d
0x100351012: or r12d, 1
0x100351016: mov ecx, eax
0x100351018: imul ecx, ecx
0x10035101b: imul ecx, ecx, 0x3d73
0x100351021: add ecx, 0xc0ae5
0x100351027: imul ecx, eax
0x10035102a: add ecx, 0x5208dd0d
0x100351030: and ecx, 0x7fffffff
0x100351036: vcvtsi2ss xmm1, xmm13, ecx
0x10035103a: vmulss xmm1, xmm1, xmm12
0x10035103f: vsubss xmm1, xmm6, xmm1
0x100351043: vaddss xmm1, xmm1, xmm6
0x100351047: vmulss xmm1, xmm1, xmm9
0x10035104c: vsubss xmm2, xmm1, xmm6
0x100351050: vmulss xmm2, xmm2, xmm0
0x100351054: vmulss xmm1, xmm1, xmm0
0x100351058: vaddss xmm1, xmm1, xmm2
0x10035105c: vaddss xmm4, xmm7, xmm1
0x100351060: vblendps xmm1, xmm5, xmm4, 1
0x100351066: lea ecx, [r12 + 1]
0x10035106b: mov eax, r12d
0x10035106e: shl eax, 0xd
0x100351071: xor eax, r12d
0x100351074: mov edx, eax
0x100351076: imul edx, edx
0x100351079: imul edx, edx, 0x3d73
0x10035107f: add edx, 0xc0ae5
0x100351085: imul edx, eax
0x100351088: add edx, 0x5208dd0d
0x10035108e: and edx, 0x7fffffff
0x100351094: vcvtsi2ss xmm2, xmm13, edx
0x100351098: vmulss xmm2, xmm2, xmm12
0x10035109d: vsubss xmm2, xmm6, xmm2
0x1003510a1: vaddss xmm2, xmm2, xmm6
0x1003510a5: vmulss xmm2, xmm2, xmm9
0x1003510aa: vsubss xmm3, xmm2, xmm6
0x1003510ae: vmulss xmm3, xmm3, xmm0
0x1003510b2: vmulss xmm0, xmm2, xmm0
0x1003510b6: vaddss xmm0, xmm0, xmm3
0x1003510ba: vaddss xmm3, xmm8, xmm0
0x1003510be: vinsertps xmm0, xmm1, xmm3, 0x20
0x1003510c4: movzx eax, byte ptr [rbx + 0xe]
0x1003510c8: cmp rax, 2
0x1003510cc: jb 0x100351140
0x1003510ce: add r12d, 2
0x1003510d2: mov edx, ecx
0x1003510d4: shl edx, 0xd
0x1003510d7: xor edx, ecx
0x1003510d9: mov ecx, edx
0x1003510db: imul ecx, ecx
0x1003510de: imul ecx, ecx, 0x3d73
0x1003510e4: add ecx, 0xc0ae5
0x1003510ea: imul ecx, edx
0x1003510ed: add ecx, 0x5208dd0d
0x1003510f3: and ecx, 0x7fffffff
0x1003510f9: vcvtsi2ss xmm1, xmm13, ecx
0x1003510fd: vmulss xmm1, xmm1, dword ptr [rip + 0x75d777] ; 0x100aae87c
0x100351105: vaddss xmm1, xmm1, xmm6
0x100351109: vaddss xmm1, xmm1, xmm6
0x10035110d: vmulss xmm1, xmm1, xmm9
0x100351112: vsubss xmm2, xmm6, xmm1
0x100351116: vmulss xmm2, xmm2, xmm10
0x10035111b: vaddss xmm1, xmm1, xmm2
0x10035111f: vmulss xmm1, xmm1, dword ptr [rbx]
0x100351123: vmovss xmm2, dword ptr [r9 + 0x70]
0x100351129: vucomiss xmm2, xmm1
0x10035112d: jbe 0x100351150
0x10035112f: mov r13, r9
0x100351132: jmp 0x100350d58 ; 0x100350d58
0x100351137: nop word ptr [rax + rax]
0x100351140: mov r13, r9
0x100351143: mov r12d, ecx
0x100351146: jmp 0x100350d58 ; 0x100350d58
0x10035114b: nop dword ptr [rax + rax]
0x100351150: mov ecx, 0xb
0x100351155: nop word ptr cs:[rax + rax]
0x100351160: movzx edx, byte ptr [rbx + rcx]
0x100351164: imul rdx, rdx, 0x110
0x10035116b: lea rsi, [rcx - 9]
0x10035116f: cmp rsi, rax
0x100351172: jae 0x100350d50
0x100351178: vaddss xmm2, xmm2, dword ptr [r15 + rdx + 0xf40]
0x100351182: inc rcx
0x100351185: vucomiss xmm2, xmm1
0x100351189: jbe 0x100351160
0x10035118b: jmp 0x100350d50 ; 0x100350d50
0x100351190: mov r14d, dword ptr [rbp - 0xb040]
0x100351197: mov r13d, dword ptr [rbp - 0xb03c]
0x10035119e: mov eax, dword ptr [rbp - 0xb038]
0x1003511a4: mov dword ptr [rbp - 0xb070], eax
0x1003511aa: mov eax, dword ptr [rbp - 0xb034]
0x1003511b0: mov dword ptr [rbp - 0xb060], eax
0x1003511b6: jmp 0x1003511d2 ; 0x1003511d2
0x1003511b8: mov dword ptr [rbp - 0xb060], 0
0x1003511c2: mov dword ptr [rbp - 0xb070], 0
0x1003511cc: xor r13d, r13d
0x1003511cf: xor r14d, r14d
0x1003511d2: mov rax, qword ptr [rip + 0x758077] ; 0x100aa9250
0x1003511d9: mov qword ptr [rbp - 0xb0c0], rax
0x1003511e0: mov dword ptr [rbp - 0xb0b8], 0
0x1003511ea: movabs rax, 0xffffff8f00000001
0x1003511f4: mov qword ptr [rbp - 0xb140], rax
0x1003511fb: mov byte ptr [rbp - 0xb138], 0
0x100351202: vxorps xmm0, xmm0, xmm0
0x100351206: vmovups xmmword ptr [rbp - 0xb130], xmm0
0x10035120e: lea rsi, [rbp - 0x6030]
0x100351215: lea r15, [rbp - 0xb0c0]
0x10035121c: vmovss xmm0, dword ptr [rip + 0x756698] ; 0x100aa78bc
0x100351224: lea rbx, [rbp - 0xb140]
0x10035122b: lea r9, [rbp - 0xb030]
0x100351232: mov r12, qword ptr [rbp - 0xb0c8]
0x100351239: mov rdi, r12
0x10035123c: mov rdx, r15
0x10035123f: mov ecx, r14d
0x100351242: mov r8, rbx
0x100351245: call 0x100776d20 ; 0x100776d20
0x10035124a: lea rsi, [rbp - 0x5030]
0x100351251: lea r9, [rbp - 0xa030]
0x100351258: mov rdi, r12
0x10035125b: mov rdx, r15
0x10035125e: vmovss xmm0, dword ptr [rip + 0x756656] ; 0x100aa78bc
0x100351266: mov ecx, r13d
0x100351269: mov r8, rbx
0x10035126c: call 0x100776d20 ; 0x100776d20
0x100351271: lea rsi, [rbp - 0x4030]
0x100351278: lea r9, [rbp - 0x9030]
0x10035127f: mov rdi, r12
0x100351282: mov rdx, r15
0x100351285: vmovss xmm0, dword ptr [rip + 0x75662f] ; 0x100aa78bc
0x10035128d: mov ecx, dword ptr [rbp - 0xb070]
0x100351293: mov r8, rbx
0x100351296: call 0x100776d20 ; 0x100776d20
0x10035129b: lea rsi, [rbp - 0x3030]
0x1003512a2: lea r9, [rbp - 0x8030]
0x1003512a9: mov rdi, r12
0x1003512ac: mov rdx, r15
0x1003512af: vmovss xmm0, dword ptr [rip + 0x756605] ; 0x100aa78bc
0x1003512b7: mov ecx, dword ptr [rbp - 0xb060]
0x1003512bd: mov r8, rbx
0x1003512c0: call 0x100776d20 ; 0x100776d20
0x1003512c5: neg byte ptr [rbp - 0xb041]
0x1003512cb: xor ecx, ecx
0x1003512cd: test r14d, r14d
0x1003512d0: jne 0x1003512fe
0x1003512d2: nop word ptr cs:[rax + rax]
0x1003512e0: lea rax, [rcx + 1]
0x1003512e4: cmp rax, 4
0x1003512e8: je 0x1003516f1
0x1003512ee: mov r14d, dword ptr [rbp + rcx*4 - 0xb03c]
0x1003512f6: mov rcx, rax
0x1003512f9: test r14d, r14d
0x1003512fc: je 0x1003512e0
0x1003512fe: xor r15d, r15d
0x100351301: mov qword ptr [rbp - 0xb070], rcx
0x100351308: nop dword ptr [rax + rax]
0x100351310: mov r15d, r15d
0x100351313: mov r12, rcx
0x100351316: shl r12, 0xc
0x10035131a: lea rbx, [rbp + r12 - 0xb030]
0x100351322: mov r13, r15
0x100351325: shl r13, 4
0x100351329: mov rdi, qword ptr [r13 + rbx + 8]
0x10035132e: test rdi, rdi
0x100351331: je 0x1003516e0
0x100351337: mov rax, qword ptr [rdi + 0x1d0]
0x10035133e: test rax, rax
0x100351341: je 0x1003516e0
0x100351347: test byte ptr [rax + 8], 1
0x10035134b: jne 0x1003516e0
0x100351351: mov rax, rcx
0x100351354: shl rax, 0xb
0x100351358: lea rax, [rbp + rax - 0x2030]
0x100351360: mov dword ptr [rbp - 0xb060], r14d
0x100351367: mov r14, qword ptr [rax + r15*8]
0x10035136b: mov esi, dword ptr [r13 + rbx + 4]
0x100351370: lea rdx, [rbp - 0xb042]
0x100351377: lea rcx, [rbp - 0xb0ec]
0x10035137e: call 0x100776640 ; 0x100776640
0x100351383: mov rcx, qword ptr [rbp - 0xb070]
0x10035138a: movzx eax, byte ptr [rbp - 0xb042]
0x100351391: mov qword ptr [rbp - 0xb0b0], r14
0x100351398: cmp al, byte ptr [r14 + 0x84]
0x10035139f: mov r14d, dword ptr [rbp - 0xb060]
0x1003513a6: jne 0x1003516e0
0x1003513ac: lea r14, [r13 + rbx + 8]
0x1003513b1: mov rax, rcx
0x1003513b4: shl rax, 0xa
0x1003513b8: lea rax, [rbp + rax - 0x7030]
0x1003513c0: mov eax, dword ptr [rax + r15*4]
0x1003513c4: mov qword ptr [rbp - 0xb0a0], rax
0x1003513cb: lea rax, [rbp + r12 - 0x6030]
0x1003513d3: vmovaps xmm1, xmmword ptr [r13 + rax]
0x1003513da: vmovaps xmmword ptr [rbp - 0xb090], xmm1
0x1003513e2: vmovss xmm0, dword ptr [r13 + rbx]
0x1003513e9: vmulss xmm0, xmm0, dword ptr [rbp - 0xb0bc]
0x1003513f1: vmovshdup xmm1, xmm1
0x1003513f5: vaddss xmm0, xmm1, xmm0
0x1003513f9: vmovss dword ptr [rbp - 0xb060], xmm0
0x100351401: mov rsi, qword ptr [r14]
0x100351404: mov edx, dword ptr [r14 - 4]
0x100351408: lea rdi, [rbp - 0xb120]
0x10035140f: call 0x100776100 ; 0x100776100
0x100351414: mov rdi, qword ptr [r14]
0x100351417: mov esi, dword ptr [r14 - 4]
0x10035141b: lea rdx, [rbp - 0xb0e8]
0x100351422: lea rcx, [rbp - 0xb160]
0x100351429: lea r8, [rbp - 0xb150]
0x100351430: call 0x1007766d0 ; 0x1007766d0
0x100351435: mov rsi, qword ptr [rbp - 0xb0a0]
0x10035143c: mov eax, dword ptr [rbp + 0x18]
0x10035143f: lea ecx, [rsi + rax]
0x100351442: lea eax, [rcx + rcx]
0x100351445: lea eax, [rax + rax*4]
0x100351448: shl ecx, 0xe
0x10035144b: lea ecx, [rcx + rcx*4]
0x10035144e: xor ecx, eax
0x100351450: or eax, 1
0x100351453: mov edx, ecx
0x100351455: imul edx, edx
0x100351458: imul edx, edx, 0x3d73
0x10035145e: add edx, 0xc0ae5
0x100351464: imul edx, ecx
0x100351467: add edx, 0x5208dd0d
0x10035146d: and edx, 0x7fffffff
0x100351473: vcvtsi2ss xmm0, xmm6, edx
0x100351477: vmovss xmm5, dword ptr [rip + 0x759739] ; 0x100aaabb8
0x10035147f: vmulss xmm0, xmm0, xmm5
0x100351483: vmovss xmm6, dword ptr [rip + 0x753c35] ; 0x100aa50c0
0x10035148b: vsubss xmm0, xmm6, xmm0
0x10035148f: vaddss xmm0, xmm0, xmm6
0x100351493: vmovss xmm7, dword ptr [rip + 0x75311d] ; 0x100aa45b8
0x10035149b: vmulss xmm0, xmm0, xmm7
0x10035149f: vsubss xmm1, xmm6, xmm0
0x1003514a3: vmulss xmm1, xmm1, dword ptr [rip + 0x755c39] ; 0x100aa70e4
0x1003514ab: vaddss xmm0, xmm0, xmm1
0x1003514af: vsubss xmm1, xmm6, xmm0
0x1003514b3: vpermilps xmm1, xmm1, 0xc0
0x1003514b9: mov rdi, qword ptr [rbp - 0xb0b0]
0x1003514c0: vmulps xmm1, xmm1, xmmword ptr [rdi + 0x40]
0x1003514c5: vpermilps xmm0, xmm0, 0xc0
0x1003514cb: vmulps xmm0, xmm0, xmmword ptr [rdi + 0x50]
0x1003514d0: vaddps xmm0, xmm0, xmm1
0x1003514d4: lea ecx, [rax + 1]
0x1003514d7: mov edx, eax
0x1003514d9: shl edx, 0xd
0x1003514dc: xor edx, eax
0x1003514de: mov eax, edx
0x1003514e0: imul eax, eax
0x1003514e3: imul eax, eax, 0x3d73
0x1003514e9: add eax, 0xc0ae5
0x1003514ee: imul eax, edx
0x1003514f1: add eax, 0x5208dd0d
0x1003514f6: and eax, 0x7fffffff
0x1003514fb: vcvtsi2ss xmm1, xmm8, eax
0x1003514ff: vmulss xmm1, xmm1, xmm5
0x100351503: vsubss xmm1, xmm6, xmm1
0x100351507: vaddss xmm1, xmm1, xmm6
0x10035150b: vmulss xmm1, xmm1, xmm7
0x10035150f: vsubss xmm2, xmm6, xmm1
0x100351513: vmovsd xmm3, qword ptr [rdi + 0x64]
0x100351518: mov eax, ecx
0x10035151a: shl eax, 0xd
0x10035151d: xor eax, ecx
0x10035151f: mov ecx, eax
0x100351521: imul ecx, ecx
0x100351524: imul ecx, ecx, 0x3d73
0x10035152a: add ecx, 0xc0ae5
0x100351530: imul ecx, eax
0x100351533: add ecx, 0x5208dd0d
0x100351539: and ecx, 0x7fffffff
0x10035153f: vcvtsi2ss xmm4, xmm4, ecx
0x100351543: vmulss xmm4, xmm4, xmm5
0x100351547: vsubss xmm4, xmm6, xmm4
0x10035154b: vaddss xmm4, xmm4, xmm6
0x10035154f: vmulss xmm4, xmm4, xmm7
0x100351553: vsubss xmm5, xmm6, xmm4
0x100351557: vinsertps xmm1, xmm1, xmm5, 0x10
0x10035155d: vmulps xmm1, xmm1, xmm3
0x100351561: vmovss xmm3, dword ptr [rdi + 0x60]
0x100351566: vinsertps xmm3, xmm3, dword ptr [rdi + 0x6c], 0x10
0x10035156d: vinsertps xmm2, xmm2, xmm4, 0x10
0x100351573: vmulps xmm2, xmm3, xmm2
0x100351577: vaddps xmm1, xmm1, xmm2
0x10035157b: mov rax, qword ptr [rbp - 0xb0d8]
0x100351582: mov rax, qword ptr [rax + rsi*8]
0x100351586: vmovaps xmm2, xmmword ptr [rbp - 0xb090]
0x10035158e: vmovss dword ptr [rax], xmm2
0x100351592: vmovss xmm3, dword ptr [rbp - 0xb060]
0x10035159a: vmovss dword ptr [rax + 4], xmm3
0x10035159f: vextractps dword ptr [rax + 8], xmm2, 2
0x1003515a6: vmovaps xmm2, xmmword ptr [rbp - 0xb120]
0x1003515ae: vxorps xmm3, xmm3, xmm3
0x1003515b2: vcmpleps xmm3, xmm3, xmm2
0x1003515b7: vmovaps xmm4, xmmword ptr [rip + 0x75fc71] ; 0x100ab1230
0x1003515bf: vmovaps xmm5, xmmword ptr [rip + 0x760569] ; 0x100ab1b30
0x1003515c7: vblendvps xmm3, xmm5, xmm4, xmm3
0x1003515cd: vmulps xmm2, xmm2, xmm3
0x1003515d1: vmaxps xmm3, xmm2, xmmword ptr [rip + 0x760567] ; 0x100ab1b40
0x1003515d9: vblendps xmm2, xmm3, xmm2, 8
0x1003515df: vminps xmm2, xmm2, xmm4
0x1003515e3: vcvttps2dq xmm2, xmm2
0x1003515e7: vpextrb byte ptr [rax + 0xc], xmm2, 0
0x1003515ee: vpextrb byte ptr [rax + 0xd], xmm2, 4
0x1003515f5: vpextrb byte ptr [rax + 0xe], xmm2, 8
0x1003515fc: cmp dword ptr [rdi + 0x80], 0
0x100351603: je 0x100351609
0x100351605: mov cl, 0x7f
0x100351607: jmp 0x10035160b ; 0x10035160b
0x100351609: xor ecx, ecx
0x10035160b: mov rdx, qword ptr [rbp - 0xb078]
0x100351612: mov byte ptr [rax + 0xf], cl
0x100351615: vmovaps xmm2, xmmword ptr [rip + 0x76b8d3] ; 0x100abcef0
0x10035161d: vmovaps xmm3, xmm2
0x100351621: vmulps xmm0, xmm0, xmm3
0x100351625: vmaxps xmm2, xmm0, xmmword ptr [rip + 0x752f73] ; 0x100aa45a0
0x10035162d: vblendps xmm0, xmm2, xmm0, 8
0x100351633: vminps xmm0, xmm0, xmm3
0x100351637: vcvttps2dq xmm0, xmm0
0x10035163b: vpextrb byte ptr [rax + 0x10], xmm0, 0
0x100351642: vpextrb byte ptr [rax + 0x11], xmm0, 4
0x100351649: vpextrb byte ptr [rax + 0x12], xmm0, 8
0x100351650: movzx ecx, byte ptr [rbp - 0xb041]
0x100351657: mov byte ptr [rax + 0x13], cl
0x10035165a: movzx ecx, byte ptr [rip + 0x9da607] ; 0x100d2bc68
0x100351661: mov byte ptr [rax + 0x14], cl
0x100351664: vmulss xmm0, xmm1, dword ptr [rip + 0x752f4c] ; 0x100aa45b8
0x10035166c: vmovshdup xmm2, xmm1
0x100351670: vaddss xmm0, xmm0, xmm2
0x100351674: vxorps xmm3, xmm3, xmm3
0x100351678: vmaxss xmm0, xmm3, xmm0
0x10035167c: vmovss xmm2, dword ptr [rip + 0x753a3c] ; 0x100aa50c0
0x100351684: vminss xmm0, xmm2, xmm0
0x100351688: vmovss xmm4, dword ptr [rip + 0x756634] ; 0x100aa7cc4
0x100351690: vmulss xmm0, xmm0, xmm4
0x100351694: vcvttss2si ecx, xmm0
0x100351698: mov byte ptr [rax + 0x15], cl
0x10035169b: vmaxss xmm0, xmm3, xmm1
0x10035169f: vminss xmm0, xmm2, xmm0
0x1003516a3: vmulss xmm0, xmm0, xmm4
0x1003516a7: vcvttss2si ecx, xmm0
0x1003516ab: mov byte ptr [rax + 0x16], cl
0x1003516ae: mov byte ptr [rax + 0x17], 0
0x1003516b2: mov ecx, dword ptr [rbp - 0xb0e8]
0x1003516b8: mov dword ptr [rax + 0x18], ecx
0x1003516bb: mov ecx, dword ptr [rbp - 0xb0e4]
0x1003516c1: mov dword ptr [rax + 0x1c], ecx
0x1003516c4: mov byte ptr [rdx + rsi], 1
0x1003516c8: mov rcx, qword ptr [rbp - 0xb070]
0x1003516cf: mov r14d, dword ptr [rbp + rcx*4 - 0xb040]
0x1003516d7: nop word ptr [rax + rax]
0x1003516e0: inc r15d
0x1003516e3: cmp r15d, r14d
0x1003516e6: jb 0x100351310
0x1003516ec: jmp 0x1003512e0 ; 0x1003512e0
0x1003516f1: mov rax, qword ptr [rip + 0x8bc1e0] ; 0x100c0d8d8
0x1003516f8: mov rax, qword ptr [rax]
0x1003516fb: cmp rax, qword ptr [rbp - 0x30]
0x1003516ff: jne 0x100351713
0x100351701: add rsp, 0xb138
0x100351708: pop rbx
0x100351709: pop r12
0x10035170b: pop r13
0x10035170d: pop r14
0x10035170f: pop r15
0x100351711: pop rbp
0x100351712: ret 
0x100351713: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100351718: nop dword ptr [rax + rax]
