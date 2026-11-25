0x1000e46e0: push rbp
0x1000e46e1: mov rbp, rsp
0x1000e46e4: mov r9, qword ptr [rdx + 0x30]
0x1000e46e8: mov r8d, dword ptr [rdi + 0x60]
0x1000e46ec: mov ecx, dword ptr [rdx + 0x44]
0x1000e46ef: mov dword ptr [rdi + 0x58], ecx
0x1000e46f2: mov dword ptr [rdi + 0x70], 0
0x1000e46f9: test esi, esi
0x1000e46fb: jle 0x1000e473d
0x1000e46fd: add r9, r8
0x1000e4700: mov r8d, esi
0x1000e4703: xor ecx, ecx
0x1000e4705: nop word ptr cs:[rax + rax]
0x1000e4710: test byte ptr [r9 + rcx], 8
0x1000e4715: je 0x1000e472d
0x1000e4717: mov r10, qword ptr [rdx + 0x30]
0x1000e471b: mov r11d, dword ptr [rdx + 0x44]
0x1000e471f: lea eax, [r11 + 1]
0x1000e4723: mov dword ptr [rdx + 0x44], eax
0x1000e4726: mov byte ptr [r10 + r11], cl
0x1000e472a: inc dword ptr [rdi + 0x70]
0x1000e472d: inc rcx
0x1000e4730: cmp r8, rcx
0x1000e4733: jne 0x1000e4710
0x1000e4735: mov r9, qword ptr [rdx + 0x30]
0x1000e4739: mov r8d, dword ptr [rdi + 0x60]
0x1000e473d: mov eax, dword ptr [rdx + 0x44]
0x1000e4740: mov dword ptr [rdi + 0x54], eax
0x1000e4743: mov dword ptr [rdi + 0x74], 0
0x1000e474a: test esi, esi
0x1000e474c: jle 0x1000e478d
0x1000e474e: mov eax, r8d
0x1000e4751: add r9, rax
0x1000e4754: mov r8d, esi
0x1000e4757: xor ecx, ecx
0x1000e4759: nop dword ptr [rax]
0x1000e4760: test byte ptr [r9 + rcx], 0x10
0x1000e4765: je 0x1000e477d
0x1000e4767: mov r10, qword ptr [rdx + 0x30]
0x1000e476b: mov r11d, dword ptr [rdx + 0x44]
0x1000e476f: lea eax, [r11 + 1]
0x1000e4773: mov dword ptr [rdx + 0x44], eax
0x1000e4776: mov byte ptr [r10 + r11], cl
0x1000e477a: inc dword ptr [rdi + 0x74]
0x1000e477d: inc rcx
0x1000e4780: cmp r8, rcx
0x1000e4783: jne 0x1000e4760
0x1000e4785: mov r9, qword ptr [rdx + 0x30]
0x1000e4789: mov r8d, dword ptr [rdi + 0x60]
0x1000e478d: mov eax, dword ptr [rdx + 0x44]
0x1000e4790: mov dword ptr [rdi + 0x5c], eax
0x1000e4793: mov dword ptr [rdi + 0x78], 0
0x1000e479a: test esi, esi
0x1000e479c: jle 0x1000e47dd
0x1000e479e: mov eax, r8d
0x1000e47a1: add r9, rax
0x1000e47a4: mov r8d, esi
0x1000e47a7: xor ecx, ecx
0x1000e47a9: nop dword ptr [rax]
0x1000e47b0: test byte ptr [r9 + rcx], 0x20
0x1000e47b5: je 0x1000e47cd
0x1000e47b7: mov r10, qword ptr [rdx + 0x30]
0x1000e47bb: mov r11d, dword ptr [rdx + 0x44]
0x1000e47bf: lea eax, [r11 + 1]
0x1000e47c3: mov dword ptr [rdx + 0x44], eax
0x1000e47c6: mov byte ptr [r10 + r11], cl
0x1000e47ca: inc dword ptr [rdi + 0x78]
0x1000e47cd: inc rcx
0x1000e47d0: cmp r8, rcx
0x1000e47d3: jne 0x1000e47b0
0x1000e47d5: mov r9, qword ptr [rdx + 0x30]
0x1000e47d9: mov r8d, dword ptr [rdi + 0x60]
0x1000e47dd: mov eax, dword ptr [rdx + 0x44]
0x1000e47e0: mov dword ptr [rdi + 0x4c], eax
0x1000e47e3: mov dword ptr [rdi + 0x64], 0
0x1000e47ea: test esi, esi
0x1000e47ec: jle 0x1000e482d
0x1000e47ee: mov eax, r8d
0x1000e47f1: add r9, rax
0x1000e47f4: mov r8d, esi
0x1000e47f7: xor ecx, ecx
0x1000e47f9: nop dword ptr [rax]
0x1000e4800: test byte ptr [r9 + rcx], 1
0x1000e4805: je 0x1000e481d
0x1000e4807: mov r10, qword ptr [rdx + 0x30]
0x1000e480b: mov r11d, dword ptr [rdx + 0x44]
0x1000e480f: lea eax, [r11 + 1]
0x1000e4813: mov dword ptr [rdx + 0x44], eax
0x1000e4816: mov byte ptr [r10 + r11], cl
0x1000e481a: inc dword ptr [rdi + 0x64]
0x1000e481d: inc rcx
0x1000e4820: cmp r8, rcx
0x1000e4823: jne 0x1000e4800
0x1000e4825: mov r9, qword ptr [rdx + 0x30]
0x1000e4829: mov r8d, dword ptr [rdi + 0x60]
0x1000e482d: mov eax, dword ptr [rdx + 0x44]
0x1000e4830: mov dword ptr [rdi + 0x48], eax
0x1000e4833: mov dword ptr [rdi + 0x68], 0
0x1000e483a: test esi, esi
0x1000e483c: jle 0x1000e487d
0x1000e483e: mov eax, r8d
0x1000e4841: add r9, rax
0x1000e4844: mov r8d, esi
0x1000e4847: xor ecx, ecx
0x1000e4849: nop dword ptr [rax]
0x1000e4850: test byte ptr [r9 + rcx], 2
0x1000e4855: je 0x1000e486d
0x1000e4857: mov r10, qword ptr [rdx + 0x30]
0x1000e485b: mov r11d, dword ptr [rdx + 0x44]
0x1000e485f: lea eax, [r11 + 1]
0x1000e4863: mov dword ptr [rdx + 0x44], eax
0x1000e4866: mov byte ptr [r10 + r11], cl
0x1000e486a: inc dword ptr [rdi + 0x68]
0x1000e486d: inc rcx
0x1000e4870: cmp r8, rcx
0x1000e4873: jne 0x1000e4850
0x1000e4875: mov r9, qword ptr [rdx + 0x30]
0x1000e4879: mov r8d, dword ptr [rdi + 0x60]
0x1000e487d: mov eax, dword ptr [rdx + 0x44]
0x1000e4880: mov dword ptr [rdi + 0x50], eax
0x1000e4883: mov dword ptr [rdi + 0x6c], 0
0x1000e488a: test esi, esi
0x1000e488c: jle 0x1000e48c3
0x1000e488e: mov eax, r8d
0x1000e4891: add r9, rax
0x1000e4894: mov r8d, esi
0x1000e4897: xor esi, esi
0x1000e4899: nop dword ptr [rax]
0x1000e48a0: test byte ptr [r9 + rsi], 4
0x1000e48a5: je 0x1000e48bb
0x1000e48a7: mov r10, qword ptr [rdx + 0x30]
0x1000e48ab: mov ecx, dword ptr [rdx + 0x44]
0x1000e48ae: lea eax, [rcx + 1]
0x1000e48b1: mov dword ptr [rdx + 0x44], eax
0x1000e48b4: mov byte ptr [r10 + rcx], sil
0x1000e48b8: inc dword ptr [rdi + 0x6c]
0x1000e48bb: inc rsi
0x1000e48be: cmp r8, rsi
0x1000e48c1: jne 0x1000e48a0
0x1000e48c3: pop rbp
0x1000e48c4: ret 
0x1000e48c5: nop word ptr cs:[rax + rax]
