0x1007c2310: push rbp
0x1007c2311: mov rbp, rsp
0x1007c2314: push r14
0x1007c2316: push rbx
0x1007c2317: mov rbx, rsi
0x1007c231a: mov r14, rdi
0x1007c231d: mov rcx, qword ptr [rbx]
0x1007c2320: test rcx, rcx
0x1007c2323: je 0x1007c238c
0x1007c2325: mov rdi, qword ptr [rcx + 0x10]
0x1007c2329: test rdi, rdi
0x1007c232c: je 0x1007c233f
0x1007c232e: mov rax, qword ptr [rdi]
0x1007c2331: mov rsi, rbx
0x1007c2334: call qword ptr [rax + 0x40]
0x1007c2337: mov rcx, qword ptr [rbx]
0x1007c233a: test rcx, rcx
0x1007c233d: je 0x1007c238c
0x1007c233f: mov rax, qword ptr [rbx + 8]
0x1007c2343: mov rdx, qword ptr [rbx + 0x10]
0x1007c2347: test rdx, rdx
0x1007c234a: lea rdx, [rdx + 8]
0x1007c234e: cmove rdx, rcx
0x1007c2352: mov qword ptr [rdx], rax
0x1007c2355: mov rax, qword ptr [rbx + 8]
0x1007c2359: mov rdx, qword ptr [rbx + 0x10]
0x1007c235d: add rcx, 8
0x1007c2361: test rax, rax
0x1007c2364: lea rax, [rax + 0x10]
0x1007c2368: cmove rax, rcx
0x1007c236c: mov qword ptr [rax], rdx
0x1007c236f: vxorps xmm0, xmm0, xmm0
0x1007c2373: vmovups xmmword ptr [rbx], xmm0
0x1007c2377: mov qword ptr [rbx + 0x10], 0
0x1007c237f: lea rax, [r14 + 0x40]
0x1007c2383: cmp qword ptr [r14 + 0x40], 0
0x1007c2388: jne 0x1007c23e1
0x1007c238a: jmp 0x1007c23f3 ; 0x1007c23f3
0x1007c238c: lea rax, [r14 + 0x40]
0x1007c2390: test rcx, rcx
0x1007c2393: je 0x1007c23da
0x1007c2395: cmp rcx, rax
0x1007c2398: je 0x1007c2401
0x1007c239a: mov rdx, qword ptr [rbx + 8]
0x1007c239e: mov rsi, qword ptr [rbx + 0x10]
0x1007c23a2: test rsi, rsi
0x1007c23a5: lea rsi, [rsi + 8]
0x1007c23a9: cmove rsi, rcx
0x1007c23ad: mov qword ptr [rsi], rdx
0x1007c23b0: mov rdx, qword ptr [rbx + 8]
0x1007c23b4: mov rsi, qword ptr [rbx + 0x10]
0x1007c23b8: add rcx, 8
0x1007c23bc: test rdx, rdx
0x1007c23bf: lea rdx, [rdx + 0x10]
0x1007c23c3: cmove rdx, rcx
0x1007c23c7: mov qword ptr [rdx], rsi
0x1007c23ca: vxorps xmm0, xmm0, xmm0
0x1007c23ce: vmovups xmmword ptr [rbx], xmm0
0x1007c23d2: mov qword ptr [rbx + 0x10], 0
0x1007c23da: cmp qword ptr [r14 + 0x40], 0
0x1007c23df: je 0x1007c23f3
0x1007c23e1: lea rcx, [r14 + 0x48]
0x1007c23e5: mov rdx, qword ptr [r14 + 0x48]
0x1007c23e9: mov qword ptr [rdx + 8], rbx
0x1007c23ed: mov qword ptr [rbx + 0x10], rdx
0x1007c23f1: jmp 0x1007c23fb ; 0x1007c23fb
0x1007c23f3: mov qword ptr [r14 + 0x40], rbx
0x1007c23f7: lea rcx, [r14 + 0x48]
0x1007c23fb: mov qword ptr [rcx], rbx
0x1007c23fe: mov qword ptr [rbx], rax
0x1007c2401: mov rax, qword ptr [r14]
0x1007c2404: mov rdi, r14
0x1007c2407: mov rsi, rbx
0x1007c240a: call qword ptr [rax + 0x38]
0x1007c240d: mov byte ptr [rbx + 0x18], 1
0x1007c2411: pop rbx
0x1007c2412: pop r14
0x1007c2414: pop rbp
0x1007c2415: ret 
0x1007c2416: nop word ptr cs:[rax + rax]
