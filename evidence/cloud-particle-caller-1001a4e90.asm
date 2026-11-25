0x1001a4e90: push rbp
0x1001a4e91: mov rbp, rsp
0x1001a4e94: push r15
0x1001a4e96: push r14
0x1001a4e98: push r13
0x1001a4e9a: push r12
0x1001a4e9c: push rbx
0x1001a4e9d: sub rsp, 0x1a8
0x1001a4ea4: vmovss dword ptr [rbp - 0x30], xmm0
0x1001a4ea9: mov r14, rdx
0x1001a4eac: mov r15, rsi
0x1001a4eaf: mov rbx, rdi
0x1001a4eb2: mov rax, qword ptr [rbx + 0x78]
0x1001a4eb6: cmp byte ptr [rax + 0x3f], 0
0x1001a4eba: je 0x1001a5256
0x1001a4ec0: cmp byte ptr [rbx + 0x71], 0
0x1001a4ec4: je 0x1001a5256
0x1001a4eca: vmovaps xmm0, xmmword ptr [rbx + 0x50]
0x1001a4ecf: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1001a4ed4: mov rax, qword ptr [rbx]
0x1001a4ed7: lea rdi, [rbp - 0x50]
0x1001a4edb: mov rsi, rbx
0x1001a4ede: call qword ptr [rax + 0x58]
0x1001a4ee1: mov rax, qword ptr [rbx]
0x1001a4ee4: lea rdi, [rbp - 0x1d0]
0x1001a4eeb: mov rsi, rbx
0x1001a4eee: call qword ptr [rax + 0x18]
0x1001a4ef1: mov rax, qword ptr [rbx]
0x1001a4ef4: lea r13, [rbp - 0x90]
0x1001a4efb: mov rdi, r13
0x1001a4efe: mov rsi, rbx
0x1001a4f01: call qword ptr [rax + 0x20]
0x1001a4f04: lea r12, [rbp - 0xd0]
0x1001a4f0b: mov rdi, r12
0x1001a4f0e: lea rsi, [rbp - 0x1d0]
0x1001a4f15: mov rdx, r13
0x1001a4f18: call 0x100076df0 ; 0x100076df0
0x1001a4f1d: lea rdi, [rbp - 0x190]
0x1001a4f24: mov rsi, r12
0x1001a4f27: call 0x100789f00 ; 0x100789f00
0x1001a4f2c: vmovaps xmm0, xmmword ptr [rbp - 0x190]
0x1001a4f34: vmulps xmm0, xmm0, xmm0
0x1001a4f38: vmovshdup xmm1, xmm0
0x1001a4f3c: vaddss xmm1, xmm0, xmm1
0x1001a4f40: vpermilpd xmm0, xmm0, 1
0x1001a4f46: vaddss xmm0, xmm0, xmm1
0x1001a4f4a: vsqrtss xmm0, xmm0, xmm0
0x1001a4f4e: vmovss dword ptr [rbp - 0x2c], xmm0
0x1001a4f53: mov dword ptr [rbp - 0x90], 0
0x1001a4f5d: mov r8, qword ptr [rbx + 0x3e0]
0x1001a4f64: test r8, r8
0x1001a4f67: je 0x1001a4fc5
0x1001a4f69: mov r9, qword ptr [rbx + 0x3e8]
0x1001a4f70: test r9, r9
0x1001a4f73: je 0x1001a4fc5
0x1001a4f75: mov rax, qword ptr [rbx + 0x3d8]
0x1001a4f7c: test rax, rax
0x1001a4f7f: je 0x1001a4fc5
0x1001a4f81: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001a4f86: vmovaps xmmword ptr [rbp - 0x180], xmm0
0x1001a4f8e: lea r10, [rbx + 0x4d0]
0x1001a4f95: lea rsi, [rbp - 0x180]
0x1001a4f9c: lea rdx, [rbp - 0x90]
0x1001a4fa3: mov ecx, 1
0x1001a4fa8: mov rdi, rbx
0x1001a4fab: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a4fb0: vmovss xmm1, dword ptr [rbp - 0x30]
0x1001a4fb5: push r14
0x1001a4fb7: push r15
0x1001a4fb9: push r10
0x1001a4fbb: push rax
0x1001a4fbc: call 0x1001a6840 ; 0x1001a6840
0x1001a4fc1: add rsp, 0x20
0x1001a4fc5: mov r8, qword ptr [rbx + 0x400]
0x1001a4fcc: test r8, r8
0x1001a4fcf: je 0x1001a502d
0x1001a4fd1: mov r9, qword ptr [rbx + 0x408]
0x1001a4fd8: test r9, r9
0x1001a4fdb: je 0x1001a502d
0x1001a4fdd: mov rax, qword ptr [rbx + 0x3f8]
0x1001a4fe4: test rax, rax
0x1001a4fe7: je 0x1001a502d
0x1001a4fe9: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001a4fee: vmovaps xmmword ptr [rbp - 0x170], xmm0
0x1001a4ff6: lea r10, [rbx + 0x4e0]
0x1001a4ffd: lea rsi, [rbp - 0x170]
0x1001a5004: lea rdx, [rbp - 0x90]
0x1001a500b: mov ecx, 0
0x1001a5010: mov rdi, rbx
0x1001a5013: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a5018: vmovss xmm1, dword ptr [rbp - 0x30]
0x1001a501d: push r14
0x1001a501f: push r15
0x1001a5021: push r10
0x1001a5023: push rax
0x1001a5024: call 0x1001a6840 ; 0x1001a6840
0x1001a5029: add rsp, 0x20
0x1001a502d: mov rsi, qword ptr [rbx + 0x410]
0x1001a5034: test rsi, rsi
0x1001a5037: je 0x1001a509c
0x1001a5039: lea rdi, [rbp - 0xd0]
0x1001a5040: call 0x1007f26b0 ; 0x1007f26b0
0x1001a5045: mov eax, dword ptr [rbp - 0x90]
0x1001a504b: lea ecx, [rax + 1]
0x1001a504e: mov dword ptr [rbp - 0x90], ecx
0x1001a5054: lea rdi, [rbx + rax*4 + 0x468]
0x1001a505c: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x1001a5064: vmovaps xmmword ptr [rbp - 0x160], xmm0
0x1001a506c: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001a5071: vmovaps xmmword ptr [rbp - 0x150], xmm0
0x1001a5079: lea rsi, [rbp - 0x160]
0x1001a5080: lea rdx, [rbp - 0x150]
0x1001a5087: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a508c: mov rcx, r15
0x1001a508f: mov r8, r14
0x1001a5092: vmovss xmm1, dword ptr [rbp - 0x30]
0x1001a5097: call 0x1001a1140 ; 0x1001a1140
0x1001a509c: mov rsi, qword ptr [rbx + 0x3f0]
0x1001a50a3: test rsi, rsi
0x1001a50a6: je 0x1001a510b
0x1001a50a8: lea rdi, [rbp - 0xd0]
0x1001a50af: call 0x1007f26b0 ; 0x1007f26b0
0x1001a50b4: mov eax, dword ptr [rbp - 0x90]
0x1001a50ba: lea ecx, [rax + 1]
0x1001a50bd: mov dword ptr [rbp - 0x90], ecx
0x1001a50c3: lea rdi, [rbx + rax*4 + 0x468]
0x1001a50cb: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x1001a50d3: vmovaps xmmword ptr [rbp - 0x140], xmm0
0x1001a50db: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001a50e0: vmovaps xmmword ptr [rbp - 0x130], xmm0
0x1001a50e8: lea rsi, [rbp - 0x140]
0x1001a50ef: lea rdx, [rbp - 0x130]
0x1001a50f6: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a50fb: mov rcx, r15
0x1001a50fe: mov r8, r14
0x1001a5101: vmovss xmm1, dword ptr [rbp - 0x30]
0x1001a5106: call 0x1001a1140 ; 0x1001a1140
0x1001a510b: mov rsi, qword ptr [rbx + 0x418]
0x1001a5112: test rsi, rsi
0x1001a5115: je 0x1001a517a
0x1001a5117: lea rdi, [rbp - 0xd0]
0x1001a511e: call 0x1007f26b0 ; 0x1007f26b0
0x1001a5123: mov eax, dword ptr [rbp - 0x90]
0x1001a5129: lea ecx, [rax + 1]
0x1001a512c: mov dword ptr [rbp - 0x90], ecx
0x1001a5132: lea rdi, [rbx + rax*4 + 0x468]
0x1001a513a: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x1001a5142: vmovaps xmmword ptr [rbp - 0x120], xmm0
0x1001a514a: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001a514f: vmovaps xmmword ptr [rbp - 0x110], xmm0
0x1001a5157: lea rsi, [rbp - 0x120]
0x1001a515e: lea rdx, [rbp - 0x110]
0x1001a5165: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a516a: mov rcx, r15
0x1001a516d: mov r8, r14
0x1001a5170: vmovss xmm1, dword ptr [rbp - 0x30]
0x1001a5175: call 0x1001a1140 ; 0x1001a1140
0x1001a517a: mov rsi, qword ptr [rbx + 0x3d0]
0x1001a5181: test rsi, rsi
0x1001a5184: je 0x1001a5256
0x1001a518a: lea rdi, [rbp - 0xd0]
0x1001a5191: call 0x1007f2a00 ; 0x1007f2a00
0x1001a5196: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x1001a519e: vmovshdup xmm1, xmm0
0x1001a51a2: vpermilpd xmm2, xmm0, 1
0x1001a51a8: vpermilps xmm3, xmm0, 0xe7
0x1001a51ae: vaddss xmm4, xmm1, xmm1
0x1001a51b2: vaddss xmm5, xmm2, xmm2
0x1001a51b6: vmulss xmm6, xmm0, xmm4
0x1001a51ba: vmulss xmm0, xmm0, xmm5
0x1001a51be: vmulss xmm1, xmm1, xmm4
0x1001a51c2: vmulss xmm4, xmm3, xmm4
0x1001a51c6: vmulss xmm2, xmm2, xmm5
0x1001a51ca: vmulss xmm3, xmm3, xmm5
0x1001a51ce: vmovss xmm5, dword ptr [rip + 0x8ffeea] ; 0x100aa50c0
0x1001a51d6: vsubss xmm1, xmm5, xmm1
0x1001a51da: vsubss xmm1, xmm1, xmm2
0x1001a51de: vaddss xmm2, xmm6, xmm3
0x1001a51e2: vsubss xmm0, xmm0, xmm4
0x1001a51e6: vinsertps xmm1, xmm1, xmm2, 0x10
0x1001a51ec: vinsertps xmm1, xmm1, xmm0, 0x20
0x1001a51f2: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1001a51f7: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x1001a51ff: vmovaps xmm0, xmmword ptr [rbx + 0x4f0]
0x1001a5207: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x1001a520f: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001a5214: vmulss xmm0, xmm0, dword ptr [rip + 0x90343c] ; 0x100aa8658
0x1001a521c: vmulps xmm1, xmm1, xmmword ptr [rip + 0x9067ec] ; 0x100aaba10
0x1001a5224: vmovaps xmmword ptr [rbp - 0xe0], xmm1
0x1001a522c: lea rsi, [rbp - 0x100]
0x1001a5233: lea rdx, [rbp - 0xf0]
0x1001a523a: lea rcx, [rbp - 0xe0]
0x1001a5241: mov rdi, r14
0x1001a5244: call 0x1002289b0 ; 0x1002289b0
0x1001a5249: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1001a524e: vmovaps xmmword ptr [rbx + 0x4f0], xmm0
0x1001a5256: add rsp, 0x1a8
0x1001a525d: pop rbx
0x1001a525e: pop r12
0x1001a5260: pop r13
0x1001a5262: pop r14
0x1001a5264: pop r15
0x1001a5266: pop rbp
0x1001a5267: ret 
0x1001a5268: nop dword ptr [rax + rax]
