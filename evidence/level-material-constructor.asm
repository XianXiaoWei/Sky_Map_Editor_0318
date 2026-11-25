0x100407ce0: push rbp
0x100407ce1: mov rbp, rsp
0x100407ce4: push r15
0x100407ce6: push r14
0x100407ce8: push r13
0x100407cea: push r12
0x100407cec: push rbx
0x100407ced: sub rsp, 0x58
0x100407cf1: mov rbx, rdi
0x100407cf4: call 0x1007abc10 ; 0x1007abc10
0x100407cf9: mov rax, qword ptr [rip + 0x1bfb2b0] ; 0x102002fb0
0x100407d00: mov eax, dword ptr [rax + 0x38]
0x100407d03: mov dword ptr [rbx], eax
0x100407d05: vxorps xmm0, xmm0, xmm0
0x100407d09: vmovups xmmword ptr [rbx + 8], xmm0
0x100407d0e: mov qword ptr [rbx + 0x18], 0
0x100407d16: vmovups xmmword ptr [rbx + 0x28], xmm0
0x100407d1b: mov qword ptr [rbx + 0x38], 0
0x100407d23: lea rax, [rip + 0x1c37986] ; 0x10203f6b0
0x100407d2a: vmovaps xmm0, xmmword ptr [rax]
0x100407d2e: vmovaps xmmword ptr [rbx + 0xd0], xmm0
0x100407d36: call 0x1007abc10 ; 0x1007abc10
0x100407d3b: mov rax, qword ptr [rip + 0x1bfb20e] ; 0x102002f50
0x100407d42: mov eax, dword ptr [rax + 0x38]
0x100407d45: mov dword ptr [rbx + 0xf0], eax
0x100407d4b: vxorps xmm0, xmm0, xmm0
0x100407d4f: vmovups xmmword ptr [rbx + 0xf8], xmm0
0x100407d57: mov qword ptr [rbx + 0x108], 0
0x100407d62: vmovups xmmword ptr [rbx + 0x130], xmm0
0x100407d6a: mov qword ptr [rbx + 0x140], 0
0x100407d75: lea r15, [rbx + 0x150]
0x100407d7c: mov qword ptr [rbp - 0x80], r15
0x100407d80: call 0x1007abc10 ; 0x1007abc10
0x100407d85: mov rax, qword ptr [rip + 0x1bfb1c4] ; 0x102002f50
0x100407d8c: mov eax, dword ptr [rax + 0x38]
0x100407d8f: mov dword ptr [rbx + 0x150], eax
0x100407d95: vxorps xmm0, xmm0, xmm0
0x100407d99: vmovups xmmword ptr [rbx + 0x158], xmm0
0x100407da1: mov qword ptr [rbx + 0x168], 0
0x100407dac: vmovups xmmword ptr [rbx + 0x190], xmm0
0x100407db4: mov qword ptr [rbx + 0x1a0], 0
0x100407dbf: lea r15, [rbx + 0x1b0]
0x100407dc6: mov qword ptr [rbp - 0x78], r15
0x100407dca: call 0x1007abc10 ; 0x1007abc10
0x100407dcf: mov rax, qword ptr [rip + 0x1bfb17a] ; 0x102002f50
0x100407dd6: mov eax, dword ptr [rax + 0x38]
0x100407dd9: mov dword ptr [rbx + 0x1b0], eax
0x100407ddf: vxorps xmm0, xmm0, xmm0
0x100407de3: vmovups xmmword ptr [rbx + 0x1b8], xmm0
0x100407deb: mov qword ptr [rbx + 0x1c8], 0
0x100407df6: vmovups xmmword ptr [rbx + 0x1f0], xmm0
0x100407dfe: mov qword ptr [rbx + 0x200], 0
0x100407e09: lea r15, [rbx + 0x210]
0x100407e10: mov qword ptr [rbp - 0x70], r15
0x100407e14: call 0x1007abc10 ; 0x1007abc10
0x100407e19: mov rax, qword ptr [rip + 0x1bfb130] ; 0x102002f50
0x100407e20: mov eax, dword ptr [rax + 0x38]
0x100407e23: mov dword ptr [rbx + 0x210], eax
0x100407e29: vxorps xmm0, xmm0, xmm0
0x100407e2d: vmovups xmmword ptr [rbx + 0x218], xmm0
0x100407e35: mov qword ptr [rbx + 0x228], 0
0x100407e40: vmovups xmmword ptr [rbx + 0x250], xmm0
0x100407e48: mov qword ptr [rbx + 0x260], 0
0x100407e53: lea r15, [rbx + 0x270]
0x100407e5a: mov qword ptr [rbp - 0x68], r15
0x100407e5e: call 0x1007abc10 ; 0x1007abc10
0x100407e63: mov rax, qword ptr [rip + 0x1bfb0e6] ; 0x102002f50
0x100407e6a: mov eax, dword ptr [rax + 0x38]
0x100407e6d: mov dword ptr [rbx + 0x270], eax
0x100407e73: vxorps xmm0, xmm0, xmm0
0x100407e77: vmovups xmmword ptr [rbx + 0x278], xmm0
0x100407e7f: mov qword ptr [rbx + 0x288], 0
0x100407e8a: vmovups xmmword ptr [rbx + 0x2b0], xmm0
0x100407e92: mov qword ptr [rbx + 0x2c0], 0
0x100407e9d: lea r15, [rbx + 0x2d0]
0x100407ea4: mov qword ptr [rbp - 0x60], r15
0x100407ea8: call 0x1007abc10 ; 0x1007abc10
0x100407ead: mov rax, qword ptr [rip + 0x1bfb09c] ; 0x102002f50
0x100407eb4: mov eax, dword ptr [rax + 0x38]
0x100407eb7: mov dword ptr [rbx + 0x2d0], eax
0x100407ebd: vxorps xmm0, xmm0, xmm0
0x100407ec1: vmovups xmmword ptr [rbx + 0x2d8], xmm0
0x100407ec9: mov qword ptr [rbx + 0x2e8], 0
0x100407ed4: vmovups xmmword ptr [rbx + 0x310], xmm0
0x100407edc: mov qword ptr [rbx + 0x320], 0
0x100407ee7: lea r15, [rbx + 0x330]
0x100407eee: mov qword ptr [rbp - 0x58], r15
0x100407ef2: call 0x1007abc10 ; 0x1007abc10
0x100407ef7: mov rax, qword ptr [rip + 0x1bfb052] ; 0x102002f50
0x100407efe: mov eax, dword ptr [rax + 0x38]
0x100407f01: mov dword ptr [rbx + 0x330], eax
0x100407f07: vxorps xmm0, xmm0, xmm0
0x100407f0b: vmovups xmmword ptr [rbx + 0x338], xmm0
0x100407f13: mov qword ptr [rbx + 0x348], 0
0x100407f1e: vmovups xmmword ptr [rbx + 0x370], xmm0
0x100407f26: mov qword ptr [rbx + 0x380], 0
0x100407f31: lea r15, [rbx + 0x390]
0x100407f38: mov qword ptr [rbp - 0x50], r15
0x100407f3c: call 0x1007abc10 ; 0x1007abc10
0x100407f41: mov rax, qword ptr [rip + 0x1bfb008] ; 0x102002f50
0x100407f48: mov eax, dword ptr [rax + 0x38]
0x100407f4b: mov dword ptr [rbx + 0x390], eax
0x100407f51: vxorps xmm0, xmm0, xmm0
0x100407f55: vmovups xmmword ptr [rbx + 0x398], xmm0
0x100407f5d: mov qword ptr [rbx + 0x3a8], 0
0x100407f68: vmovups xmmword ptr [rbx + 0x3d0], xmm0
0x100407f70: mov qword ptr [rbx + 0x3e0], 0
0x100407f7b: lea r15, [rbx + 0x3f0]
0x100407f82: mov qword ptr [rbp - 0x48], r15
0x100407f86: call 0x1007abc10 ; 0x1007abc10
0x100407f8b: mov rax, qword ptr [rip + 0x1bfafbe] ; 0x102002f50
0x100407f92: mov eax, dword ptr [rax + 0x38]
0x100407f95: mov dword ptr [rbx + 0x3f0], eax
0x100407f9b: vxorps xmm0, xmm0, xmm0
0x100407f9f: vmovups xmmword ptr [rbx + 0x3f8], xmm0
0x100407fa7: mov qword ptr [rbx + 0x408], 0
0x100407fb2: vmovups xmmword ptr [rbx + 0x430], xmm0
0x100407fba: mov qword ptr [rbx + 0x440], 0
0x100407fc5: lea r15, [rbx + 0x450]
0x100407fcc: mov qword ptr [rbp - 0x40], r15
0x100407fd0: call 0x1007abc10 ; 0x1007abc10
0x100407fd5: mov rax, qword ptr [rip + 0x1bfaf74] ; 0x102002f50
0x100407fdc: mov eax, dword ptr [rax + 0x38]
0x100407fdf: mov dword ptr [rbx + 0x450], eax
0x100407fe5: vxorps xmm0, xmm0, xmm0
0x100407fe9: vmovups xmmword ptr [rbx + 0x458], xmm0
0x100407ff1: mov qword ptr [rbx + 0x468], 0
0x100407ffc: vmovups xmmword ptr [rbx + 0x490], xmm0
0x100408004: mov qword ptr [rbx + 0x4a0], 0
0x10040800f: lea r15, [rbx + 0x4b0]
0x100408016: mov qword ptr [rbp - 0x38], r15
0x10040801a: call 0x1007abc10 ; 0x1007abc10
0x10040801f: mov rax, qword ptr [rip + 0x1bfaf2a] ; 0x102002f50
0x100408026: mov eax, dword ptr [rax + 0x38]
0x100408029: mov dword ptr [rbx + 0x4b0], eax
0x10040802f: vxorps xmm0, xmm0, xmm0
0x100408033: vmovups xmmword ptr [rbx + 0x4b8], xmm0
0x10040803b: mov qword ptr [rbx + 0x4c8], 0
0x100408046: vmovups xmmword ptr [rbx + 0x4f0], xmm0
0x10040804e: mov qword ptr [rbx + 0x500], 0
0x100408059: lea r15, [rbx + 0x510]
0x100408060: mov qword ptr [rbp - 0x30], r15
0x100408064: call 0x1007abc10 ; 0x1007abc10
0x100408069: mov rax, qword ptr [rip + 0x1bfaee0] ; 0x102002f50
0x100408070: mov eax, dword ptr [rax + 0x38]
0x100408073: mov dword ptr [rbx + 0x510], eax
0x100408079: vxorps xmm0, xmm0, xmm0
0x10040807d: vmovups xmmword ptr [rbx + 0x518], xmm0
0x100408085: mov qword ptr [rbx + 0x528], 0
0x100408090: vmovups xmmword ptr [rbx + 0x550], xmm0
0x100408098: mov qword ptr [rbx + 0x560], 0
0x1004080a3: lea r12, [rbx + 0x570]
0x1004080aa: mov r15, r12
0x1004080ad: call 0x1007abc10 ; 0x1007abc10
0x1004080b2: mov rax, qword ptr [rip + 0x1bfae97] ; 0x102002f50
0x1004080b9: mov eax, dword ptr [rax + 0x38]
0x1004080bc: mov dword ptr [rbx + 0x570], eax
0x1004080c2: vxorps xmm0, xmm0, xmm0
0x1004080c6: vmovups xmmword ptr [rbx + 0x578], xmm0
0x1004080ce: mov qword ptr [rbx + 0x588], 0
0x1004080d9: vmovups xmmword ptr [rbx + 0x5b0], xmm0
0x1004080e1: mov qword ptr [rbx + 0x5c0], 0
0x1004080ec: lea r13, [rbx + 0x5d0]
0x1004080f3: mov r15, r13
0x1004080f6: call 0x1007abc10 ; 0x1007abc10
0x1004080fb: mov rax, qword ptr [rip + 0x1bfae4e] ; 0x102002f50
0x100408102: mov eax, dword ptr [rax + 0x38]
0x100408105: mov dword ptr [rbx + 0x5d0], eax
0x10040810b: vxorps xmm0, xmm0, xmm0
0x10040810f: vmovups xmmword ptr [rbx + 0x5d8], xmm0
0x100408117: mov qword ptr [rbx + 0x5e8], 0
0x100408122: vmovups xmmword ptr [rbx + 0x610], xmm0
0x10040812a: mov qword ptr [rbx + 0x620], 0
0x100408135: lea r14, [rbx + 0x630]
0x10040813c: mov r15, r14
0x10040813f: call 0x1007abc10 ; 0x1007abc10
0x100408144: mov rax, qword ptr [rip + 0x1bfae05] ; 0x102002f50
0x10040814b: mov eax, dword ptr [rax + 0x38]
0x10040814e: mov dword ptr [rbx + 0x630], eax
0x100408154: vxorps xmm0, xmm0, xmm0
0x100408158: vmovups xmmword ptr [rbx + 0x638], xmm0
0x100408160: mov qword ptr [rbx + 0x648], 0
0x10040816b: vmovups xmmword ptr [rbx + 0x670], xmm0
0x100408173: mov qword ptr [rbx + 0x680], 0
0x10040817e: lea r15, [rbx + 0x690]
0x100408185: call 0x1007abc10 ; 0x1007abc10
0x10040818a: mov rax, qword ptr [rip + 0x1bfadbf] ; 0x102002f50
0x100408191: mov eax, dword ptr [rax + 0x38]
0x100408194: mov dword ptr [rbx + 0x690], eax
0x10040819a: vxorps xmm0, xmm0, xmm0
0x10040819e: vmovups xmmword ptr [rbx + 0x698], xmm0
0x1004081a6: mov qword ptr [rbx + 0x6a8], 0
0x1004081b1: vmovups xmmword ptr [rbx + 0x6d0], xmm0
0x1004081b9: mov qword ptr [rbx + 0x6e0], 0
0x1004081c4: lea rax, [rbx + 0xf0]
0x1004081cb: mov qword ptr [rbx + 0x40], rax
0x1004081cf: mov rax, qword ptr [rbp - 0x80]
0x1004081d3: mov qword ptr [rbx + 0x48], rax
0x1004081d7: mov rax, qword ptr [rbp - 0x78]
0x1004081db: mov qword ptr [rbx + 0x50], rax
0x1004081df: mov rax, qword ptr [rbp - 0x70]
0x1004081e3: mov qword ptr [rbx + 0x58], rax
0x1004081e7: mov rax, qword ptr [rbp - 0x68]
0x1004081eb: mov qword ptr [rbx + 0x60], rax
0x1004081ef: mov rax, qword ptr [rbp - 0x60]
0x1004081f3: mov qword ptr [rbx + 0x68], rax
0x1004081f7: mov rax, qword ptr [rbp - 0x58]
0x1004081fb: mov qword ptr [rbx + 0x70], rax
0x1004081ff: mov rax, qword ptr [rbp - 0x50]
0x100408203: mov qword ptr [rbx + 0x78], rax
0x100408207: mov rax, qword ptr [rbp - 0x48]
0x10040820b: mov qword ptr [rbx + 0x80], rax
0x100408212: mov rax, qword ptr [rbp - 0x40]
0x100408216: mov qword ptr [rbx + 0x88], rax
0x10040821d: mov rax, qword ptr [rbp - 0x38]
0x100408221: mov qword ptr [rbx + 0x90], rax
0x100408228: mov rax, qword ptr [rbp - 0x30]
0x10040822c: mov qword ptr [rbx + 0x98], rax
0x100408233: mov qword ptr [rbx + 0xa0], r12
0x10040823a: mov qword ptr [rbx + 0xa8], r13
0x100408241: mov qword ptr [rbx + 0xb0], r14
0x100408248: mov qword ptr [rbx + 0xb8], r15
0x10040824f: add rsp, 0x58
0x100408253: pop rbx
0x100408254: pop r12
0x100408256: pop r13
0x100408258: pop r14
0x10040825a: pop r15
0x10040825c: pop rbp
0x10040825d: ret 
0x10040825e: mov r14, rax
0x100408261: lea rax, [rbx + 0x28]
0x100408265: test byte ptr [rax], 1
0x100408268: je 0x10040827e
0x10040826a: mov r15, qword ptr [rbx + 0x38]
0x10040826e: call 0x1007e50d0 ; 0x1007e50d0
0x100408273: mov rdi, rax
0x100408276: mov rsi, r15
0x100408279: call 0x1007e5db0 ; 0x1007e5db0
0x10040827e: lea rax, [rbx + 8]
0x100408282: test byte ptr [rax], 1
0x100408285: je 0x10040829b
0x100408287: mov rbx, qword ptr [rbx + 0x18]
0x10040828b: call 0x1007e50d0 ; 0x1007e50d0
0x100408290: mov rdi, rax
0x100408293: mov rsi, rbx
0x100408296: call 0x1007e5db0 ; 0x1007e5db0
0x10040829b: mov rdi, r14
0x10040829e: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1004082a3: mov rdi, rax
0x1004082a6: call 0x100011bf0 ; 0x100011bf0
0x1004082ab: mov rdi, rax
0x1004082ae: call 0x100011bf0 ; 0x100011bf0
0x1004082b3: mov r14, rax
0x1004082b6: add r15, -0xf0
0x1004082bd: test byte ptr [r15 + 0xd0], 1
0x1004082c5: je 0x1004082de
0x1004082c7: mov r12, qword ptr [r15 + 0xe0]
0x1004082ce: call 0x1007e50d0 ; 0x1007e50d0
0x1004082d3: mov rdi, rax
0x1004082d6: mov rsi, r12
0x1004082d9: call 0x1007e5db0 ; 0x1007e5db0
0x1004082de: test byte ptr [r15 + 0x98], 1
0x1004082e6: je 0x1004082ff
0x1004082e8: mov r12, qword ptr [r15 + 0xa8]
0x1004082ef: call 0x1007e50d0 ; 0x1007e50d0
0x1004082f4: mov rdi, rax
0x1004082f7: mov rsi, r12
0x1004082fa: call 0x1007e5db0 ; 0x1007e5db0
0x1004082ff: add r15, -0x60
0x100408303: cmp rbx, r15
0x100408306: jne 0x1004082bd
0x100408308: jmp 0x100408261 ; 0x100408261
0x10040830d: mov rdi, rax
0x100408310: call 0x100011bf0 ; 0x100011bf0
0x100408315: mov rdi, rax
0x100408318: call 0x100011bf0 ; 0x100011bf0
0x10040831d: nop dword ptr [rax]
