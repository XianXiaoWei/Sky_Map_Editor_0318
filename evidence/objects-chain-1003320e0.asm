0x1003320e0: push rbp
0x1003320e1: mov rbp, rsp
0x1003320e4: lea rax, [rdi + 8]
0x1003320e8: cmp rax, rsi
0x1003320eb: je 0x1003320f9
0x1003320ed: mov r9d, dword ptr [r8]
0x1003320f0: mov r10d, dword ptr [rsi + 0x1c]
0x1003320f4: cmp r9d, r10d
0x1003320f7: jae 0x10033211e
0x1003320f9: cmp qword ptr [rdi], rsi
0x1003320fc: mov r9, qword ptr [rsi]
0x1003320ff: je 0x100332150
0x100332101: test r9, r9
0x100332104: je 0x10033215d
0x100332106: mov rcx, r9
0x100332109: nop dword ptr [rax]
0x100332110: mov r10, rcx
0x100332113: mov rcx, qword ptr [r10 + 8]
0x100332117: test rcx, rcx
0x10033211a: jne 0x100332110
0x10033211c: jmp 0x10033216c ; 0x10033216c
0x10033211e: cmp r10d, r9d
0x100332121: jae 0x1003321df
0x100332127: mov r8, qword ptr [rsi + 8]
0x10033212b: test r8, r8
0x10033212e: je 0x1003321ef
0x100332134: mov rcx, r8
0x100332137: nop word ptr [rax + rax]
0x100332140: mov rdi, rcx
0x100332143: mov rcx, qword ptr [rdi]
0x100332146: test rcx, rcx
0x100332149: jne 0x100332140
0x10033214b: jmp 0x100332210 ; 0x100332210
0x100332150: mov r10, rsi
0x100332153: test r9, r9
0x100332156: jne 0x10033217a
0x100332158: jmp 0x1003321d7 ; 0x1003321d7
0x10033215d: mov rcx, rsi
0x100332160: mov r10, qword ptr [rcx + 0x10]
0x100332164: cmp qword ptr [r10], rcx
0x100332167: mov rcx, r10
0x10033216a: je 0x100332160
0x10033216c: mov r8d, dword ptr [r8]
0x10033216f: cmp dword ptr [r10 + 0x1c], r8d
0x100332173: jae 0x100332186
0x100332175: test r9, r9
0x100332178: je 0x1003321d7
0x10033217a: mov qword ptr [rdx], r10
0x10033217d: add r10, 8
0x100332181: mov rax, r10
0x100332184: pop rbp
0x100332185: ret 
0x100332186: mov rsi, qword ptr [rax]
0x100332189: test rsi, rsi
0x10033218c: je 0x1003321ea
0x10033218e: add rdi, 8
0x100332192: mov rax, rdi
0x100332195: mov ecx, dword ptr [rsi + 0x1c]
0x100332198: cmp r8d, ecx
0x10033219b: jae 0x1003321c0
0x10033219d: jmp 0x1003321ab ; 0x1003321ab
0x10033219f: nop 
0x1003321a0: mov rsi, rcx
0x1003321a3: mov ecx, dword ptr [rsi + 0x1c]
0x1003321a6: cmp r8d, ecx
0x1003321a9: jae 0x1003321c0
0x1003321ab: mov rcx, qword ptr [rsi]
0x1003321ae: mov rax, rsi
0x1003321b1: test rcx, rcx
0x1003321b4: jne 0x1003321a0
0x1003321b6: jmp 0x1003321d7 ; 0x1003321d7
0x1003321b8: nop dword ptr [rax + rax]
0x1003321c0: cmp ecx, r8d
0x1003321c3: jae 0x1003321d2
0x1003321c5: lea rax, [rsi + 8]
0x1003321c9: mov rcx, qword ptr [rsi + 8]
0x1003321cd: test rcx, rcx
0x1003321d0: jne 0x1003321a0
0x1003321d2: mov qword ptr [rdx], rsi
0x1003321d5: pop rbp
0x1003321d6: ret 
0x1003321d7: mov qword ptr [rdx], rsi
0x1003321da: mov rax, rsi
0x1003321dd: pop rbp
0x1003321de: ret 
0x1003321df: mov qword ptr [rdx], rsi
0x1003321e2: mov qword ptr [rcx], rsi
0x1003321e5: mov rax, rcx
0x1003321e8: pop rbp
0x1003321e9: ret 
0x1003321ea: mov qword ptr [rdx], rax
0x1003321ed: pop rbp
0x1003321ee: ret 
0x1003321ef: mov rdi, qword ptr [rsi + 0x10]
0x1003321f3: cmp qword ptr [rdi], rsi
0x1003321f6: je 0x100332210
0x1003321f8: lea rcx, [rsi + 0x10]
0x1003321fc: nop dword ptr [rax]
0x100332200: mov rcx, qword ptr [rcx]
0x100332203: mov rdi, qword ptr [rcx + 0x10]
0x100332207: cmp qword ptr [rdi], rcx
0x10033220a: lea rcx, [rcx + 0x10]
0x10033220e: jne 0x100332200
0x100332210: cmp rdi, rax
0x100332213: je 0x10033221b
0x100332215: cmp r9d, dword ptr [rdi + 0x1c]
0x100332219: jae 0x100332228
0x10033221b: test r8, r8
0x10033221e: je 0x100332277
0x100332220: mov qword ptr [rdx], rdi
0x100332223: mov rax, rdi
0x100332226: pop rbp
0x100332227: ret 
0x100332228: mov rcx, qword ptr [rax]
0x10033222b: test rcx, rcx
0x10033222e: jne 0x100332243
0x100332230: mov qword ptr [rdx], rax
0x100332233: pop rbp
0x100332234: ret 
0x100332235: nop word ptr cs:[rax + rax]
0x100332240: mov rcx, rsi
0x100332243: mov esi, dword ptr [rcx + 0x1c]
0x100332246: cmp r9d, esi
0x100332249: jae 0x100332260
0x10033224b: mov rsi, qword ptr [rcx]
0x10033224e: mov rax, rcx
0x100332251: test rsi, rsi
0x100332254: jne 0x100332240
0x100332256: jmp 0x100332283 ; 0x100332283
0x100332258: nop dword ptr [rax + rax]
0x100332260: cmp esi, r9d
0x100332263: jae 0x100332272
0x100332265: lea rax, [rcx + 8]
0x100332269: mov rsi, qword ptr [rcx + 8]
0x10033226d: test rsi, rsi
0x100332270: jne 0x100332240
0x100332272: mov qword ptr [rdx], rcx
0x100332275: pop rbp
0x100332276: ret 
0x100332277: mov qword ptr [rdx], rsi
0x10033227a: add rsi, 8
0x10033227e: mov rax, rsi
0x100332281: pop rbp
0x100332282: ret 
0x100332283: mov qword ptr [rdx], rcx
0x100332286: mov rax, rcx
0x100332289: pop rbp
0x10033228a: ret 
0x10033228b: nop dword ptr [rax + rax]
