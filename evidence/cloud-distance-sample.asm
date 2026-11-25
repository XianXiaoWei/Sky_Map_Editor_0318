0x100213dd0: push rbp
0x100213dd1: mov rbp, rsp
0x100213dd4: push r15
0x100213dd6: push r14
0x100213dd8: push rbx
0x100213dd9: sub rsp, 0x88
0x100213de0: mov rbx, rdi
0x100213de3: mov rax, qword ptr [rip + 0x9f9aee] ; 0x100c0d8d8
0x100213dea: mov rax, qword ptr [rax]
0x100213ded: mov qword ptr [rbp - 0x20], rax
0x100213df1: lea r8, [rbx + 0x2a0]
0x100213df8: mov r9d, dword ptr [rbx + 0x2c0]
0x100213dff: vcvtsi2sd xmm0, xmm0, r9
0x100213e04: vmovsd xmm1, qword ptr [rip + 0x89d55c] ; 0x100ab1368
0x100213e0c: vdivsd xmm0, xmm1, xmm0
0x100213e10: vcvtsd2ss xmm0, xmm0, xmm0
0x100213e14: lea rax, [rbp - 0x44]
0x100213e18: lea rdx, [rbp - 0x50]
0x100213e1c: lea rcx, [rbp - 0x5c]
0x100213e20: mov rdi, rsi
0x100213e23: mov rsi, rax
0x100213e26: call 0x100216670 ; 0x100216670
0x100213e2b: vmovss xmm0, dword ptr [rbp - 0x54]
0x100213e30: vmovss dword ptr [rbp - 0x98], xmm0
0x100213e38: vmovss xmm0, dword ptr [rbp - 0x5c]
0x100213e3d: vmovss dword ptr [rbp - 0x90], xmm0
0x100213e45: vmovss xmm0, dword ptr [rbp - 0x58]
0x100213e4a: vmovss dword ptr [rbp - 0x94], xmm0
0x100213e52: mov rax, qword ptr [rbp - 0x44]
0x100213e56: mov ecx, dword ptr [rbp - 0x3c]
0x100213e59: mov rdx, qword ptr [rbp - 0x50]
0x100213e5d: mov esi, dword ptr [rbp - 0x48]
0x100213e60: mov qword ptr [rbp - 0x2c], rdx
0x100213e64: mov dword ptr [rbp - 0x24], esi
0x100213e67: mov qword ptr [rbp - 0x38], rax
0x100213e6b: mov dword ptr [rbp - 0x30], ecx
0x100213e6e: lea r14, [rbx + 0x2ac]
0x100213e75: mov ecx, dword ptr [rbx + 0x2c0]
0x100213e7b: lea rdi, [rbp - 0x38]
0x100213e7f: lea rdx, [rbp - 0x2c]
0x100213e83: mov rsi, r14
0x100213e86: call 0x100216530 ; 0x100216530
0x100213e8b: vmovss xmm0, dword ptr [rip + 0x893a29] ; 0x100aa78bc
0x100213e93: vmovss dword ptr [rbp - 0x60], xmm0
0x100213e98: test al, al
0x100213e9a: je 0x100213f68
0x100213ea0: mov rdi, qword ptr [rbx + 0x2d8]
0x100213ea7: lea rsi, [rbp - 0x38]
0x100213eab: mov rdx, r14
0x100213eae: call 0x100216510 ; 0x100216510
0x100213eb3: test al, al
0x100213eb5: je 0x100213f09
0x100213eb7: mov r15, qword ptr [rbx + 0x2d0]
0x100213ebe: mov rdi, qword ptr [rbx + 0x2d8]
0x100213ec5: mov r8d, dword ptr [rbx + 0x2c0]
0x100213ecc: lea rsi, [rbp - 0x38]
0x100213ed0: lea rcx, [rbp - 0x2c]
0x100213ed4: mov rdx, r14
0x100213ed7: call 0x1002164b0 ; 0x1002164b0
0x100213edc: mov eax, eax
0x100213ede: movzx eax, byte ptr [r15 + rax]
0x100213ee3: vcvtsi2ss xmm0, xmm2, eax
0x100213ee7: vdivss xmm0, xmm0, dword ptr [rip + 0x893dd5] ; 0x100aa7cc4
0x100213eef: vcvtss2sd xmm0, xmm0, xmm0
0x100213ef3: vmulsd xmm0, xmm0, qword ptr [rip + 0x89d48d] ; 0x100ab1388
0x100213efb: vaddsd xmm0, xmm0, qword ptr [rip + 0x89d48d] ; 0x100ab1390
0x100213f03: vcvtsd2ss xmm0, xmm0, xmm0
0x100213f07: jmp 0x100213f68 ; 0x100213f68
0x100213f09: mov eax, dword ptr [rbx + 0x2b0]
0x100213f0f: imul eax, dword ptr [rbp - 0x30]
0x100213f13: add eax, dword ptr [rbp - 0x34]
0x100213f16: imul eax, dword ptr [rbx + 0x2ac]
0x100213f1d: add eax, dword ptr [rbp - 0x38]
0x100213f20: mov rcx, qword ptr [rbx + 0x2b8]
0x100213f27: movzx eax, byte ptr [rcx + rax]
0x100213f2b: vcvtsi2ss xmm0, xmm2, eax
0x100213f2f: vdivss xmm0, xmm0, dword ptr [rip + 0x893d8d] ; 0x100aa7cc4
0x100213f37: vcvtss2sd xmm0, xmm0, xmm0
0x100213f3b: vmulsd xmm0, xmm0, qword ptr [rip + 0x89d42d] ; 0x100ab1370
0x100213f43: vaddsd xmm0, xmm0, qword ptr [rip + 0x89d42d] ; 0x100ab1378
0x100213f4b: vcvtsd2ss xmm0, xmm0, xmm0
0x100213f4f: vxorpd xmm1, xmm1, xmm1
0x100213f53: xor eax, eax
0x100213f55: vucomiss xmm1, xmm0
0x100213f59: seta al
0x100213f5c: lea rcx, [rip + 0x89d41d] ; 0x100ab1380
0x100213f63: vmovss xmm0, dword ptr [rcx + rax*4]
0x100213f68: vmovss dword ptr [rbp - 0x8c], xmm0
0x100213f70: mov rax, qword ptr [rbp - 0x44]
0x100213f74: mov ecx, dword ptr [rbp - 0x3c]
0x100213f77: mov edx, dword ptr [rbp - 0x50]
0x100213f7a: inc edx
0x100213f7c: mov rsi, qword ptr [rbp - 0x4c]
0x100213f80: mov dword ptr [rbp - 0x2c], edx
0x100213f83: mov qword ptr [rbp - 0x28], rsi
0x100213f87: mov qword ptr [rbp - 0x38], rax
0x100213f8b: mov dword ptr [rbp - 0x30], ecx
0x100213f8e: mov ecx, dword ptr [rbx + 0x2c0]
0x100213f94: lea rdi, [rbp - 0x38]
0x100213f98: lea rdx, [rbp - 0x2c]
0x100213f9c: mov rsi, r14
0x100213f9f: call 0x100216530 ; 0x100216530
0x100213fa4: vmovss xmm0, dword ptr [rip + 0x893910] ; 0x100aa78bc
0x100213fac: test al, al
0x100213fae: je 0x10021407c
0x100213fb4: mov rdi, qword ptr [rbx + 0x2d8]
0x100213fbb: lea rsi, [rbp - 0x38]
0x100213fbf: mov rdx, r14
0x100213fc2: call 0x100216510 ; 0x100216510
0x100213fc7: test al, al
0x100213fc9: je 0x10021401d
0x100213fcb: mov r15, qword ptr [rbx + 0x2d0]
0x100213fd2: mov rdi, qword ptr [rbx + 0x2d8]
0x100213fd9: mov r8d, dword ptr [rbx + 0x2c0]
0x100213fe0: lea rsi, [rbp - 0x38]
0x100213fe4: lea rcx, [rbp - 0x2c]
0x100213fe8: mov rdx, r14
0x100213feb: call 0x1002164b0 ; 0x1002164b0
0x100213ff0: mov eax, eax
0x100213ff2: movzx eax, byte ptr [r15 + rax]
0x100213ff7: vcvtsi2ss xmm0, xmm2, eax
0x100213ffb: vdivss xmm0, xmm0, dword ptr [rip + 0x893cc1] ; 0x100aa7cc4
0x100214003: vcvtss2sd xmm0, xmm0, xmm0
0x100214007: vmulsd xmm0, xmm0, qword ptr [rip + 0x89d379] ; 0x100ab1388
0x10021400f: vaddsd xmm0, xmm0, qword ptr [rip + 0x89d379] ; 0x100ab1390
0x100214017: vcvtsd2ss xmm0, xmm0, xmm0
0x10021401b: jmp 0x10021407c ; 0x10021407c
0x10021401d: mov eax, dword ptr [rbx + 0x2b0]
0x100214023: imul eax, dword ptr [rbp - 0x30]
0x100214027: add eax, dword ptr [rbp - 0x34]
0x10021402a: imul eax, dword ptr [rbx + 0x2ac]
0x100214031: add eax, dword ptr [rbp - 0x38]
0x100214034: mov rcx, qword ptr [rbx + 0x2b8]
0x10021403b: movzx eax, byte ptr [rcx + rax]
0x10021403f: vcvtsi2ss xmm0, xmm2, eax
0x100214043: vdivss xmm0, xmm0, dword ptr [rip + 0x893c79] ; 0x100aa7cc4
0x10021404b: vcvtss2sd xmm0, xmm0, xmm0
0x10021404f: vmulsd xmm0, xmm0, qword ptr [rip + 0x89d319] ; 0x100ab1370
0x100214057: vaddsd xmm0, xmm0, qword ptr [rip + 0x89d319] ; 0x100ab1378
0x10021405f: vcvtsd2ss xmm0, xmm0, xmm0
0x100214063: vxorpd xmm1, xmm1, xmm1
0x100214067: xor eax, eax
0x100214069: vucomiss xmm1, xmm0
0x10021406d: seta al
0x100214070: lea rcx, [rip + 0x89d309] ; 0x100ab1380
0x100214077: vmovss xmm0, dword ptr [rcx + rax*4]
0x10021407c: vmovss dword ptr [rbp - 0x88], xmm0
0x100214084: vmovss xmm0, dword ptr [rbp - 0x5c]
0x100214089: vmovss dword ptr [rbp - 0x84], xmm0
0x100214091: mov rax, qword ptr [rbp - 0x44]
0x100214095: mov ecx, dword ptr [rbp - 0x3c]
0x100214098: mov edx, dword ptr [rbp - 0x50]
0x10021409b: mov esi, dword ptr [rbp - 0x4c]
0x10021409e: inc esi
0x1002140a0: mov edi, dword ptr [rbp - 0x48]
0x1002140a3: mov dword ptr [rbp - 0x2c], edx
0x1002140a6: mov dword ptr [rbp - 0x28], esi
0x1002140a9: mov dword ptr [rbp - 0x24], edi
0x1002140ac: mov qword ptr [rbp - 0x38], rax
0x1002140b0: mov dword ptr [rbp - 0x30], ecx
0x1002140b3: mov ecx, dword ptr [rbx + 0x2c0]
0x1002140b9: lea rdi, [rbp - 0x38]
0x1002140bd: lea rdx, [rbp - 0x2c]
0x1002140c1: mov rsi, r14
0x1002140c4: call 0x100216530 ; 0x100216530
0x1002140c9: vmovss xmm0, dword ptr [rip + 0x8937eb] ; 0x100aa78bc
0x1002140d1: test al, al
0x1002140d3: je 0x1002141a1
0x1002140d9: mov rdi, qword ptr [rbx + 0x2d8]
0x1002140e0: lea rsi, [rbp - 0x38]
0x1002140e4: mov rdx, r14
0x1002140e7: call 0x100216510 ; 0x100216510
0x1002140ec: test al, al
0x1002140ee: je 0x100214142
0x1002140f0: mov r15, qword ptr [rbx + 0x2d0]
0x1002140f7: mov rdi, qword ptr [rbx + 0x2d8]
0x1002140fe: mov r8d, dword ptr [rbx + 0x2c0]
0x100214105: lea rsi, [rbp - 0x38]
0x100214109: lea rcx, [rbp - 0x2c]
0x10021410d: mov rdx, r14
0x100214110: call 0x1002164b0 ; 0x1002164b0
0x100214115: mov eax, eax
0x100214117: movzx eax, byte ptr [r15 + rax]
0x10021411c: vcvtsi2ss xmm0, xmm2, eax
0x100214120: vdivss xmm0, xmm0, dword ptr [rip + 0x893b9c] ; 0x100aa7cc4
0x100214128: vcvtss2sd xmm0, xmm0, xmm0
0x10021412c: vmulsd xmm0, xmm0, qword ptr [rip + 0x89d254] ; 0x100ab1388
0x100214134: vaddsd xmm0, xmm0, qword ptr [rip + 0x89d254] ; 0x100ab1390
0x10021413c: vcvtsd2ss xmm0, xmm0, xmm0
0x100214140: jmp 0x1002141a1 ; 0x1002141a1
0x100214142: mov eax, dword ptr [rbx + 0x2b0]
0x100214148: imul eax, dword ptr [rbp - 0x30]
0x10021414c: add eax, dword ptr [rbp - 0x34]
0x10021414f: imul eax, dword ptr [rbx + 0x2ac]
0x100214156: add eax, dword ptr [rbp - 0x38]
0x100214159: mov rcx, qword ptr [rbx + 0x2b8]
0x100214160: movzx eax, byte ptr [rcx + rax]
0x100214164: vcvtsi2ss xmm0, xmm2, eax
0x100214168: vdivss xmm0, xmm0, dword ptr [rip + 0x893b54] ; 0x100aa7cc4
0x100214170: vcvtss2sd xmm0, xmm0, xmm0
0x100214174: vmulsd xmm0, xmm0, qword ptr [rip + 0x89d1f4] ; 0x100ab1370
0x10021417c: vaddsd xmm0, xmm0, qword ptr [rip + 0x89d1f4] ; 0x100ab1378
0x100214184: vcvtsd2ss xmm0, xmm0, xmm0
0x100214188: vxorpd xmm1, xmm1, xmm1
0x10021418c: xor eax, eax
0x10021418e: vucomiss xmm1, xmm0
0x100214192: seta al
0x100214195: lea rcx, [rip + 0x89d1e4] ; 0x100ab1380
0x10021419c: vmovss xmm0, dword ptr [rcx + rax*4]
0x1002141a1: vmovss dword ptr [rbp - 0x80], xmm0
0x1002141a6: mov rax, qword ptr [rbp - 0x44]
0x1002141aa: mov ecx, dword ptr [rbp - 0x3c]
0x1002141ad: mov edx, dword ptr [rbp - 0x50]
0x1002141b0: mov esi, dword ptr [rbp - 0x4c]
0x1002141b3: inc edx
0x1002141b5: inc esi
0x1002141b7: mov edi, dword ptr [rbp - 0x48]
0x1002141ba: mov dword ptr [rbp - 0x2c], edx
0x1002141bd: mov dword ptr [rbp - 0x28], esi
0x1002141c0: mov dword ptr [rbp - 0x24], edi
0x1002141c3: mov qword ptr [rbp - 0x38], rax
0x1002141c7: mov dword ptr [rbp - 0x30], ecx
0x1002141ca: mov ecx, dword ptr [rbx + 0x2c0]
0x1002141d0: lea rdi, [rbp - 0x38]
0x1002141d4: lea rdx, [rbp - 0x2c]
0x1002141d8: mov rsi, r14
0x1002141db: call 0x100216530 ; 0x100216530
0x1002141e0: vmovss xmm0, dword ptr [rip + 0x8936d4] ; 0x100aa78bc
0x1002141e8: test al, al
0x1002141ea: je 0x1002142b8
0x1002141f0: mov rdi, qword ptr [rbx + 0x2d8]
0x1002141f7: lea rsi, [rbp - 0x38]
0x1002141fb: mov rdx, r14
0x1002141fe: call 0x100216510 ; 0x100216510
0x100214203: test al, al
0x100214205: je 0x100214259
0x100214207: mov r15, qword ptr [rbx + 0x2d0]
0x10021420e: mov rdi, qword ptr [rbx + 0x2d8]
0x100214215: mov r8d, dword ptr [rbx + 0x2c0]
0x10021421c: lea rsi, [rbp - 0x38]
0x100214220: lea rcx, [rbp - 0x2c]
0x100214224: mov rdx, r14
0x100214227: call 0x1002164b0 ; 0x1002164b0
0x10021422c: mov eax, eax
0x10021422e: movzx eax, byte ptr [r15 + rax]
0x100214233: vcvtsi2ss xmm0, xmm2, eax
0x100214237: vdivss xmm0, xmm0, dword ptr [rip + 0x893a85] ; 0x100aa7cc4
0x10021423f: vcvtss2sd xmm0, xmm0, xmm0
0x100214243: vmulsd xmm0, xmm0, qword ptr [rip + 0x89d13d] ; 0x100ab1388
0x10021424b: vaddsd xmm0, xmm0, qword ptr [rip + 0x89d13d] ; 0x100ab1390
0x100214253: vcvtsd2ss xmm0, xmm0, xmm0
0x100214257: jmp 0x1002142b8 ; 0x1002142b8
0x100214259: mov eax, dword ptr [rbx + 0x2b0]
0x10021425f: imul eax, dword ptr [rbp - 0x30]
0x100214263: add eax, dword ptr [rbp - 0x34]
0x100214266: imul eax, dword ptr [rbx + 0x2ac]
0x10021426d: add eax, dword ptr [rbp - 0x38]
0x100214270: mov rcx, qword ptr [rbx + 0x2b8]
0x100214277: movzx eax, byte ptr [rcx + rax]
0x10021427b: vcvtsi2ss xmm0, xmm2, eax
0x10021427f: vdivss xmm0, xmm0, dword ptr [rip + 0x893a3d] ; 0x100aa7cc4
0x100214287: vcvtss2sd xmm0, xmm0, xmm0
0x10021428b: vmulsd xmm0, xmm0, qword ptr [rip + 0x89d0dd] ; 0x100ab1370
0x100214293: vaddsd xmm0, xmm0, qword ptr [rip + 0x89d0dd] ; 0x100ab1378
0x10021429b: vcvtsd2ss xmm0, xmm0, xmm0
0x10021429f: vxorpd xmm1, xmm1, xmm1
0x1002142a3: xor eax, eax
0x1002142a5: vucomiss xmm1, xmm0
0x1002142a9: seta al
0x1002142ac: lea rcx, [rip + 0x89d0cd] ; 0x100ab1380
0x1002142b3: vmovss xmm0, dword ptr [rcx + rax*4]
0x1002142b8: vmovss dword ptr [rbp - 0x78], xmm0
0x1002142bd: vmovss xmm0, dword ptr [rbp - 0x5c]
0x1002142c2: vmovss dword ptr [rbp - 0x74], xmm0
0x1002142c7: vmovss xmm0, dword ptr [rbp - 0x58]
0x1002142cc: vmovss dword ptr [rbp - 0x7c], xmm0
0x1002142d1: mov rax, qword ptr [rbp - 0x44]
0x1002142d5: mov ecx, dword ptr [rbp - 0x3c]
0x1002142d8: mov rdx, qword ptr [rbp - 0x50]
0x1002142dc: mov esi, dword ptr [rbp - 0x48]
0x1002142df: inc esi
0x1002142e1: mov qword ptr [rbp - 0x2c], rdx
0x1002142e5: mov dword ptr [rbp - 0x24], esi
0x1002142e8: mov qword ptr [rbp - 0x38], rax
0x1002142ec: mov dword ptr [rbp - 0x30], ecx
0x1002142ef: mov ecx, dword ptr [rbx + 0x2c0]
0x1002142f5: lea rdi, [rbp - 0x38]
0x1002142f9: lea rdx, [rbp - 0x2c]
0x1002142fd: mov rsi, r14
0x100214300: call 0x100216530 ; 0x100216530
0x100214305: vmovss xmm0, dword ptr [rip + 0x8935af] ; 0x100aa78bc
0x10021430d: test al, al
0x10021430f: je 0x1002143dd
0x100214315: mov rdi, qword ptr [rbx + 0x2d8]
0x10021431c: lea rsi, [rbp - 0x38]
0x100214320: mov rdx, r14
0x100214323: call 0x100216510 ; 0x100216510
0x100214328: test al, al
0x10021432a: je 0x10021437e
0x10021432c: mov r15, qword ptr [rbx + 0x2d0]
0x100214333: mov rdi, qword ptr [rbx + 0x2d8]
0x10021433a: mov r8d, dword ptr [rbx + 0x2c0]
0x100214341: lea rsi, [rbp - 0x38]
0x100214345: lea rcx, [rbp - 0x2c]
0x100214349: mov rdx, r14
0x10021434c: call 0x1002164b0 ; 0x1002164b0
0x100214351: mov eax, eax
0x100214353: movzx eax, byte ptr [r15 + rax]
0x100214358: vcvtsi2ss xmm0, xmm2, eax
0x10021435c: vdivss xmm0, xmm0, dword ptr [rip + 0x893960] ; 0x100aa7cc4
0x100214364: vcvtss2sd xmm0, xmm0, xmm0
0x100214368: vmulsd xmm0, xmm0, qword ptr [rip + 0x89d018] ; 0x100ab1388
0x100214370: vaddsd xmm0, xmm0, qword ptr [rip + 0x89d018] ; 0x100ab1390
0x100214378: vcvtsd2ss xmm0, xmm0, xmm0
0x10021437c: jmp 0x1002143dd ; 0x1002143dd
0x10021437e: mov eax, dword ptr [rbx + 0x2b0]
0x100214384: imul eax, dword ptr [rbp - 0x30]
0x100214388: add eax, dword ptr [rbp - 0x34]
0x10021438b: imul eax, dword ptr [rbx + 0x2ac]
0x100214392: add eax, dword ptr [rbp - 0x38]
0x100214395: mov rcx, qword ptr [rbx + 0x2b8]
0x10021439c: movzx eax, byte ptr [rcx + rax]
0x1002143a0: vcvtsi2ss xmm0, xmm2, eax
0x1002143a4: vdivss xmm0, xmm0, dword ptr [rip + 0x893918] ; 0x100aa7cc4
0x1002143ac: vcvtss2sd xmm0, xmm0, xmm0
0x1002143b0: vmulsd xmm0, xmm0, qword ptr [rip + 0x89cfb8] ; 0x100ab1370
0x1002143b8: vaddsd xmm0, xmm0, qword ptr [rip + 0x89cfb8] ; 0x100ab1378
0x1002143c0: vcvtsd2ss xmm0, xmm0, xmm0
0x1002143c4: vxorpd xmm1, xmm1, xmm1
0x1002143c8: xor eax, eax
0x1002143ca: vucomiss xmm1, xmm0
0x1002143ce: seta al
0x1002143d1: lea rcx, [rip + 0x89cfa8] ; 0x100ab1380
0x1002143d8: vmovss xmm0, dword ptr [rcx + rax*4]
0x1002143dd: vmovss dword ptr [rbp - 0x70], xmm0
0x1002143e2: mov rax, qword ptr [rbp - 0x44]
0x1002143e6: mov ecx, dword ptr [rbp - 0x3c]
0x1002143e9: mov edx, dword ptr [rbp - 0x50]
0x1002143ec: mov esi, dword ptr [rbp - 0x4c]
0x1002143ef: inc edx
0x1002143f1: mov edi, dword ptr [rbp - 0x48]
0x1002143f4: inc edi
0x1002143f6: mov dword ptr [rbp - 0x2c], edx
0x1002143f9: mov dword ptr [rbp - 0x28], esi
0x1002143fc: mov dword ptr [rbp - 0x24], edi
0x1002143ff: mov qword ptr [rbp - 0x38], rax
0x100214403: mov dword ptr [rbp - 0x30], ecx
0x100214406: mov ecx, dword ptr [rbx + 0x2c0]
0x10021440c: lea rdi, [rbp - 0x38]
0x100214410: lea rdx, [rbp - 0x2c]
0x100214414: mov rsi, r14
0x100214417: call 0x100216530 ; 0x100216530
0x10021441c: vmovss xmm0, dword ptr [rip + 0x893498] ; 0x100aa78bc
0x100214424: test al, al
0x100214426: je 0x1002144f4
0x10021442c: mov rdi, qword ptr [rbx + 0x2d8]
0x100214433: lea rsi, [rbp - 0x38]
0x100214437: mov rdx, r14
0x10021443a: call 0x100216510 ; 0x100216510
0x10021443f: test al, al
0x100214441: je 0x100214495
0x100214443: mov r15, qword ptr [rbx + 0x2d0]
0x10021444a: mov rdi, qword ptr [rbx + 0x2d8]
0x100214451: mov r8d, dword ptr [rbx + 0x2c0]
0x100214458: lea rsi, [rbp - 0x38]
0x10021445c: lea rcx, [rbp - 0x2c]
0x100214460: mov rdx, r14
0x100214463: call 0x1002164b0 ; 0x1002164b0
0x100214468: mov eax, eax
0x10021446a: movzx eax, byte ptr [r15 + rax]
0x10021446f: vcvtsi2ss xmm0, xmm2, eax
0x100214473: vdivss xmm0, xmm0, dword ptr [rip + 0x893849] ; 0x100aa7cc4
0x10021447b: vcvtss2sd xmm0, xmm0, xmm0
0x10021447f: vmulsd xmm0, xmm0, qword ptr [rip + 0x89cf01] ; 0x100ab1388
0x100214487: vaddsd xmm0, xmm0, qword ptr [rip + 0x89cf01] ; 0x100ab1390
0x10021448f: vcvtsd2ss xmm0, xmm0, xmm0
0x100214493: jmp 0x1002144f4 ; 0x1002144f4
0x100214495: mov eax, dword ptr [rbx + 0x2b0]
0x10021449b: imul eax, dword ptr [rbp - 0x30]
0x10021449f: add eax, dword ptr [rbp - 0x34]
0x1002144a2: imul eax, dword ptr [rbx + 0x2ac]
0x1002144a9: add eax, dword ptr [rbp - 0x38]
0x1002144ac: mov rcx, qword ptr [rbx + 0x2b8]
0x1002144b3: movzx eax, byte ptr [rcx + rax]
0x1002144b7: vcvtsi2ss xmm0, xmm2, eax
0x1002144bb: vdivss xmm0, xmm0, dword ptr [rip + 0x893801] ; 0x100aa7cc4
0x1002144c3: vcvtss2sd xmm0, xmm0, xmm0
0x1002144c7: vmulsd xmm0, xmm0, qword ptr [rip + 0x89cea1] ; 0x100ab1370
0x1002144cf: vaddsd xmm0, xmm0, qword ptr [rip + 0x89cea1] ; 0x100ab1378
0x1002144d7: vcvtsd2ss xmm0, xmm0, xmm0
0x1002144db: vxorpd xmm1, xmm1, xmm1
0x1002144df: xor eax, eax
0x1002144e1: vucomiss xmm1, xmm0
0x1002144e5: seta al
0x1002144e8: lea rcx, [rip + 0x89ce91] ; 0x100ab1380
0x1002144ef: vmovss xmm0, dword ptr [rcx + rax*4]
0x1002144f4: vmovss dword ptr [rbp - 0x6c], xmm0
0x1002144f9: vmovss xmm0, dword ptr [rbp - 0x5c]
0x1002144fe: vmovss dword ptr [rbp - 0x68], xmm0
0x100214503: mov rax, qword ptr [rbp - 0x44]
0x100214507: mov ecx, dword ptr [rbp - 0x3c]
0x10021450a: mov edx, dword ptr [rbp - 0x50]
0x10021450d: mov esi, dword ptr [rbp - 0x4c]
0x100214510: inc esi
0x100214512: mov edi, dword ptr [rbp - 0x48]
0x100214515: inc edi
0x100214517: mov dword ptr [rbp - 0x2c], edx
0x10021451a: mov dword ptr [rbp - 0x28], esi
0x10021451d: mov dword ptr [rbp - 0x24], edi
0x100214520: mov qword ptr [rbp - 0x38], rax
0x100214524: mov dword ptr [rbp - 0x30], ecx
0x100214527: mov ecx, dword ptr [rbx + 0x2c0]
0x10021452d: lea rdi, [rbp - 0x38]
0x100214531: lea rdx, [rbp - 0x2c]
0x100214535: mov rsi, r14
0x100214538: call 0x100216530 ; 0x100216530
0x10021453d: vmovss xmm0, dword ptr [rip + 0x893377] ; 0x100aa78bc
0x100214545: test al, al
0x100214547: je 0x100214615
0x10021454d: mov rdi, qword ptr [rbx + 0x2d8]
0x100214554: lea rsi, [rbp - 0x38]
0x100214558: mov rdx, r14
0x10021455b: call 0x100216510 ; 0x100216510
0x100214560: test al, al
0x100214562: je 0x1002145b6
0x100214564: mov r15, qword ptr [rbx + 0x2d0]
0x10021456b: mov rdi, qword ptr [rbx + 0x2d8]
0x100214572: mov r8d, dword ptr [rbx + 0x2c0]
0x100214579: lea rsi, [rbp - 0x38]
0x10021457d: lea rcx, [rbp - 0x2c]
0x100214581: mov rdx, r14
0x100214584: call 0x1002164b0 ; 0x1002164b0
0x100214589: mov eax, eax
0x10021458b: movzx eax, byte ptr [r15 + rax]
0x100214590: vcvtsi2ss xmm0, xmm2, eax
0x100214594: vdivss xmm0, xmm0, dword ptr [rip + 0x893728] ; 0x100aa7cc4
0x10021459c: vcvtss2sd xmm0, xmm0, xmm0
0x1002145a0: vmulsd xmm0, xmm0, qword ptr [rip + 0x89cde0] ; 0x100ab1388
0x1002145a8: vaddsd xmm0, xmm0, qword ptr [rip + 0x89cde0] ; 0x100ab1390
0x1002145b0: vcvtsd2ss xmm0, xmm0, xmm0
0x1002145b4: jmp 0x100214615 ; 0x100214615
0x1002145b6: mov eax, dword ptr [rbx + 0x2b0]
0x1002145bc: imul eax, dword ptr [rbp - 0x30]
0x1002145c0: add eax, dword ptr [rbp - 0x34]
0x1002145c3: imul eax, dword ptr [rbx + 0x2ac]
0x1002145ca: add eax, dword ptr [rbp - 0x38]
0x1002145cd: mov rcx, qword ptr [rbx + 0x2b8]
0x1002145d4: movzx eax, byte ptr [rcx + rax]
0x1002145d8: vcvtsi2ss xmm0, xmm2, eax
0x1002145dc: vdivss xmm0, xmm0, dword ptr [rip + 0x8936e0] ; 0x100aa7cc4
0x1002145e4: vcvtss2sd xmm0, xmm0, xmm0
0x1002145e8: vmulsd xmm0, xmm0, qword ptr [rip + 0x89cd80] ; 0x100ab1370
0x1002145f0: vaddsd xmm0, xmm0, qword ptr [rip + 0x89cd80] ; 0x100ab1378
0x1002145f8: vcvtsd2ss xmm0, xmm0, xmm0
0x1002145fc: vxorpd xmm1, xmm1, xmm1
0x100214600: xor eax, eax
0x100214602: vucomiss xmm1, xmm0
0x100214606: seta al
0x100214609: lea rcx, [rip + 0x89cd70] ; 0x100ab1380
0x100214610: vmovss xmm0, dword ptr [rcx + rax*4]
0x100214615: vmovss dword ptr [rbp - 0x64], xmm0
0x10021461a: mov rax, qword ptr [rbp - 0x44]
0x10021461e: mov ecx, dword ptr [rbp - 0x3c]
0x100214621: mov edx, dword ptr [rbp - 0x50]
0x100214624: mov esi, dword ptr [rbp - 0x4c]
0x100214627: inc edx
0x100214629: inc esi
0x10021462b: mov edi, dword ptr [rbp - 0x48]
0x10021462e: inc edi
0x100214630: mov dword ptr [rbp - 0x2c], edx
0x100214633: mov dword ptr [rbp - 0x28], esi
0x100214636: mov dword ptr [rbp - 0x24], edi
0x100214639: mov qword ptr [rbp - 0x38], rax
0x10021463d: mov dword ptr [rbp - 0x30], ecx
0x100214640: mov ecx, dword ptr [rbx + 0x2c0]
0x100214646: lea rdi, [rbp - 0x38]
0x10021464a: lea rdx, [rbp - 0x2c]
0x10021464e: mov rsi, r14
0x100214651: call 0x100216530 ; 0x100216530
0x100214656: test al, al
0x100214658: je 0x10021472b
0x10021465e: mov rdi, qword ptr [rbx + 0x2d8]
0x100214665: lea rsi, [rbp - 0x38]
0x100214669: mov rdx, r14
0x10021466c: call 0x100216510 ; 0x100216510
0x100214671: test al, al
0x100214673: je 0x1002146c7
0x100214675: mov r15, qword ptr [rbx + 0x2d0]
0x10021467c: mov rdi, qword ptr [rbx + 0x2d8]
0x100214683: mov r8d, dword ptr [rbx + 0x2c0]
0x10021468a: lea rsi, [rbp - 0x38]
0x10021468e: lea rcx, [rbp - 0x2c]
0x100214692: mov rdx, r14
0x100214695: call 0x1002164b0 ; 0x1002164b0
0x10021469a: mov eax, eax
0x10021469c: movzx eax, byte ptr [r15 + rax]
0x1002146a1: vcvtsi2ss xmm0, xmm2, eax
0x1002146a5: vdivss xmm0, xmm0, dword ptr [rip + 0x893617] ; 0x100aa7cc4
0x1002146ad: vcvtss2sd xmm0, xmm0, xmm0
0x1002146b1: vmulsd xmm0, xmm0, qword ptr [rip + 0x89cccf] ; 0x100ab1388
0x1002146b9: vaddsd xmm0, xmm0, qword ptr [rip + 0x89cccf] ; 0x100ab1390
0x1002146c1: vcvtsd2ss xmm0, xmm0, xmm0
0x1002146c5: jmp 0x100214726 ; 0x100214726
0x1002146c7: mov eax, dword ptr [rbx + 0x2b0]
0x1002146cd: imul eax, dword ptr [rbp - 0x30]
0x1002146d1: add eax, dword ptr [rbp - 0x34]
0x1002146d4: imul eax, dword ptr [rbx + 0x2ac]
0x1002146db: add eax, dword ptr [rbp - 0x38]
0x1002146de: mov rcx, qword ptr [rbx + 0x2b8]
0x1002146e5: movzx eax, byte ptr [rcx + rax]
0x1002146e9: vcvtsi2ss xmm0, xmm2, eax
0x1002146ed: vdivss xmm0, xmm0, dword ptr [rip + 0x8935cf] ; 0x100aa7cc4
0x1002146f5: vcvtss2sd xmm0, xmm0, xmm0
0x1002146f9: vmulsd xmm0, xmm0, qword ptr [rip + 0x89cc6f] ; 0x100ab1370
0x100214701: vaddsd xmm0, xmm0, qword ptr [rip + 0x89cc6f] ; 0x100ab1378
0x100214709: vcvtsd2ss xmm0, xmm0, xmm0
0x10021470d: vxorpd xmm1, xmm1, xmm1
0x100214711: xor eax, eax
0x100214713: vucomiss xmm1, xmm0
0x100214717: seta al
0x10021471a: lea rcx, [rip + 0x89cc5f] ; 0x100ab1380
0x100214721: vmovss xmm0, dword ptr [rcx + rax*4]
0x100214726: vmovss dword ptr [rbp - 0x60], xmm0
0x10021472b: mov rax, qword ptr [rip + 0x9f91a6] ; 0x100c0d8d8
0x100214732: mov rax, qword ptr [rax]
0x100214735: cmp rax, qword ptr [rbp - 0x20]
0x100214739: jne 0x100214802
0x10021473f: vmovss xmm0, dword ptr [rip + 0x890979] ; 0x100aa50c0
0x100214747: vmovss xmm3, dword ptr [rbp - 0x90]
0x10021474f: vsubss xmm1, xmm0, xmm3
0x100214753: vmulss xmm1, xmm1, dword ptr [rbp - 0x8c]
0x10021475b: vmovss xmm4, dword ptr [rbp - 0x84]
0x100214763: vsubss xmm2, xmm0, xmm4
0x100214767: vmulss xmm2, xmm2, dword ptr [rbp - 0x80]
0x10021476c: vmulss xmm3, xmm3, dword ptr [rbp - 0x88]
0x100214774: vaddss xmm1, xmm1, xmm3
0x100214778: vmulss xmm3, xmm4, dword ptr [rbp - 0x78]
0x10021477d: vaddss xmm2, xmm2, xmm3
0x100214781: vmovss xmm4, dword ptr [rbp - 0x94]
0x100214789: vsubss xmm3, xmm0, xmm4
0x10021478d: vmulss xmm1, xmm3, xmm1
0x100214791: vmovss xmm5, dword ptr [rbp - 0x74]
0x100214796: vsubss xmm3, xmm0, xmm5
0x10021479a: vmulss xmm3, xmm3, dword ptr [rbp - 0x70]
0x10021479f: vmulss xmm2, xmm4, xmm2
0x1002147a3: vaddss xmm1, xmm1, xmm2
0x1002147a7: vmulss xmm2, xmm5, dword ptr [rbp - 0x6c]
0x1002147ac: vaddss xmm2, xmm3, xmm2
0x1002147b0: vmovss xmm4, dword ptr [rbp - 0x68]
0x1002147b5: vsubss xmm3, xmm0, xmm4
0x1002147b9: vmulss xmm3, xmm3, dword ptr [rbp - 0x64]
0x1002147be: vmulss xmm4, xmm4, dword ptr [rbp - 0x60]
0x1002147c3: vaddss xmm3, xmm3, xmm4
0x1002147c7: vmovss xmm5, dword ptr [rbp - 0x7c]
0x1002147cc: vsubss xmm4, xmm0, xmm5
0x1002147d0: vmulss xmm2, xmm4, xmm2
0x1002147d4: vmulss xmm3, xmm5, xmm3
0x1002147d8: vaddss xmm2, xmm2, xmm3
0x1002147dc: vmovss xmm3, dword ptr [rbp - 0x98]
0x1002147e4: vsubss xmm0, xmm0, xmm3
0x1002147e8: vmulss xmm0, xmm0, xmm1
0x1002147ec: vmulss xmm1, xmm3, xmm2
0x1002147f0: vaddss xmm0, xmm0, xmm1
0x1002147f4: add rsp, 0x88
0x1002147fb: pop rbx
0x1002147fc: pop r14
0x1002147fe: pop r15
0x100214800: pop rbp
0x100214801: ret 
0x100214802: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100214807: nop word ptr [rax + rax]
