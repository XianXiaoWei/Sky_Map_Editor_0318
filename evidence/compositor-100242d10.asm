0x100242d10: push rbp
0x100242d11: mov rbp, rsp
0x100242d14: push r15
0x100242d16: push r14
0x100242d18: push rbx
0x100242d19: sub rsp, 0xf8
0x100242d20: mov r15, rdx
0x100242d23: mov rbx, rsi
0x100242d26: mov r14, rdi
0x100242d29: mov rax, qword ptr [rip + 0x9caba8] ; 0x100c0d8d8
0x100242d30: mov rax, qword ptr [rax]
0x100242d33: mov qword ptr [rbp - 0x20], rax
0x100242d37: movsxd rax, dword ptr [rbx + 0x20]
0x100242d3b: cmp eax, dword ptr [rip + 0xa56393] ; 0x100c990d4
0x100242d41: jne 0x100242d58
0x100242d43: mov dword ptr [r14 + 0x30], 0
0x100242d4b: mov dword ptr [r14 + 0x28], 1
0x100242d53: jmp 0x100243273 ; 0x100243273
0x100242d58: mov dword ptr [rbp - 0x100], 0xffffffff
0x100242d62: mov dword ptr [rbp - 0xf4], 0xffffffff
0x100242d6c: mov dword ptr [rbp - 0xe0], 0xffffffff
0x100242d76: mov dword ptr [rbp - 0xd4], 0xffffffff
0x100242d80: mov dword ptr [rbp - 0xc0], 0xffffffff
0x100242d8a: mov dword ptr [rbp - 0xb4], 0xffffffff
0x100242d94: mov dword ptr [rbp - 0xa0], 0xffffffff
0x100242d9e: mov dword ptr [rbp - 0x94], 0xffffffff
0x100242da8: mov dword ptr [rbp - 0x80], 0xffffffff
0x100242daf: mov dword ptr [rbp - 0x74], 0xffffffff
0x100242db6: mov dword ptr [rbp - 0x60], 0xffffffff
0x100242dbd: mov dword ptr [rbp - 0x54], 0xffffffff
0x100242dc4: mov qword ptr [rbp - 0x40], 0
0x100242dcc: lea rcx, [rbx + 1]
0x100242dd0: test byte ptr [rbx], 1
0x100242dd3: cmovne rcx, qword ptr [rbx + 0x10]
0x100242dd8: mov qword ptr [rbp - 0x108], rcx
0x100242ddf: mov edx, 0xffffffff
0x100242de4: test eax, eax
0x100242de6: je 0x100242e3f
0x100242de8: imul rax, rax, 0xf8
0x100242def: cmp dword ptr [r15 + rax], 0
0x100242df4: je 0x100243296
0x100242dfa: mov esi, dword ptr [r15 + rax + 8]
0x100242dff: mov eax, dword ptr [rbx + 0x24]
0x100242e02: mov ecx, dword ptr [rbx + 0x28]
0x100242e05: vmovups xmm0, xmmword ptr [rbx + 0x30]
0x100242e0a: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100242e0f: cmp ecx, 2
0x100242e12: jne 0x100242e4b
0x100242e14: movsxd rcx, dword ptr [rbx + 0x2c]
0x100242e18: test rcx, rcx
0x100242e1b: je 0x1002432b5
0x100242e21: imul rcx, rcx, 0xf8
0x100242e28: cmp dword ptr [r15 + rcx], 0
0x100242e2d: je 0x100243296
0x100242e33: mov edi, dword ptr [r15 + rcx + 8]
0x100242e38: mov ecx, 2
0x100242e3d: jmp 0x100242e50 ; 0x100242e50
0x100242e3f: mov edi, 0xffffffff
0x100242e44: mov esi, 0xffffffff
0x100242e49: jmp 0x100242e50 ; 0x100242e50
0x100242e4b: mov edi, 0xffffffff
0x100242e50: mov dword ptr [rbp - 0x100], esi
0x100242e56: mov dword ptr [rbp - 0xfc], eax
0x100242e5c: mov dword ptr [rbp - 0xf8], ecx
0x100242e62: mov dword ptr [rbp - 0xf4], edi
0x100242e68: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x100242e6d: vmovups xmmword ptr [rbp - 0xf0], xmm0
0x100242e75: movsxd rsi, dword ptr [rbx + 0x40]
0x100242e79: test rsi, rsi
0x100242e7c: je 0x100242ed5
0x100242e7e: imul rax, rsi, 0xf8
0x100242e85: cmp dword ptr [r15 + rax], 0
0x100242e8a: je 0x100243296
0x100242e90: mov esi, dword ptr [r15 + rax + 8]
0x100242e95: mov eax, dword ptr [rbx + 0x44]
0x100242e98: mov ecx, dword ptr [rbx + 0x48]
0x100242e9b: vmovups xmm0, xmmword ptr [rbx + 0x50]
0x100242ea0: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100242ea5: cmp ecx, 2
0x100242ea8: jne 0x100242eda
0x100242eaa: movsxd rcx, dword ptr [rbx + 0x4c]
0x100242eae: test rcx, rcx
0x100242eb1: je 0x1002432b5
0x100242eb7: imul rcx, rcx, 0xf8
0x100242ebe: cmp dword ptr [r15 + rcx], 0
0x100242ec3: je 0x100243296
0x100242ec9: mov edx, dword ptr [r15 + rcx + 8]
0x100242ece: mov ecx, 2
0x100242ed3: jmp 0x100242eda ; 0x100242eda
0x100242ed5: mov esi, 0xffffffff
0x100242eda: mov dword ptr [rbp - 0xe0], esi
0x100242ee0: mov dword ptr [rbp - 0xdc], eax
0x100242ee6: mov dword ptr [rbp - 0xd8], ecx
0x100242eec: mov dword ptr [rbp - 0xd4], edx
0x100242ef2: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x100242ef7: vmovups xmmword ptr [rbp - 0xd0], xmm0
0x100242eff: movsxd rdx, dword ptr [rbx + 0x60]
0x100242f03: mov r8d, 0xffffffff
0x100242f09: mov edi, 0xffffffff
0x100242f0e: mov esi, 0xffffffff
0x100242f13: test rdx, rdx
0x100242f16: je 0x100242f74
0x100242f18: imul rax, rdx, 0xf8
0x100242f1f: cmp dword ptr [r15 + rax], 0
0x100242f24: je 0x100243296
0x100242f2a: mov esi, dword ptr [r15 + rax + 8]
0x100242f2f: mov eax, dword ptr [rbx + 0x64]
0x100242f32: mov ecx, dword ptr [rbx + 0x68]
0x100242f35: vmovups xmm0, xmmword ptr [rbx + 0x70]
0x100242f3a: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100242f3f: cmp ecx, 2
0x100242f42: jne 0x100242f6f
0x100242f44: movsxd rcx, dword ptr [rbx + 0x6c]
0x100242f48: test rcx, rcx
0x100242f4b: je 0x1002432b5
0x100242f51: imul rcx, rcx, 0xf8
0x100242f58: cmp dword ptr [r15 + rcx], 0
0x100242f5d: je 0x100243296
0x100242f63: mov edi, dword ptr [r15 + rcx + 8]
0x100242f68: mov ecx, 2
0x100242f6d: jmp 0x100242f74 ; 0x100242f74
0x100242f6f: mov edi, 0xffffffff
0x100242f74: mov dword ptr [rbp - 0xc0], esi
0x100242f7a: mov dword ptr [rbp - 0xbc], eax
0x100242f80: mov dword ptr [rbp - 0xb8], ecx
0x100242f86: mov dword ptr [rbp - 0xb4], edi
0x100242f8c: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x100242f91: vmovups xmmword ptr [rbp - 0xb0], xmm0
0x100242f99: movsxd rdx, dword ptr [rbx + 0x80]
0x100242fa0: test rdx, rdx
0x100242fa3: je 0x100243008
0x100242fa5: imul rax, rdx, 0xf8
0x100242fac: cmp dword ptr [r15 + rax], 0
0x100242fb1: je 0x100243296
0x100242fb7: mov esi, dword ptr [r15 + rax + 8]
0x100242fbc: mov eax, dword ptr [rbx + 0x84]
0x100242fc2: mov ecx, dword ptr [rbx + 0x88]
0x100242fc8: vmovups xmm0, xmmword ptr [rbx + 0x90]
0x100242fd0: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100242fd5: cmp ecx, 2
0x100242fd8: jne 0x10024300d
0x100242fda: movsxd rcx, dword ptr [rbx + 0x8c]
0x100242fe1: test rcx, rcx
0x100242fe4: je 0x1002432b5
0x100242fea: imul rcx, rcx, 0xf8
0x100242ff1: cmp dword ptr [r15 + rcx], 0
0x100242ff6: je 0x100243296
0x100242ffc: mov r8d, dword ptr [r15 + rcx + 8]
0x100243001: mov ecx, 2
0x100243006: jmp 0x10024300d ; 0x10024300d
0x100243008: mov esi, 0xffffffff
0x10024300d: mov dword ptr [rbp - 0xa0], esi
0x100243013: mov dword ptr [rbp - 0x9c], eax
0x100243019: mov dword ptr [rbp - 0x98], ecx
0x10024301f: mov dword ptr [rbp - 0x94], r8d
0x100243026: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x10024302b: vmovups xmmword ptr [rbp - 0x90], xmm0
0x100243033: movsxd rcx, dword ptr [rbx + 0xa0]
0x10024303a: mov eax, 0xffffffff
0x10024303f: test rcx, rcx
0x100243042: je 0x1002430a7
0x100243044: imul rcx, rcx, 0xf8
0x10024304b: cmp dword ptr [r15 + rcx], 0
0x100243050: je 0x100243296
0x100243056: mov edx, dword ptr [r15 + rcx + 8]
0x10024305b: mov ecx, dword ptr [rbx + 0xa4]
0x100243061: mov esi, dword ptr [rbx + 0xa8]
0x100243067: vmovups xmm0, xmmword ptr [rbx + 0xb0]
0x10024306f: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x100243074: cmp esi, 2
0x100243077: jne 0x1002430b3
0x100243079: movsxd rsi, dword ptr [rbx + 0xac]
0x100243080: test rsi, rsi
0x100243083: je 0x1002432b5
0x100243089: imul rsi, rsi, 0xf8
0x100243090: cmp dword ptr [r15 + rsi], 0
0x100243095: je 0x100243296
0x10024309b: mov edi, dword ptr [r15 + rsi + 8]
0x1002430a0: mov esi, 2
0x1002430a5: jmp 0x1002430b8 ; 0x1002430b8
0x1002430a7: mov edi, 0xffffffff
0x1002430ac: mov edx, 0xffffffff
0x1002430b1: jmp 0x1002430b8 ; 0x1002430b8
0x1002430b3: mov edi, 0xffffffff
0x1002430b8: mov dword ptr [rbp - 0x80], edx
0x1002430bb: mov dword ptr [rbp - 0x7c], ecx
0x1002430be: mov dword ptr [rbp - 0x78], esi
0x1002430c1: mov dword ptr [rbp - 0x74], edi
0x1002430c4: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x1002430c9: vmovups xmmword ptr [rbp - 0x70], xmm0
0x1002430ce: movsxd rcx, dword ptr [rbx + 0xc0]
0x1002430d5: test rcx, rcx
0x1002430d8: je 0x10024313d
0x1002430da: imul rcx, rcx, 0xf8
0x1002430e1: cmp dword ptr [r15 + rcx], 0
0x1002430e6: je 0x100243296
0x1002430ec: mov edx, dword ptr [r15 + rcx + 8]
0x1002430f1: mov ecx, dword ptr [rbx + 0xc4]
0x1002430f7: mov esi, dword ptr [rbx + 0xc8]
0x1002430fd: vmovups xmm0, xmmword ptr [rbx + 0xd0]
0x100243105: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x10024310a: cmp esi, 2
0x10024310d: jne 0x100243142
0x10024310f: movsxd rax, dword ptr [rbx + 0xcc]
0x100243116: test rax, rax
0x100243119: je 0x1002432b5
0x10024311f: imul rax, rax, 0xf8
0x100243126: cmp dword ptr [r15 + rax], 0
0x10024312b: je 0x100243296
0x100243131: mov eax, dword ptr [r15 + rax + 8]
0x100243136: mov esi, 2
0x10024313b: jmp 0x100243142 ; 0x100243142
0x10024313d: mov edx, 0xffffffff
0x100243142: mov dword ptr [rbp - 0x60], edx
0x100243145: mov dword ptr [rbp - 0x5c], ecx
0x100243148: mov dword ptr [rbp - 0x58], esi
0x10024314b: mov dword ptr [rbp - 0x54], eax
0x10024314e: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x100243153: vmovups xmmword ptr [rbp - 0x50], xmm0
0x100243158: vmovups xmm0, xmmword ptr [rbx + 0xe0]
0x100243160: vmovups xmmword ptr [rbp - 0x40], xmm0
0x100243165: call 0x1007c1470 ; 0x1007c1470
0x10024316a: mov rcx, qword ptr [rax]
0x10024316d: lea rsi, [rbp - 0x108]
0x100243174: mov rdi, rax
0x100243177: call qword ptr [rcx + 0x68]
0x10024317a: mov dword ptr [r14 + 0x30], eax
0x10024317e: cmp byte ptr [rbx + 0x18], 0
0x100243182: je 0x100243262
0x100243188: cmp dword ptr [rbp - 0x100], -1
0x10024318f: je 0x1002431b5
0x100243191: movsxd rax, dword ptr [rbx + 0x20]
0x100243195: imul rax, rax, 0xf8
0x10024319c: cmp dword ptr [r15 + rax], 1
0x1002431a1: jbe 0x100243296
0x1002431a7: mov eax, dword ptr [r15 + rax + 0x80]
0x1002431af: mov dword ptr [rbp - 0x100], eax
0x1002431b5: cmp dword ptr [rbp - 0xe0], -1
0x1002431bc: je 0x1002431e2
0x1002431be: movsxd rax, dword ptr [rbx + 0x40]
0x1002431c2: imul rax, rax, 0xf8
0x1002431c9: cmp dword ptr [r15 + rax], 1
0x1002431ce: jbe 0x100243296
0x1002431d4: mov eax, dword ptr [r15 + rax + 0x80]
0x1002431dc: mov dword ptr [rbp - 0xe0], eax
0x1002431e2: cmp dword ptr [rbp - 0xc0], -1
0x1002431e9: je 0x10024320f
0x1002431eb: movsxd rax, dword ptr [rbx + 0x60]
0x1002431ef: imul rax, rax, 0xf8
0x1002431f6: cmp dword ptr [r15 + rax], 1
0x1002431fb: jbe 0x100243296
0x100243201: mov eax, dword ptr [r15 + rax + 0x80]
0x100243209: mov dword ptr [rbp - 0xc0], eax
0x10024320f: cmp dword ptr [rbp - 0xa0], -1
0x100243216: je 0x10024323b
0x100243218: movsxd rax, dword ptr [rbx + 0x80]
0x10024321f: imul rax, rax, 0xf8
0x100243226: cmp dword ptr [r15 + rax], 1
0x10024322b: jbe 0x100243296
0x10024322d: mov eax, dword ptr [r15 + rax + 0x80]
0x100243235: mov dword ptr [rbp - 0xa0], eax
0x10024323b: call 0x1007c1470 ; 0x1007c1470
0x100243240: mov rcx, qword ptr [rax]
0x100243243: lea rsi, [rbp - 0x108]
0x10024324a: mov rdi, rax
0x10024324d: call qword ptr [rcx + 0x68]
0x100243250: mov dword ptr [r14 + 0x34], eax
0x100243254: cmp byte ptr [rbx + 0x18], 1
0x100243258: mov eax, 2
0x10024325d: sbb eax, 0
0x100243260: jmp 0x100243267 ; 0x100243267
0x100243262: mov eax, 1
0x100243267: mov dword ptr [r14 + 0x28], eax
0x10024326b: mov dword ptr [r14 + 0x2c], 0
0x100243273: mov rax, qword ptr [rip + 0x9ca65e] ; 0x100c0d8d8
0x10024327a: mov rax, qword ptr [rax]
0x10024327d: cmp rax, qword ptr [rbp - 0x20]
0x100243281: jne 0x100243291
0x100243283: add rsp, 0xf8
0x10024328a: pop rbx
0x10024328b: pop r14
0x10024328d: pop r15
0x10024328f: pop rbp
0x100243290: ret 
0x100243291: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100243296: lea rdi, [rip + 0x938cef] ; 0x100b7bf8c i < m_texCount
0x10024329d: lea rsi, [rip + 0x938cf7] ; 0x100b7bf9b ./Compositor.h
0x1002432a4: mov edx, 0x3d
0x1002432a9: mov ecx, 3
0x1002432ae: call 0x1007e5f70 ; 0x1007e5f70
0x1002432b3: ud2 
0x1002432b5: lea rdi, [rip + 0x938cee] ; 0x100b7bfaa a.resolveIndex != 0
0x1002432bc: lea rsi, [rip + 0x938295] ; 0x100b7b558 Compositor.cpp
0x1002432c3: lea r8, [rip + 0x938cf4] ; 0x100b7bfbe To perform MSAA, a valid resolve target is required in this attachment
0x1002432ca: mov edx, 0x3fc
0x1002432cf: mov ecx, 4
0x1002432d4: xor eax, eax
0x1002432d6: call 0x1007e6030 ; 0x1007e6030
0x1002432db: ud2 
0x1002432dd: nop dword ptr [rax]
