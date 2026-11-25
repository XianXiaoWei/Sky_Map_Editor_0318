0x10005cb80: push rbp
0x10005cb81: mov rbp, rsp
0x10005cb84: push r15
0x10005cb86: push r14
0x10005cb88: push r13
0x10005cb8a: push r12
0x10005cb8c: push rbx
0x10005cb8d: sub rsp, 0x238
0x10005cb94: vxorps ymm0, ymm0, ymm0
0x10005cb98: vmovups ymmword ptr [rdi + 0x8a8], ymm0
0x10005cba0: vmovups ymmword ptr [rdi + 0x8f4], ymm0
0x10005cba8: vmovups ymmword ptr [rdi + 0x8e8], ymm0
0x10005cbb0: vmovups ymmword ptr [rdi + 0x8c8], ymm0
0x10005cbb8: movabs rax, 0x3eaa7efa3eaa7efa
0x10005cbc2: mov qword ptr [rdi + 0x8a8], rax
0x10005cbc9: mov dword ptr [rdi + 0x8b0], 0x3eaa7efa
0x10005cbd3: mov qword ptr [rbp - 0xa8], rdi
0x10005cbda: lea rdi, [rdi + 0x208a0]
0x10005cbe1: mov esi, 0x2ffd0
0x10005cbe6: vzeroupper 
0x10005cbe9: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10005cbee: mov edi, 0x20
0x10005cbf3: mov esi, 0x20
0x10005cbf8: call 0x1007f0470 ; 0x1007f0470
0x10005cbfd: mov dword ptr [rbp - 0x23c], eax
0x10005cc03: cmp eax, 2
0x10005cc06: jb 0x1000608fe
0x10005cc0c: mov ecx, 1
0x10005cc11: nop word ptr cs:[rax + rax]
0x10005cc20: mov edx, 0x20
0x10005cc25: shr edx, cl
0x10005cc27: lea r11d, [rdx + rdx]
0x10005cc2b: lea eax, [rdx + rdx - 1]
0x10005cc2f: mov dword ptr [rbp - 0x1f4], eax
0x10005cc35: mov qword ptr [rbp - 0x230], rdx
0x10005cc3c: mov eax, edx
0x10005cc3e: imul eax, r11d
0x10005cc42: shl eax, 4
0x10005cc45: mov edx, 0x2000
0x10005cc4a: sub edx, eax
0x10005cc4c: mov dword ptr [rbp - 0x74], edx
0x10005cc4f: xor eax, eax
0x10005cc51: mov dword ptr [rbp - 0x240], ecx
0x10005cc57: nop word ptr [rax + rax]
0x10005cc60: mov qword ptr [rbp - 0x228], rax
0x10005cc67: cmp ecx, 5
0x10005cc6a: ja 0x1000608d8
0x10005cc70: mov rax, qword ptr [rbp - 0x228]
0x10005cc77: lea eax, [rax + 0x18]
0x10005cc7a: imul eax, dword ptr [rbp - 0x230]
0x10005cc81: mov qword ptr [rbp - 0x248], rax
0x10005cc88: xor r8d, r8d
0x10005cc8b: nop dword ptr [rax + rax]
0x10005cc90: lea r9d, [r8 + r8]
0x10005cc94: mov r12d, r9d
0x10005cc97: or r12d, 1
0x10005cc9b: add r12d, r11d
0x10005cc9e: mov ecx, dword ptr [rbp - 0x1f4]
0x10005cca4: and r12d, ecx
0x10005cca7: mov r13d, r11d
0x10005ccaa: sub r13d, r12d
0x10005ccad: dec r13d
0x10005ccb0: mov edx, r9d
0x10005ccb3: or edx, 1
0x10005ccb6: mov dword ptr [rbp - 0x38], edx
0x10005ccb9: lea ebx, [r8 + r8 - 1]
0x10005ccbe: setns byte ptr [rbp - 0x30]
0x10005ccc2: sets byte ptr [rbp - 0x3c]
0x10005ccc6: mov edx, r13d
0x10005ccc9: cmovs edx, r12d
0x10005cccd: mov dword ptr [rbp - 0xbc], edx
0x10005ccd3: mov edx, r12d
0x10005ccd6: cmovs edx, r13d
0x10005ccda: mov dword ptr [rbp - 0xb8], edx
0x10005cce0: mov rax, qword ptr [rbp - 0x248]
0x10005cce7: lea eax, [rax + r8]
0x10005cceb: imul eax, dword ptr [rbp - 0x230]
0x10005ccf2: add eax, dword ptr [rbp - 0x74]
0x10005ccf5: mov qword ptr [rbp - 0x258], rax
0x10005ccfc: cmp ebx, r11d
0x10005ccff: setae byte ptr [rbp - 0x68]
0x10005cd03: lea edx, [r11 + r8*2 - 1]
0x10005cd08: setb al
0x10005cd0b: and edx, ecx
0x10005cd0d: mov edi, ecx
0x10005cd0f: mov dword ptr [rbp - 0x70], edx
0x10005cd12: mov esi, r11d
0x10005cd15: sub esi, edx
0x10005cd17: dec esi
0x10005cd19: mov dword ptr [rbp - 0xac], esi
0x10005cd1f: test ebx, ebx
0x10005cd21: mov ecx, esi
0x10005cd23: cmovs ecx, edx
0x10005cd26: mov dword ptr [rbp - 0xb0], ecx
0x10005cd2c: mov ecx, edx
0x10005cd2e: cmovs ecx, esi
0x10005cd31: mov dword ptr [rbp - 0xb4], ecx
0x10005cd37: setns cl
0x10005cd3a: sets byte ptr [rbp - 0x29]
0x10005cd3e: and cl, al
0x10005cd40: mov byte ptr [rbp - 0xe0], cl
0x10005cd46: mov dword ptr [rbp - 0x34], ebx
0x10005cd49: mov eax, ebx
0x10005cd4b: sar eax, 0x1f
0x10005cd4e: mov ecx, ebx
0x10005cd50: shr ecx, 0x1f
0x10005cd53: or ecx, 4
0x10005cd56: mov dword ptr [rbp - 0xe4], ecx
0x10005cd5c: lea ecx, [rax + 3]
0x10005cd5f: mov dword ptr [rbp - 0x8c], ecx
0x10005cd65: add eax, 5
0x10005cd68: mov qword ptr [rbp - 0x200], rax
0x10005cd6f: cmp r9d, r11d
0x10005cd72: setae byte ptr [rbp - 0x51]
0x10005cd76: setb r15b
0x10005cd7a: lea eax, [r11 + r8*2]
0x10005cd7e: and eax, edi
0x10005cd80: mov r14d, r11d
0x10005cd83: sub r14d, eax
0x10005cd86: dec r14d
0x10005cd89: test r9d, r9d
0x10005cd8c: mov ecx, r14d
0x10005cd8f: cmovs ecx, eax
0x10005cd92: mov edx, eax
0x10005cd94: cmovs edx, r14d
0x10005cd98: setns r10b
0x10005cd9c: sets sil
0x10005cda0: and r10b, r15b
0x10005cda3: mov byte ptr [rbp - 0xdf], r10b
0x10005cdaa: mov r10d, r9d
0x10005cdad: sar r10d, 0x1f
0x10005cdb1: mov ebx, r8d
0x10005cdb4: shr ebx, 0x1e
0x10005cdb7: and ebx, 1
0x10005cdba: or ebx, 4
0x10005cdbd: lea edi, [r10 + 3]
0x10005cdc1: mov dword ptr [rbp - 0x6c], edi
0x10005cdc4: add r10d, 5
0x10005cdc8: or sil, byte ptr [rbp - 0x51]
0x10005cdcc: mov byte ptr [rbp - 0x2c], sil
0x10005cdd0: mov esi, 3
0x10005cdd5: cmovne esi, r10d
0x10005cdd9: mov dword ptr [rbp - 0x198], esi
0x10005cddf: mov esi, r9d
0x10005cde2: mov dword ptr [rbp - 0xd8], ecx
0x10005cde8: cmovne esi, ecx
0x10005cdeb: mov dword ptr [rbp - 0x194], esi
0x10005cdf1: mov ecx, 2
0x10005cdf6: cmovne ecx, ebx
0x10005cdf9: mov dword ptr [rbp - 0x190], ecx
0x10005cdff: mov ecx, r9d
0x10005ce02: mov dword ptr [rbp - 0xd4], edx
0x10005ce08: cmovne ecx, edx
0x10005ce0b: mov dword ptr [rbp - 0x18c], ecx
0x10005ce11: mov ecx, 5
0x10005ce16: cmovne ecx, edi
0x10005ce19: mov dword ptr [rbp - 0x188], ecx
0x10005ce1f: mov ecx, r9d
0x10005ce22: mov dword ptr [rbp - 0xc4], r14d
0x10005ce29: cmovne ecx, r14d
0x10005ce2d: mov dword ptr [rbp - 0x184], ecx
0x10005ce33: mov ecx, 4
0x10005ce38: cmovne ecx, edi
0x10005ce3b: mov dword ptr [rbp - 0x180], ecx
0x10005ce41: mov ecx, r9d
0x10005ce44: mov dword ptr [rbp - 0x7c], eax
0x10005ce47: cmovne ecx, eax
0x10005ce4a: mov dword ptr [rbp - 0x17c], ecx
0x10005ce50: mov eax, 1
0x10005ce55: cmovne eax, edi
0x10005ce58: mov dword ptr [rbp - 0x178], eax
0x10005ce5e: mov eax, 0
0x10005ce63: cmovne eax, edi
0x10005ce66: mov dword ptr [rbp - 0x174], eax
0x10005ce6c: mov eax, 1
0x10005ce71: cmovne eax, r10d
0x10005ce75: mov dword ptr [rbp - 0x170], eax
0x10005ce7b: mov eax, 1
0x10005ce80: cmovne eax, ebx
0x10005ce83: mov dword ptr [rbp - 0x16c], eax
0x10005ce89: mov edx, dword ptr [rbp - 0x38]
0x10005ce8c: cmp edx, r11d
0x10005ce8f: setae al
0x10005ce92: setb cl
0x10005ce95: and cl, byte ptr [rbp - 0x30]
0x10005ce98: mov byte ptr [rbp - 0xde], cl
0x10005ce9e: mov r15d, dword ptr [rbp - 0x34]
0x10005cea2: or al, byte ptr [rbp - 0x3c]
0x10005cea5: mov byte ptr [rbp - 0x2b], al
0x10005cea8: mov ecx, edx
0x10005ceaa: mov eax, 3
0x10005ceaf: cmovne eax, r10d
0x10005ceb3: mov dword ptr [rbp - 0x168], eax
0x10005ceb9: mov eax, ecx
0x10005cebb: cmovne eax, dword ptr [rbp - 0xbc]
0x10005cec2: mov dword ptr [rbp - 0x164], eax
0x10005cec8: mov eax, 2
0x10005cecd: cmovne eax, ebx
0x10005ced0: mov dword ptr [rbp - 0x160], eax
0x10005ced6: mov eax, ecx
0x10005ced8: cmovne eax, dword ptr [rbp - 0xb8]
0x10005cedf: mov dword ptr [rbp - 0x15c], eax
0x10005cee5: mov eax, 5
0x10005ceea: cmovne eax, edi
0x10005ceed: mov dword ptr [rbp - 0x158], eax
0x10005cef3: mov eax, ecx
0x10005cef5: mov dword ptr [rbp - 0xc8], r13d
0x10005cefc: cmovne eax, r13d
0x10005cf00: mov dword ptr [rbp - 0x154], eax
0x10005cf06: mov eax, 4
0x10005cf0b: cmovne eax, edi
0x10005cf0e: mov dword ptr [rbp - 0x150], eax
0x10005cf14: mov eax, ecx
0x10005cf16: mov dword ptr [rbp - 0x80], r12d
0x10005cf1a: cmovne eax, r12d
0x10005cf1e: mov dword ptr [rbp - 0x14c], eax
0x10005cf24: mov eax, 1
0x10005cf29: cmovne eax, edi
0x10005cf2c: mov dword ptr [rbp - 0x148], eax
0x10005cf32: mov eax, 0
0x10005cf37: cmovne eax, edi
0x10005cf3a: mov dword ptr [rbp - 0x144], eax
0x10005cf40: mov r13d, 1
0x10005cf46: cmove r10d, r13d
0x10005cf4a: mov qword ptr [rbp - 0x220], r10
0x10005cf51: cmove ebx, r13d
0x10005cf55: mov dword ptr [rbp - 0x19c], ebx
0x10005cf5b: lea ebx, [r8 + r8 + 2]
0x10005cf60: cmp ebx, r11d
0x10005cf63: setae dl
0x10005cf66: setb cl
0x10005cf69: mov qword ptr [rbp - 0x250], r8
0x10005cf70: lea esi, [r11 + r8*2 + 2]
0x10005cf75: and esi, dword ptr [rbp - 0x1f4]
0x10005cf7b: mov edi, r11d
0x10005cf7e: sub edi, esi
0x10005cf80: dec edi
0x10005cf82: test ebx, ebx
0x10005cf84: mov r12d, edi
0x10005cf87: cmovs r12d, esi
0x10005cf8b: mov r10d, esi
0x10005cf8e: cmovs r10d, edi
0x10005cf92: setns al
0x10005cf95: sets r8b
0x10005cf99: and al, cl
0x10005cf9b: mov byte ptr [rbp - 0xdd], al
0x10005cfa1: mov eax, ebx
0x10005cfa3: sar eax, 0x1f
0x10005cfa6: mov ecx, ebx
0x10005cfa8: shr ecx, 0x1f
0x10005cfab: or ecx, 4
0x10005cfae: lea r14d, [rax + 3]
0x10005cfb2: add eax, 5
0x10005cfb5: or r8b, dl
0x10005cfb8: mov byte ptr [rbp - 0x2a], r8b
0x10005cfbc: mov edx, 3
0x10005cfc1: cmovne edx, eax
0x10005cfc4: mov dword ptr [rbp - 0x13c], edx
0x10005cfca: mov edx, ebx
0x10005cfcc: mov dword ptr [rbp - 0xd0], r12d
0x10005cfd3: cmovne edx, r12d
0x10005cfd7: mov r12d, r9d
0x10005cfda: mov dword ptr [rbp - 0x138], edx
0x10005cfe0: mov edx, 2
0x10005cfe5: cmovne edx, ecx
0x10005cfe8: mov dword ptr [rbp - 0x134], edx
0x10005cfee: mov edx, ebx
0x10005cff0: mov dword ptr [rbp - 0xcc], r10d
0x10005cff7: cmovne edx, r10d
0x10005cffb: mov dword ptr [rbp - 0x130], edx
0x10005d001: mov edx, 5
0x10005d006: cmovne edx, r14d
0x10005d00a: mov dword ptr [rbp - 0x12c], edx
0x10005d010: mov edx, ebx
0x10005d012: mov dword ptr [rbp - 0xc0], edi
0x10005d018: cmovne edx, edi
0x10005d01b: mov dword ptr [rbp - 0x128], edx
0x10005d021: mov edx, 4
0x10005d026: cmovne edx, r14d
0x10005d02a: mov dword ptr [rbp - 0x124], edx
0x10005d030: mov edx, ebx
0x10005d032: mov dword ptr [rbp - 0x78], esi
0x10005d035: cmovne edx, esi
0x10005d038: mov dword ptr [rbp - 0x120], edx
0x10005d03e: mov edx, 1
0x10005d043: cmovne edx, r14d
0x10005d047: mov dword ptr [rbp - 0x11c], edx
0x10005d04d: mov edx, 0
0x10005d052: mov dword ptr [rbp - 0x90], r14d
0x10005d059: cmovne edx, r14d
0x10005d05d: mov dword ptr [rbp - 0x118], edx
0x10005d063: cmove eax, r13d
0x10005d067: mov qword ptr [rbp - 0x218], rax
0x10005d06e: cmove ecx, r13d
0x10005d072: mov dword ptr [rbp - 0x140], ecx
0x10005d078: mov al, byte ptr [rbp - 0x29]
0x10005d07b: or al, byte ptr [rbp - 0x68]
0x10005d07e: mov byte ptr [rbp - 0x29], al
0x10005d081: mov eax, 1
0x10005d086: mov esi, dword ptr [rbp - 0xe4]
0x10005d08c: cmovne eax, esi
0x10005d08f: mov dword ptr [rbp - 0x114], eax
0x10005d095: mov eax, 1
0x10005d09a: mov rdx, qword ptr [rbp - 0x200]
0x10005d0a1: cmovne eax, edx
0x10005d0a4: mov dword ptr [rbp - 0x110], eax
0x10005d0aa: mov eax, 0
0x10005d0af: mov edi, dword ptr [rbp - 0x8c]
0x10005d0b5: cmovne eax, edi
0x10005d0b8: mov dword ptr [rbp - 0x10c], eax
0x10005d0be: mov eax, 1
0x10005d0c3: cmovne eax, edi
0x10005d0c6: mov dword ptr [rbp - 0x108], eax
0x10005d0cc: mov eax, 4
0x10005d0d1: cmovne eax, edi
0x10005d0d4: mov dword ptr [rbp - 0x104], eax
0x10005d0da: mov eax, r15d
0x10005d0dd: cmovne eax, dword ptr [rbp - 0x70]
0x10005d0e1: mov dword ptr [rbp - 0x100], eax
0x10005d0e7: mov ecx, 5
0x10005d0ec: cmovne ecx, edi
0x10005d0ef: mov dword ptr [rbp - 0xfc], ecx
0x10005d0f5: mov ecx, r15d
0x10005d0f8: cmovne ecx, dword ptr [rbp - 0xac]
0x10005d0ff: mov dword ptr [rbp - 0xf8], ecx
0x10005d105: mov eax, 2
0x10005d10a: mov ecx, esi
0x10005d10c: cmove ecx, eax
0x10005d10f: mov dword ptr [rbp - 0xe4], ecx
0x10005d115: mov eax, r15d
0x10005d118: cmovne eax, dword ptr [rbp - 0xb4]
0x10005d11f: mov dword ptr [rbp - 0xf4], eax
0x10005d125: mov eax, 3
0x10005d12a: mov rcx, rdx
0x10005d12d: cmove ecx, eax
0x10005d130: mov qword ptr [rbp - 0x200], rcx
0x10005d137: mov eax, r15d
0x10005d13a: cmovne eax, dword ptr [rbp - 0xb0]
0x10005d141: mov dword ptr [rbp - 0xf0], eax
0x10005d147: xor eax, eax
0x10005d149: mov qword ptr [rbp - 0x238], rax
0x10005d150: mov dword ptr [rbp - 0x20c], r12d
0x10005d157: mov dword ptr [rbp - 0x1a0], ebx
0x10005d15d: nop dword ptr [rax]
0x10005d160: mov r13, qword ptr [rbp - 0x238]
0x10005d167: lea ebx, [r13 + r13]
0x10005d16c: lea esi, [r13 + r13 - 1]
0x10005d171: mov dword ptr [rbp - 0x3c], esi
0x10005d174: mov rax, qword ptr [rbp - 0x258]
0x10005d17b: lea eax, [rax + r13]
0x10005d17f: shl eax, 4
0x10005d182: mov qword ptr [rbp - 0x260], rax
0x10005d189: test esi, esi
0x10005d18b: setns cl
0x10005d18e: lea edx, [r11 + r13*2 - 1]
0x10005d193: mov r9d, dword ptr [rbp - 0x1f4]
0x10005d19a: and edx, r9d
0x10005d19d: xor eax, eax
0x10005d19f: xor edi, edi
0x10005d1a1: cmp esi, r11d
0x10005d1a4: setae al
0x10005d1a7: mov qword ptr [rbp - 0x208], rax
0x10005d1ae: setb dil
0x10005d1b2: mov eax, edx
0x10005d1b4: cmovb eax, esi
0x10005d1b7: mov dword ptr [rbp - 0x94], eax
0x10005d1bd: and cl, dil
0x10005d1c0: mov byte ptr [rbp - 0x59], cl
0x10005d1c3: test ebx, ebx
0x10005d1c5: lea r15d, [r11 + r13*2]
0x10005d1c9: setns r8b
0x10005d1cd: and r15d, r9d
0x10005d1d0: xor ecx, ecx
0x10005d1d2: xor esi, esi
0x10005d1d4: cmp ebx, r11d
0x10005d1d7: mov dword ptr [rbp - 0x30], ebx
0x10005d1da: setae cl
0x10005d1dd: mov qword ptr [rbp - 0x88], rcx
0x10005d1e4: setb sil
0x10005d1e8: mov ecx, r15d
0x10005d1eb: cmovb ecx, ebx
0x10005d1ee: mov dword ptr [rbp - 0x98], ecx
0x10005d1f4: and r8b, sil
0x10005d1f7: mov byte ptr [rbp - 0x5a], r8b
0x10005d1fb: or ebx, 1
0x10005d1fe: setns r8b
0x10005d202: lea eax, [rbx + r11]
0x10005d206: and eax, r9d
0x10005d209: xor r10d, r10d
0x10005d20c: xor r14d, r14d
0x10005d20f: cmp ebx, r11d
0x10005d212: setae r10b
0x10005d216: setb r14b
0x10005d21a: mov ecx, eax
0x10005d21c: mov qword ptr [rbp - 0x68], rbx
0x10005d220: cmovb ecx, ebx
0x10005d223: mov dword ptr [rbp - 0x9c], ecx
0x10005d229: and r8b, r14b
0x10005d22c: mov byte ptr [rbp - 0x5b], r8b
0x10005d230: lea r12d, [r13 + r13 + 2]
0x10005d235: test r12d, r12d
0x10005d238: setns bl
0x10005d23b: mov r8, r11
0x10005d23e: lea r11d, [r8 + r13*2 + 2]
0x10005d243: and r11d, r9d
0x10005d246: xor r13d, r13d
0x10005d249: xor ecx, ecx
0x10005d24b: cmp r12d, r8d
0x10005d24e: setae r13b
0x10005d252: setb cl
0x10005d255: mov r9d, r11d
0x10005d258: mov dword ptr [rbp - 0x210], r12d
0x10005d25f: cmovb r9d, r12d
0x10005d263: mov dword ptr [rbp - 0xa0], r9d
0x10005d26a: mov r12d, r11d
0x10005d26d: mov r11, r8
0x10005d270: mov dword ptr [rbp - 0x44], r15d
0x10005d274: and bl, cl
0x10005d276: mov byte ptr [rbp - 0x51], bl
0x10005d279: mov ebx, r11d
0x10005d27c: mov dword ptr [rbp - 0x40], r12d
0x10005d280: sub ebx, r12d
0x10005d283: dec ebx
0x10005d285: mov r12d, ebx
0x10005d288: lea ebx, [r13 + r13*4]
0x10005d28d: mov dword ptr [rbp - 0x1f0], ebx
0x10005d293: lea ebx, [r13 + r13*2 + 1]
0x10005d298: mov r13d, edx
0x10005d29b: mov dword ptr [rbp - 0x1ec], ebx
0x10005d2a1: lea ebx, [rcx*4]
0x10005d2a8: mov dword ptr [rbp - 0x1e0], ebx
0x10005d2ae: lea ebx, [rcx*4 + 1]
0x10005d2b5: mov dword ptr [rbp - 0x1dc], ebx
0x10005d2bb: lea ebx, [rcx + rcx*2]
0x10005d2be: mov dword ptr [rbp - 0x1e8], ebx
0x10005d2c4: add ecx, ecx
0x10005d2c6: mov dword ptr [rbp - 0x1e4], ecx
0x10005d2cc: mov ecx, r11d
0x10005d2cf: mov dword ptr [rbp - 0x48], eax
0x10005d2d2: sub ecx, eax
0x10005d2d4: dec ecx
0x10005d2d6: mov dword ptr [rbp - 0x50], ecx
0x10005d2d9: mov ecx, dword ptr [rbp - 0x30]
0x10005d2dc: lea eax, [r10 + r10*4]
0x10005d2e0: mov dword ptr [rbp - 0x1d8], eax
0x10005d2e6: lea eax, [r10 + r10*2 + 1]
0x10005d2eb: mov dword ptr [rbp - 0xec], eax
0x10005d2f1: lea eax, [r14*4]
0x10005d2f9: mov dword ptr [rbp - 0x1d0], eax
0x10005d2ff: lea eax, [r14*4 + 1]
0x10005d307: mov dword ptr [rbp - 0x1cc], eax
0x10005d30d: lea eax, [r14 + r14*2]
0x10005d311: mov dword ptr [rbp - 0xe8], eax
0x10005d317: mov eax, r14d
0x10005d31a: mov r14, qword ptr [rbp - 0x260]
0x10005d321: add eax, eax
0x10005d323: mov dword ptr [rbp - 0x1d4], eax
0x10005d329: mov eax, r11d
0x10005d32c: sub eax, r15d
0x10005d32f: dec eax
0x10005d331: mov dword ptr [rbp - 0x4c], eax
0x10005d334: mov rdx, qword ptr [rbp - 0x88]
0x10005d33b: lea eax, [rdx + rdx*4]
0x10005d33e: mov dword ptr [rbp - 0x1a4], eax
0x10005d344: lea r15d, [rdx + rdx*2 + 1]
0x10005d349: lea eax, [rsi*4]
0x10005d350: mov dword ptr [rbp - 0x1c0], eax
0x10005d356: lea eax, [rsi*4 + 1]
0x10005d35d: mov dword ptr [rbp - 0x1bc], eax
0x10005d363: lea eax, [rsi + rsi*2]
0x10005d366: mov dword ptr [rbp - 0x1c8], eax
0x10005d36c: mov eax, esi
0x10005d36e: add eax, eax
0x10005d370: mov dword ptr [rbp - 0x1c4], eax
0x10005d376: mov eax, r11d
0x10005d379: sub eax, r13d
0x10005d37c: dec eax
0x10005d37e: mov dword ptr [rbp - 0x88], eax
0x10005d384: mov rdx, qword ptr [rbp - 0x208]
0x10005d38b: lea eax, [rdx + rdx*4]
0x10005d38e: mov dword ptr [rbp - 0x1b8], eax
0x10005d394: lea eax, [rdx + rdx*2 + 1]
0x10005d398: mov dword ptr [rbp - 0x208], eax
0x10005d39e: lea eax, [rdi*4]
0x10005d3a5: mov dword ptr [rbp - 0x1ac], eax
0x10005d3ab: lea eax, [rdi*4 + 1]
0x10005d3b2: mov dword ptr [rbp - 0x1a8], eax
0x10005d3b8: lea eax, [rdi + rdi*2]
0x10005d3bb: mov dword ptr [rbp - 0x1b4], eax
0x10005d3c1: mov eax, edi
0x10005d3c3: add eax, eax
0x10005d3c5: mov dword ptr [rbp - 0x1b0], eax
0x10005d3cb: cmp byte ptr [rbp - 0xe0], 0
0x10005d3d2: lea eax, [r14 - 0x18000]
0x10005d3d9: mov edx, dword ptr [rbp - 0x3c]
0x10005d3dc: mov dword ptr [rbp - 0x58], r12d
0x10005d3e0: je 0x10005d480
0x10005d3e6: mov r10, qword ptr [rbp - 0x228]
0x10005d3ed: mov edi, r10d
0x10005d3f0: mov r9d, edx
0x10005d3f3: mov esi, dword ptr [rbp - 0x34]
0x10005d3f6: cmp byte ptr [rbp - 0x59], 0
0x10005d3fa: mov r8d, dword ptr [rbp - 0x210]
0x10005d401: mov ebx, ecx
0x10005d403: jne 0x10005d6b0
0x10005d409: mov edi, r10d
0x10005d40c: mov r9d, edx
0x10005d40f: mov esi, dword ptr [rbp - 0x34]
0x10005d412: cmp r10d, 5
0x10005d416: ja 0x10005d6b0
0x10005d41c: mov ecx, r10d
0x10005d41f: lea rdx, [rip + 0x354a] ; 0x100060970
0x10005d426: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005d42a: add rcx, rdx
0x10005d42d: jmp rcx
0x10005d42f: cmp dword ptr [rbp - 0x34], 0
0x10005d433: mov esi, r13d
0x10005d436: cmovs esi, dword ptr [rbp - 0x88]
0x10005d43d: mov edi, dword ptr [rbp - 0x8c]
0x10005d443: mov r9d, dword ptr [rbp - 0xb0]
0x10005d44a: test byte ptr [rbp - 0x29], 1
0x10005d44e: mov ecx, dword ptr [rbp - 0x3c]
0x10005d451: jne 0x10005d6b0
0x10005d457: cmp ecx, r11d
0x10005d45a: mov ebx, dword ptr [rbp - 0x70]
0x10005d45d: mov esi, ebx
0x10005d45f: cmovb esi, dword ptr [rbp - 0x34]
0x10005d463: test ecx, ecx
0x10005d465: mov edi, dword ptr [rbp - 0x1b8]
0x10005d46b: mov ecx, 4
0x10005d470: jmp 0x10005d697 ; 0x10005d697
0x10005d475: nop word ptr cs:[rax + rax]
0x10005d480: mov r10, qword ptr [rbp - 0x228]
0x10005d487: mov esi, r10d
0x10005d48a: mov edx, ecx
0x10005d48c: mov edi, dword ptr [rbp - 0x20c]
0x10005d492: mov ebx, edi
0x10005d494: cmp byte ptr [rbp - 0x59], 0
0x10005d498: mov r8d, dword ptr [rbp - 0x210]
0x10005d49f: je 0x10005d800
0x10005d4a5: mov esi, r10d
0x10005d4a8: mov edx, dword ptr [rbp - 0x3c]
0x10005d4ab: mov edi, dword ptr [rbp - 0x34]
0x10005d4ae: cmp r10d, 5
0x10005d4b2: ja 0x10005d800
0x10005d4b8: mov ecx, r10d
0x10005d4bb: lea rdx, [rip + 0x344e] ; 0x100060910
0x10005d4c2: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005d4c6: add rcx, rdx
0x10005d4c9: jmp rcx
0x10005d4cb: mov esi, dword ptr [rbp - 0x34]
0x10005d4ce: test esi, esi
0x10005d4d0: mov edi, r13d
0x10005d4d3: cmovs edi, dword ptr [rbp - 0x88]
0x10005d4da: movzx ecx, byte ptr [rbp - 0x29]
0x10005d4de: and cl, 1
0x10005d4e1: mov edx, dword ptr [rbp - 0x3c]
0x10005d4e4: cmovne edx, dword ptr [rbp - 0xb0]
0x10005d4eb: test cl, cl
0x10005d4ed: cmove edi, esi
0x10005d4f0: mov esi, dword ptr [rbp - 0x10c]
0x10005d4f6: jmp 0x10005d800 ; 0x10005d800
0x10005d4fb: cmp dword ptr [rbp - 0x34], 0
0x10005d4ff: mov esi, dword ptr [rbp - 0x88]
0x10005d505: cmovs esi, r13d
0x10005d509: mov edi, dword ptr [rbp - 0x8c]
0x10005d50f: mov r9d, dword ptr [rbp - 0xb4]
0x10005d516: test byte ptr [rbp - 0x29], 1
0x10005d51a: mov ecx, dword ptr [rbp - 0x3c]
0x10005d51d: jne 0x10005d6b0
0x10005d523: cmp ecx, r11d
0x10005d526: mov ebx, dword ptr [rbp - 0x70]
0x10005d529: mov esi, ebx
0x10005d52b: cmovb esi, dword ptr [rbp - 0x34]
0x10005d52f: test ecx, ecx
0x10005d531: mov edi, dword ptr [rbp - 0x208]
0x10005d537: mov ecx, 5
0x10005d53c: jmp 0x10005d697 ; 0x10005d697
0x10005d541: mov dword ptr [rbp - 0xdc], r15d
0x10005d548: mov r15d, r13d
0x10005d54b: mov r13d, dword ptr [rbp - 0x3c]
0x10005d54f: test r13d, r13d
0x10005d552: sets cl
0x10005d555: cmp dword ptr [rbp - 0x34], 0
0x10005d559: mov r9d, r15d
0x10005d55c: mov esi, dword ptr [rbp - 0x88]
0x10005d562: cmovs r9d, esi
0x10005d566: movzx ebx, byte ptr [rbp - 0x29]
0x10005d56a: or cl, bl
0x10005d56c: and bl, 1
0x10005d56f: cmovne esi, dword ptr [rbp - 0xb4]
0x10005d576: test bl, bl
0x10005d578: mov ebx, dword ptr [rbp - 0x30]
0x10005d57b: cmove r9d, dword ptr [rbp - 0x70]
0x10005d580: mov edi, dword ptr [rbp - 0x114]
0x10005d586: test cl, 1
0x10005d589: mov ecx, r13d
0x10005d58c: mov r13d, r15d
0x10005d58f: mov r15d, dword ptr [rbp - 0xdc]
0x10005d596: jne 0x10005d6b0
0x10005d59c: cmp ecx, r11d
0x10005d59f: mov r9d, dword ptr [rbp - 0xac]
0x10005d5a6: cmovb r9d, ecx
0x10005d5aa: mov esi, r13d
0x10005d5ad: cmovb esi, dword ptr [rbp - 0x34]
0x10005d5b1: mov edi, dword ptr [rbp - 0x1b0]
0x10005d5b7: jmp 0x10005d6b0 ; 0x10005d6b0
0x10005d5bc: mov dword ptr [rbp - 0xdc], r15d
0x10005d5c3: mov r15d, dword ptr [rbp - 0x3c]
0x10005d5c7: test r15d, r15d
0x10005d5ca: sets cl
0x10005d5cd: cmp dword ptr [rbp - 0x34], 0
0x10005d5d1: mov r9d, dword ptr [rbp - 0x88]
0x10005d5d8: cmovs r9d, r13d
0x10005d5dc: movzx ebx, byte ptr [rbp - 0x29]
0x10005d5e0: or cl, bl
0x10005d5e2: and bl, 1
0x10005d5e5: mov esi, r13d
0x10005d5e8: cmovne esi, dword ptr [rbp - 0xb0]
0x10005d5ef: test bl, bl
0x10005d5f1: mov ebx, dword ptr [rbp - 0x30]
0x10005d5f4: cmove r9d, dword ptr [rbp - 0xac]
0x10005d5fc: mov edi, dword ptr [rbp - 0x110]
0x10005d602: test cl, 1
0x10005d605: mov ecx, r15d
0x10005d608: mov r15d, dword ptr [rbp - 0xdc]
0x10005d60f: jne 0x10005d6b0
0x10005d615: cmp ecx, r11d
0x10005d618: mov r9d, dword ptr [rbp - 0x70]
0x10005d61c: cmovb r9d, ecx
0x10005d620: mov esi, dword ptr [rbp - 0x88]
0x10005d626: cmovb esi, dword ptr [rbp - 0x34]
0x10005d62a: mov edi, dword ptr [rbp - 0x1b4]
0x10005d630: jmp 0x10005d6b0 ; 0x10005d6b0
0x10005d632: mov edi, dword ptr [rbp - 0x8c]
0x10005d638: mov r9d, r13d
0x10005d63b: mov esi, dword ptr [rbp - 0x70]
0x10005d63e: test byte ptr [rbp - 0x29], 1
0x10005d642: mov ecx, dword ptr [rbp - 0x3c]
0x10005d645: jne 0x10005d6b0
0x10005d647: cmp ecx, r11d
0x10005d64a: mov ebx, dword ptr [rbp - 0x70]
0x10005d64d: mov esi, ebx
0x10005d64f: cmovb esi, dword ptr [rbp - 0x34]
0x10005d653: test ecx, ecx
0x10005d655: mov edi, dword ptr [rbp - 0x1ac]
0x10005d65b: mov ecx, 1
0x10005d660: jmp 0x10005d697 ; 0x10005d697
0x10005d662: mov edi, dword ptr [rbp - 0x8c]
0x10005d668: mov r9d, dword ptr [rbp - 0x88]
0x10005d66f: mov esi, dword ptr [rbp - 0xac]
0x10005d675: test byte ptr [rbp - 0x29], 1
0x10005d679: mov ecx, dword ptr [rbp - 0x3c]
0x10005d67c: jne 0x10005d6b0
0x10005d67e: cmp ecx, r11d
0x10005d681: mov ebx, dword ptr [rbp - 0x70]
0x10005d684: mov esi, ebx
0x10005d686: cmovb esi, dword ptr [rbp - 0x34]
0x10005d68a: test ecx, ecx
0x10005d68c: mov edi, dword ptr [rbp - 0x1a8]
0x10005d692: mov ecx, 0
0x10005d697: cmovs edi, ecx
0x10005d69a: mov r9d, dword ptr [rbp - 0x94]
0x10005d6a1: cmovs r9d, r13d
0x10005d6a5: cmovs esi, ebx
0x10005d6a8: mov ebx, dword ptr [rbp - 0x30]
0x10005d6ab: nop dword ptr [rax + rax]
0x10005d6b0: imul edi, r11d
0x10005d6b4: add edi, esi
0x10005d6b6: imul edi, r11d
0x10005d6ba: add r9d, dword ptr [rbp - 0x74]
0x10005d6be: add r9d, edi
0x10005d6c1: mov ecx, eax
0x10005d6c3: mov rsi, qword ptr [rbp - 0xa8]
0x10005d6ca: mov dword ptr [rsi + rcx*4 + 0x914], r9d
0x10005d6d2: mov edi, r10d
0x10005d6d5: mov edx, ebx
0x10005d6d7: mov esi, dword ptr [rbp - 0x34]
0x10005d6da: cmp byte ptr [rbp - 0x5a], 0
0x10005d6de: jne 0x10005d9f0
0x10005d6e4: mov edi, r10d
0x10005d6e7: mov edx, ebx
0x10005d6e9: mov esi, dword ptr [rbp - 0x34]
0x10005d6ec: cmp r10d, 5
0x10005d6f0: ja 0x10005d9f0
0x10005d6f6: mov ecx, r10d
0x10005d6f9: lea rdx, [rip + 0x3288] ; 0x100060988
0x10005d700: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005d704: add rcx, rdx
0x10005d707: jmp rcx
0x10005d709: cmp dword ptr [rbp - 0x34], 0
0x10005d70d: mov esi, dword ptr [rbp - 0x44]
0x10005d710: cmovs esi, dword ptr [rbp - 0x4c]
0x10005d714: mov edi, dword ptr [rbp - 0x8c]
0x10005d71a: mov edx, dword ptr [rbp - 0xb0]
0x10005d720: test byte ptr [rbp - 0x29], 1
0x10005d724: jne 0x10005d9f0
0x10005d72a: cmp ebx, r11d
0x10005d72d: mov ebx, dword ptr [rbp - 0x70]
0x10005d730: mov esi, ebx
0x10005d732: cmovb esi, dword ptr [rbp - 0x34]
0x10005d736: cmp dword ptr [rbp - 0x30], 0
0x10005d73a: mov edi, dword ptr [rbp - 0x1a4]
0x10005d740: mov ecx, 4
0x10005d745: jmp 0x10005d9d4 ; 0x10005d9d4
0x10005d74a: mov esi, dword ptr [rbp - 0x34]
0x10005d74d: test esi, esi
0x10005d74f: mov edi, dword ptr [rbp - 0x88]
0x10005d755: cmovs edi, r13d
0x10005d759: movzx ecx, byte ptr [rbp - 0x29]
0x10005d75d: and cl, 1
0x10005d760: mov edx, dword ptr [rbp - 0x3c]
0x10005d763: cmovne edx, dword ptr [rbp - 0xb4]
0x10005d76a: test cl, cl
0x10005d76c: cmove edi, esi
0x10005d76f: mov esi, dword ptr [rbp - 0x108]
0x10005d775: jmp 0x10005d800 ; 0x10005d800
0x10005d77a: cmp dword ptr [rbp - 0x34], 0
0x10005d77e: mov edx, r13d
0x10005d781: cmovs edx, dword ptr [rbp - 0x88]
0x10005d788: test byte ptr [rbp - 0x29], 1
0x10005d78c: cmove edx, dword ptr [rbp - 0x3c]
0x10005d790: mov esi, dword ptr [rbp - 0xe4]
0x10005d796: mov edi, dword ptr [rbp - 0xf4]
0x10005d79c: jmp 0x10005d800 ; 0x10005d800
0x10005d79e: cmp dword ptr [rbp - 0x34], 0
0x10005d7a2: mov edx, dword ptr [rbp - 0x88]
0x10005d7a8: cmovs edx, r13d
0x10005d7ac: test byte ptr [rbp - 0x29], 1
0x10005d7b0: cmove edx, dword ptr [rbp - 0x3c]
0x10005d7b4: mov rcx, qword ptr [rbp - 0x200]
0x10005d7bb: mov esi, ecx
0x10005d7bd: mov edi, dword ptr [rbp - 0xf0]
0x10005d7c3: jmp 0x10005d800 ; 0x10005d800
0x10005d7c5: test byte ptr [rbp - 0x29], 1
0x10005d7c9: mov edx, dword ptr [rbp - 0x3c]
0x10005d7cc: cmovne edx, r13d
0x10005d7d0: mov esi, dword ptr [rbp - 0x104]
0x10005d7d6: mov edi, dword ptr [rbp - 0x100]
0x10005d7dc: jmp 0x10005d800 ; 0x10005d800
0x10005d7de: test byte ptr [rbp - 0x29], 1
0x10005d7e2: mov edx, dword ptr [rbp - 0x3c]
0x10005d7e5: cmovne edx, dword ptr [rbp - 0x88]
0x10005d7ec: mov esi, dword ptr [rbp - 0xfc]
0x10005d7f2: mov edi, dword ptr [rbp - 0xf8]
0x10005d7f8: nop dword ptr [rax + rax]
0x10005d800: imul esi, r11d
0x10005d804: add esi, edi
0x10005d806: imul esi, r11d
0x10005d80a: add edx, dword ptr [rbp - 0x74]
0x10005d80d: add edx, esi
0x10005d80f: mov ecx, eax
0x10005d811: mov rsi, qword ptr [rbp - 0xa8]
0x10005d818: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005d81f: mov esi, r10d
0x10005d822: mov ecx, dword ptr [rbp - 0x30]
0x10005d825: mov edx, ecx
0x10005d827: mov r12d, ebx
0x10005d82a: mov ebx, ecx
0x10005d82c: mov edi, r12d
0x10005d82f: cmp byte ptr [rbp - 0x5a], 0
0x10005d833: je 0x10005db40
0x10005d839: mov esi, r10d
0x10005d83c: mov edx, ebx
0x10005d83e: mov edi, dword ptr [rbp - 0x34]
0x10005d841: cmp r10d, 5
0x10005d845: ja 0x10005db40
0x10005d84b: mov ecx, r10d
0x10005d84e: lea rdx, [rip + 0x30d3] ; 0x100060928
0x10005d855: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005d859: add rcx, rdx
0x10005d85c: jmp rcx
0x10005d85e: mov esi, dword ptr [rbp - 0x34]
0x10005d861: test esi, esi
0x10005d863: mov edi, dword ptr [rbp - 0x44]
0x10005d866: cmovs edi, dword ptr [rbp - 0x4c]
0x10005d86a: movzx ecx, byte ptr [rbp - 0x29]
0x10005d86e: and cl, 1
0x10005d871: mov edx, ebx
0x10005d873: cmovne edx, dword ptr [rbp - 0xb0]
0x10005d87a: test cl, cl
0x10005d87c: cmove edi, esi
0x10005d87f: mov esi, dword ptr [rbp - 0x10c]
0x10005d885: jmp 0x10005db40 ; 0x10005db40
0x10005d88a: cmp dword ptr [rbp - 0x34], 0
0x10005d88e: mov esi, dword ptr [rbp - 0x4c]
0x10005d891: cmovs esi, dword ptr [rbp - 0x44]
0x10005d895: mov edi, dword ptr [rbp - 0x8c]
0x10005d89b: mov edx, dword ptr [rbp - 0xb4]
0x10005d8a1: test byte ptr [rbp - 0x29], 1
0x10005d8a5: jne 0x10005d9f0
0x10005d8ab: cmp ebx, r11d
0x10005d8ae: mov ebx, dword ptr [rbp - 0x70]
0x10005d8b1: mov esi, ebx
0x10005d8b3: cmovb esi, dword ptr [rbp - 0x34]
0x10005d8b7: cmp dword ptr [rbp - 0x30], 0
0x10005d8bb: mov edi, r15d
0x10005d8be: mov ecx, 5
0x10005d8c3: jmp 0x10005d9d4 ; 0x10005d9d4
0x10005d8c8: test ebx, ebx
0x10005d8ca: sets cl
0x10005d8cd: cmp dword ptr [rbp - 0x34], 0
0x10005d8d1: mov edx, dword ptr [rbp - 0x44]
0x10005d8d4: mov esi, dword ptr [rbp - 0x4c]
0x10005d8d7: cmovs edx, esi
0x10005d8da: movzx ebx, byte ptr [rbp - 0x29]
0x10005d8de: or cl, bl
0x10005d8e0: and bl, 1
0x10005d8e3: cmovne esi, dword ptr [rbp - 0xb4]
0x10005d8ea: test bl, bl
0x10005d8ec: mov ebx, dword ptr [rbp - 0x30]
0x10005d8ef: cmove edx, dword ptr [rbp - 0x70]
0x10005d8f3: mov edi, dword ptr [rbp - 0x114]
0x10005d8f9: test cl, 1
0x10005d8fc: jne 0x10005d9f0
0x10005d902: cmp ebx, r11d
0x10005d905: mov edx, dword ptr [rbp - 0xac]
0x10005d90b: cmovb edx, ebx
0x10005d90e: mov esi, dword ptr [rbp - 0x44]
0x10005d911: cmovb esi, dword ptr [rbp - 0x34]
0x10005d915: mov edi, dword ptr [rbp - 0x1c4]
0x10005d91b: jmp 0x10005d9f0 ; 0x10005d9f0
0x10005d920: test ebx, ebx
0x10005d922: sets cl
0x10005d925: cmp dword ptr [rbp - 0x34], 0
0x10005d929: mov edx, dword ptr [rbp - 0x4c]
0x10005d92c: mov esi, dword ptr [rbp - 0x44]
0x10005d92f: cmovs edx, esi
0x10005d932: movzx ebx, byte ptr [rbp - 0x29]
0x10005d936: or cl, bl
0x10005d938: and bl, 1
0x10005d93b: cmovne esi, dword ptr [rbp - 0xb0]
0x10005d942: test bl, bl
0x10005d944: mov ebx, dword ptr [rbp - 0x30]
0x10005d947: cmove edx, dword ptr [rbp - 0xac]
0x10005d94e: mov edi, dword ptr [rbp - 0x110]
0x10005d954: test cl, 1
0x10005d957: jne 0x10005d9f0
0x10005d95d: cmp ebx, r11d
0x10005d960: mov edx, dword ptr [rbp - 0x70]
0x10005d963: cmovb edx, ebx
0x10005d966: mov esi, dword ptr [rbp - 0x4c]
0x10005d969: cmovb esi, dword ptr [rbp - 0x34]
0x10005d96d: mov edi, dword ptr [rbp - 0x1c8]
0x10005d973: jmp 0x10005d9f0 ; 0x10005d9f0
0x10005d975: mov edi, dword ptr [rbp - 0x8c]
0x10005d97b: mov edx, dword ptr [rbp - 0x44]
0x10005d97e: mov esi, dword ptr [rbp - 0x70]
0x10005d981: test byte ptr [rbp - 0x29], 1
0x10005d985: jne 0x10005d9f0
0x10005d987: cmp ebx, r11d
0x10005d98a: mov ebx, dword ptr [rbp - 0x70]
0x10005d98d: mov esi, ebx
0x10005d98f: cmovb esi, dword ptr [rbp - 0x34]
0x10005d993: cmp dword ptr [rbp - 0x30], 0
0x10005d997: mov edi, dword ptr [rbp - 0x1c0]
0x10005d99d: mov ecx, 1
0x10005d9a2: jmp 0x10005d9d4 ; 0x10005d9d4
0x10005d9a4: mov edi, dword ptr [rbp - 0x8c]
0x10005d9aa: mov edx, dword ptr [rbp - 0x4c]
0x10005d9ad: mov esi, dword ptr [rbp - 0xac]
0x10005d9b3: test byte ptr [rbp - 0x29], 1
0x10005d9b7: jne 0x10005d9f0
0x10005d9b9: cmp ebx, r11d
0x10005d9bc: mov ebx, dword ptr [rbp - 0x70]
0x10005d9bf: mov esi, ebx
0x10005d9c1: cmovb esi, dword ptr [rbp - 0x34]
0x10005d9c5: cmp dword ptr [rbp - 0x30], 0
0x10005d9c9: mov edi, dword ptr [rbp - 0x1bc]
0x10005d9cf: mov ecx, 0
0x10005d9d4: cmovs edi, ecx
0x10005d9d7: mov edx, dword ptr [rbp - 0x98]
0x10005d9dd: cmovs edx, dword ptr [rbp - 0x44]
0x10005d9e1: cmovs esi, ebx
0x10005d9e4: mov ebx, dword ptr [rbp - 0x30]
0x10005d9e7: nop word ptr [rax + rax]
0x10005d9f0: imul edi, r11d
0x10005d9f4: add edi, esi
0x10005d9f6: imul edi, r11d
0x10005d9fa: add edx, dword ptr [rbp - 0x74]
0x10005d9fd: add edx, edi
0x10005d9ff: mov ecx, eax
0x10005da01: or ecx, 1
0x10005da04: mov rsi, qword ptr [rbp - 0xa8]
0x10005da0b: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005da12: mov edi, r10d
0x10005da15: mov rcx, qword ptr [rbp - 0x68]
0x10005da19: mov edx, ecx
0x10005da1b: mov esi, dword ptr [rbp - 0x34]
0x10005da1e: cmp byte ptr [rbp - 0x5b], 0
0x10005da22: mov r12d, dword ptr [rbp - 0x20c]
0x10005da29: jne 0x10005dd40
0x10005da2f: mov edi, r10d
0x10005da32: mov rcx, qword ptr [rbp - 0x68]
0x10005da36: mov edx, ecx
0x10005da38: mov esi, dword ptr [rbp - 0x34]
0x10005da3b: cmp r10d, 5
0x10005da3f: ja 0x10005dd40
0x10005da45: mov ecx, r10d
0x10005da48: lea rdx, [rip + 0x2f51] ; 0x1000609a0
0x10005da4f: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005da53: add rcx, rdx
0x10005da56: jmp rcx
0x10005da58: cmp dword ptr [rbp - 0x34], 0
0x10005da5c: mov esi, dword ptr [rbp - 0x48]
0x10005da5f: cmovs esi, dword ptr [rbp - 0x50]
0x10005da63: mov edi, dword ptr [rbp - 0x8c]
0x10005da69: mov edx, dword ptr [rbp - 0xb0]
0x10005da6f: test byte ptr [rbp - 0x29], 1
0x10005da73: jne 0x10005dd40
0x10005da79: mov rcx, qword ptr [rbp - 0x68]
0x10005da7d: cmp ecx, r11d
0x10005da80: mov ebx, dword ptr [rbp - 0x70]
0x10005da83: mov esi, ebx
0x10005da85: cmovb esi, dword ptr [rbp - 0x34]
0x10005da89: test ecx, ecx
0x10005da8b: mov edi, dword ptr [rbp - 0x1d8]
0x10005da91: mov ecx, 4
0x10005da96: jmp 0x10005dd2a ; 0x10005dd2a
0x10005da9b: mov esi, dword ptr [rbp - 0x34]
0x10005da9e: test esi, esi
0x10005daa0: mov edi, dword ptr [rbp - 0x4c]
0x10005daa3: cmovs edi, dword ptr [rbp - 0x44]
0x10005daa7: movzx ecx, byte ptr [rbp - 0x29]
0x10005daab: and cl, 1
0x10005daae: mov edx, ebx
0x10005dab0: cmovne edx, dword ptr [rbp - 0xb4]
0x10005dab7: test cl, cl
0x10005dab9: cmove edi, esi
0x10005dabc: mov esi, dword ptr [rbp - 0x108]
0x10005dac2: jmp 0x10005db40 ; 0x10005db40
0x10005dac4: cmp dword ptr [rbp - 0x34], 0
0x10005dac8: mov edx, dword ptr [rbp - 0x44]
0x10005dacb: cmovs edx, dword ptr [rbp - 0x4c]
0x10005dacf: test byte ptr [rbp - 0x29], 1
0x10005dad3: cmove edx, ebx
0x10005dad6: mov esi, dword ptr [rbp - 0xe4]
0x10005dadc: mov edi, dword ptr [rbp - 0xf4]
0x10005dae2: jmp 0x10005db40 ; 0x10005db40
0x10005dae4: cmp dword ptr [rbp - 0x34], 0
0x10005dae8: mov edx, dword ptr [rbp - 0x4c]
0x10005daeb: cmovs edx, dword ptr [rbp - 0x44]
0x10005daef: test byte ptr [rbp - 0x29], 1
0x10005daf3: cmove edx, ebx
0x10005daf6: mov rcx, qword ptr [rbp - 0x200]
0x10005dafd: mov esi, ecx
0x10005daff: mov edi, dword ptr [rbp - 0xf0]
0x10005db05: jmp 0x10005db40 ; 0x10005db40
0x10005db07: test byte ptr [rbp - 0x29], 1
0x10005db0b: mov edx, ebx
0x10005db0d: cmovne edx, dword ptr [rbp - 0x44]
0x10005db11: mov esi, dword ptr [rbp - 0x104]
0x10005db17: mov edi, dword ptr [rbp - 0x100]
0x10005db1d: jmp 0x10005db40 ; 0x10005db40
0x10005db1f: test byte ptr [rbp - 0x29], 1
0x10005db23: mov edx, ebx
0x10005db25: cmovne edx, dword ptr [rbp - 0x4c]
0x10005db29: mov esi, dword ptr [rbp - 0xfc]
0x10005db2f: mov edi, dword ptr [rbp - 0xf8]
0x10005db35: nop word ptr cs:[rax + rax]
0x10005db40: imul esi, r11d
0x10005db44: add esi, edi
0x10005db46: imul esi, r11d
0x10005db4a: add edx, dword ptr [rbp - 0x74]
0x10005db4d: add edx, esi
0x10005db4f: mov ecx, eax
0x10005db51: or ecx, 1
0x10005db54: mov rsi, qword ptr [rbp - 0xa8]
0x10005db5b: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005db62: mov esi, r10d
0x10005db65: mov edx, ebx
0x10005db67: mov edi, r12d
0x10005db6a: cmp byte ptr [rbp - 0x5b], 0
0x10005db6e: je 0x10005de90
0x10005db74: mov esi, r10d
0x10005db77: mov rcx, qword ptr [rbp - 0x68]
0x10005db7b: mov edx, ecx
0x10005db7d: mov edi, dword ptr [rbp - 0x34]
0x10005db80: cmp r10d, 5
0x10005db84: ja 0x10005de90
0x10005db8a: mov ecx, r10d
0x10005db8d: lea rdx, [rip + 0x2dac] ; 0x100060940
0x10005db94: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005db98: add rcx, rdx
0x10005db9b: jmp rcx
0x10005db9d: mov esi, dword ptr [rbp - 0x34]
0x10005dba0: test esi, esi
0x10005dba2: mov edi, dword ptr [rbp - 0x48]
0x10005dba5: cmovs edi, dword ptr [rbp - 0x50]
0x10005dba9: movzx ecx, byte ptr [rbp - 0x29]
0x10005dbad: and cl, 1
0x10005dbb0: mov rdx, qword ptr [rbp - 0x68]
0x10005dbb4: cmovne edx, dword ptr [rbp - 0xb0]
0x10005dbbb: test cl, cl
0x10005dbbd: cmove edi, esi
0x10005dbc0: mov esi, dword ptr [rbp - 0x10c]
0x10005dbc6: jmp 0x10005de90 ; 0x10005de90
0x10005dbcb: cmp dword ptr [rbp - 0x34], 0
0x10005dbcf: mov esi, dword ptr [rbp - 0x50]
0x10005dbd2: cmovs esi, dword ptr [rbp - 0x48]
0x10005dbd6: mov edi, dword ptr [rbp - 0x8c]
0x10005dbdc: mov edx, dword ptr [rbp - 0xb4]
0x10005dbe2: test byte ptr [rbp - 0x29], 1
0x10005dbe6: jne 0x10005dd40
0x10005dbec: mov rcx, qword ptr [rbp - 0x68]
0x10005dbf0: cmp ecx, r11d
0x10005dbf3: mov ebx, dword ptr [rbp - 0x70]
0x10005dbf6: mov esi, ebx
0x10005dbf8: cmovb esi, dword ptr [rbp - 0x34]
0x10005dbfc: test ecx, ecx
0x10005dbfe: mov edi, dword ptr [rbp - 0xec]
0x10005dc04: mov ecx, 5
0x10005dc09: jmp 0x10005dd2a ; 0x10005dd2a
0x10005dc0e: cmp dword ptr [rbp - 0x68], 0
0x10005dc12: sets cl
0x10005dc15: cmp dword ptr [rbp - 0x34], 0
0x10005dc19: mov edx, dword ptr [rbp - 0x48]
0x10005dc1c: mov esi, dword ptr [rbp - 0x50]
0x10005dc1f: cmovs edx, esi
0x10005dc22: movzx ebx, byte ptr [rbp - 0x29]
0x10005dc26: or cl, bl
0x10005dc28: and bl, 1
0x10005dc2b: cmovne esi, dword ptr [rbp - 0xb4]
0x10005dc32: test bl, bl
0x10005dc34: mov ebx, dword ptr [rbp - 0x30]
0x10005dc37: cmove edx, dword ptr [rbp - 0x70]
0x10005dc3b: mov edi, dword ptr [rbp - 0x114]
0x10005dc41: test cl, 1
0x10005dc44: jne 0x10005dd40
0x10005dc4a: mov rcx, qword ptr [rbp - 0x68]
0x10005dc4e: cmp ecx, r11d
0x10005dc51: mov edx, dword ptr [rbp - 0xac]
0x10005dc57: cmovb edx, ecx
0x10005dc5a: mov esi, dword ptr [rbp - 0x48]
0x10005dc5d: cmovb esi, dword ptr [rbp - 0x34]
0x10005dc61: mov edi, dword ptr [rbp - 0x1d4]
0x10005dc67: jmp 0x10005dd40 ; 0x10005dd40
0x10005dc6c: cmp dword ptr [rbp - 0x68], 0
0x10005dc70: sets cl
0x10005dc73: cmp dword ptr [rbp - 0x34], 0
0x10005dc77: mov edx, dword ptr [rbp - 0x50]
0x10005dc7a: mov esi, dword ptr [rbp - 0x48]
0x10005dc7d: cmovs edx, esi
0x10005dc80: movzx ebx, byte ptr [rbp - 0x29]
0x10005dc84: or cl, bl
0x10005dc86: and bl, 1
0x10005dc89: cmovne esi, dword ptr [rbp - 0xb0]
0x10005dc90: test bl, bl
0x10005dc92: mov ebx, dword ptr [rbp - 0x30]
0x10005dc95: cmove edx, dword ptr [rbp - 0xac]
0x10005dc9c: mov edi, dword ptr [rbp - 0x110]
0x10005dca2: test cl, 1
0x10005dca5: jne 0x10005dd40
0x10005dcab: mov rcx, qword ptr [rbp - 0x68]
0x10005dcaf: cmp ecx, r11d
0x10005dcb2: mov edx, dword ptr [rbp - 0x70]
0x10005dcb5: cmovb edx, ecx
0x10005dcb8: mov esi, dword ptr [rbp - 0x50]
0x10005dcbb: cmovb esi, dword ptr [rbp - 0x34]
0x10005dcbf: mov edi, dword ptr [rbp - 0xe8]
0x10005dcc5: jmp 0x10005dd40 ; 0x10005dd40
0x10005dcc7: mov edi, dword ptr [rbp - 0x8c]
0x10005dccd: mov edx, dword ptr [rbp - 0x48]
0x10005dcd0: mov esi, dword ptr [rbp - 0x70]
0x10005dcd3: test byte ptr [rbp - 0x29], 1
0x10005dcd7: jne 0x10005dd40
0x10005dcd9: mov rcx, qword ptr [rbp - 0x68]
0x10005dcdd: cmp ecx, r11d
0x10005dce0: mov ebx, dword ptr [rbp - 0x70]
0x10005dce3: mov esi, ebx
0x10005dce5: cmovb esi, dword ptr [rbp - 0x34]
0x10005dce9: test ecx, ecx
0x10005dceb: mov edi, dword ptr [rbp - 0x1d0]
0x10005dcf1: mov ecx, 1
0x10005dcf6: jmp 0x10005dd2a ; 0x10005dd2a
0x10005dcf8: mov edi, dword ptr [rbp - 0x8c]
0x10005dcfe: mov edx, dword ptr [rbp - 0x50]
0x10005dd01: mov esi, dword ptr [rbp - 0xac]
0x10005dd07: test byte ptr [rbp - 0x29], 1
0x10005dd0b: jne 0x10005dd40
0x10005dd0d: mov rcx, qword ptr [rbp - 0x68]
0x10005dd11: cmp ecx, r11d
0x10005dd14: mov ebx, dword ptr [rbp - 0x70]
0x10005dd17: mov esi, ebx
0x10005dd19: cmovb esi, dword ptr [rbp - 0x34]
0x10005dd1d: test ecx, ecx
0x10005dd1f: mov edi, dword ptr [rbp - 0x1cc]
0x10005dd25: mov ecx, 0
0x10005dd2a: cmovs edi, ecx
0x10005dd2d: mov edx, dword ptr [rbp - 0x9c]
0x10005dd33: cmovs edx, dword ptr [rbp - 0x48]
0x10005dd37: cmovs esi, ebx
0x10005dd3a: mov ebx, dword ptr [rbp - 0x30]
0x10005dd3d: nop dword ptr [rax]
0x10005dd40: imul edi, r11d
0x10005dd44: add edi, esi
0x10005dd46: imul edi, r11d
0x10005dd4a: add edx, dword ptr [rbp - 0x74]
0x10005dd4d: add edx, edi
0x10005dd4f: mov ecx, eax
0x10005dd51: or ecx, 2
0x10005dd54: mov rsi, qword ptr [rbp - 0xa8]
0x10005dd5b: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005dd62: mov edx, r10d
0x10005dd65: mov edi, dword ptr [rbp - 0x34]
0x10005dd68: mov esi, r8d
0x10005dd6b: cmp byte ptr [rbp - 0x51], 0
0x10005dd6f: jne 0x10005e130
0x10005dd75: mov edx, r10d
0x10005dd78: mov edi, dword ptr [rbp - 0x34]
0x10005dd7b: mov esi, r8d
0x10005dd7e: cmp r10d, 5
0x10005dd82: ja 0x10005e130
0x10005dd88: mov ecx, r10d
0x10005dd8b: lea rdx, [rip + 0x2c26] ; 0x1000609b8
0x10005dd92: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005dd96: add rcx, rdx
0x10005dd99: jmp rcx
0x10005dd9b: cmp dword ptr [rbp - 0x34], 0
0x10005dd9f: mov edi, dword ptr [rbp - 0x40]
0x10005dda2: cmovs edi, dword ptr [rbp - 0x58]
0x10005dda6: mov edx, dword ptr [rbp - 0x8c]
0x10005ddac: mov esi, dword ptr [rbp - 0xb0]
0x10005ddb2: test byte ptr [rbp - 0x29], 1
0x10005ddb6: jne 0x10005e130
0x10005ddbc: cmp r8d, r11d
0x10005ddbf: mov ebx, dword ptr [rbp - 0x70]
0x10005ddc2: mov edi, ebx
0x10005ddc4: cmovb edi, dword ptr [rbp - 0x34]
0x10005ddc8: test r8d, r8d
0x10005ddcb: mov edx, dword ptr [rbp - 0x1f0]
0x10005ddd1: mov ecx, 4
0x10005ddd6: jmp 0x10005e06a ; 0x10005e06a
0x10005dddb: mov esi, dword ptr [rbp - 0x34]
0x10005ddde: test esi, esi
0x10005dde0: mov edi, dword ptr [rbp - 0x50]
0x10005dde3: cmovs edi, dword ptr [rbp - 0x48]
0x10005dde7: movzx ecx, byte ptr [rbp - 0x29]
0x10005ddeb: and cl, 1
0x10005ddee: mov rdx, qword ptr [rbp - 0x68]
0x10005ddf2: cmovne edx, dword ptr [rbp - 0xb4]
0x10005ddf9: test cl, cl
0x10005ddfb: cmove edi, esi
0x10005ddfe: mov esi, dword ptr [rbp - 0x108]
0x10005de04: jmp 0x10005de90 ; 0x10005de90
0x10005de09: cmp dword ptr [rbp - 0x34], 0
0x10005de0d: mov edx, dword ptr [rbp - 0x48]
0x10005de10: cmovs edx, dword ptr [rbp - 0x50]
0x10005de14: test byte ptr [rbp - 0x29], 1
0x10005de18: cmove edx, dword ptr [rbp - 0x68]
0x10005de1c: mov esi, dword ptr [rbp - 0xe4]
0x10005de22: mov edi, dword ptr [rbp - 0xf4]
0x10005de28: jmp 0x10005de90 ; 0x10005de90
0x10005de2a: cmp dword ptr [rbp - 0x34], 0
0x10005de2e: mov edx, dword ptr [rbp - 0x50]
0x10005de31: cmovs edx, dword ptr [rbp - 0x48]
0x10005de35: test byte ptr [rbp - 0x29], 1
0x10005de39: cmove edx, dword ptr [rbp - 0x68]
0x10005de3d: mov rcx, qword ptr [rbp - 0x200]
0x10005de44: mov esi, ecx
0x10005de46: mov edi, dword ptr [rbp - 0xf0]
0x10005de4c: jmp 0x10005de90 ; 0x10005de90
0x10005de4e: test byte ptr [rbp - 0x29], 1
0x10005de52: mov rcx, qword ptr [rbp - 0x68]
0x10005de56: mov edx, ecx
0x10005de58: cmovne edx, dword ptr [rbp - 0x48]
0x10005de5c: mov esi, dword ptr [rbp - 0x104]
0x10005de62: mov edi, dword ptr [rbp - 0x100]
0x10005de68: jmp 0x10005de90 ; 0x10005de90
0x10005de6a: test byte ptr [rbp - 0x29], 1
0x10005de6e: mov rcx, qword ptr [rbp - 0x68]
0x10005de72: mov edx, ecx
0x10005de74: cmovne edx, dword ptr [rbp - 0x50]
0x10005de78: mov esi, dword ptr [rbp - 0xfc]
0x10005de7e: mov edi, dword ptr [rbp - 0xf8]
0x10005de84: nop word ptr cs:[rax + rax]
0x10005de90: imul esi, r11d
0x10005de94: add esi, edi
0x10005de96: imul esi, r11d
0x10005de9a: add edx, dword ptr [rbp - 0x74]
0x10005de9d: add edx, esi
0x10005de9f: mov ecx, eax
0x10005dea1: or ecx, 2
0x10005dea4: mov rsi, qword ptr [rbp - 0xa8]
0x10005deab: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005deb2: mov edx, r10d
0x10005deb5: mov edi, r12d
0x10005deb8: mov esi, ebx
0x10005deba: cmp byte ptr [rbp - 0x51], 0
0x10005debe: je 0x10005e130
0x10005dec4: mov edx, r10d
0x10005dec7: mov edi, dword ptr [rbp - 0x34]
0x10005deca: mov esi, r8d
0x10005decd: cmp r10d, 5
0x10005ded1: ja 0x10005e130
0x10005ded7: mov ecx, r10d
0x10005deda: lea rdx, [rip + 0x2a77] ; 0x100060958
0x10005dee1: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005dee5: add rcx, rdx
0x10005dee8: jmp rcx
0x10005deea: mov edx, dword ptr [rbp - 0x34]
0x10005deed: test edx, edx
0x10005deef: mov edi, dword ptr [rbp - 0x40]
0x10005def2: cmovs edi, dword ptr [rbp - 0x58]
0x10005def6: movzx ecx, byte ptr [rbp - 0x29]
0x10005defa: and cl, 1
0x10005defd: mov esi, r8d
0x10005df00: cmovne esi, dword ptr [rbp - 0xb0]
0x10005df07: test cl, cl
0x10005df09: cmove edi, edx
0x10005df0c: mov edx, dword ptr [rbp - 0x10c]
0x10005df12: jmp 0x10005e130 ; 0x10005e130
0x10005df17: cmp dword ptr [rbp - 0x34], 0
0x10005df1b: mov edi, dword ptr [rbp - 0x58]
0x10005df1e: cmovs edi, dword ptr [rbp - 0x40]
0x10005df22: mov edx, dword ptr [rbp - 0x8c]
0x10005df28: mov esi, dword ptr [rbp - 0xb4]
0x10005df2e: test byte ptr [rbp - 0x29], 1
0x10005df32: jne 0x10005e130
0x10005df38: cmp r8d, r11d
0x10005df3b: mov ebx, dword ptr [rbp - 0x70]
0x10005df3e: mov edi, ebx
0x10005df40: cmovb edi, dword ptr [rbp - 0x34]
0x10005df44: test r8d, r8d
0x10005df47: mov edx, dword ptr [rbp - 0x1ec]
0x10005df4d: mov ecx, 5
0x10005df52: jmp 0x10005e06a ; 0x10005e06a
0x10005df57: test r8d, r8d
0x10005df5a: sets cl
0x10005df5d: cmp dword ptr [rbp - 0x34], 0
0x10005df61: mov esi, dword ptr [rbp - 0x40]
0x10005df64: mov edi, dword ptr [rbp - 0x58]
0x10005df67: cmovs esi, edi
0x10005df6a: movzx edx, byte ptr [rbp - 0x29]
0x10005df6e: or cl, dl
0x10005df70: and dl, 1
0x10005df73: cmovne edi, dword ptr [rbp - 0xb4]
0x10005df7a: test dl, dl
0x10005df7c: cmove esi, dword ptr [rbp - 0x70]
0x10005df80: mov edx, dword ptr [rbp - 0x114]
0x10005df86: test cl, 1
0x10005df89: jne 0x10005e130
0x10005df8f: cmp r8d, r11d
0x10005df92: mov esi, dword ptr [rbp - 0xac]
0x10005df98: cmovb esi, r8d
0x10005df9c: mov edi, dword ptr [rbp - 0x40]
0x10005df9f: cmovb edi, dword ptr [rbp - 0x34]
0x10005dfa3: mov edx, dword ptr [rbp - 0x1e4]
0x10005dfa9: jmp 0x10005e130 ; 0x10005e130
0x10005dfae: test r8d, r8d
0x10005dfb1: sets cl
0x10005dfb4: cmp dword ptr [rbp - 0x34], 0
0x10005dfb8: mov esi, dword ptr [rbp - 0x58]
0x10005dfbb: mov edi, dword ptr [rbp - 0x40]
0x10005dfbe: cmovs esi, edi
0x10005dfc1: movzx edx, byte ptr [rbp - 0x29]
0x10005dfc5: or cl, dl
0x10005dfc7: and dl, 1
0x10005dfca: cmovne edi, dword ptr [rbp - 0xb0]
0x10005dfd1: test dl, dl
0x10005dfd3: cmove esi, dword ptr [rbp - 0xac]
0x10005dfda: mov edx, dword ptr [rbp - 0x110]
0x10005dfe0: test cl, 1
0x10005dfe3: jne 0x10005e130
0x10005dfe9: cmp r8d, r11d
0x10005dfec: mov esi, dword ptr [rbp - 0x70]
0x10005dfef: cmovb esi, r8d
0x10005dff3: mov edi, dword ptr [rbp - 0x58]
0x10005dff6: cmovb edi, dword ptr [rbp - 0x34]
0x10005dffa: mov edx, dword ptr [rbp - 0x1e8]
0x10005e000: jmp 0x10005e130 ; 0x10005e130
0x10005e005: mov edx, dword ptr [rbp - 0x8c]
0x10005e00b: mov edi, dword ptr [rbp - 0x70]
0x10005e00e: mov esi, dword ptr [rbp - 0x40]
0x10005e011: test byte ptr [rbp - 0x29], 1
0x10005e015: jne 0x10005e130
0x10005e01b: cmp r8d, r11d
0x10005e01e: mov ebx, dword ptr [rbp - 0x70]
0x10005e021: mov edi, ebx
0x10005e023: cmovb edi, dword ptr [rbp - 0x34]
0x10005e027: test r8d, r8d
0x10005e02a: mov edx, dword ptr [rbp - 0x1e0]
0x10005e030: mov ecx, 1
0x10005e035: jmp 0x10005e06a ; 0x10005e06a
0x10005e037: mov edx, dword ptr [rbp - 0x8c]
0x10005e03d: mov edi, dword ptr [rbp - 0xac]
0x10005e043: mov esi, dword ptr [rbp - 0x58]
0x10005e046: test byte ptr [rbp - 0x29], 1
0x10005e04a: jne 0x10005e130
0x10005e050: cmp r8d, r11d
0x10005e053: mov ebx, dword ptr [rbp - 0x70]
0x10005e056: mov edi, ebx
0x10005e058: cmovb edi, dword ptr [rbp - 0x34]
0x10005e05c: test r8d, r8d
0x10005e05f: mov edx, dword ptr [rbp - 0x1dc]
0x10005e065: mov ecx, 0
0x10005e06a: cmovs edx, ecx
0x10005e06d: mov esi, dword ptr [rbp - 0xa0]
0x10005e073: cmovs esi, dword ptr [rbp - 0x40]
0x10005e077: cmovs edi, ebx
0x10005e07a: mov ebx, dword ptr [rbp - 0x30]
0x10005e07d: jmp 0x10005e130 ; 0x10005e130
0x10005e082: mov edx, dword ptr [rbp - 0x34]
0x10005e085: test edx, edx
0x10005e087: mov edi, dword ptr [rbp - 0x58]
0x10005e08a: cmovs edi, dword ptr [rbp - 0x40]
0x10005e08e: movzx ecx, byte ptr [rbp - 0x29]
0x10005e092: and cl, 1
0x10005e095: mov esi, r8d
0x10005e098: cmovne esi, dword ptr [rbp - 0xb4]
0x10005e09f: test cl, cl
0x10005e0a1: cmove edi, edx
0x10005e0a4: mov edx, dword ptr [rbp - 0x108]
0x10005e0aa: jmp 0x10005e130 ; 0x10005e130
0x10005e0af: cmp dword ptr [rbp - 0x34], 0
0x10005e0b3: mov esi, dword ptr [rbp - 0x40]
0x10005e0b6: cmovs esi, dword ptr [rbp - 0x58]
0x10005e0ba: test byte ptr [rbp - 0x29], 1
0x10005e0be: cmove esi, r8d
0x10005e0c2: mov edx, dword ptr [rbp - 0xe4]
0x10005e0c8: mov edi, dword ptr [rbp - 0xf4]
0x10005e0ce: jmp 0x10005e130 ; 0x10005e130
0x10005e0d0: cmp dword ptr [rbp - 0x34], 0
0x10005e0d4: mov esi, dword ptr [rbp - 0x58]
0x10005e0d7: cmovs esi, dword ptr [rbp - 0x40]
0x10005e0db: test byte ptr [rbp - 0x29], 1
0x10005e0df: cmove esi, r8d
0x10005e0e3: mov rcx, qword ptr [rbp - 0x200]
0x10005e0ea: mov edx, ecx
0x10005e0ec: mov edi, dword ptr [rbp - 0xf0]
0x10005e0f2: jmp 0x10005e130 ; 0x10005e130
0x10005e0f4: test byte ptr [rbp - 0x29], 1
0x10005e0f8: mov esi, r8d
0x10005e0fb: cmovne esi, dword ptr [rbp - 0x40]
0x10005e0ff: mov edx, dword ptr [rbp - 0x104]
0x10005e105: mov edi, dword ptr [rbp - 0x100]
0x10005e10b: jmp 0x10005e130 ; 0x10005e130
0x10005e10d: test byte ptr [rbp - 0x29], 1
0x10005e111: mov esi, r8d
0x10005e114: cmovne esi, dword ptr [rbp - 0x58]
0x10005e118: mov edx, dword ptr [rbp - 0xfc]
0x10005e11e: mov edi, dword ptr [rbp - 0xf8]
0x10005e124: nop word ptr cs:[rax + rax]
0x10005e130: imul edx, r11d
0x10005e134: add edx, edi
0x10005e136: imul edx, r11d
0x10005e13a: add esi, dword ptr [rbp - 0x74]
0x10005e13d: add esi, edx
0x10005e13f: or eax, 3
0x10005e142: mov rcx, qword ptr [rbp - 0xa8]
0x10005e149: mov dword ptr [rcx + rax*4 + 0x914], esi
0x10005e150: lea eax, [r14 - 0x17ffc]
0x10005e157: cmp byte ptr [rbp - 0xdf], 0
0x10005e15e: je 0x10005e1e0
0x10005e164: mov edi, r10d
0x10005e167: mov ecx, dword ptr [rbp - 0x3c]
0x10005e16a: mov edx, ecx
0x10005e16c: mov esi, r12d
0x10005e16f: cmp byte ptr [rbp - 0x59], 0
0x10005e173: jne 0x10005e3f0
0x10005e179: mov edi, r10d
0x10005e17c: mov edx, ecx
0x10005e17e: mov esi, r12d
0x10005e181: cmp r10d, 5
0x10005e185: ja 0x10005e3f0
0x10005e18b: mov ecx, r10d
0x10005e18e: lea rdx, [rip + 0x289b] ; 0x100060a30
0x10005e195: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005e199: add rcx, rdx
0x10005e19c: jmp rcx
0x10005e19e: test r12d, r12d
0x10005e1a1: mov esi, r13d
0x10005e1a4: cmovs esi, dword ptr [rbp - 0x88]
0x10005e1ab: mov edi, dword ptr [rbp - 0x6c]
0x10005e1ae: mov edx, dword ptr [rbp - 0xd8]
0x10005e1b4: test byte ptr [rbp - 0x2c], 1
0x10005e1b8: mov ecx, dword ptr [rbp - 0x3c]
0x10005e1bb: jne 0x10005e3f0
0x10005e1c1: cmp ecx, r11d
0x10005e1c4: mov ebx, dword ptr [rbp - 0x7c]
0x10005e1c7: mov esi, ebx
0x10005e1c9: cmovb esi, r12d
0x10005e1cd: test ecx, ecx
0x10005e1cf: mov edi, dword ptr [rbp - 0x1b8]
0x10005e1d5: mov ecx, 4
0x10005e1da: jmp 0x10005e3d3 ; 0x10005e3d3
0x10005e1df: nop 
0x10005e1e0: mov esi, r10d
0x10005e1e3: mov edx, ebx
0x10005e1e5: mov edi, r12d
0x10005e1e8: cmp byte ptr [rbp - 0x59], 0
0x10005e1ec: je 0x10005e530
0x10005e1f2: mov esi, r10d
0x10005e1f5: mov edx, dword ptr [rbp - 0x3c]
0x10005e1f8: mov edi, r12d
0x10005e1fb: cmp r10d, 5
0x10005e1ff: ja 0x10005e530
0x10005e205: mov ecx, r10d
0x10005e208: lea rdx, [rip + 0x27c1] ; 0x1000609d0
0x10005e20f: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005e213: add rcx, rdx
0x10005e216: jmp rcx
0x10005e218: test r12d, r12d
0x10005e21b: mov edi, r13d
0x10005e21e: cmovs edi, dword ptr [rbp - 0x88]
0x10005e225: movzx ecx, byte ptr [rbp - 0x2c]
0x10005e229: and cl, 1
0x10005e22c: mov edx, dword ptr [rbp - 0x3c]
0x10005e22f: cmovne edx, dword ptr [rbp - 0xd8]
0x10005e236: test cl, cl
0x10005e238: cmove edi, r12d
0x10005e23c: mov esi, dword ptr [rbp - 0x174]
0x10005e242: jmp 0x10005e530 ; 0x10005e530
0x10005e247: test r12d, r12d
0x10005e24a: mov esi, dword ptr [rbp - 0x88]
0x10005e250: cmovs esi, r13d
0x10005e254: mov edi, dword ptr [rbp - 0x6c]
0x10005e257: mov edx, dword ptr [rbp - 0xd4]
0x10005e25d: test byte ptr [rbp - 0x2c], 1
0x10005e261: mov ecx, dword ptr [rbp - 0x3c]
0x10005e264: jne 0x10005e3f0
0x10005e26a: cmp ecx, r11d
0x10005e26d: mov ebx, dword ptr [rbp - 0x7c]
0x10005e270: mov esi, ebx
0x10005e272: cmovb esi, r12d
0x10005e276: test ecx, ecx
0x10005e278: mov edi, dword ptr [rbp - 0x208]
0x10005e27e: mov ecx, 5
0x10005e283: jmp 0x10005e3d3 ; 0x10005e3d3
0x10005e288: mov dword ptr [rbp - 0xdc], r15d
0x10005e28f: mov r15d, r13d
0x10005e292: mov r13d, dword ptr [rbp - 0x3c]
0x10005e296: test r13d, r13d
0x10005e299: sets cl
0x10005e29c: test r12d, r12d
0x10005e29f: mov edx, r15d
0x10005e2a2: mov esi, dword ptr [rbp - 0x88]
0x10005e2a8: cmovs edx, esi
0x10005e2ab: movzx ebx, byte ptr [rbp - 0x2c]
0x10005e2af: or cl, bl
0x10005e2b1: and bl, 1
0x10005e2b4: cmovne esi, dword ptr [rbp - 0xd4]
0x10005e2bb: test bl, bl
0x10005e2bd: mov ebx, dword ptr [rbp - 0x30]
0x10005e2c0: cmove edx, dword ptr [rbp - 0x7c]
0x10005e2c4: mov edi, dword ptr [rbp - 0x16c]
0x10005e2ca: test cl, 1
0x10005e2cd: mov ecx, r13d
0x10005e2d0: mov r13d, r15d
0x10005e2d3: mov r15d, dword ptr [rbp - 0xdc]
0x10005e2da: jne 0x10005e3f0
0x10005e2e0: cmp ecx, r11d
0x10005e2e3: mov edx, dword ptr [rbp - 0xc4]
0x10005e2e9: cmovb edx, ecx
0x10005e2ec: mov esi, r13d
0x10005e2ef: cmovb esi, r12d
0x10005e2f3: mov edi, dword ptr [rbp - 0x1b0]
0x10005e2f9: jmp 0x10005e3f0 ; 0x10005e3f0
0x10005e2fe: mov dword ptr [rbp - 0xdc], r15d
0x10005e305: mov r15d, r13d
0x10005e308: mov r13d, dword ptr [rbp - 0x3c]
0x10005e30c: test r13d, r13d
0x10005e30f: sets cl
0x10005e312: test r12d, r12d
0x10005e315: mov edx, dword ptr [rbp - 0x88]
0x10005e31b: cmovs edx, r15d
0x10005e31f: movzx ebx, byte ptr [rbp - 0x2c]
0x10005e323: or cl, bl
0x10005e325: and bl, 1
0x10005e328: mov esi, r15d
0x10005e32b: cmovne esi, dword ptr [rbp - 0xd8]
0x10005e332: test bl, bl
0x10005e334: mov ebx, dword ptr [rbp - 0x30]
0x10005e337: cmove edx, dword ptr [rbp - 0xc4]
0x10005e33e: mov edi, dword ptr [rbp - 0x170]
0x10005e344: test cl, 1
0x10005e347: mov ecx, r13d
0x10005e34a: mov r13d, r15d
0x10005e34d: mov r15d, dword ptr [rbp - 0xdc]
0x10005e354: jne 0x10005e3f0
0x10005e35a: cmp ecx, r11d
0x10005e35d: mov edx, dword ptr [rbp - 0x7c]
0x10005e360: cmovb edx, ecx
0x10005e363: mov esi, dword ptr [rbp - 0x88]
0x10005e369: cmovb esi, r12d
0x10005e36d: mov edi, dword ptr [rbp - 0x1b4]
0x10005e373: jmp 0x10005e3f0 ; 0x10005e3f0
0x10005e375: mov edi, dword ptr [rbp - 0x6c]
0x10005e378: mov edx, r13d
0x10005e37b: mov esi, dword ptr [rbp - 0x7c]
0x10005e37e: test byte ptr [rbp - 0x2c], 1
0x10005e382: mov ecx, dword ptr [rbp - 0x3c]
0x10005e385: jne 0x10005e3f0
0x10005e387: cmp ecx, r11d
0x10005e38a: mov ebx, dword ptr [rbp - 0x7c]
0x10005e38d: mov esi, ebx
0x10005e38f: cmovb esi, r12d
0x10005e393: test ecx, ecx
0x10005e395: mov edi, dword ptr [rbp - 0x1ac]
0x10005e39b: mov ecx, 1
0x10005e3a0: jmp 0x10005e3d3 ; 0x10005e3d3
0x10005e3a2: mov edi, dword ptr [rbp - 0x6c]
0x10005e3a5: mov edx, dword ptr [rbp - 0x88]
0x10005e3ab: mov esi, dword ptr [rbp - 0xc4]
0x10005e3b1: test byte ptr [rbp - 0x2c], 1
0x10005e3b5: mov ecx, dword ptr [rbp - 0x3c]
0x10005e3b8: jne 0x10005e3f0
0x10005e3ba: cmp ecx, r11d
0x10005e3bd: mov ebx, dword ptr [rbp - 0x7c]
0x10005e3c0: mov esi, ebx
0x10005e3c2: cmovb esi, r12d
0x10005e3c6: test ecx, ecx
0x10005e3c8: mov edi, dword ptr [rbp - 0x1a8]
0x10005e3ce: mov ecx, 0
0x10005e3d3: cmovs edi, ecx
0x10005e3d6: mov edx, dword ptr [rbp - 0x94]
0x10005e3dc: cmovs edx, r13d
0x10005e3e0: cmovs esi, ebx
0x10005e3e3: mov ebx, dword ptr [rbp - 0x30]
0x10005e3e6: nop word ptr cs:[rax + rax]
0x10005e3f0: imul edi, r11d
0x10005e3f4: add edi, esi
0x10005e3f6: imul edi, r11d
0x10005e3fa: add edx, dword ptr [rbp - 0x74]
0x10005e3fd: add edx, edi
0x10005e3ff: mov ecx, eax
0x10005e401: mov rsi, qword ptr [rbp - 0xa8]
0x10005e408: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005e40f: mov edi, r10d
0x10005e412: mov edx, ebx
0x10005e414: mov esi, r12d
0x10005e417: cmp byte ptr [rbp - 0x5a], 0
0x10005e41b: jne 0x10005e710
0x10005e421: mov edi, r10d
0x10005e424: mov edx, ebx
0x10005e426: mov esi, r12d
0x10005e429: cmp r10d, 5
0x10005e42d: ja 0x10005e710
0x10005e433: mov ecx, r10d
0x10005e436: lea rdx, [rip + 0x260b] ; 0x100060a48
0x10005e43d: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005e441: add rcx, rdx
0x10005e444: jmp rcx
0x10005e446: test r12d, r12d
0x10005e449: mov esi, dword ptr [rbp - 0x44]
0x10005e44c: cmovs esi, dword ptr [rbp - 0x4c]
0x10005e450: mov edi, dword ptr [rbp - 0x6c]
0x10005e453: mov edx, dword ptr [rbp - 0xd8]
0x10005e459: test byte ptr [rbp - 0x2c], 1
0x10005e45d: jne 0x10005e710
0x10005e463: cmp ebx, r11d
0x10005e466: mov ebx, dword ptr [rbp - 0x7c]
0x10005e469: mov esi, ebx
0x10005e46b: cmovb esi, r12d
0x10005e46f: cmp dword ptr [rbp - 0x30], 0
0x10005e473: mov edi, dword ptr [rbp - 0x1a4]
0x10005e479: mov ecx, 4
0x10005e47e: jmp 0x10005e6ef ; 0x10005e6ef
0x10005e483: test r12d, r12d
0x10005e486: mov edi, dword ptr [rbp - 0x88]
0x10005e48c: cmovs edi, r13d
0x10005e490: movzx ecx, byte ptr [rbp - 0x2c]
0x10005e494: and cl, 1
0x10005e497: mov edx, dword ptr [rbp - 0x3c]
0x10005e49a: cmovne edx, dword ptr [rbp - 0xd4]
0x10005e4a1: test cl, cl
0x10005e4a3: cmove edi, r12d
0x10005e4a7: mov esi, dword ptr [rbp - 0x178]
0x10005e4ad: jmp 0x10005e530 ; 0x10005e530
0x10005e4b2: test r12d, r12d
0x10005e4b5: mov edx, r13d
0x10005e4b8: cmovs edx, dword ptr [rbp - 0x88]
0x10005e4bf: test byte ptr [rbp - 0x2c], 1
0x10005e4c3: cmove edx, dword ptr [rbp - 0x3c]
0x10005e4c7: mov esi, dword ptr [rbp - 0x190]
0x10005e4cd: mov edi, dword ptr [rbp - 0x18c]
0x10005e4d3: jmp 0x10005e530 ; 0x10005e530
0x10005e4d5: test r12d, r12d
0x10005e4d8: mov edx, dword ptr [rbp - 0x88]
0x10005e4de: cmovs edx, r13d
0x10005e4e2: test byte ptr [rbp - 0x2c], 1
0x10005e4e6: cmove edx, dword ptr [rbp - 0x3c]
0x10005e4ea: mov esi, dword ptr [rbp - 0x198]
0x10005e4f0: mov edi, dword ptr [rbp - 0x194]
0x10005e4f6: jmp 0x10005e530 ; 0x10005e530
0x10005e4f8: test byte ptr [rbp - 0x2c], 1
0x10005e4fc: mov edx, dword ptr [rbp - 0x3c]
0x10005e4ff: cmovne edx, r13d
0x10005e503: mov esi, dword ptr [rbp - 0x180]
0x10005e509: mov edi, dword ptr [rbp - 0x17c]
0x10005e50f: jmp 0x10005e530 ; 0x10005e530
0x10005e511: test byte ptr [rbp - 0x2c], 1
0x10005e515: mov edx, dword ptr [rbp - 0x3c]
0x10005e518: cmovne edx, dword ptr [rbp - 0x88]
0x10005e51f: mov esi, dword ptr [rbp - 0x188]
0x10005e525: mov edi, dword ptr [rbp - 0x184]
0x10005e52b: nop dword ptr [rax + rax]
0x10005e530: imul esi, r11d
0x10005e534: add esi, edi
0x10005e536: imul esi, r11d
0x10005e53a: add edx, dword ptr [rbp - 0x74]
0x10005e53d: add edx, esi
0x10005e53f: mov ecx, eax
0x10005e541: mov rsi, qword ptr [rbp - 0xa8]
0x10005e548: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005e54f: mov esi, r10d
0x10005e552: mov edx, ebx
0x10005e554: mov edi, r12d
0x10005e557: cmp byte ptr [rbp - 0x5a], 0
0x10005e55b: je 0x10005e850
0x10005e561: mov esi, r10d
0x10005e564: mov edx, ebx
0x10005e566: mov edi, r12d
0x10005e569: cmp r10d, 5
0x10005e56d: ja 0x10005e850
0x10005e573: mov ecx, r10d
0x10005e576: lea rdx, [rip + 0x246b] ; 0x1000609e8
0x10005e57d: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005e581: add rcx, rdx
0x10005e584: jmp rcx
0x10005e586: test r12d, r12d
0x10005e589: mov edi, dword ptr [rbp - 0x44]
0x10005e58c: cmovs edi, dword ptr [rbp - 0x4c]
0x10005e590: movzx ecx, byte ptr [rbp - 0x2c]
0x10005e594: and cl, 1
0x10005e597: mov edx, ebx
0x10005e599: cmovne edx, dword ptr [rbp - 0xd8]
0x10005e5a0: test cl, cl
0x10005e5a2: cmove edi, r12d
0x10005e5a6: mov esi, dword ptr [rbp - 0x174]
0x10005e5ac: jmp 0x10005e850 ; 0x10005e850
0x10005e5b1: test r12d, r12d
0x10005e5b4: mov esi, dword ptr [rbp - 0x4c]
0x10005e5b7: cmovs esi, dword ptr [rbp - 0x44]
0x10005e5bb: mov edi, dword ptr [rbp - 0x6c]
0x10005e5be: mov edx, dword ptr [rbp - 0xd4]
0x10005e5c4: test byte ptr [rbp - 0x2c], 1
0x10005e5c8: jne 0x10005e710
0x10005e5ce: cmp ebx, r11d
0x10005e5d1: mov ebx, dword ptr [rbp - 0x7c]
0x10005e5d4: mov esi, ebx
0x10005e5d6: cmovb esi, r12d
0x10005e5da: cmp dword ptr [rbp - 0x30], 0
0x10005e5de: mov edi, r15d
0x10005e5e1: mov ecx, 5
0x10005e5e6: jmp 0x10005e6ef ; 0x10005e6ef
0x10005e5eb: test ebx, ebx
0x10005e5ed: sets cl
0x10005e5f0: test r12d, r12d
0x10005e5f3: mov edx, dword ptr [rbp - 0x44]
0x10005e5f6: mov esi, dword ptr [rbp - 0x4c]
0x10005e5f9: cmovs edx, esi
0x10005e5fc: movzx ebx, byte ptr [rbp - 0x2c]
0x10005e600: or cl, bl
0x10005e602: and bl, 1
0x10005e605: cmovne esi, dword ptr [rbp - 0xd4]
0x10005e60c: test bl, bl
0x10005e60e: mov ebx, dword ptr [rbp - 0x30]
0x10005e611: cmove edx, dword ptr [rbp - 0x7c]
0x10005e615: mov edi, dword ptr [rbp - 0x16c]
0x10005e61b: test cl, 1
0x10005e61e: jne 0x10005e710
0x10005e624: cmp ebx, r11d
0x10005e627: mov edx, dword ptr [rbp - 0xc4]
0x10005e62d: cmovb edx, ebx
0x10005e630: mov esi, dword ptr [rbp - 0x44]
0x10005e633: cmovb esi, r12d
0x10005e637: mov edi, dword ptr [rbp - 0x1c4]
0x10005e63d: jmp 0x10005e710 ; 0x10005e710
0x10005e642: test ebx, ebx
0x10005e644: sets cl
0x10005e647: test r12d, r12d
0x10005e64a: mov edx, dword ptr [rbp - 0x4c]
0x10005e64d: mov esi, dword ptr [rbp - 0x44]
0x10005e650: cmovs edx, esi
0x10005e653: movzx ebx, byte ptr [rbp - 0x2c]
0x10005e657: or cl, bl
0x10005e659: and bl, 1
0x10005e65c: cmovne esi, dword ptr [rbp - 0xd8]
0x10005e663: test bl, bl
0x10005e665: mov ebx, dword ptr [rbp - 0x30]
0x10005e668: cmove edx, dword ptr [rbp - 0xc4]
0x10005e66f: mov edi, dword ptr [rbp - 0x170]
0x10005e675: test cl, 1
0x10005e678: jne 0x10005e710
0x10005e67e: cmp ebx, r11d
0x10005e681: mov edx, dword ptr [rbp - 0x7c]
0x10005e684: cmovb edx, ebx
0x10005e687: mov esi, dword ptr [rbp - 0x4c]
0x10005e68a: cmovb esi, r12d
0x10005e68e: mov edi, dword ptr [rbp - 0x1c8]
0x10005e694: jmp 0x10005e710 ; 0x10005e710
0x10005e696: mov edi, dword ptr [rbp - 0x6c]
0x10005e699: mov edx, dword ptr [rbp - 0x44]
0x10005e69c: mov esi, dword ptr [rbp - 0x7c]
0x10005e69f: test byte ptr [rbp - 0x2c], 1
0x10005e6a3: jne 0x10005e710
0x10005e6a5: cmp ebx, r11d
0x10005e6a8: mov ebx, dword ptr [rbp - 0x7c]
0x10005e6ab: mov esi, ebx
0x10005e6ad: cmovb esi, r12d
0x10005e6b1: cmp dword ptr [rbp - 0x30], 0
0x10005e6b5: mov edi, dword ptr [rbp - 0x1c0]
0x10005e6bb: mov ecx, 1
0x10005e6c0: jmp 0x10005e6ef ; 0x10005e6ef
0x10005e6c2: mov edi, dword ptr [rbp - 0x6c]
0x10005e6c5: mov edx, dword ptr [rbp - 0x4c]
0x10005e6c8: mov esi, dword ptr [rbp - 0xc4]
0x10005e6ce: test byte ptr [rbp - 0x2c], 1
0x10005e6d2: jne 0x10005e710
0x10005e6d4: cmp ebx, r11d
0x10005e6d7: mov ebx, dword ptr [rbp - 0x7c]
0x10005e6da: mov esi, ebx
0x10005e6dc: cmovb esi, r12d
0x10005e6e0: cmp dword ptr [rbp - 0x30], 0
0x10005e6e4: mov edi, dword ptr [rbp - 0x1bc]
0x10005e6ea: mov ecx, 0
0x10005e6ef: cmovs edi, ecx
0x10005e6f2: mov edx, dword ptr [rbp - 0x98]
0x10005e6f8: cmovs edx, dword ptr [rbp - 0x44]
0x10005e6fc: cmovs esi, ebx
0x10005e6ff: mov ebx, dword ptr [rbp - 0x30]
0x10005e702: nop word ptr cs:[rax + rax]
0x10005e710: imul edi, r11d
0x10005e714: add edi, esi
0x10005e716: imul edi, r11d
0x10005e71a: add edx, dword ptr [rbp - 0x74]
0x10005e71d: add edx, edi
0x10005e71f: mov ecx, eax
0x10005e721: or ecx, 1
0x10005e724: mov rsi, qword ptr [rbp - 0xa8]
0x10005e72b: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005e732: mov edi, r10d
0x10005e735: mov rcx, qword ptr [rbp - 0x68]
0x10005e739: mov edx, ecx
0x10005e73b: mov esi, r12d
0x10005e73e: cmp byte ptr [rbp - 0x5b], 0
0x10005e742: jne 0x10005ea40
0x10005e748: mov edi, r10d
0x10005e74b: mov rcx, qword ptr [rbp - 0x68]
0x10005e74f: mov edx, ecx
0x10005e751: mov esi, r12d
0x10005e754: cmp r10d, 5
0x10005e758: ja 0x10005ea40
0x10005e75e: mov ecx, r10d
0x10005e761: lea rdx, [rip + 0x22f8] ; 0x100060a60
0x10005e768: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005e76c: add rcx, rdx
0x10005e76f: jmp rcx
0x10005e771: test r12d, r12d
0x10005e774: mov esi, dword ptr [rbp - 0x48]
0x10005e777: cmovs esi, dword ptr [rbp - 0x50]
0x10005e77b: mov edi, dword ptr [rbp - 0x6c]
0x10005e77e: mov edx, dword ptr [rbp - 0xd8]
0x10005e784: test byte ptr [rbp - 0x2c], 1
0x10005e788: jne 0x10005ea40
0x10005e78e: mov rcx, qword ptr [rbp - 0x68]
0x10005e792: cmp ecx, r11d
0x10005e795: mov ebx, dword ptr [rbp - 0x7c]
0x10005e798: mov esi, ebx
0x10005e79a: cmovb esi, r12d
0x10005e79e: test ecx, ecx
0x10005e7a0: mov edi, dword ptr [rbp - 0x1d8]
0x10005e7a6: mov ecx, 4
0x10005e7ab: jmp 0x10005ea2d ; 0x10005ea2d
0x10005e7b0: test r12d, r12d
0x10005e7b3: mov edi, dword ptr [rbp - 0x4c]
0x10005e7b6: cmovs edi, dword ptr [rbp - 0x44]
0x10005e7ba: movzx ecx, byte ptr [rbp - 0x2c]
0x10005e7be: and cl, 1
0x10005e7c1: mov edx, ebx
0x10005e7c3: cmovne edx, dword ptr [rbp - 0xd4]
0x10005e7ca: test cl, cl
0x10005e7cc: cmove edi, r12d
0x10005e7d0: mov esi, dword ptr [rbp - 0x178]
0x10005e7d6: jmp 0x10005e850 ; 0x10005e850
0x10005e7d8: test r12d, r12d
0x10005e7db: mov edx, dword ptr [rbp - 0x44]
0x10005e7de: cmovs edx, dword ptr [rbp - 0x4c]
0x10005e7e2: test byte ptr [rbp - 0x2c], 1
0x10005e7e6: cmove edx, ebx
0x10005e7e9: mov esi, dword ptr [rbp - 0x190]
0x10005e7ef: mov edi, dword ptr [rbp - 0x18c]
0x10005e7f5: jmp 0x10005e850 ; 0x10005e850
0x10005e7f7: test r12d, r12d
0x10005e7fa: mov edx, dword ptr [rbp - 0x4c]
0x10005e7fd: cmovs edx, dword ptr [rbp - 0x44]
0x10005e801: test byte ptr [rbp - 0x2c], 1
0x10005e805: cmove edx, ebx
0x10005e808: mov esi, dword ptr [rbp - 0x198]
0x10005e80e: mov edi, dword ptr [rbp - 0x194]
0x10005e814: jmp 0x10005e850 ; 0x10005e850
0x10005e816: test byte ptr [rbp - 0x2c], 1
0x10005e81a: mov edx, ebx
0x10005e81c: cmovne edx, dword ptr [rbp - 0x44]
0x10005e820: mov esi, dword ptr [rbp - 0x180]
0x10005e826: mov edi, dword ptr [rbp - 0x17c]
0x10005e82c: jmp 0x10005e850 ; 0x10005e850
0x10005e82e: test byte ptr [rbp - 0x2c], 1
0x10005e832: mov edx, ebx
0x10005e834: cmovne edx, dword ptr [rbp - 0x4c]
0x10005e838: mov esi, dword ptr [rbp - 0x188]
0x10005e83e: mov edi, dword ptr [rbp - 0x184]
0x10005e844: nop word ptr cs:[rax + rax]
0x10005e850: imul esi, r11d
0x10005e854: add esi, edi
0x10005e856: imul esi, r11d
0x10005e85a: add edx, dword ptr [rbp - 0x74]
0x10005e85d: add edx, esi
0x10005e85f: mov ecx, eax
0x10005e861: or ecx, 1
0x10005e864: mov rsi, qword ptr [rbp - 0xa8]
0x10005e86b: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005e872: mov esi, r10d
0x10005e875: mov edx, ebx
0x10005e877: mov edi, r12d
0x10005e87a: cmp byte ptr [rbp - 0x5b], 0
0x10005e87e: je 0x10005eb80
0x10005e884: mov esi, r10d
0x10005e887: mov rcx, qword ptr [rbp - 0x68]
0x10005e88b: mov edx, ecx
0x10005e88d: mov edi, r12d
0x10005e890: cmp r10d, 5
0x10005e894: ja 0x10005eb80
0x10005e89a: mov ecx, r10d
0x10005e89d: lea rdx, [rip + 0x215c] ; 0x100060a00
0x10005e8a4: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005e8a8: add rcx, rdx
0x10005e8ab: jmp rcx
0x10005e8ad: test r12d, r12d
0x10005e8b0: mov edi, dword ptr [rbp - 0x48]
0x10005e8b3: cmovs edi, dword ptr [rbp - 0x50]
0x10005e8b7: movzx ecx, byte ptr [rbp - 0x2c]
0x10005e8bb: and cl, 1
0x10005e8be: mov rdx, qword ptr [rbp - 0x68]
0x10005e8c2: cmovne edx, dword ptr [rbp - 0xd8]
0x10005e8c9: test cl, cl
0x10005e8cb: cmove edi, r12d
0x10005e8cf: mov esi, dword ptr [rbp - 0x174]
0x10005e8d5: jmp 0x10005eb80 ; 0x10005eb80
0x10005e8da: test r12d, r12d
0x10005e8dd: mov esi, dword ptr [rbp - 0x50]
0x10005e8e0: cmovs esi, dword ptr [rbp - 0x48]
0x10005e8e4: mov edi, dword ptr [rbp - 0x6c]
0x10005e8e7: mov edx, dword ptr [rbp - 0xd4]
0x10005e8ed: test byte ptr [rbp - 0x2c], 1
0x10005e8f1: jne 0x10005ea40
0x10005e8f7: mov rcx, qword ptr [rbp - 0x68]
0x10005e8fb: cmp ecx, r11d
0x10005e8fe: mov ebx, dword ptr [rbp - 0x7c]
0x10005e901: mov esi, ebx
0x10005e903: cmovb esi, r12d
0x10005e907: test ecx, ecx
0x10005e909: mov edi, dword ptr [rbp - 0xec]
0x10005e90f: mov ecx, 5
0x10005e914: jmp 0x10005ea2d ; 0x10005ea2d
0x10005e919: cmp dword ptr [rbp - 0x68], 0
0x10005e91d: sets cl
0x10005e920: test r12d, r12d
0x10005e923: mov edx, dword ptr [rbp - 0x48]
0x10005e926: mov esi, dword ptr [rbp - 0x50]
0x10005e929: cmovs edx, esi
0x10005e92c: movzx ebx, byte ptr [rbp - 0x2c]
0x10005e930: or cl, bl
0x10005e932: and bl, 1
0x10005e935: cmovne esi, dword ptr [rbp - 0xd4]
0x10005e93c: test bl, bl
0x10005e93e: mov ebx, dword ptr [rbp - 0x30]
0x10005e941: cmove edx, dword ptr [rbp - 0x7c]
0x10005e945: mov edi, dword ptr [rbp - 0x16c]
0x10005e94b: test cl, 1
0x10005e94e: jne 0x10005ea40
0x10005e954: mov rcx, qword ptr [rbp - 0x68]
0x10005e958: cmp ecx, r11d
0x10005e95b: mov edx, dword ptr [rbp - 0xc4]
0x10005e961: cmovb edx, ecx
0x10005e964: mov esi, dword ptr [rbp - 0x48]
0x10005e967: cmovb esi, r12d
0x10005e96b: mov edi, dword ptr [rbp - 0x1d4]
0x10005e971: jmp 0x10005ea40 ; 0x10005ea40
0x10005e976: cmp dword ptr [rbp - 0x68], 0
0x10005e97a: sets cl
0x10005e97d: test r12d, r12d
0x10005e980: mov edx, dword ptr [rbp - 0x50]
0x10005e983: mov esi, dword ptr [rbp - 0x48]
0x10005e986: cmovs edx, esi
0x10005e989: movzx ebx, byte ptr [rbp - 0x2c]
0x10005e98d: or cl, bl
0x10005e98f: and bl, 1
0x10005e992: cmovne esi, dword ptr [rbp - 0xd8]
0x10005e999: test bl, bl
0x10005e99b: mov ebx, dword ptr [rbp - 0x30]
0x10005e99e: cmove edx, dword ptr [rbp - 0xc4]
0x10005e9a5: mov edi, dword ptr [rbp - 0x170]
0x10005e9ab: test cl, 1
0x10005e9ae: jne 0x10005ea40
0x10005e9b4: mov rcx, qword ptr [rbp - 0x68]
0x10005e9b8: cmp ecx, r11d
0x10005e9bb: mov edx, dword ptr [rbp - 0x7c]
0x10005e9be: cmovb edx, ecx
0x10005e9c1: mov esi, dword ptr [rbp - 0x50]
0x10005e9c4: cmovb esi, r12d
0x10005e9c8: mov edi, dword ptr [rbp - 0xe8]
0x10005e9ce: jmp 0x10005ea40 ; 0x10005ea40
0x10005e9d0: mov edi, dword ptr [rbp - 0x6c]
0x10005e9d3: mov edx, dword ptr [rbp - 0x48]
0x10005e9d6: mov esi, dword ptr [rbp - 0x7c]
0x10005e9d9: test byte ptr [rbp - 0x2c], 1
0x10005e9dd: jne 0x10005ea40
0x10005e9df: mov rcx, qword ptr [rbp - 0x68]
0x10005e9e3: cmp ecx, r11d
0x10005e9e6: mov ebx, dword ptr [rbp - 0x7c]
0x10005e9e9: mov esi, ebx
0x10005e9eb: cmovb esi, r12d
0x10005e9ef: test ecx, ecx
0x10005e9f1: mov edi, dword ptr [rbp - 0x1d0]
0x10005e9f7: mov ecx, 1
0x10005e9fc: jmp 0x10005ea2d ; 0x10005ea2d
0x10005e9fe: mov edi, dword ptr [rbp - 0x6c]
0x10005ea01: mov edx, dword ptr [rbp - 0x50]
0x10005ea04: mov esi, dword ptr [rbp - 0xc4]
0x10005ea0a: test byte ptr [rbp - 0x2c], 1
0x10005ea0e: jne 0x10005ea40
0x10005ea10: mov rcx, qword ptr [rbp - 0x68]
0x10005ea14: cmp ecx, r11d
0x10005ea17: mov ebx, dword ptr [rbp - 0x7c]
0x10005ea1a: mov esi, ebx
0x10005ea1c: cmovb esi, r12d
0x10005ea20: test ecx, ecx
0x10005ea22: mov edi, dword ptr [rbp - 0x1cc]
0x10005ea28: mov ecx, 0
0x10005ea2d: cmovs edi, ecx
0x10005ea30: mov edx, dword ptr [rbp - 0x9c]
0x10005ea36: cmovs edx, dword ptr [rbp - 0x48]
0x10005ea3a: cmovs esi, ebx
0x10005ea3d: mov ebx, dword ptr [rbp - 0x30]
0x10005ea40: imul edi, r11d
0x10005ea44: add edi, esi
0x10005ea46: imul edi, r11d
0x10005ea4a: add edx, dword ptr [rbp - 0x74]
0x10005ea4d: add edx, edi
0x10005ea4f: mov ecx, eax
0x10005ea51: or ecx, 2
0x10005ea54: mov rsi, qword ptr [rbp - 0xa8]
0x10005ea5b: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005ea62: mov edx, r10d
0x10005ea65: mov esi, r12d
0x10005ea68: mov edi, r8d
0x10005ea6b: cmp byte ptr [rbp - 0x51], 0
0x10005ea6f: jne 0x10005ee00
0x10005ea75: mov edx, r10d
0x10005ea78: mov esi, r12d
0x10005ea7b: mov edi, r8d
0x10005ea7e: cmp r10d, 5
0x10005ea82: ja 0x10005ee00
0x10005ea88: mov ecx, r10d
0x10005ea8b: lea rdx, [rip + 0x1fe6] ; 0x100060a78
0x10005ea92: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005ea96: add rcx, rdx
0x10005ea99: jmp rcx
0x10005ea9b: test r12d, r12d
0x10005ea9e: mov esi, dword ptr [rbp - 0x40]
0x10005eaa1: cmovs esi, dword ptr [rbp - 0x58]
0x10005eaa5: mov edx, dword ptr [rbp - 0x6c]
0x10005eaa8: mov edi, dword ptr [rbp - 0xd8]
0x10005eaae: test byte ptr [rbp - 0x2c], 1
0x10005eab2: jne 0x10005ee00
0x10005eab8: cmp r8d, r11d
0x10005eabb: mov ebx, dword ptr [rbp - 0x7c]
0x10005eabe: mov esi, ebx
0x10005eac0: cmovb esi, r12d
0x10005eac4: test r8d, r8d
0x10005eac7: mov edx, dword ptr [rbp - 0x1f0]
0x10005eacd: mov ecx, 4
0x10005ead2: jmp 0x10005ed4d ; 0x10005ed4d
0x10005ead7: test r12d, r12d
0x10005eada: mov edi, dword ptr [rbp - 0x50]
0x10005eadd: cmovs edi, dword ptr [rbp - 0x48]
0x10005eae1: movzx ecx, byte ptr [rbp - 0x2c]
0x10005eae5: and cl, 1
0x10005eae8: mov rdx, qword ptr [rbp - 0x68]
0x10005eaec: cmovne edx, dword ptr [rbp - 0xd4]
0x10005eaf3: test cl, cl
0x10005eaf5: cmove edi, r12d
0x10005eaf9: mov esi, dword ptr [rbp - 0x178]
0x10005eaff: jmp 0x10005eb80 ; 0x10005eb80
0x10005eb01: test r12d, r12d
0x10005eb04: mov edx, dword ptr [rbp - 0x48]
0x10005eb07: cmovs edx, dword ptr [rbp - 0x50]
0x10005eb0b: test byte ptr [rbp - 0x2c], 1
0x10005eb0f: cmove edx, dword ptr [rbp - 0x68]
0x10005eb13: mov esi, dword ptr [rbp - 0x190]
0x10005eb19: mov edi, dword ptr [rbp - 0x18c]
0x10005eb1f: jmp 0x10005eb80 ; 0x10005eb80
0x10005eb21: test r12d, r12d
0x10005eb24: mov edx, dword ptr [rbp - 0x50]
0x10005eb27: cmovs edx, dword ptr [rbp - 0x48]
0x10005eb2b: test byte ptr [rbp - 0x2c], 1
0x10005eb2f: cmove edx, dword ptr [rbp - 0x68]
0x10005eb33: mov esi, dword ptr [rbp - 0x198]
0x10005eb39: mov edi, dword ptr [rbp - 0x194]
0x10005eb3f: jmp 0x10005eb80 ; 0x10005eb80
0x10005eb41: test byte ptr [rbp - 0x2c], 1
0x10005eb45: mov rcx, qword ptr [rbp - 0x68]
0x10005eb49: mov edx, ecx
0x10005eb4b: cmovne edx, dword ptr [rbp - 0x48]
0x10005eb4f: mov esi, dword ptr [rbp - 0x180]
0x10005eb55: mov edi, dword ptr [rbp - 0x17c]
0x10005eb5b: jmp 0x10005eb80 ; 0x10005eb80
0x10005eb5d: test byte ptr [rbp - 0x2c], 1
0x10005eb61: mov rcx, qword ptr [rbp - 0x68]
0x10005eb65: mov edx, ecx
0x10005eb67: cmovne edx, dword ptr [rbp - 0x50]
0x10005eb6b: mov esi, dword ptr [rbp - 0x188]
0x10005eb71: mov edi, dword ptr [rbp - 0x184]
0x10005eb77: nop word ptr [rax + rax]
0x10005eb80: imul esi, r11d
0x10005eb84: add esi, edi
0x10005eb86: imul esi, r11d
0x10005eb8a: add edx, dword ptr [rbp - 0x74]
0x10005eb8d: add edx, esi
0x10005eb8f: mov ecx, eax
0x10005eb91: or ecx, 2
0x10005eb94: mov rsi, qword ptr [rbp - 0xa8]
0x10005eb9b: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005eba2: mov edx, r10d
0x10005eba5: mov esi, r12d
0x10005eba8: mov edi, ebx
0x10005ebaa: cmp byte ptr [rbp - 0x51], 0
0x10005ebae: je 0x10005ee00
0x10005ebb4: mov edx, r10d
0x10005ebb7: mov esi, r12d
0x10005ebba: mov edi, r8d
0x10005ebbd: cmp r10d, 5
0x10005ebc1: ja 0x10005ee00
0x10005ebc7: mov ecx, r10d
0x10005ebca: lea rdx, [rip + 0x1e47] ; 0x100060a18
0x10005ebd1: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005ebd5: add rcx, rdx
0x10005ebd8: jmp rcx
0x10005ebda: test r12d, r12d
0x10005ebdd: mov esi, dword ptr [rbp - 0x40]
0x10005ebe0: cmovs esi, dword ptr [rbp - 0x58]
0x10005ebe4: movzx ecx, byte ptr [rbp - 0x2c]
0x10005ebe8: and cl, 1
0x10005ebeb: mov edi, r8d
0x10005ebee: cmovne edi, dword ptr [rbp - 0xd8]
0x10005ebf5: test cl, cl
0x10005ebf7: cmove esi, r12d
0x10005ebfb: mov edx, dword ptr [rbp - 0x174]
0x10005ec01: jmp 0x10005ee00 ; 0x10005ee00
0x10005ec06: test r12d, r12d
0x10005ec09: mov esi, dword ptr [rbp - 0x58]
0x10005ec0c: cmovs esi, dword ptr [rbp - 0x40]
0x10005ec10: mov edx, dword ptr [rbp - 0x6c]
0x10005ec13: mov edi, dword ptr [rbp - 0xd4]
0x10005ec19: test byte ptr [rbp - 0x2c], 1
0x10005ec1d: jne 0x10005ee00
0x10005ec23: cmp r8d, r11d
0x10005ec26: mov ebx, dword ptr [rbp - 0x7c]
0x10005ec29: mov esi, ebx
0x10005ec2b: cmovb esi, r12d
0x10005ec2f: test r8d, r8d
0x10005ec32: mov edx, dword ptr [rbp - 0x1ec]
0x10005ec38: mov ecx, 5
0x10005ec3d: jmp 0x10005ed4d ; 0x10005ed4d
0x10005ec42: test r8d, r8d
0x10005ec45: sets cl
0x10005ec48: test r12d, r12d
0x10005ec4b: mov edi, dword ptr [rbp - 0x40]
0x10005ec4e: mov esi, dword ptr [rbp - 0x58]
0x10005ec51: cmovs edi, esi
0x10005ec54: movzx edx, byte ptr [rbp - 0x2c]
0x10005ec58: or cl, dl
0x10005ec5a: and dl, 1
0x10005ec5d: cmovne esi, dword ptr [rbp - 0xd4]
0x10005ec64: test dl, dl
0x10005ec66: cmove edi, dword ptr [rbp - 0x7c]
0x10005ec6a: mov edx, dword ptr [rbp - 0x16c]
0x10005ec70: test cl, 1
0x10005ec73: jne 0x10005ee00
0x10005ec79: cmp r8d, r11d
0x10005ec7c: mov edi, dword ptr [rbp - 0xc4]
0x10005ec82: cmovb edi, r8d
0x10005ec86: mov esi, dword ptr [rbp - 0x40]
0x10005ec89: cmovb esi, r12d
0x10005ec8d: mov edx, dword ptr [rbp - 0x1e4]
0x10005ec93: jmp 0x10005ee00 ; 0x10005ee00
0x10005ec98: test r8d, r8d
0x10005ec9b: sets cl
0x10005ec9e: test r12d, r12d
0x10005eca1: mov edi, dword ptr [rbp - 0x58]
0x10005eca4: mov esi, dword ptr [rbp - 0x40]
0x10005eca7: cmovs edi, esi
0x10005ecaa: movzx edx, byte ptr [rbp - 0x2c]
0x10005ecae: or cl, dl
0x10005ecb0: and dl, 1
0x10005ecb3: cmovne esi, dword ptr [rbp - 0xd8]
0x10005ecba: test dl, dl
0x10005ecbc: cmove edi, dword ptr [rbp - 0xc4]
0x10005ecc3: mov edx, dword ptr [rbp - 0x170]
0x10005ecc9: test cl, 1
0x10005eccc: jne 0x10005ee00
0x10005ecd2: cmp r8d, r11d
0x10005ecd5: mov edi, dword ptr [rbp - 0x7c]
0x10005ecd8: cmovb edi, r8d
0x10005ecdc: mov esi, dword ptr [rbp - 0x58]
0x10005ecdf: cmovb esi, r12d
0x10005ece3: mov edx, dword ptr [rbp - 0x1e8]
0x10005ece9: jmp 0x10005ee00 ; 0x10005ee00
0x10005ecee: mov edx, dword ptr [rbp - 0x6c]
0x10005ecf1: mov esi, dword ptr [rbp - 0x7c]
0x10005ecf4: mov edi, dword ptr [rbp - 0x40]
0x10005ecf7: test byte ptr [rbp - 0x2c], 1
0x10005ecfb: jne 0x10005ee00
0x10005ed01: cmp r8d, r11d
0x10005ed04: mov ebx, dword ptr [rbp - 0x7c]
0x10005ed07: mov esi, ebx
0x10005ed09: cmovb esi, r12d
0x10005ed0d: test r8d, r8d
0x10005ed10: mov edx, dword ptr [rbp - 0x1e0]
0x10005ed16: mov ecx, 1
0x10005ed1b: jmp 0x10005ed4d ; 0x10005ed4d
0x10005ed1d: mov edx, dword ptr [rbp - 0x6c]
0x10005ed20: mov esi, dword ptr [rbp - 0xc4]
0x10005ed26: mov edi, dword ptr [rbp - 0x58]
0x10005ed29: test byte ptr [rbp - 0x2c], 1
0x10005ed2d: jne 0x10005ee00
0x10005ed33: cmp r8d, r11d
0x10005ed36: mov ebx, dword ptr [rbp - 0x7c]
0x10005ed39: mov esi, ebx
0x10005ed3b: cmovb esi, r12d
0x10005ed3f: test r8d, r8d
0x10005ed42: mov edx, dword ptr [rbp - 0x1dc]
0x10005ed48: mov ecx, 0
0x10005ed4d: cmovs edx, ecx
0x10005ed50: mov edi, dword ptr [rbp - 0xa0]
0x10005ed56: cmovs edi, dword ptr [rbp - 0x40]
0x10005ed5a: cmovs esi, ebx
0x10005ed5d: mov ebx, dword ptr [rbp - 0x30]
0x10005ed60: jmp 0x10005ee00 ; 0x10005ee00
0x10005ed65: test r12d, r12d
0x10005ed68: mov esi, dword ptr [rbp - 0x58]
0x10005ed6b: cmovs esi, dword ptr [rbp - 0x40]
0x10005ed6f: movzx ecx, byte ptr [rbp - 0x2c]
0x10005ed73: and cl, 1
0x10005ed76: mov edi, r8d
0x10005ed79: cmovne edi, dword ptr [rbp - 0xd4]
0x10005ed80: test cl, cl
0x10005ed82: cmove esi, r12d
0x10005ed86: mov edx, dword ptr [rbp - 0x178]
0x10005ed8c: jmp 0x10005ee00 ; 0x10005ee00
0x10005ed8e: test r12d, r12d
0x10005ed91: mov edi, dword ptr [rbp - 0x40]
0x10005ed94: cmovs edi, dword ptr [rbp - 0x58]
0x10005ed98: test byte ptr [rbp - 0x2c], 1
0x10005ed9c: cmove edi, r8d
0x10005eda0: mov edx, dword ptr [rbp - 0x190]
0x10005eda6: mov esi, dword ptr [rbp - 0x18c]
0x10005edac: jmp 0x10005ee00 ; 0x10005ee00
0x10005edae: test r12d, r12d
0x10005edb1: mov edi, dword ptr [rbp - 0x58]
0x10005edb4: cmovs edi, dword ptr [rbp - 0x40]
0x10005edb8: test byte ptr [rbp - 0x2c], 1
0x10005edbc: cmove edi, r8d
0x10005edc0: mov edx, dword ptr [rbp - 0x198]
0x10005edc6: mov esi, dword ptr [rbp - 0x194]
0x10005edcc: jmp 0x10005ee00 ; 0x10005ee00
0x10005edce: test byte ptr [rbp - 0x2c], 1
0x10005edd2: mov edi, r8d
0x10005edd5: cmovne edi, dword ptr [rbp - 0x40]
0x10005edd9: mov edx, dword ptr [rbp - 0x180]
0x10005eddf: mov esi, dword ptr [rbp - 0x17c]
0x10005ede5: jmp 0x10005ee00 ; 0x10005ee00
0x10005ede7: test byte ptr [rbp - 0x2c], 1
0x10005edeb: mov edi, r8d
0x10005edee: cmovne edi, dword ptr [rbp - 0x58]
0x10005edf2: mov edx, dword ptr [rbp - 0x188]
0x10005edf8: mov esi, dword ptr [rbp - 0x184]
0x10005edfe: nop 
0x10005ee00: imul edx, r11d
0x10005ee04: add edx, esi
0x10005ee06: imul edx, r11d
0x10005ee0a: add edi, dword ptr [rbp - 0x74]
0x10005ee0d: add edi, edx
0x10005ee0f: or eax, 3
0x10005ee12: mov rcx, qword ptr [rbp - 0xa8]
0x10005ee19: mov dword ptr [rcx + rax*4 + 0x914], edi
0x10005ee20: lea eax, [r14 - 0x17ff8]
0x10005ee27: cmp byte ptr [rbp - 0xde], 0
0x10005ee2e: je 0x10005eeb0
0x10005ee34: mov edi, r10d
0x10005ee37: mov ecx, dword ptr [rbp - 0x3c]
0x10005ee3a: mov edx, ecx
0x10005ee3c: mov esi, dword ptr [rbp - 0x38]
0x10005ee3f: cmp byte ptr [rbp - 0x59], 0
0x10005ee43: jne 0x10005f0c0
0x10005ee49: mov edi, r10d
0x10005ee4c: mov edx, ecx
0x10005ee4e: mov esi, dword ptr [rbp - 0x38]
0x10005ee51: cmp r10d, 5
0x10005ee55: ja 0x10005f0c0
0x10005ee5b: mov ecx, r10d
0x10005ee5e: lea rdx, [rip + 0x1c8b] ; 0x100060af0
0x10005ee65: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005ee69: add rcx, rdx
0x10005ee6c: jmp rcx
0x10005ee6e: cmp dword ptr [rbp - 0x38], 0
0x10005ee72: mov esi, r13d
0x10005ee75: cmovs esi, dword ptr [rbp - 0x88]
0x10005ee7c: mov edi, dword ptr [rbp - 0x6c]
0x10005ee7f: mov edx, dword ptr [rbp - 0xbc]
0x10005ee85: test byte ptr [rbp - 0x2b], 1
0x10005ee89: mov ecx, dword ptr [rbp - 0x3c]
0x10005ee8c: jne 0x10005f0c0
0x10005ee92: cmp ecx, r11d
0x10005ee95: mov ebx, dword ptr [rbp - 0x80]
0x10005ee98: mov esi, ebx
0x10005ee9a: cmovb esi, dword ptr [rbp - 0x38]
0x10005ee9e: test ecx, ecx
0x10005eea0: mov edi, dword ptr [rbp - 0x1b8]
0x10005eea6: mov ecx, 4
0x10005eeab: jmp 0x10005f0a8 ; 0x10005f0a8
0x10005eeb0: mov esi, r10d
0x10005eeb3: mov edx, ebx
0x10005eeb5: mov edi, r12d
0x10005eeb8: cmp byte ptr [rbp - 0x59], 0
0x10005eebc: je 0x10005f200
0x10005eec2: mov esi, r10d
0x10005eec5: mov edx, dword ptr [rbp - 0x3c]
0x10005eec8: mov edi, dword ptr [rbp - 0x38]
0x10005eecb: cmp r10d, 5
0x10005eecf: ja 0x10005f200
0x10005eed5: mov ecx, r10d
0x10005eed8: lea rdx, [rip + 0x1bb1] ; 0x100060a90
0x10005eedf: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005eee3: add rcx, rdx
0x10005eee6: jmp rcx
0x10005eee8: mov esi, dword ptr [rbp - 0x38]
0x10005eeeb: test esi, esi
0x10005eeed: mov edi, r13d
0x10005eef0: cmovs edi, dword ptr [rbp - 0x88]
0x10005eef7: movzx ecx, byte ptr [rbp - 0x2b]
0x10005eefb: and cl, 1
0x10005eefe: mov edx, dword ptr [rbp - 0x3c]
0x10005ef01: cmovne edx, dword ptr [rbp - 0xbc]
0x10005ef08: test cl, cl
0x10005ef0a: cmove edi, esi
0x10005ef0d: mov esi, dword ptr [rbp - 0x144]
0x10005ef13: jmp 0x10005f200 ; 0x10005f200
0x10005ef18: cmp dword ptr [rbp - 0x38], 0
0x10005ef1c: mov esi, dword ptr [rbp - 0x88]
0x10005ef22: cmovs esi, r13d
0x10005ef26: mov edi, dword ptr [rbp - 0x6c]
0x10005ef29: mov edx, dword ptr [rbp - 0xb8]
0x10005ef2f: test byte ptr [rbp - 0x2b], 1
0x10005ef33: mov ecx, dword ptr [rbp - 0x3c]
0x10005ef36: jne 0x10005f0c0
0x10005ef3c: cmp ecx, r11d
0x10005ef3f: mov ebx, dword ptr [rbp - 0x80]
0x10005ef42: mov esi, ebx
0x10005ef44: cmovb esi, dword ptr [rbp - 0x38]
0x10005ef48: test ecx, ecx
0x10005ef4a: mov edi, dword ptr [rbp - 0x208]
0x10005ef50: mov ecx, 5
0x10005ef55: jmp 0x10005f0a8 ; 0x10005f0a8
0x10005ef5a: mov dword ptr [rbp - 0xdc], r15d
0x10005ef61: mov r15d, r13d
0x10005ef64: mov r13d, dword ptr [rbp - 0x3c]
0x10005ef68: test r13d, r13d
0x10005ef6b: sets cl
0x10005ef6e: cmp dword ptr [rbp - 0x38], 0
0x10005ef72: mov edx, r15d
0x10005ef75: mov esi, dword ptr [rbp - 0x88]
0x10005ef7b: cmovs edx, esi
0x10005ef7e: movzx ebx, byte ptr [rbp - 0x2b]
0x10005ef82: or cl, bl
0x10005ef84: and bl, 1
0x10005ef87: cmovne esi, dword ptr [rbp - 0xb8]
0x10005ef8e: test bl, bl
0x10005ef90: mov ebx, dword ptr [rbp - 0x30]
0x10005ef93: cmove edx, dword ptr [rbp - 0x80]
0x10005ef97: mov edi, dword ptr [rbp - 0x19c]
0x10005ef9d: test cl, 1
0x10005efa0: mov ecx, r13d
0x10005efa3: mov r13d, r15d
0x10005efa6: mov r15d, dword ptr [rbp - 0xdc]
0x10005efad: jne 0x10005f0c0
0x10005efb3: cmp ecx, r11d
0x10005efb6: mov edx, dword ptr [rbp - 0xc8]
0x10005efbc: cmovb edx, ecx
0x10005efbf: mov esi, r13d
0x10005efc2: cmovb esi, dword ptr [rbp - 0x38]
0x10005efc6: mov edi, dword ptr [rbp - 0x1b0]
0x10005efcc: jmp 0x10005f0c0 ; 0x10005f0c0
0x10005efd1: mov dword ptr [rbp - 0xdc], r15d
0x10005efd8: mov r15d, r13d
0x10005efdb: mov r13d, dword ptr [rbp - 0x3c]
0x10005efdf: test r13d, r13d
0x10005efe2: sets cl
0x10005efe5: cmp dword ptr [rbp - 0x38], 0
0x10005efe9: mov edx, dword ptr [rbp - 0x88]
0x10005efef: cmovs edx, r15d
0x10005eff3: movzx ebx, byte ptr [rbp - 0x2b]
0x10005eff7: or cl, bl
0x10005eff9: and bl, 1
0x10005effc: mov esi, r15d
0x10005efff: cmovne esi, dword ptr [rbp - 0xbc]
0x10005f006: test bl, bl
0x10005f008: mov ebx, dword ptr [rbp - 0x30]
0x10005f00b: cmove edx, dword ptr [rbp - 0xc8]
0x10005f012: mov rdi, qword ptr [rbp - 0x220]
0x10005f019: test cl, 1
0x10005f01c: mov ecx, r13d
0x10005f01f: mov r13d, r15d
0x10005f022: mov r15d, dword ptr [rbp - 0xdc]
0x10005f029: jne 0x10005f0c0
0x10005f02f: cmp ecx, r11d
0x10005f032: mov edx, dword ptr [rbp - 0x80]
0x10005f035: cmovb edx, ecx
0x10005f038: mov esi, dword ptr [rbp - 0x88]
0x10005f03e: cmovb esi, dword ptr [rbp - 0x38]
0x10005f042: mov edi, dword ptr [rbp - 0x1b4]
0x10005f048: jmp 0x10005f0c0 ; 0x10005f0c0
0x10005f04a: mov edi, dword ptr [rbp - 0x6c]
0x10005f04d: mov edx, r13d
0x10005f050: mov esi, dword ptr [rbp - 0x80]
0x10005f053: test byte ptr [rbp - 0x2b], 1
0x10005f057: mov ecx, dword ptr [rbp - 0x3c]
0x10005f05a: jne 0x10005f0c0
0x10005f05c: cmp ecx, r11d
0x10005f05f: mov ebx, dword ptr [rbp - 0x80]
0x10005f062: mov esi, ebx
0x10005f064: cmovb esi, dword ptr [rbp - 0x38]
0x10005f068: test ecx, ecx
0x10005f06a: mov edi, dword ptr [rbp - 0x1ac]
0x10005f070: mov ecx, 1
0x10005f075: jmp 0x10005f0a8 ; 0x10005f0a8
0x10005f077: mov edi, dword ptr [rbp - 0x6c]
0x10005f07a: mov edx, dword ptr [rbp - 0x88]
0x10005f080: mov esi, dword ptr [rbp - 0xc8]
0x10005f086: test byte ptr [rbp - 0x2b], 1
0x10005f08a: mov ecx, dword ptr [rbp - 0x3c]
0x10005f08d: jne 0x10005f0c0
0x10005f08f: cmp ecx, r11d
0x10005f092: mov ebx, dword ptr [rbp - 0x80]
0x10005f095: mov esi, ebx
0x10005f097: cmovb esi, dword ptr [rbp - 0x38]
0x10005f09b: test ecx, ecx
0x10005f09d: mov edi, dword ptr [rbp - 0x1a8]
0x10005f0a3: mov ecx, 0
0x10005f0a8: cmovs edi, ecx
0x10005f0ab: mov edx, dword ptr [rbp - 0x94]
0x10005f0b1: cmovs edx, r13d
0x10005f0b5: cmovs esi, ebx
0x10005f0b8: mov ebx, dword ptr [rbp - 0x30]
0x10005f0bb: nop dword ptr [rax + rax]
0x10005f0c0: imul edi, r11d
0x10005f0c4: add edi, esi
0x10005f0c6: imul edi, r11d
0x10005f0ca: add edx, dword ptr [rbp - 0x74]
0x10005f0cd: add edx, edi
0x10005f0cf: mov ecx, eax
0x10005f0d1: mov rsi, qword ptr [rbp - 0xa8]
0x10005f0d8: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005f0df: mov edi, r10d
0x10005f0e2: mov edx, ebx
0x10005f0e4: mov esi, dword ptr [rbp - 0x38]
0x10005f0e7: cmp byte ptr [rbp - 0x5a], 0
0x10005f0eb: jne 0x10005f3e0
0x10005f0f1: mov edi, r10d
0x10005f0f4: mov edx, ebx
0x10005f0f6: mov esi, dword ptr [rbp - 0x38]
0x10005f0f9: cmp r10d, 5
0x10005f0fd: ja 0x10005f3e0
0x10005f103: mov ecx, r10d
0x10005f106: lea rdx, [rip + 0x19fb] ; 0x100060b08
0x10005f10d: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005f111: add rcx, rdx
0x10005f114: jmp rcx
0x10005f116: cmp dword ptr [rbp - 0x38], 0
0x10005f11a: mov esi, dword ptr [rbp - 0x44]
0x10005f11d: cmovs esi, dword ptr [rbp - 0x4c]
0x10005f121: mov edi, dword ptr [rbp - 0x6c]
0x10005f124: mov edx, dword ptr [rbp - 0xbc]
0x10005f12a: test byte ptr [rbp - 0x2b], 1
0x10005f12e: jne 0x10005f3e0
0x10005f134: cmp ebx, r11d
0x10005f137: mov ebx, dword ptr [rbp - 0x80]
0x10005f13a: mov esi, ebx
0x10005f13c: cmovb esi, dword ptr [rbp - 0x38]
0x10005f140: cmp dword ptr [rbp - 0x30], 0
0x10005f144: mov edi, dword ptr [rbp - 0x1a4]
0x10005f14a: mov ecx, 4
0x10005f14f: jmp 0x10005f3c4 ; 0x10005f3c4
0x10005f154: mov esi, dword ptr [rbp - 0x38]
0x10005f157: test esi, esi
0x10005f159: mov edi, dword ptr [rbp - 0x88]
0x10005f15f: cmovs edi, r13d
0x10005f163: movzx ecx, byte ptr [rbp - 0x2b]
0x10005f167: and cl, 1
0x10005f16a: mov edx, dword ptr [rbp - 0x3c]
0x10005f16d: cmovne edx, dword ptr [rbp - 0xb8]
0x10005f174: test cl, cl
0x10005f176: cmove edi, esi
0x10005f179: mov esi, dword ptr [rbp - 0x148]
0x10005f17f: jmp 0x10005f200 ; 0x10005f200
0x10005f181: cmp dword ptr [rbp - 0x38], 0
0x10005f185: mov edx, r13d
0x10005f188: cmovs edx, dword ptr [rbp - 0x88]
0x10005f18f: test byte ptr [rbp - 0x2b], 1
0x10005f193: cmove edx, dword ptr [rbp - 0x3c]
0x10005f197: mov esi, dword ptr [rbp - 0x160]
0x10005f19d: mov edi, dword ptr [rbp - 0x15c]
0x10005f1a3: jmp 0x10005f200 ; 0x10005f200
0x10005f1a5: cmp dword ptr [rbp - 0x38], 0
0x10005f1a9: mov edx, dword ptr [rbp - 0x88]
0x10005f1af: cmovs edx, r13d
0x10005f1b3: test byte ptr [rbp - 0x2b], 1
0x10005f1b7: cmove edx, dword ptr [rbp - 0x3c]
0x10005f1bb: mov esi, dword ptr [rbp - 0x168]
0x10005f1c1: mov edi, dword ptr [rbp - 0x164]
0x10005f1c7: jmp 0x10005f200 ; 0x10005f200
0x10005f1c9: test byte ptr [rbp - 0x2b], 1
0x10005f1cd: mov edx, dword ptr [rbp - 0x3c]
0x10005f1d0: cmovne edx, r13d
0x10005f1d4: mov esi, dword ptr [rbp - 0x150]
0x10005f1da: mov edi, dword ptr [rbp - 0x14c]
0x10005f1e0: jmp 0x10005f200 ; 0x10005f200
0x10005f1e2: test byte ptr [rbp - 0x2b], 1
0x10005f1e6: mov edx, dword ptr [rbp - 0x3c]
0x10005f1e9: cmovne edx, dword ptr [rbp - 0x88]
0x10005f1f0: mov esi, dword ptr [rbp - 0x158]
0x10005f1f6: mov edi, dword ptr [rbp - 0x154]
0x10005f1fc: nop dword ptr [rax]
0x10005f200: imul esi, r11d
0x10005f204: add esi, edi
0x10005f206: imul esi, r11d
0x10005f20a: add edx, dword ptr [rbp - 0x74]
0x10005f20d: add edx, esi
0x10005f20f: mov ecx, eax
0x10005f211: mov rsi, qword ptr [rbp - 0xa8]
0x10005f218: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005f21f: mov esi, r10d
0x10005f222: mov edx, ebx
0x10005f224: mov edi, r12d
0x10005f227: cmp byte ptr [rbp - 0x5a], 0
0x10005f22b: je 0x10005f520
0x10005f231: mov esi, r10d
0x10005f234: mov edx, ebx
0x10005f236: mov edi, dword ptr [rbp - 0x38]
0x10005f239: cmp r10d, 5
0x10005f23d: ja 0x10005f520
0x10005f243: mov ecx, r10d
0x10005f246: lea rdx, [rip + 0x185b] ; 0x100060aa8
0x10005f24d: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005f251: add rcx, rdx
0x10005f254: jmp rcx
0x10005f256: mov esi, dword ptr [rbp - 0x38]
0x10005f259: test esi, esi
0x10005f25b: mov edi, dword ptr [rbp - 0x44]
0x10005f25e: cmovs edi, dword ptr [rbp - 0x4c]
0x10005f262: movzx ecx, byte ptr [rbp - 0x2b]
0x10005f266: and cl, 1
0x10005f269: mov edx, ebx
0x10005f26b: cmovne edx, dword ptr [rbp - 0xbc]
0x10005f272: test cl, cl
0x10005f274: cmove edi, esi
0x10005f277: mov esi, dword ptr [rbp - 0x144]
0x10005f27d: jmp 0x10005f520 ; 0x10005f520
0x10005f282: cmp dword ptr [rbp - 0x38], 0
0x10005f286: mov esi, dword ptr [rbp - 0x4c]
0x10005f289: cmovs esi, dword ptr [rbp - 0x44]
0x10005f28d: mov edi, dword ptr [rbp - 0x6c]
0x10005f290: mov edx, dword ptr [rbp - 0xb8]
0x10005f296: test byte ptr [rbp - 0x2b], 1
0x10005f29a: jne 0x10005f3e0
0x10005f2a0: cmp ebx, r11d
0x10005f2a3: mov ebx, dword ptr [rbp - 0x80]
0x10005f2a6: mov esi, ebx
0x10005f2a8: cmovb esi, dword ptr [rbp - 0x38]
0x10005f2ac: cmp dword ptr [rbp - 0x30], 0
0x10005f2b0: mov edi, r15d
0x10005f2b3: mov ecx, 5
0x10005f2b8: jmp 0x10005f3c4 ; 0x10005f3c4
0x10005f2bd: test ebx, ebx
0x10005f2bf: sets cl
0x10005f2c2: cmp dword ptr [rbp - 0x38], 0
0x10005f2c6: mov edx, dword ptr [rbp - 0x44]
0x10005f2c9: mov esi, dword ptr [rbp - 0x4c]
0x10005f2cc: cmovs edx, esi
0x10005f2cf: movzx ebx, byte ptr [rbp - 0x2b]
0x10005f2d3: or cl, bl
0x10005f2d5: and bl, 1
0x10005f2d8: cmovne esi, dword ptr [rbp - 0xb8]
0x10005f2df: test bl, bl
0x10005f2e1: mov ebx, dword ptr [rbp - 0x30]
0x10005f2e4: cmove edx, dword ptr [rbp - 0x80]
0x10005f2e8: mov edi, dword ptr [rbp - 0x19c]
0x10005f2ee: test cl, 1
0x10005f2f1: jne 0x10005f3e0
0x10005f2f7: cmp ebx, r11d
0x10005f2fa: mov edx, dword ptr [rbp - 0xc8]
0x10005f300: cmovb edx, ebx
0x10005f303: mov esi, dword ptr [rbp - 0x44]
0x10005f306: cmovb esi, dword ptr [rbp - 0x38]
0x10005f30a: mov edi, dword ptr [rbp - 0x1c4]
0x10005f310: jmp 0x10005f3e0 ; 0x10005f3e0
0x10005f315: test ebx, ebx
0x10005f317: sets cl
0x10005f31a: cmp dword ptr [rbp - 0x38], 0
0x10005f31e: mov edx, dword ptr [rbp - 0x4c]
0x10005f321: mov esi, dword ptr [rbp - 0x44]
0x10005f324: cmovs edx, esi
0x10005f327: movzx ebx, byte ptr [rbp - 0x2b]
0x10005f32b: or cl, bl
0x10005f32d: and bl, 1
0x10005f330: cmovne esi, dword ptr [rbp - 0xbc]
0x10005f337: test bl, bl
0x10005f339: mov ebx, dword ptr [rbp - 0x30]
0x10005f33c: cmove edx, dword ptr [rbp - 0xc8]
0x10005f343: mov rdi, qword ptr [rbp - 0x220]
0x10005f34a: test cl, 1
0x10005f34d: jne 0x10005f3e0
0x10005f353: cmp ebx, r11d
0x10005f356: mov edx, dword ptr [rbp - 0x80]
0x10005f359: cmovb edx, ebx
0x10005f35c: mov esi, dword ptr [rbp - 0x4c]
0x10005f35f: cmovb esi, dword ptr [rbp - 0x38]
0x10005f363: mov edi, dword ptr [rbp - 0x1c8]
0x10005f369: jmp 0x10005f3e0 ; 0x10005f3e0
0x10005f36b: mov edi, dword ptr [rbp - 0x6c]
0x10005f36e: mov edx, dword ptr [rbp - 0x44]
0x10005f371: mov esi, dword ptr [rbp - 0x80]
0x10005f374: test byte ptr [rbp - 0x2b], 1
0x10005f378: jne 0x10005f3e0
0x10005f37a: cmp ebx, r11d
0x10005f37d: mov ebx, dword ptr [rbp - 0x80]
0x10005f380: mov esi, ebx
0x10005f382: cmovb esi, dword ptr [rbp - 0x38]
0x10005f386: cmp dword ptr [rbp - 0x30], 0
0x10005f38a: mov edi, dword ptr [rbp - 0x1c0]
0x10005f390: mov ecx, 1
0x10005f395: jmp 0x10005f3c4 ; 0x10005f3c4
0x10005f397: mov edi, dword ptr [rbp - 0x6c]
0x10005f39a: mov edx, dword ptr [rbp - 0x4c]
0x10005f39d: mov esi, dword ptr [rbp - 0xc8]
0x10005f3a3: test byte ptr [rbp - 0x2b], 1
0x10005f3a7: jne 0x10005f3e0
0x10005f3a9: cmp ebx, r11d
0x10005f3ac: mov ebx, dword ptr [rbp - 0x80]
0x10005f3af: mov esi, ebx
0x10005f3b1: cmovb esi, dword ptr [rbp - 0x38]
0x10005f3b5: cmp dword ptr [rbp - 0x30], 0
0x10005f3b9: mov edi, dword ptr [rbp - 0x1bc]
0x10005f3bf: mov ecx, 0
0x10005f3c4: cmovs edi, ecx
0x10005f3c7: mov edx, dword ptr [rbp - 0x98]
0x10005f3cd: cmovs edx, dword ptr [rbp - 0x44]
0x10005f3d1: cmovs esi, ebx
0x10005f3d4: mov ebx, dword ptr [rbp - 0x30]
0x10005f3d7: nop word ptr [rax + rax]
0x10005f3e0: imul edi, r11d
0x10005f3e4: add edi, esi
0x10005f3e6: imul edi, r11d
0x10005f3ea: add edx, dword ptr [rbp - 0x74]
0x10005f3ed: add edx, edi
0x10005f3ef: mov ecx, eax
0x10005f3f1: or ecx, 1
0x10005f3f4: mov rsi, qword ptr [rbp - 0xa8]
0x10005f3fb: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005f402: mov edi, r10d
0x10005f405: mov rcx, qword ptr [rbp - 0x68]
0x10005f409: mov edx, ecx
0x10005f40b: mov esi, dword ptr [rbp - 0x38]
0x10005f40e: cmp byte ptr [rbp - 0x5b], 0
0x10005f412: jne 0x10005f720
0x10005f418: mov edi, r10d
0x10005f41b: mov rcx, qword ptr [rbp - 0x68]
0x10005f41f: mov edx, ecx
0x10005f421: mov esi, dword ptr [rbp - 0x38]
0x10005f424: cmp r10d, 5
0x10005f428: ja 0x10005f720
0x10005f42e: mov ecx, r10d
0x10005f431: lea rdx, [rip + 0x16e8] ; 0x100060b20
0x10005f438: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005f43c: add rcx, rdx
0x10005f43f: jmp rcx
0x10005f441: cmp dword ptr [rbp - 0x38], 0
0x10005f445: mov esi, dword ptr [rbp - 0x48]
0x10005f448: cmovs esi, dword ptr [rbp - 0x50]
0x10005f44c: mov edi, dword ptr [rbp - 0x6c]
0x10005f44f: mov edx, dword ptr [rbp - 0xbc]
0x10005f455: test byte ptr [rbp - 0x2b], 1
0x10005f459: jne 0x10005f720
0x10005f45f: mov rcx, qword ptr [rbp - 0x68]
0x10005f463: cmp ecx, r11d
0x10005f466: mov ebx, dword ptr [rbp - 0x80]
0x10005f469: mov esi, ebx
0x10005f46b: cmovb esi, dword ptr [rbp - 0x38]
0x10005f46f: test ecx, ecx
0x10005f471: mov edi, dword ptr [rbp - 0x1d8]
0x10005f477: mov ecx, 4
0x10005f47c: jmp 0x10005f702 ; 0x10005f702
0x10005f481: mov esi, dword ptr [rbp - 0x38]
0x10005f484: test esi, esi
0x10005f486: mov edi, dword ptr [rbp - 0x4c]
0x10005f489: cmovs edi, dword ptr [rbp - 0x44]
0x10005f48d: movzx ecx, byte ptr [rbp - 0x2b]
0x10005f491: and cl, 1
0x10005f494: mov edx, ebx
0x10005f496: cmovne edx, dword ptr [rbp - 0xb8]
0x10005f49d: test cl, cl
0x10005f49f: cmove edi, esi
0x10005f4a2: mov esi, dword ptr [rbp - 0x148]
0x10005f4a8: jmp 0x10005f520 ; 0x10005f520
0x10005f4aa: cmp dword ptr [rbp - 0x38], 0
0x10005f4ae: mov edx, dword ptr [rbp - 0x44]
0x10005f4b1: cmovs edx, dword ptr [rbp - 0x4c]
0x10005f4b5: test byte ptr [rbp - 0x2b], 1
0x10005f4b9: cmove edx, ebx
0x10005f4bc: mov esi, dword ptr [rbp - 0x160]
0x10005f4c2: mov edi, dword ptr [rbp - 0x15c]
0x10005f4c8: jmp 0x10005f520 ; 0x10005f520
0x10005f4ca: cmp dword ptr [rbp - 0x38], 0
0x10005f4ce: mov edx, dword ptr [rbp - 0x4c]
0x10005f4d1: cmovs edx, dword ptr [rbp - 0x44]
0x10005f4d5: test byte ptr [rbp - 0x2b], 1
0x10005f4d9: cmove edx, ebx
0x10005f4dc: mov esi, dword ptr [rbp - 0x168]
0x10005f4e2: mov edi, dword ptr [rbp - 0x164]
0x10005f4e8: jmp 0x10005f520 ; 0x10005f520
0x10005f4ea: test byte ptr [rbp - 0x2b], 1
0x10005f4ee: mov edx, ebx
0x10005f4f0: cmovne edx, dword ptr [rbp - 0x44]
0x10005f4f4: mov esi, dword ptr [rbp - 0x150]
0x10005f4fa: mov edi, dword ptr [rbp - 0x14c]
0x10005f500: jmp 0x10005f520 ; 0x10005f520
0x10005f502: test byte ptr [rbp - 0x2b], 1
0x10005f506: mov edx, ebx
0x10005f508: cmovne edx, dword ptr [rbp - 0x4c]
0x10005f50c: mov esi, dword ptr [rbp - 0x158]
0x10005f512: mov edi, dword ptr [rbp - 0x154]
0x10005f518: nop dword ptr [rax + rax]
0x10005f520: imul esi, r11d
0x10005f524: add esi, edi
0x10005f526: imul esi, r11d
0x10005f52a: add edx, dword ptr [rbp - 0x74]
0x10005f52d: add edx, esi
0x10005f52f: mov ecx, eax
0x10005f531: or ecx, 1
0x10005f534: mov rsi, qword ptr [rbp - 0xa8]
0x10005f53b: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005f542: mov esi, r10d
0x10005f545: mov edx, ebx
0x10005f547: mov edi, r12d
0x10005f54a: cmp byte ptr [rbp - 0x5b], 0
0x10005f54e: je 0x10005f860
0x10005f554: mov esi, r10d
0x10005f557: mov rcx, qword ptr [rbp - 0x68]
0x10005f55b: mov edx, ecx
0x10005f55d: mov edi, dword ptr [rbp - 0x38]
0x10005f560: cmp r10d, 5
0x10005f564: ja 0x10005f860
0x10005f56a: mov ecx, r10d
0x10005f56d: lea rdx, [rip + 0x154c] ; 0x100060ac0
0x10005f574: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005f578: add rcx, rdx
0x10005f57b: jmp rcx
0x10005f57d: mov esi, dword ptr [rbp - 0x38]
0x10005f580: test esi, esi
0x10005f582: mov edi, dword ptr [rbp - 0x48]
0x10005f585: cmovs edi, dword ptr [rbp - 0x50]
0x10005f589: movzx ecx, byte ptr [rbp - 0x2b]
0x10005f58d: and cl, 1
0x10005f590: mov rdx, qword ptr [rbp - 0x68]
0x10005f594: cmovne edx, dword ptr [rbp - 0xbc]
0x10005f59b: test cl, cl
0x10005f59d: cmove edi, esi
0x10005f5a0: mov esi, dword ptr [rbp - 0x144]
0x10005f5a6: jmp 0x10005f860 ; 0x10005f860
0x10005f5ab: cmp dword ptr [rbp - 0x38], 0
0x10005f5af: mov esi, dword ptr [rbp - 0x50]
0x10005f5b2: cmovs esi, dword ptr [rbp - 0x48]
0x10005f5b6: mov edi, dword ptr [rbp - 0x6c]
0x10005f5b9: mov edx, dword ptr [rbp - 0xb8]
0x10005f5bf: test byte ptr [rbp - 0x2b], 1
0x10005f5c3: jne 0x10005f720
0x10005f5c9: mov rcx, qword ptr [rbp - 0x68]
0x10005f5cd: cmp ecx, r11d
0x10005f5d0: mov ebx, dword ptr [rbp - 0x80]
0x10005f5d3: mov esi, ebx
0x10005f5d5: cmovb esi, dword ptr [rbp - 0x38]
0x10005f5d9: test ecx, ecx
0x10005f5db: mov edi, dword ptr [rbp - 0xec]
0x10005f5e1: mov ecx, 5
0x10005f5e6: jmp 0x10005f702 ; 0x10005f702
0x10005f5eb: cmp dword ptr [rbp - 0x68], 0
0x10005f5ef: sets cl
0x10005f5f2: cmp dword ptr [rbp - 0x38], 0
0x10005f5f6: mov edx, dword ptr [rbp - 0x48]
0x10005f5f9: mov esi, dword ptr [rbp - 0x50]
0x10005f5fc: cmovs edx, esi
0x10005f5ff: movzx ebx, byte ptr [rbp - 0x2b]
0x10005f603: or cl, bl
0x10005f605: and bl, 1
0x10005f608: cmovne esi, dword ptr [rbp - 0xb8]
0x10005f60f: test bl, bl
0x10005f611: mov ebx, dword ptr [rbp - 0x30]
0x10005f614: cmove edx, dword ptr [rbp - 0x80]
0x10005f618: mov edi, dword ptr [rbp - 0x19c]
0x10005f61e: test cl, 1
0x10005f621: jne 0x10005f720
0x10005f627: mov rcx, qword ptr [rbp - 0x68]
0x10005f62b: cmp ecx, r11d
0x10005f62e: mov edx, dword ptr [rbp - 0xc8]
0x10005f634: cmovb edx, ecx
0x10005f637: mov esi, dword ptr [rbp - 0x48]
0x10005f63a: cmovb esi, dword ptr [rbp - 0x38]
0x10005f63e: mov edi, dword ptr [rbp - 0x1d4]
0x10005f644: jmp 0x10005f720 ; 0x10005f720
0x10005f649: cmp dword ptr [rbp - 0x68], 0
0x10005f64d: sets cl
0x10005f650: cmp dword ptr [rbp - 0x38], 0
0x10005f654: mov edx, dword ptr [rbp - 0x50]
0x10005f657: mov esi, dword ptr [rbp - 0x48]
0x10005f65a: cmovs edx, esi
0x10005f65d: movzx ebx, byte ptr [rbp - 0x2b]
0x10005f661: or cl, bl
0x10005f663: and bl, 1
0x10005f666: cmovne esi, dword ptr [rbp - 0xbc]
0x10005f66d: test bl, bl
0x10005f66f: mov ebx, dword ptr [rbp - 0x30]
0x10005f672: cmove edx, dword ptr [rbp - 0xc8]
0x10005f679: mov rdi, qword ptr [rbp - 0x220]
0x10005f680: test cl, 1
0x10005f683: jne 0x10005f720
0x10005f689: mov rcx, qword ptr [rbp - 0x68]
0x10005f68d: cmp ecx, r11d
0x10005f690: mov edx, dword ptr [rbp - 0x80]
0x10005f693: cmovb edx, ecx
0x10005f696: mov esi, dword ptr [rbp - 0x50]
0x10005f699: cmovb esi, dword ptr [rbp - 0x38]
0x10005f69d: mov edi, dword ptr [rbp - 0xe8]
0x10005f6a3: jmp 0x10005f720 ; 0x10005f720
0x10005f6a5: mov edi, dword ptr [rbp - 0x6c]
0x10005f6a8: mov edx, dword ptr [rbp - 0x48]
0x10005f6ab: mov esi, dword ptr [rbp - 0x80]
0x10005f6ae: test byte ptr [rbp - 0x2b], 1
0x10005f6b2: jne 0x10005f720
0x10005f6b4: mov rcx, qword ptr [rbp - 0x68]
0x10005f6b8: cmp ecx, r11d
0x10005f6bb: mov ebx, dword ptr [rbp - 0x80]
0x10005f6be: mov esi, ebx
0x10005f6c0: cmovb esi, dword ptr [rbp - 0x38]
0x10005f6c4: test ecx, ecx
0x10005f6c6: mov edi, dword ptr [rbp - 0x1d0]
0x10005f6cc: mov ecx, 1
0x10005f6d1: jmp 0x10005f702 ; 0x10005f702
0x10005f6d3: mov edi, dword ptr [rbp - 0x6c]
0x10005f6d6: mov edx, dword ptr [rbp - 0x50]
0x10005f6d9: mov esi, dword ptr [rbp - 0xc8]
0x10005f6df: test byte ptr [rbp - 0x2b], 1
0x10005f6e3: jne 0x10005f720
0x10005f6e5: mov rcx, qword ptr [rbp - 0x68]
0x10005f6e9: cmp ecx, r11d
0x10005f6ec: mov ebx, dword ptr [rbp - 0x80]
0x10005f6ef: mov esi, ebx
0x10005f6f1: cmovb esi, dword ptr [rbp - 0x38]
0x10005f6f5: test ecx, ecx
0x10005f6f7: mov edi, dword ptr [rbp - 0x1cc]
0x10005f6fd: mov ecx, 0
0x10005f702: cmovs edi, ecx
0x10005f705: mov edx, dword ptr [rbp - 0x9c]
0x10005f70b: cmovs edx, dword ptr [rbp - 0x48]
0x10005f70f: cmovs esi, ebx
0x10005f712: mov ebx, dword ptr [rbp - 0x30]
0x10005f715: nop word ptr cs:[rax + rax]
0x10005f720: imul edi, r11d
0x10005f724: add edi, esi
0x10005f726: imul edi, r11d
0x10005f72a: add edx, dword ptr [rbp - 0x74]
0x10005f72d: add edx, edi
0x10005f72f: mov ecx, eax
0x10005f731: or ecx, 2
0x10005f734: mov rsi, qword ptr [rbp - 0xa8]
0x10005f73b: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005f742: mov edx, r10d
0x10005f745: mov esi, dword ptr [rbp - 0x38]
0x10005f748: mov edi, r8d
0x10005f74b: cmp byte ptr [rbp - 0x51], 0
0x10005f74f: jne 0x10005faf0
0x10005f755: mov edx, r10d
0x10005f758: mov esi, dword ptr [rbp - 0x38]
0x10005f75b: mov edi, r8d
0x10005f75e: cmp r10d, 5
0x10005f762: ja 0x10005faf0
0x10005f768: mov ecx, r10d
0x10005f76b: lea rdx, [rip + 0x13c6] ; 0x100060b38
0x10005f772: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005f776: add rcx, rdx
0x10005f779: jmp rcx
0x10005f77b: cmp dword ptr [rbp - 0x38], 0
0x10005f77f: mov esi, dword ptr [rbp - 0x40]
0x10005f782: cmovs esi, dword ptr [rbp - 0x58]
0x10005f786: mov edx, dword ptr [rbp - 0x6c]
0x10005f789: mov edi, dword ptr [rbp - 0xbc]
0x10005f78f: test byte ptr [rbp - 0x2b], 1
0x10005f793: jne 0x10005faf0
0x10005f799: cmp r8d, r11d
0x10005f79c: mov ebx, dword ptr [rbp - 0x80]
0x10005f79f: mov esi, ebx
0x10005f7a1: cmovb esi, dword ptr [rbp - 0x38]
0x10005f7a5: test r8d, r8d
0x10005f7a8: mov edx, dword ptr [rbp - 0x1f0]
0x10005f7ae: mov ecx, 4
0x10005f7b3: jmp 0x10005fa32 ; 0x10005fa32
0x10005f7b8: mov esi, dword ptr [rbp - 0x38]
0x10005f7bb: test esi, esi
0x10005f7bd: mov edi, dword ptr [rbp - 0x50]
0x10005f7c0: cmovs edi, dword ptr [rbp - 0x48]
0x10005f7c4: movzx ecx, byte ptr [rbp - 0x2b]
0x10005f7c8: and cl, 1
0x10005f7cb: mov rdx, qword ptr [rbp - 0x68]
0x10005f7cf: cmovne edx, dword ptr [rbp - 0xb8]
0x10005f7d6: test cl, cl
0x10005f7d8: cmove edi, esi
0x10005f7db: mov esi, dword ptr [rbp - 0x148]
0x10005f7e1: jmp 0x10005f860 ; 0x10005f860
0x10005f7e3: cmp dword ptr [rbp - 0x38], 0
0x10005f7e7: mov edx, dword ptr [rbp - 0x48]
0x10005f7ea: cmovs edx, dword ptr [rbp - 0x50]
0x10005f7ee: test byte ptr [rbp - 0x2b], 1
0x10005f7f2: cmove edx, dword ptr [rbp - 0x68]
0x10005f7f6: mov esi, dword ptr [rbp - 0x160]
0x10005f7fc: mov edi, dword ptr [rbp - 0x15c]
0x10005f802: jmp 0x10005f860 ; 0x10005f860
0x10005f804: cmp dword ptr [rbp - 0x38], 0
0x10005f808: mov edx, dword ptr [rbp - 0x50]
0x10005f80b: cmovs edx, dword ptr [rbp - 0x48]
0x10005f80f: test byte ptr [rbp - 0x2b], 1
0x10005f813: cmove edx, dword ptr [rbp - 0x68]
0x10005f817: mov esi, dword ptr [rbp - 0x168]
0x10005f81d: mov edi, dword ptr [rbp - 0x164]
0x10005f823: jmp 0x10005f860 ; 0x10005f860
0x10005f825: test byte ptr [rbp - 0x2b], 1
0x10005f829: mov rcx, qword ptr [rbp - 0x68]
0x10005f82d: mov edx, ecx
0x10005f82f: cmovne edx, dword ptr [rbp - 0x48]
0x10005f833: mov esi, dword ptr [rbp - 0x150]
0x10005f839: mov edi, dword ptr [rbp - 0x14c]
0x10005f83f: jmp 0x10005f860 ; 0x10005f860
0x10005f841: test byte ptr [rbp - 0x2b], 1
0x10005f845: mov rcx, qword ptr [rbp - 0x68]
0x10005f849: mov edx, ecx
0x10005f84b: cmovne edx, dword ptr [rbp - 0x50]
0x10005f84f: mov esi, dword ptr [rbp - 0x158]
0x10005f855: mov edi, dword ptr [rbp - 0x154]
0x10005f85b: nop dword ptr [rax + rax]
0x10005f860: imul esi, r11d
0x10005f864: add esi, edi
0x10005f866: imul esi, r11d
0x10005f86a: add edx, dword ptr [rbp - 0x74]
0x10005f86d: add edx, esi
0x10005f86f: mov ecx, eax
0x10005f871: or ecx, 2
0x10005f874: mov rsi, qword ptr [rbp - 0xa8]
0x10005f87b: mov dword ptr [rsi + rcx*4 + 0x914], edx
0x10005f882: mov edx, r10d
0x10005f885: mov esi, r12d
0x10005f888: mov edi, ebx
0x10005f88a: cmp byte ptr [rbp - 0x51], 0
0x10005f88e: je 0x10005faf0
0x10005f894: mov edx, r10d
0x10005f897: mov esi, dword ptr [rbp - 0x38]
0x10005f89a: mov edi, r8d
0x10005f89d: cmp r10d, 5
0x10005f8a1: ja 0x10005faf0
0x10005f8a7: mov ecx, r10d
0x10005f8aa: lea rdx, [rip + 0x1227] ; 0x100060ad8
0x10005f8b1: movsxd rcx, dword ptr [rdx + rcx*4]
0x10005f8b5: add rcx, rdx
0x10005f8b8: jmp rcx
0x10005f8ba: mov edx, dword ptr [rbp - 0x38]
0x10005f8bd: test edx, edx
0x10005f8bf: mov esi, dword ptr [rbp - 0x40]
0x10005f8c2: cmovs esi, dword ptr [rbp - 0x58]
0x10005f8c6: movzx ecx, byte ptr [rbp - 0x2b]
0x10005f8ca: and cl, 1
0x10005f8cd: mov edi, r8d
0x10005f8d0: cmovne edi, dword ptr [rbp - 0xbc]
0x10005f8d7: test cl, cl
0x10005f8d9: cmove esi, edx
0x10005f8dc: mov edx, dword ptr [rbp - 0x144]
0x10005f8e2: jmp 0x10005faf0 ; 0x10005faf0
0x10005f8e7: cmp dword ptr [rbp - 0x38], 0
0x10005f8eb: mov esi, dword ptr [rbp - 0x58]
0x10005f8ee: cmovs esi, dword ptr [rbp - 0x40]
0x10005f8f2: mov edx, dword ptr [rbp - 0x6c]
0x10005f8f5: mov edi, dword ptr [rbp - 0xb8]
0x10005f8fb: test byte ptr [rbp - 0x2b], 1
0x10005f8ff: jne 0x10005faf0
0x10005f905: cmp r8d, r11d
0x10005f908: mov ebx, dword ptr [rbp - 0x80]
0x10005f90b: mov esi, ebx
0x10005f90d: cmovb esi, dword ptr [rbp - 0x38]
0x10005f911: test r8d, r8d
0x10005f914: mov edx, dword ptr [rbp - 0x1ec]
0x10005f91a: mov ecx, 5
0x10005f91f: jmp 0x10005fa32 ; 0x10005fa32
0x10005f924: test r8d, r8d
0x10005f927: sets cl
0x10005f92a: cmp dword ptr [rbp - 0x38], 0
0x10005f92e: mov edi, dword ptr [rbp - 0x40]
0x10005f931: mov esi, dword ptr [rbp - 0x58]
0x10005f934: cmovs edi, esi
0x10005f937: movzx edx, byte ptr [rbp - 0x2b]
0x10005f93b: or cl, dl
0x10005f93d: and dl, 1
0x10005f940: cmovne esi, dword ptr [rbp - 0xb8]
0x10005f947: test dl, dl
0x10005f949: cmove edi, dword ptr [rbp - 0x80]
0x10005f94d: mov edx, dword ptr [rbp - 0x19c]
0x10005f953: test cl, 1
0x10005f956: jne 0x10005faf0
0x10005f95c: cmp r8d, r11d
0x10005f95f: mov edi, dword ptr [rbp - 0xc8]
0x10005f965: cmovb edi, r8d
0x10005f969: mov esi, dword ptr [rbp - 0x40]
0x10005f96c: cmovb esi, dword ptr [rbp - 0x38]
0x10005f970: mov edx, dword ptr [rbp - 0x1e4]
0x10005f976: jmp 0x10005faf0 ; 0x10005faf0
0x10005f97b: test r8d, r8d
0x10005f97e: sets cl
0x10005f981: cmp dword ptr [rbp - 0x38], 0
0x10005f985: mov edi, dword ptr [rbp - 0x58]
0x10005f988: mov esi, dword ptr [rbp - 0x40]
0x10005f98b: cmovs edi, esi
0x10005f98e: movzx edx, byte ptr [rbp - 0x2b]
0x10005f992: or cl, dl
0x10005f994: and dl, 1
0x10005f997: cmovne esi, dword ptr [rbp - 0xbc]
0x10005f99e: test dl, dl
0x10005f9a0: cmove edi, dword ptr [rbp - 0xc8]
0x10005f9a7: mov rdx, qword ptr [rbp - 0x220]
0x10005f9ae: test cl, 1
0x10005f9b1: jne 0x10005faf0
0x10005f9b7: cmp r8d, r11d
0x10005f9ba: mov edi, dword ptr [rbp - 0x80]
0x10005f9bd: cmovb edi, r8d
0x10005f9c1: mov esi, dword ptr [rbp - 0x58]
0x10005f9c4: cmovb esi, dword ptr [rbp - 0x38]
0x10005f9c8: mov edx, dword ptr [rbp - 0x1e8]
0x10005f9ce: jmp 0x10005faf0 ; 0x10005faf0
0x10005f9d3: mov edx, dword ptr [rbp - 0x6c]
0x10005f9d6: mov esi, dword ptr [rbp - 0x80]
0x10005f9d9: mov edi, dword ptr [rbp - 0x40]
0x10005f9dc: test byte ptr [rbp - 0x2b], 1
0x10005f9e0: jne 0x10005faf0
0x10005f9e6: cmp r8d, r11d
0x10005f9e9: mov ebx, dword ptr [rbp - 0x80]
0x10005f9ec: mov esi, ebx
0x10005f9ee: cmovb esi, dword ptr [rbp - 0x38]
0x10005f9f2: test r8d, r8d
0x10005f9f5: mov edx, dword ptr [rbp - 0x1e0]
0x10005f9fb: mov ecx, 1
0x10005fa00: jmp 0x10005fa32 ; 0x10005fa32
0x10005fa02: mov edx, dword ptr [rbp - 0x6c]
0x10005fa05: mov esi, dword ptr [rbp - 0xc8]
0x10005fa0b: mov edi, dword ptr [rbp - 0x58]
0x10005fa0e: test byte ptr [rbp - 0x2b], 1
0x10005fa12: jne 0x10005faf0
0x10005fa18: cmp r8d, r11d
0x10005fa1b: mov ebx, dword ptr [rbp - 0x80]
0x10005fa1e: mov esi, ebx
0x10005fa20: cmovb esi, dword ptr [rbp - 0x38]
0x10005fa24: test r8d, r8d
0x10005fa27: mov edx, dword ptr [rbp - 0x1dc]
0x10005fa2d: mov ecx, 0
0x10005fa32: cmovs edx, ecx
0x10005fa35: mov edi, dword ptr [rbp - 0xa0]
0x10005fa3b: cmovs edi, dword ptr [rbp - 0x40]
0x10005fa3f: cmovs esi, ebx
0x10005fa42: mov ebx, dword ptr [rbp - 0x30]
0x10005fa45: jmp 0x10005faf0 ; 0x10005faf0
0x10005fa4a: mov edx, dword ptr [rbp - 0x38]
0x10005fa4d: test edx, edx
0x10005fa4f: mov esi, dword ptr [rbp - 0x58]
0x10005fa52: cmovs esi, dword ptr [rbp - 0x40]
0x10005fa56: movzx ecx, byte ptr [rbp - 0x2b]
0x10005fa5a: and cl, 1
0x10005fa5d: mov edi, r8d
0x10005fa60: cmovne edi, dword ptr [rbp - 0xb8]
0x10005fa67: test cl, cl
0x10005fa69: cmove esi, edx
0x10005fa6c: mov edx, dword ptr [rbp - 0x148]
0x10005fa72: jmp 0x10005faf0 ; 0x10005faf0
0x10005fa74: cmp dword ptr [rbp - 0x38], 0
0x10005fa78: mov edi, dword ptr [rbp - 0x40]
0x10005fa7b: cmovs edi, dword ptr [rbp - 0x58]
0x10005fa7f: test byte ptr [rbp - 0x2b], 1
0x10005fa83: cmove edi, r8d
0x10005fa87: mov edx, dword ptr [rbp - 0x160]
0x10005fa8d: mov esi, dword ptr [rbp - 0x15c]
0x10005fa93: jmp 0x10005faf0 ; 0x10005faf0
0x10005fa95: cmp dword ptr [rbp - 0x38], 0
0x10005fa99: mov edi, dword ptr [rbp - 0x58]
0x10005fa9c: cmovs edi, dword ptr [rbp - 0x40]
0x10005faa0: test byte ptr [rbp - 0x2b], 1
0x10005faa4: cmove edi, r8d
0x10005faa8: mov edx, dword ptr [rbp - 0x168]
0x10005faae: mov esi, dword ptr [rbp - 0x164]
0x10005fab4: jmp 0x10005faf0 ; 0x10005faf0
0x10005fab6: test byte ptr [rbp - 0x2b], 1
0x10005faba: mov edi, r8d
0x10005fabd: cmovne edi, dword ptr [rbp - 0x40]
0x10005fac1: mov edx, dword ptr [rbp - 0x150]
0x10005fac7: mov esi, dword ptr [rbp - 0x14c]
0x10005facd: jmp 0x10005faf0 ; 0x10005faf0
0x10005facf: test byte ptr [rbp - 0x2b], 1
0x10005fad3: mov edi, r8d
0x10005fad6: cmovne edi, dword ptr [rbp - 0x58]
0x10005fada: mov edx, dword ptr [rbp - 0x158]
0x10005fae0: mov esi, dword ptr [rbp - 0x154]
0x10005fae6: nop word ptr cs:[rax + rax]
0x10005faf0: imul edx, r11d
0x10005faf4: add edx, esi
0x10005faf6: imul edx, r11d
0x10005fafa: add edi, dword ptr [rbp - 0x74]
0x10005fafd: add edi, edx
0x10005faff: or eax, 3
0x10005fb02: mov rcx, qword ptr [rbp - 0xa8]
0x10005fb09: mov dword ptr [rcx + rax*4 + 0x914], edi
0x10005fb10: add r14d, 0xfffe800c
0x10005fb17: cmp byte ptr [rbp - 0xdd], 0
0x10005fb1e: je 0x10005fb40
0x10005fb20: cmp byte ptr [rbp - 0x59], 0
0x10005fb24: je 0x10005fbc0
0x10005fb2a: mov esi, r10d
0x10005fb2d: mov eax, dword ptr [rbp - 0x3c]
0x10005fb30: mov ebx, dword ptr [rbp - 0x1a0]
0x10005fb36: mov edx, ebx
0x10005fb38: jmp 0x10005fef0 ; 0x10005fef0
0x10005fb3d: nop dword ptr [rax]
0x10005fb40: mov r15d, r8d
0x10005fb43: mov r8d, dword ptr [rbp - 0x58]
0x10005fb47: mov eax, r10d
0x10005fb4a: mov edx, ebx
0x10005fb4c: mov esi, r12d
0x10005fb4f: cmp byte ptr [rbp - 0x59], 0
0x10005fb53: mov r9d, ebx
0x10005fb56: mov ebx, dword ptr [rbp - 0x1a0]
0x10005fb5c: mov edi, dword ptr [rbp - 0x48]
0x10005fb5f: je 0x10005fcf4
0x10005fb65: cmp r10d, 5
0x10005fb69: ja 0x10005fc27
0x10005fb6f: mov eax, r10d
0x10005fb72: lea rcx, [rip + 0xfd7] ; 0x100060b50
0x10005fb79: movsxd rax, dword ptr [rcx + rax*4]
0x10005fb7d: add rax, rcx
0x10005fb80: jmp rax
0x10005fb82: test ebx, ebx
0x10005fb84: cmovs r13d, dword ptr [rbp - 0x88]
0x10005fb8c: movzx eax, byte ptr [rbp - 0x2a]
0x10005fb90: and al, 1
0x10005fb92: mov ecx, dword ptr [rbp - 0x3c]
0x10005fb95: cmovne ecx, dword ptr [rbp - 0xd0]
0x10005fb9c: test al, al
0x10005fb9e: cmove r13d, ebx
0x10005fba2: mov eax, dword ptr [rbp - 0x118]
0x10005fba8: mov edx, ecx
0x10005fbaa: mov esi, r13d
0x10005fbad: jmp 0x10005fcf0 ; 0x10005fcf0
0x10005fbb2: nop word ptr cs:[rax + rax]
0x10005fbc0: cmp r10d, 5
0x10005fbc4: ja 0x10005fb2a
0x10005fbca: mov eax, r10d
0x10005fbcd: lea rcx, [rip + 0xfdc] ; 0x100060bb0
0x10005fbd4: movsxd rax, dword ptr [rcx + rax*4]
0x10005fbd8: add rax, rcx
0x10005fbdb: mov ebx, dword ptr [rbp - 0x1a0]
0x10005fbe1: jmp rax
0x10005fbe3: test ebx, ebx
0x10005fbe5: mov ecx, dword ptr [rbp - 0x88]
0x10005fbeb: cmovns ecx, r13d
0x10005fbef: mov esi, dword ptr [rbp - 0x90]
0x10005fbf5: mov eax, dword ptr [rbp - 0xd0]
0x10005fbfb: mov edx, ecx
0x10005fbfd: test byte ptr [rbp - 0x2a], 1
0x10005fc01: jne 0x10005fef0
0x10005fc07: mov eax, dword ptr [rbp - 0x3c]
0x10005fc0a: cmp eax, r11d
0x10005fc0d: mov ecx, dword ptr [rbp - 0x78]
0x10005fc10: mov edx, ecx
0x10005fc12: cmovb edx, ebx
0x10005fc15: test eax, eax
0x10005fc17: mov eax, 4
0x10005fc1c: mov esi, dword ptr [rbp - 0x1b8]
0x10005fc22: jmp 0x10005fed6 ; 0x10005fed6
0x10005fc27: mov eax, r10d
0x10005fc2a: mov edx, dword ptr [rbp - 0x3c]
0x10005fc2d: mov esi, ebx
0x10005fc2f: jmp 0x10005fcf0 ; 0x10005fcf0
0x10005fc34: test ebx, ebx
0x10005fc36: mov esi, dword ptr [rbp - 0x88]
0x10005fc3c: cmovs esi, r13d
0x10005fc40: movzx eax, byte ptr [rbp - 0x2a]
0x10005fc44: and al, 1
0x10005fc46: mov ecx, dword ptr [rbp - 0x3c]
0x10005fc49: cmovne ecx, dword ptr [rbp - 0xcc]
0x10005fc50: test al, al
0x10005fc52: cmove esi, ebx
0x10005fc55: mov eax, dword ptr [rbp - 0x11c]
0x10005fc5b: mov edx, ecx
0x10005fc5d: jmp 0x10005fcf0 ; 0x10005fcf0
0x10005fc62: test ebx, ebx
0x10005fc64: cmovs r13d, dword ptr [rbp - 0x88]
0x10005fc6c: test byte ptr [rbp - 0x2a], 1
0x10005fc70: mov ecx, dword ptr [rbp - 0x3c]
0x10005fc73: cmovne ecx, r13d
0x10005fc77: mov eax, dword ptr [rbp - 0x134]
0x10005fc7d: mov edx, ecx
0x10005fc7f: mov esi, dword ptr [rbp - 0x130]
0x10005fc85: jmp 0x10005fcf0 ; 0x10005fcf0
0x10005fc87: test ebx, ebx
0x10005fc89: mov eax, dword ptr [rbp - 0x88]
0x10005fc8f: cmovs eax, r13d
0x10005fc93: test byte ptr [rbp - 0x2a], 1
0x10005fc97: mov ecx, dword ptr [rbp - 0x3c]
0x10005fc9a: cmovne ecx, eax
0x10005fc9d: mov eax, dword ptr [rbp - 0x13c]
0x10005fca3: mov edx, ecx
0x10005fca5: mov esi, dword ptr [rbp - 0x138]
0x10005fcab: jmp 0x10005fcf0 ; 0x10005fcf0
0x10005fcad: test byte ptr [rbp - 0x2a], 1
0x10005fcb1: mov ecx, dword ptr [rbp - 0x3c]
0x10005fcb4: cmovne ecx, r13d
0x10005fcb8: mov eax, dword ptr [rbp - 0x124]
0x10005fcbe: mov edx, ecx
0x10005fcc0: mov esi, dword ptr [rbp - 0x120]
0x10005fcc6: jmp 0x10005fcf0 ; 0x10005fcf0
0x10005fcc8: test byte ptr [rbp - 0x2a], 1
0x10005fccc: mov ecx, dword ptr [rbp - 0x3c]
0x10005fccf: cmovne ecx, dword ptr [rbp - 0x88]
0x10005fcd6: mov eax, dword ptr [rbp - 0x12c]
0x10005fcdc: mov edx, ecx
0x10005fcde: mov esi, dword ptr [rbp - 0x128]
0x10005fce4: nop word ptr cs:[rax + rax]
0x10005fcf0: mov r9d, dword ptr [rbp - 0x30]
0x10005fcf4: imul eax, r11d
0x10005fcf8: add eax, esi
0x10005fcfa: imul eax, r11d
0x10005fcfe: add edx, dword ptr [rbp - 0x74]
0x10005fd01: add edx, eax
0x10005fd03: mov eax, r14d
0x10005fd06: mov rcx, qword ptr [rbp - 0xa8]
0x10005fd0d: mov dword ptr [rcx + rax*4 + 0x914], edx
0x10005fd14: mov edx, r10d
0x10005fd17: mov eax, r9d
0x10005fd1a: mov esi, r12d
0x10005fd1d: cmp byte ptr [rbp - 0x5a], 0
0x10005fd21: je 0x1000601a0
0x10005fd27: mov edx, r10d
0x10005fd2a: mov eax, r9d
0x10005fd2d: mov esi, ebx
0x10005fd2f: cmp r10d, 5
0x10005fd33: ja 0x1000601a0
0x10005fd39: mov eax, r10d
0x10005fd3c: lea rcx, [rip + 0xe25] ; 0x100060b68
0x10005fd43: movsxd rax, dword ptr [rcx + rax*4]
0x10005fd47: add rax, rcx
0x10005fd4a: jmp rax
0x10005fd4c: test ebx, ebx
0x10005fd4e: mov esi, dword ptr [rbp - 0x44]
0x10005fd51: cmovs esi, dword ptr [rbp - 0x4c]
0x10005fd55: movzx ecx, byte ptr [rbp - 0x2a]
0x10005fd59: and cl, 1
0x10005fd5c: mov r9d, dword ptr [rbp - 0x30]
0x10005fd60: mov eax, r9d
0x10005fd63: cmovne eax, dword ptr [rbp - 0xd0]
0x10005fd6a: test cl, cl
0x10005fd6c: cmove esi, ebx
0x10005fd6f: mov edx, dword ptr [rbp - 0x118]
0x10005fd75: jmp 0x1000601a0 ; 0x1000601a0
0x10005fd7a: test ebx, ebx
0x10005fd7c: mov ecx, dword ptr [rbp - 0x88]
0x10005fd82: cmovs ecx, r13d
0x10005fd86: mov esi, dword ptr [rbp - 0x90]
0x10005fd8c: mov eax, dword ptr [rbp - 0xcc]
0x10005fd92: mov edx, ecx
0x10005fd94: test byte ptr [rbp - 0x2a], 1
0x10005fd98: jne 0x10005fef0
0x10005fd9e: mov eax, dword ptr [rbp - 0x3c]
0x10005fda1: cmp eax, r11d
0x10005fda4: mov ecx, dword ptr [rbp - 0x78]
0x10005fda7: mov edx, ecx
0x10005fda9: cmovb edx, ebx
0x10005fdac: test eax, eax
0x10005fdae: mov eax, 5
0x10005fdb3: mov esi, dword ptr [rbp - 0x208]
0x10005fdb9: jmp 0x10005fed6 ; 0x10005fed6
0x10005fdbe: cmp dword ptr [rbp - 0x3c], 0
0x10005fdc2: sets cl
0x10005fdc5: test ebx, ebx
0x10005fdc7: mov eax, r13d
0x10005fdca: mov edi, dword ptr [rbp - 0x88]
0x10005fdd0: cmovs eax, edi
0x10005fdd3: movzx edx, byte ptr [rbp - 0x2a]
0x10005fdd7: or cl, dl
0x10005fdd9: and dl, 1
0x10005fddc: cmovne edi, dword ptr [rbp - 0xcc]
0x10005fde3: test dl, dl
0x10005fde5: cmove eax, dword ptr [rbp - 0x78]
0x10005fde9: mov esi, dword ptr [rbp - 0x140]
0x10005fdef: mov edx, edi
0x10005fdf1: test cl, 1
0x10005fdf4: jne 0x10005fef0
0x10005fdfa: mov eax, dword ptr [rbp - 0x3c]
0x10005fdfd: cmp eax, r11d
0x10005fe00: cmovae eax, dword ptr [rbp - 0xc0]
0x10005fe07: cmovb r13d, ebx
0x10005fe0b: mov esi, dword ptr [rbp - 0x1b0]
0x10005fe11: mov edx, r13d
0x10005fe14: jmp 0x10005fef0 ; 0x10005fef0
0x10005fe19: cmp dword ptr [rbp - 0x3c], 0
0x10005fe1d: sets cl
0x10005fe20: test ebx, ebx
0x10005fe22: mov edi, dword ptr [rbp - 0x88]
0x10005fe28: mov eax, edi
0x10005fe2a: cmovs eax, r13d
0x10005fe2e: movzx edx, byte ptr [rbp - 0x2a]
0x10005fe32: or cl, dl
0x10005fe34: and dl, 1
0x10005fe37: cmovne r13d, dword ptr [rbp - 0xd0]
0x10005fe3f: test dl, dl
0x10005fe41: cmove eax, dword ptr [rbp - 0xc0]
0x10005fe48: mov rdx, qword ptr [rbp - 0x218]
0x10005fe4f: mov esi, edx
0x10005fe51: mov edx, r13d
0x10005fe54: test cl, 1
0x10005fe57: jne 0x10005fef0
0x10005fe5d: mov eax, dword ptr [rbp - 0x3c]
0x10005fe60: cmp eax, r11d
0x10005fe63: cmovae eax, dword ptr [rbp - 0x78]
0x10005fe67: cmovb edi, ebx
0x10005fe6a: mov esi, dword ptr [rbp - 0x1b4]
0x10005fe70: mov edx, edi
0x10005fe72: jmp 0x10005fef0 ; 0x10005fef0
0x10005fe74: mov esi, dword ptr [rbp - 0x90]
0x10005fe7a: mov eax, r13d
0x10005fe7d: mov edx, dword ptr [rbp - 0x78]
0x10005fe80: test byte ptr [rbp - 0x2a], 1
0x10005fe84: jne 0x10005fef0
0x10005fe86: mov eax, dword ptr [rbp - 0x3c]
0x10005fe89: cmp eax, r11d
0x10005fe8c: mov ecx, dword ptr [rbp - 0x78]
0x10005fe8f: mov edx, ecx
0x10005fe91: cmovb edx, ebx
0x10005fe94: test eax, eax
0x10005fe96: mov eax, 1
0x10005fe9b: mov esi, dword ptr [rbp - 0x1ac]
0x10005fea1: jmp 0x10005fed6 ; 0x10005fed6
0x10005fea3: mov esi, dword ptr [rbp - 0x90]
0x10005fea9: mov eax, dword ptr [rbp - 0x88]
0x10005feaf: mov edx, dword ptr [rbp - 0xc0]
0x10005feb5: test byte ptr [rbp - 0x2a], 1
0x10005feb9: jne 0x10005fef0
0x10005febb: mov eax, dword ptr [rbp - 0x3c]
0x10005febe: cmp eax, r11d
0x10005fec1: mov ecx, dword ptr [rbp - 0x78]
0x10005fec4: mov edx, ecx
0x10005fec6: cmovb edx, ebx
0x10005fec9: test eax, eax
0x10005fecb: mov eax, 0
0x10005fed0: mov esi, dword ptr [rbp - 0x1a8]
0x10005fed6: cmovs esi, eax
0x10005fed9: mov eax, dword ptr [rbp - 0x94]
0x10005fedf: cmovs eax, r13d
0x10005fee3: cmovs edx, ecx
0x10005fee6: nop word ptr cs:[rax + rax]
0x10005fef0: imul esi, r11d
0x10005fef4: add esi, edx
0x10005fef6: imul esi, r11d
0x10005fefa: add eax, dword ptr [rbp - 0x74]
0x10005fefd: add eax, esi
0x10005feff: mov ecx, r14d
0x10005ff02: mov rdx, qword ptr [rbp - 0xa8]
0x10005ff09: mov dword ptr [rdx + rcx*4 + 0x914], eax
0x10005ff10: cmp byte ptr [rbp - 0x5a], 0
0x10005ff14: je 0x10005ffa0
0x10005ff1a: mov r9d, dword ptr [rbp - 0xe8]
0x10005ff21: mov r13d, dword ptr [rbp - 0xec]
0x10005ff28: mov esi, r10d
0x10005ff2b: mov eax, dword ptr [rbp - 0x30]
0x10005ff2e: mov edx, ebx
0x10005ff30: imul esi, r11d
0x10005ff34: add esi, edx
0x10005ff36: imul esi, r11d
0x10005ff3a: add eax, dword ptr [rbp - 0x74]
0x10005ff3d: add eax, esi
0x10005ff3f: mov ecx, r14d
0x10005ff42: or ecx, 1
0x10005ff45: mov rdx, qword ptr [rbp - 0xa8]
0x10005ff4c: mov dword ptr [rdx + rcx*4 + 0x914], eax
0x10005ff53: cmp byte ptr [rbp - 0x5b], 0
0x10005ff57: je 0x100060010
0x10005ff5d: mov esi, r10d
0x10005ff60: mov rax, qword ptr [rbp - 0x68]
0x10005ff64: mov edx, ebx
0x10005ff66: imul esi, r11d
0x10005ff6a: add esi, edx
0x10005ff6c: imul esi, r11d
0x10005ff70: add eax, dword ptr [rbp - 0x74]
0x10005ff73: add eax, esi
0x10005ff75: mov ecx, r14d
0x10005ff78: or ecx, 2
0x10005ff7b: mov rdx, qword ptr [rbp - 0xa8]
0x10005ff82: mov dword ptr [rdx + rcx*4 + 0x914], eax
0x10005ff89: cmp byte ptr [rbp - 0x51], 0
0x10005ff8d: je 0x100060080
0x10005ff93: mov edx, r10d
0x10005ff96: mov eax, ebx
0x10005ff98: mov edi, r8d
0x10005ff9b: jmp 0x100060883 ; 0x100060883
0x10005ffa0: mov r9d, dword ptr [rbp - 0xe8]
0x10005ffa7: mov r13d, dword ptr [rbp - 0xec]
0x10005ffae: cmp r10d, 5
0x10005ffb2: ja 0x10005ff28
0x10005ffb8: mov eax, r10d
0x10005ffbb: lea rcx, [rip + 0xc06] ; 0x100060bc8
0x10005ffc2: movsxd rax, dword ptr [rcx + rax*4]
0x10005ffc6: add rax, rcx
0x10005ffc9: jmp rax
0x10005ffcb: test ebx, ebx
0x10005ffcd: mov ecx, dword ptr [rbp - 0x44]
0x10005ffd0: mov edx, dword ptr [rbp - 0x4c]
0x10005ffd3: cmovns edx, ecx
0x10005ffd6: mov esi, dword ptr [rbp - 0x90]
0x10005ffdc: mov eax, dword ptr [rbp - 0xd0]
0x10005ffe2: test byte ptr [rbp - 0x2a], 1
0x10005ffe6: jne 0x10005ff30
0x10005ffec: mov eax, dword ptr [rbp - 0x30]
0x10005ffef: cmp eax, r11d
0x10005fff2: mov esi, dword ptr [rbp - 0x78]
0x10005fff5: mov edx, esi
0x10005fff7: cmovb edx, ebx
0x10005fffa: test eax, eax
0x10005fffc: mov eax, 4
0x100060001: mov edi, dword ptr [rbp - 0x1a4]
0x100060007: jmp 0x100060364 ; 0x100060364
0x10006000c: nop dword ptr [rax]
0x100060010: cmp r10d, 5
0x100060014: ja 0x10005ff5d
0x10006001a: mov eax, r10d
0x10006001d: lea rcx, [rip + 0xbbc] ; 0x100060be0
0x100060024: movsxd rax, dword ptr [rcx + rax*4]
0x100060028: add rax, rcx
0x10006002b: jmp rax
0x10006002d: test ebx, ebx
0x10006002f: mov ecx, dword ptr [rbp - 0x50]
0x100060032: mov edi, dword ptr [rbp - 0x48]
0x100060035: cmovns ecx, edi
0x100060038: mov esi, dword ptr [rbp - 0x90]
0x10006003e: mov eax, dword ptr [rbp - 0xd0]
0x100060044: mov edx, ecx
0x100060046: test byte ptr [rbp - 0x2a], 1
0x10006004a: jne 0x10005ff66
0x100060050: mov rax, qword ptr [rbp - 0x68]
0x100060054: cmp eax, r11d
0x100060057: mov ecx, dword ptr [rbp - 0x78]
0x10006005a: mov edx, ecx
0x10006005c: cmovb edx, ebx
0x10006005f: test eax, eax
0x100060061: mov eax, 4
0x100060066: mov esi, dword ptr [rbp - 0x1d8]
0x10006006c: jmp 0x100060540 ; 0x100060540
0x100060071: nop word ptr cs:[rax + rax]
0x100060080: mov edx, r10d
0x100060083: mov eax, ebx
0x100060085: mov r15d, r8d
0x100060088: mov edi, r8d
0x10006008b: cmp r10d, 5
0x10006008f: ja 0x100060883
0x100060095: mov eax, r10d
0x100060098: lea rcx, [rip + 0xb59] ; 0x100060bf8
0x10006009f: movsxd rax, dword ptr [rcx + rax*4]
0x1000600a3: add rax, rcx
0x1000600a6: jmp rax
0x1000600a8: test ebx, ebx
0x1000600aa: mov eax, dword ptr [rbp - 0x58]
0x1000600ad: cmovns eax, dword ptr [rbp - 0x40]
0x1000600b1: mov edx, dword ptr [rbp - 0x90]
0x1000600b7: mov edi, dword ptr [rbp - 0xd0]
0x1000600bd: test byte ptr [rbp - 0x2a], 1
0x1000600c1: jne 0x100060883
0x1000600c7: cmp r15d, r11d
0x1000600ca: mov edx, dword ptr [rbp - 0x78]
0x1000600cd: mov eax, edx
0x1000600cf: cmovb eax, ebx
0x1000600d2: test r15d, r15d
0x1000600d5: mov ecx, 4
0x1000600da: mov esi, dword ptr [rbp - 0x1f0]
0x1000600e0: jmp 0x10006069d ; 0x10006069d
0x1000600e5: test ebx, ebx
0x1000600e7: mov esi, dword ptr [rbp - 0x4c]
0x1000600ea: cmovs esi, dword ptr [rbp - 0x44]
0x1000600ee: movzx ecx, byte ptr [rbp - 0x2a]
0x1000600f2: and cl, 1
0x1000600f5: mov r9d, dword ptr [rbp - 0x30]
0x1000600f9: mov eax, r9d
0x1000600fc: cmovne eax, dword ptr [rbp - 0xcc]
0x100060103: test cl, cl
0x100060105: cmove esi, ebx
0x100060108: mov edx, dword ptr [rbp - 0x11c]
0x10006010e: jmp 0x1000601a0 ; 0x1000601a0
0x100060113: test ebx, ebx
0x100060115: mov eax, dword ptr [rbp - 0x44]
0x100060118: cmovs eax, dword ptr [rbp - 0x4c]
0x10006011c: test byte ptr [rbp - 0x2a], 1
0x100060120: mov r9d, dword ptr [rbp - 0x30]
0x100060124: cmove eax, r9d
0x100060128: mov edx, dword ptr [rbp - 0x134]
0x10006012e: mov esi, dword ptr [rbp - 0x130]
0x100060134: jmp 0x1000601a0 ; 0x1000601a0
0x100060136: test ebx, ebx
0x100060138: mov eax, dword ptr [rbp - 0x4c]
0x10006013b: cmovs eax, dword ptr [rbp - 0x44]
0x10006013f: test byte ptr [rbp - 0x2a], 1
0x100060143: mov r9d, dword ptr [rbp - 0x30]
0x100060147: cmove eax, r9d
0x10006014b: mov edx, dword ptr [rbp - 0x13c]
0x100060151: mov esi, dword ptr [rbp - 0x138]
0x100060157: jmp 0x1000601a0 ; 0x1000601a0
0x100060159: test byte ptr [rbp - 0x2a], 1
0x10006015d: mov r9d, dword ptr [rbp - 0x30]
0x100060161: mov eax, dword ptr [rbp - 0x44]
0x100060164: cmove eax, r9d
0x100060168: mov edx, dword ptr [rbp - 0x124]
0x10006016e: mov esi, dword ptr [rbp - 0x120]
0x100060174: jmp 0x1000601a0 ; 0x1000601a0
0x100060176: test byte ptr [rbp - 0x2a], 1
0x10006017a: mov r9d, dword ptr [rbp - 0x30]
0x10006017e: mov eax, dword ptr [rbp - 0x4c]
0x100060181: cmove eax, r9d
0x100060185: mov edx, dword ptr [rbp - 0x12c]
0x10006018b: mov esi, dword ptr [rbp - 0x128]
0x100060191: nop word ptr cs:[rax + rax]
0x1000601a0: imul edx, r11d
0x1000601a4: add edx, esi
0x1000601a6: imul edx, r11d
0x1000601aa: add eax, dword ptr [rbp - 0x74]
0x1000601ad: add eax, edx
0x1000601af: mov ecx, r14d
0x1000601b2: or ecx, 1
0x1000601b5: mov rdx, qword ptr [rbp - 0xa8]
0x1000601bc: mov dword ptr [rdx + rcx*4 + 0x914], eax
0x1000601c3: mov eax, r10d
0x1000601c6: mov esi, r12d
0x1000601c9: cmp byte ptr [rbp - 0x5b], 0
0x1000601cd: je 0x100060760
0x1000601d3: mov eax, r10d
0x1000601d6: mov rcx, qword ptr [rbp - 0x68]
0x1000601da: mov r9d, ecx
0x1000601dd: mov esi, ebx
0x1000601df: cmp r10d, 5
0x1000601e3: ja 0x100060760
0x1000601e9: mov eax, r10d
0x1000601ec: lea rcx, [rip + 0x98d] ; 0x100060b80
0x1000601f3: movsxd rax, dword ptr [rcx + rax*4]
0x1000601f7: add rax, rcx
0x1000601fa: jmp rax
0x1000601fc: test ebx, ebx
0x1000601fe: cmovs edi, dword ptr [rbp - 0x50]
0x100060202: movzx eax, byte ptr [rbp - 0x2a]
0x100060206: and al, 1
0x100060208: mov rcx, qword ptr [rbp - 0x68]
0x10006020c: cmovne ecx, dword ptr [rbp - 0xd0]
0x100060213: test al, al
0x100060215: cmove edi, ebx
0x100060218: mov eax, dword ptr [rbp - 0x118]
0x10006021e: mov r9d, ecx
0x100060221: mov esi, edi
0x100060223: jmp 0x100060760 ; 0x100060760
0x100060228: test ebx, ebx
0x10006022a: mov ecx, dword ptr [rbp - 0x44]
0x10006022d: mov edx, dword ptr [rbp - 0x4c]
0x100060230: cmovs edx, ecx
0x100060233: mov esi, dword ptr [rbp - 0x90]
0x100060239: mov eax, dword ptr [rbp - 0xcc]
0x10006023f: test byte ptr [rbp - 0x2a], 1
0x100060243: jne 0x10005ff30
0x100060249: mov eax, dword ptr [rbp - 0x30]
0x10006024c: cmp eax, r11d
0x10006024f: mov esi, dword ptr [rbp - 0x78]
0x100060252: mov edx, esi
0x100060254: cmovb edx, ebx
0x100060257: test eax, eax
0x100060259: mov eax, 5
0x10006025e: cmovs r15d, eax
0x100060262: mov eax, dword ptr [rbp - 0x98]
0x100060268: cmovs eax, ecx
0x10006026b: cmovs edx, esi
0x10006026e: mov esi, r15d
0x100060271: jmp 0x10005ff30 ; 0x10005ff30
0x100060276: cmp dword ptr [rbp - 0x30], 0
0x10006027a: sets cl
0x10006027d: test ebx, ebx
0x10006027f: mov r15d, dword ptr [rbp - 0x44]
0x100060283: mov eax, r15d
0x100060286: mov edi, dword ptr [rbp - 0x4c]
0x100060289: cmovs eax, edi
0x10006028c: movzx edx, byte ptr [rbp - 0x2a]
0x100060290: or cl, dl
0x100060292: and dl, 1
0x100060295: cmovne edi, dword ptr [rbp - 0xcc]
0x10006029c: test dl, dl
0x10006029e: cmove eax, dword ptr [rbp - 0x78]
0x1000602a2: mov esi, dword ptr [rbp - 0x140]
0x1000602a8: mov edx, edi
0x1000602aa: test cl, 1
0x1000602ad: jne 0x10005ff30
0x1000602b3: mov eax, dword ptr [rbp - 0x30]
0x1000602b6: cmp eax, r11d
0x1000602b9: cmovae eax, dword ptr [rbp - 0xc0]
0x1000602c0: cmovb r15d, ebx
0x1000602c4: mov esi, dword ptr [rbp - 0x1c4]
0x1000602ca: mov edx, r15d
0x1000602cd: jmp 0x10005ff30 ; 0x10005ff30
0x1000602d2: cmp dword ptr [rbp - 0x30], 0
0x1000602d6: sets cl
0x1000602d9: test ebx, ebx
0x1000602db: mov r15d, dword ptr [rbp - 0x4c]
0x1000602df: mov eax, r15d
0x1000602e2: mov edi, dword ptr [rbp - 0x44]
0x1000602e5: cmovs eax, edi
0x1000602e8: movzx edx, byte ptr [rbp - 0x2a]
0x1000602ec: or cl, dl
0x1000602ee: and dl, 1
0x1000602f1: cmovne edi, dword ptr [rbp - 0xd0]
0x1000602f8: test dl, dl
0x1000602fa: cmove eax, dword ptr [rbp - 0xc0]
0x100060301: mov rdx, qword ptr [rbp - 0x218]
0x100060308: mov esi, edx
0x10006030a: mov edx, edi
0x10006030c: test cl, 1
0x10006030f: jne 0x10005ff30
0x100060315: mov eax, dword ptr [rbp - 0x30]
0x100060318: cmp eax, r11d
0x10006031b: cmovae eax, dword ptr [rbp - 0x78]
0x10006031f: cmovb r15d, ebx
0x100060323: mov esi, dword ptr [rbp - 0x1c8]
0x100060329: mov edx, r15d
0x10006032c: jmp 0x10005ff30 ; 0x10005ff30
0x100060331: mov esi, dword ptr [rbp - 0x90]
0x100060337: mov ecx, dword ptr [rbp - 0x44]
0x10006033a: mov eax, ecx
0x10006033c: mov edx, dword ptr [rbp - 0x78]
0x10006033f: test byte ptr [rbp - 0x2a], 1
0x100060343: jne 0x10005ff30
0x100060349: mov eax, dword ptr [rbp - 0x30]
0x10006034c: cmp eax, r11d
0x10006034f: mov esi, dword ptr [rbp - 0x78]
0x100060352: mov edx, esi
0x100060354: cmovb edx, ebx
0x100060357: test eax, eax
0x100060359: mov eax, 1
0x10006035e: mov edi, dword ptr [rbp - 0x1c0]
0x100060364: cmovs edi, eax
0x100060367: mov eax, dword ptr [rbp - 0x98]
0x10006036d: cmovs eax, ecx
0x100060370: cmovs edx, esi
0x100060373: mov esi, edi
0x100060375: jmp 0x10005ff30 ; 0x10005ff30
0x10006037a: mov esi, dword ptr [rbp - 0x90]
0x100060380: mov eax, dword ptr [rbp - 0x4c]
0x100060383: mov edx, dword ptr [rbp - 0xc0]
0x100060389: test byte ptr [rbp - 0x2a], 1
0x10006038d: mov r15d, dword ptr [rbp - 0x44]
0x100060391: jne 0x10005ff30
0x100060397: mov eax, dword ptr [rbp - 0x30]
0x10006039a: cmp eax, r11d
0x10006039d: mov ecx, dword ptr [rbp - 0x78]
0x1000603a0: mov edx, ecx
0x1000603a2: cmovb edx, ebx
0x1000603a5: test eax, eax
0x1000603a7: mov eax, 0
0x1000603ac: mov esi, dword ptr [rbp - 0x1bc]
0x1000603b2: cmovs esi, eax
0x1000603b5: mov eax, dword ptr [rbp - 0x98]
0x1000603bb: cmovs eax, r15d
0x1000603bf: cmovs edx, ecx
0x1000603c2: jmp 0x10005ff30 ; 0x10005ff30
0x1000603c7: test ebx, ebx
0x1000603c9: mov ecx, dword ptr [rbp - 0x50]
0x1000603cc: mov edi, dword ptr [rbp - 0x48]
0x1000603cf: cmovs ecx, edi
0x1000603d2: mov esi, dword ptr [rbp - 0x90]
0x1000603d8: mov eax, dword ptr [rbp - 0xcc]
0x1000603de: mov edx, ecx
0x1000603e0: test byte ptr [rbp - 0x2a], 1
0x1000603e4: jne 0x10005ff66
0x1000603ea: mov rax, qword ptr [rbp - 0x68]
0x1000603ee: cmp eax, r11d
0x1000603f1: mov ecx, dword ptr [rbp - 0x78]
0x1000603f4: mov edx, ecx
0x1000603f6: cmovb edx, ebx
0x1000603f9: test eax, eax
0x1000603fb: mov eax, 5
0x100060400: cmovs r13d, eax
0x100060404: mov eax, dword ptr [rbp - 0x9c]
0x10006040a: cmovs eax, edi
0x10006040d: cmovs edx, ecx
0x100060410: mov esi, r13d
0x100060413: jmp 0x10005ff66 ; 0x10005ff66
0x100060418: cmp dword ptr [rbp - 0x68], 0
0x10006041c: sets cl
0x10006041f: test ebx, ebx
0x100060421: mov r9d, dword ptr [rbp - 0x48]
0x100060425: mov eax, r9d
0x100060428: mov edi, dword ptr [rbp - 0x50]
0x10006042b: cmovs eax, edi
0x10006042e: movzx edx, byte ptr [rbp - 0x2a]
0x100060432: or cl, dl
0x100060434: and dl, 1
0x100060437: cmovne edi, dword ptr [rbp - 0xcc]
0x10006043e: test dl, dl
0x100060440: cmove eax, dword ptr [rbp - 0x78]
0x100060444: mov esi, dword ptr [rbp - 0x140]
0x10006044a: mov edx, edi
0x10006044c: test cl, 1
0x10006044f: jne 0x10005ff66
0x100060455: mov rax, qword ptr [rbp - 0x68]
0x100060459: cmp eax, r11d
0x10006045c: cmovae eax, dword ptr [rbp - 0xc0]
0x100060463: cmovb r9d, ebx
0x100060467: mov esi, dword ptr [rbp - 0x1d4]
0x10006046d: mov edx, r9d
0x100060470: jmp 0x10005ff66 ; 0x10005ff66
0x100060475: cmp dword ptr [rbp - 0x68], 0
0x100060479: sets cl
0x10006047c: test ebx, ebx
0x10006047e: mov r15d, dword ptr [rbp - 0x50]
0x100060482: mov eax, r15d
0x100060485: mov edi, dword ptr [rbp - 0x48]
0x100060488: cmovs eax, edi
0x10006048b: movzx edx, byte ptr [rbp - 0x2a]
0x10006048f: or cl, dl
0x100060491: and dl, 1
0x100060494: cmovne edi, dword ptr [rbp - 0xd0]
0x10006049b: test dl, dl
0x10006049d: cmove eax, dword ptr [rbp - 0xc0]
0x1000604a4: mov rdx, qword ptr [rbp - 0x218]
0x1000604ab: mov esi, edx
0x1000604ad: mov edx, edi
0x1000604af: test cl, 1
0x1000604b2: jne 0x10005ff66
0x1000604b8: mov rax, qword ptr [rbp - 0x68]
0x1000604bc: cmp eax, r11d
0x1000604bf: cmovae eax, dword ptr [rbp - 0x78]
0x1000604c3: cmovb r15d, ebx
0x1000604c7: mov esi, r9d
0x1000604ca: mov edx, r15d
0x1000604cd: jmp 0x10005ff66 ; 0x10005ff66
0x1000604d2: mov esi, dword ptr [rbp - 0x90]
0x1000604d8: mov edi, dword ptr [rbp - 0x48]
0x1000604db: mov eax, edi
0x1000604dd: mov edx, dword ptr [rbp - 0x78]
0x1000604e0: test byte ptr [rbp - 0x2a], 1
0x1000604e4: jne 0x10005ff66
0x1000604ea: mov rax, qword ptr [rbp - 0x68]
0x1000604ee: cmp eax, r11d
0x1000604f1: mov ecx, dword ptr [rbp - 0x78]
0x1000604f4: mov edx, ecx
0x1000604f6: cmovb edx, ebx
0x1000604f9: test eax, eax
0x1000604fb: mov eax, 1
0x100060500: mov esi, dword ptr [rbp - 0x1d0]
0x100060506: jmp 0x100060540 ; 0x100060540
0x100060508: mov esi, dword ptr [rbp - 0x90]
0x10006050e: mov eax, dword ptr [rbp - 0x50]
0x100060511: mov edx, dword ptr [rbp - 0xc0]
0x100060517: test byte ptr [rbp - 0x2a], 1
0x10006051b: mov edi, dword ptr [rbp - 0x48]
0x10006051e: jne 0x10005ff66
0x100060524: mov rax, qword ptr [rbp - 0x68]
0x100060528: cmp eax, r11d
0x10006052b: mov ecx, dword ptr [rbp - 0x78]
0x10006052e: mov edx, ecx
0x100060530: cmovb edx, ebx
0x100060533: test eax, eax
0x100060535: mov eax, 0
0x10006053a: mov esi, dword ptr [rbp - 0x1cc]
0x100060540: cmovs esi, eax
0x100060543: mov eax, dword ptr [rbp - 0x9c]
0x100060549: cmovs eax, edi
0x10006054c: cmovs edx, ecx
0x10006054f: jmp 0x10005ff66 ; 0x10005ff66
0x100060554: test ebx, ebx
0x100060556: mov eax, dword ptr [rbp - 0x58]
0x100060559: cmovs eax, dword ptr [rbp - 0x40]
0x10006055d: mov edx, dword ptr [rbp - 0x90]
0x100060563: mov edi, dword ptr [rbp - 0xcc]
0x100060569: test byte ptr [rbp - 0x2a], 1
0x10006056d: jne 0x100060883
0x100060573: cmp r15d, r11d
0x100060576: mov edx, dword ptr [rbp - 0x78]
0x100060579: mov eax, edx
0x10006057b: cmovb eax, ebx
0x10006057e: test r15d, r15d
0x100060581: mov ecx, 5
0x100060586: mov esi, dword ptr [rbp - 0x1ec]
0x10006058c: jmp 0x10006069d ; 0x10006069d
0x100060591: test r15d, r15d
0x100060594: sets cl
0x100060597: test ebx, ebx
0x100060599: mov edi, dword ptr [rbp - 0x40]
0x10006059c: mov esi, dword ptr [rbp - 0x58]
0x10006059f: cmovs edi, esi
0x1000605a2: movzx eax, byte ptr [rbp - 0x2a]
0x1000605a6: or cl, al
0x1000605a8: and al, 1
0x1000605aa: cmovne esi, dword ptr [rbp - 0xcc]
0x1000605b1: test al, al
0x1000605b3: cmove edi, dword ptr [rbp - 0x78]
0x1000605b7: mov edx, dword ptr [rbp - 0x140]
0x1000605bd: mov eax, esi
0x1000605bf: test cl, 1
0x1000605c2: jne 0x100060883
0x1000605c8: cmp r15d, r11d
0x1000605cb: cmovae r15d, dword ptr [rbp - 0xc0]
0x1000605d3: mov eax, dword ptr [rbp - 0x40]
0x1000605d6: cmovb eax, ebx
0x1000605d9: mov edx, dword ptr [rbp - 0x1e4]
0x1000605df: jmp 0x100060880 ; 0x100060880
0x1000605e4: test r15d, r15d
0x1000605e7: sets cl
0x1000605ea: test ebx, ebx
0x1000605ec: mov edi, dword ptr [rbp - 0x58]
0x1000605ef: mov esi, dword ptr [rbp - 0x40]
0x1000605f2: cmovs edi, esi
0x1000605f5: movzx eax, byte ptr [rbp - 0x2a]
0x1000605f9: or cl, al
0x1000605fb: and al, 1
0x1000605fd: cmovne esi, dword ptr [rbp - 0xd0]
0x100060604: test al, al
0x100060606: cmove edi, dword ptr [rbp - 0xc0]
0x10006060d: mov rax, qword ptr [rbp - 0x218]
0x100060614: mov edx, eax
0x100060616: mov eax, esi
0x100060618: test cl, 1
0x10006061b: jne 0x100060883
0x100060621: cmp r15d, r11d
0x100060624: cmovae r15d, dword ptr [rbp - 0x78]
0x100060629: mov eax, dword ptr [rbp - 0x58]
0x10006062c: cmovb eax, ebx
0x10006062f: mov edx, dword ptr [rbp - 0x1e8]
0x100060635: jmp 0x100060880 ; 0x100060880
0x10006063a: mov edx, dword ptr [rbp - 0x90]
0x100060640: mov eax, dword ptr [rbp - 0x78]
0x100060643: mov edi, dword ptr [rbp - 0x40]
0x100060646: test byte ptr [rbp - 0x2a], 1
0x10006064a: jne 0x100060883
0x100060650: cmp r15d, r11d
0x100060653: mov edx, dword ptr [rbp - 0x78]
0x100060656: mov eax, edx
0x100060658: cmovb eax, ebx
0x10006065b: test r15d, r15d
0x10006065e: mov ecx, 1
0x100060663: mov esi, dword ptr [rbp - 0x1e0]
0x100060669: jmp 0x10006069d ; 0x10006069d
0x10006066b: mov edx, dword ptr [rbp - 0x90]
0x100060671: mov eax, dword ptr [rbp - 0xc0]
0x100060677: mov edi, dword ptr [rbp - 0x58]
0x10006067a: test byte ptr [rbp - 0x2a], 1
0x10006067e: jne 0x100060883
0x100060684: cmp r15d, r11d
0x100060687: mov edx, dword ptr [rbp - 0x78]
0x10006068a: mov eax, edx
0x10006068c: cmovb eax, ebx
0x10006068f: test r15d, r15d
0x100060692: mov ecx, 0
0x100060697: mov esi, dword ptr [rbp - 0x1dc]
0x10006069d: cmovs esi, ecx
0x1000606a0: mov ecx, dword ptr [rbp - 0xa0]
0x1000606a6: cmovs ecx, dword ptr [rbp - 0x40]
0x1000606aa: cmovs eax, edx
0x1000606ad: mov edx, esi
0x1000606af: mov edi, ecx
0x1000606b1: jmp 0x100060883 ; 0x100060883
0x1000606b6: test ebx, ebx
0x1000606b8: mov esi, dword ptr [rbp - 0x50]
0x1000606bb: cmovs esi, edi
0x1000606be: movzx eax, byte ptr [rbp - 0x2a]
0x1000606c2: and al, 1
0x1000606c4: mov rcx, qword ptr [rbp - 0x68]
0x1000606c8: cmovne ecx, dword ptr [rbp - 0xcc]
0x1000606cf: test al, al
0x1000606d1: cmove esi, ebx
0x1000606d4: mov eax, dword ptr [rbp - 0x11c]
0x1000606da: mov r9d, ecx
0x1000606dd: jmp 0x100060760 ; 0x100060760
0x1000606e2: test ebx, ebx
0x1000606e4: cmovs edi, dword ptr [rbp - 0x50]
0x1000606e8: test byte ptr [rbp - 0x2a], 1
0x1000606ec: mov rcx, qword ptr [rbp - 0x68]
0x1000606f0: cmovne ecx, edi
0x1000606f3: mov eax, dword ptr [rbp - 0x134]
0x1000606f9: mov r9d, ecx
0x1000606fc: mov esi, dword ptr [rbp - 0x130]
0x100060702: jmp 0x100060760 ; 0x100060760
0x100060704: test ebx, ebx
0x100060706: mov eax, dword ptr [rbp - 0x50]
0x100060709: cmovs eax, edi
0x10006070c: test byte ptr [rbp - 0x2a], 1
0x100060710: mov rcx, qword ptr [rbp - 0x68]
0x100060714: cmovne ecx, eax
0x100060717: mov eax, dword ptr [rbp - 0x13c]
0x10006071d: mov r9d, ecx
0x100060720: mov esi, dword ptr [rbp - 0x138]
0x100060726: jmp 0x100060760 ; 0x100060760
0x100060728: test byte ptr [rbp - 0x2a], 1
0x10006072c: mov rcx, qword ptr [rbp - 0x68]
0x100060730: cmovne ecx, edi
0x100060733: mov eax, dword ptr [rbp - 0x124]
0x100060739: mov r9d, ecx
0x10006073c: mov esi, dword ptr [rbp - 0x120]
0x100060742: jmp 0x100060760 ; 0x100060760
0x100060744: test byte ptr [rbp - 0x2a], 1
0x100060748: mov rcx, qword ptr [rbp - 0x68]
0x10006074c: cmovne ecx, dword ptr [rbp - 0x50]
0x100060750: mov eax, dword ptr [rbp - 0x12c]
0x100060756: mov r9d, ecx
0x100060759: mov esi, dword ptr [rbp - 0x128]
0x10006075f: nop 
0x100060760: imul eax, r11d
0x100060764: add eax, esi
0x100060766: imul eax, r11d
0x10006076a: add r9d, dword ptr [rbp - 0x74]
0x10006076e: add r9d, eax
0x100060771: mov eax, r14d
0x100060774: or eax, 2
0x100060777: mov rcx, qword ptr [rbp - 0xa8]
0x10006077e: mov dword ptr [rcx + rax*4 + 0x914], r9d
0x100060786: mov edx, r10d
0x100060789: mov eax, r12d
0x10006078c: cmp byte ptr [rbp - 0x51], 0
0x100060790: mov edi, dword ptr [rbp - 0x30]
0x100060793: je 0x100060883
0x100060799: cmp r10d, 5
0x10006079d: ja 0x1000607db
0x10006079f: mov eax, r10d
0x1000607a2: lea rcx, [rip + 0x3ef] ; 0x100060b98
0x1000607a9: movsxd rax, dword ptr [rcx + rax*4]
0x1000607ad: add rax, rcx
0x1000607b0: jmp rax
0x1000607b2: test ebx, ebx
0x1000607b4: mov ecx, dword ptr [rbp - 0x40]
0x1000607b7: cmovs ecx, r8d
0x1000607bb: movzx eax, byte ptr [rbp - 0x2a]
0x1000607bf: and al, 1
0x1000607c1: cmovne r15d, dword ptr [rbp - 0xd0]
0x1000607c9: test al, al
0x1000607cb: cmove ecx, ebx
0x1000607ce: mov edx, dword ptr [rbp - 0x118]
0x1000607d4: mov eax, ecx
0x1000607d6: jmp 0x100060880 ; 0x100060880
0x1000607db: mov edx, r10d
0x1000607de: mov eax, ebx
0x1000607e0: jmp 0x100060880 ; 0x100060880
0x1000607e5: test ebx, ebx
0x1000607e7: cmovs r8d, dword ptr [rbp - 0x40]
0x1000607ec: movzx eax, byte ptr [rbp - 0x2a]
0x1000607f0: and al, 1
0x1000607f2: cmovne r15d, dword ptr [rbp - 0xcc]
0x1000607fa: test al, al
0x1000607fc: cmove r8d, ebx
0x100060800: mov edx, dword ptr [rbp - 0x11c]
0x100060806: mov eax, r8d
0x100060809: jmp 0x100060880 ; 0x100060880
0x10006080b: test ebx, ebx
0x10006080d: mov eax, dword ptr [rbp - 0x40]
0x100060810: cmovs eax, r8d
0x100060814: test byte ptr [rbp - 0x2a], 1
0x100060818: cmovne r15d, eax
0x10006081c: mov edx, dword ptr [rbp - 0x134]
0x100060822: mov eax, dword ptr [rbp - 0x130]
0x100060828: jmp 0x100060880 ; 0x100060880
0x10006082a: test ebx, ebx
0x10006082c: cmovs r8d, dword ptr [rbp - 0x40]
0x100060831: test byte ptr [rbp - 0x2a], 1
0x100060835: cmovne r15d, r8d
0x100060839: mov edx, dword ptr [rbp - 0x13c]
0x10006083f: mov eax, dword ptr [rbp - 0x138]
0x100060845: jmp 0x100060880 ; 0x100060880
0x100060847: test byte ptr [rbp - 0x2a], 1
0x10006084b: cmovne r15d, dword ptr [rbp - 0x40]
0x100060850: mov edx, dword ptr [rbp - 0x124]
0x100060856: mov eax, dword ptr [rbp - 0x120]
0x10006085c: jmp 0x100060880 ; 0x100060880
0x10006085e: test byte ptr [rbp - 0x2a], 1
0x100060862: cmovne r15d, r8d
0x100060866: mov edx, dword ptr [rbp - 0x12c]
0x10006086c: mov eax, dword ptr [rbp - 0x128]
0x100060872: nop word ptr cs:[rax + rax]
0x100060880: mov edi, r15d
0x100060883: imul edx, r11d
0x100060887: add edx, eax
0x100060889: imul edx, r11d
0x10006088d: add edi, dword ptr [rbp - 0x74]
0x100060890: add edi, edx
0x100060892: or r14d, 3
0x100060896: mov rax, qword ptr [rbp - 0xa8]
0x10006089d: mov dword ptr [rax + r14*4 + 0x914], edi
0x1000608a5: mov rax, qword ptr [rbp - 0x238]
0x1000608ac: inc eax
0x1000608ae: mov qword ptr [rbp - 0x238], rax
0x1000608b5: cmp eax, dword ptr [rbp - 0x230]
0x1000608bb: jb 0x10005d160
0x1000608c1: mov r8, qword ptr [rbp - 0x250]
0x1000608c8: inc r8d
0x1000608cb: cmp r8d, dword ptr [rbp - 0x230]
0x1000608d2: jb 0x10005cc90
0x1000608d8: mov rax, qword ptr [rbp - 0x228]
0x1000608df: inc eax
0x1000608e1: cmp eax, 6
0x1000608e4: mov ecx, dword ptr [rbp - 0x240]
0x1000608ea: jne 0x10005cc60
0x1000608f0: inc ecx
0x1000608f2: cmp ecx, dword ptr [rbp - 0x23c]
0x1000608f8: jne 0x10005cc20
0x1000608fe: add rsp, 0x238
0x100060905: pop rbx
0x100060906: pop r12
0x100060908: pop r13
0x10006090a: pop r14
0x10006090c: pop r15
0x10006090e: pop rbp
0x10006090f: ret 
