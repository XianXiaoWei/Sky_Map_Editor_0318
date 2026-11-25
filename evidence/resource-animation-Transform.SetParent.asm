0x1007f22c0: push rbp
0x1007f22c1: mov rbp, rsp
0x1007f22c4: push r14
0x1007f22c6: push rbx
0x1007f22c7: mov r14, rsi
0x1007f22ca: mov rbx, rdi
0x1007f22cd: cmp r14, rbx
0x1007f22d0: je 0x1007f23fc
0x1007f22d6: mov rax, qword ptr [rbx + 0xc0]
0x1007f22dd: test rax, rax
0x1007f22e0: je 0x1007f236c
0x1007f22e6: mov rcx, qword ptr [rbx + 0xc8]
0x1007f22ed: test rcx, rcx
0x1007f22f0: je 0x1007f23d3
0x1007f22f6: cmp qword ptr [rcx + 0xd0], rbx
0x1007f22fd: jne 0x1007f2459
0x1007f2303: cmp qword ptr [rcx + 0xc0], rax
0x1007f230a: jne 0x1007f2478
0x1007f2310: cmp qword ptr [rax + 0xd8], rbx
0x1007f2317: je 0x1007f2497
0x1007f231d: mov rdx, qword ptr [rbx + 0xd0]
0x1007f2324: mov qword ptr [rcx + 0xd0], rdx
0x1007f232b: mov rdx, qword ptr [rbx + 0xd0]
0x1007f2332: test rdx, rdx
0x1007f2335: je 0x1007f2358
0x1007f2337: cmp qword ptr [rdx + 0xc8], rbx
0x1007f233e: jne 0x1007f24b6
0x1007f2344: cmp qword ptr [rdx + 0xc0], rax
0x1007f234b: jne 0x1007f24d5
0x1007f2351: mov qword ptr [rdx + 0xc8], rcx
0x1007f2358: vxorps xmm0, xmm0, xmm0
0x1007f235c: vmovups xmmword ptr [rbx + 0xc8], xmm0
0x1007f2364: mov rdi, rbx
0x1007f2367: call 0x1007f2740 ; 0x1007f2740
0x1007f236c: mov qword ptr [rbx + 0xc0], r14
0x1007f2373: test r14, r14
0x1007f2376: je 0x1007f23ce
0x1007f2378: cmp qword ptr [rbx + 0xc8], 0
0x1007f2380: jne 0x1007f241b
0x1007f2386: cmp qword ptr [rbx + 0xd0], 0
0x1007f238e: jne 0x1007f243a
0x1007f2394: mov rax, qword ptr [r14 + 0xd8]
0x1007f239b: mov qword ptr [rbx + 0xd0], rax
0x1007f23a2: mov qword ptr [r14 + 0xd8], rbx
0x1007f23a9: test rax, rax
0x1007f23ac: je 0x1007f23c2
0x1007f23ae: cmp qword ptr [rax + 0xc0], r14
0x1007f23b5: jne 0x1007f24f4
0x1007f23bb: mov qword ptr [rax + 0xc8], rbx
0x1007f23c2: mov rdi, rbx
0x1007f23c5: pop rbx
0x1007f23c6: pop r14
0x1007f23c8: pop rbp
0x1007f23c9: jmp 0x1007f2740 ; 0x1007f2740
0x1007f23ce: pop rbx
0x1007f23cf: pop r14
0x1007f23d1: pop rbp
0x1007f23d2: ret 
0x1007f23d3: cmp qword ptr [rax + 0xd8], rbx
0x1007f23da: jne 0x1007f2513
0x1007f23e0: mov rdx, qword ptr [rbx + 0xd0]
0x1007f23e7: mov qword ptr [rax + 0xd8], rdx
0x1007f23ee: test rdx, rdx
0x1007f23f1: jne 0x1007f2337
0x1007f23f7: jmp 0x1007f2358 ; 0x1007f2358
0x1007f23fc: lea rdi, [rip + 0x3aad99] ; 0x100b9d19c val != this
0x1007f2403: lea rsi, [rip + 0x3b55ad] ; 0x100ba79b7 Transform.cpp
0x1007f240a: mov edx, 0x72
0x1007f240f: mov ecx, 3
0x1007f2414: call 0x1007e5f70 ; 0x1007e5f70
0x1007f2419: ud2 
0x1007f241b: lea rdi, [rip + 0x3aae3a] ; 0x100b9d25c prevSibling == NULL
0x1007f2422: lea rsi, [rip + 0x3b558e] ; 0x100ba79b7 Transform.cpp
0x1007f2429: mov edx, 0x93
0x1007f242e: mov ecx, 3
0x1007f2433: call 0x1007e5f70 ; 0x1007e5f70
0x1007f2438: ud2 
0x1007f243a: lea rdi, [rip + 0x3aae2f] ; 0x100b9d270 nextSibling == NULL
0x1007f2441: lea rsi, [rip + 0x3b556f] ; 0x100ba79b7 Transform.cpp
0x1007f2448: mov edx, 0x94
0x1007f244d: mov ecx, 3
0x1007f2452: call 0x1007e5f70 ; 0x1007e5f70
0x1007f2457: ud2 
0x1007f2459: lea rdi, [rip + 0x3aad48] ; 0x100b9d1a8 prevSibling->nextSibling == this
0x1007f2460: lea rsi, [rip + 0x3b5550] ; 0x100ba79b7 Transform.cpp
0x1007f2467: mov edx, 0x78
0x1007f246c: mov ecx, 3
0x1007f2471: call 0x1007e5f70 ; 0x1007e5f70
0x1007f2476: ud2 
0x1007f2478: lea rdi, [rip + 0x3aad4a] ; 0x100b9d1c9 prevSibling->parent == parent
0x1007f247f: lea rsi, [rip + 0x3b5531] ; 0x100ba79b7 Transform.cpp
0x1007f2486: mov edx, 0x79
0x1007f248b: mov ecx, 3
0x1007f2490: call 0x1007e5f70 ; 0x1007e5f70
0x1007f2495: ud2 
0x1007f2497: lea rdi, [rip + 0x3aad49] ; 0x100b9d1e7 parent->firstChild != this
0x1007f249e: lea rsi, [rip + 0x3b5512] ; 0x100ba79b7 Transform.cpp
0x1007f24a5: mov edx, 0x7a
0x1007f24aa: mov ecx, 3
0x1007f24af: call 0x1007e5f70 ; 0x1007e5f70
0x1007f24b4: ud2 
0x1007f24b6: lea rdi, [rip + 0x3aad60] ; 0x100b9d21d nextSibling->prevSibling == this
0x1007f24bd: lea rsi, [rip + 0x3b54f3] ; 0x100ba79b7 Transform.cpp
0x1007f24c4: mov edx, 0x85
0x1007f24c9: mov ecx, 3
0x1007f24ce: call 0x1007e5f70 ; 0x1007e5f70
0x1007f24d3: ud2 
0x1007f24d5: lea rdi, [rip + 0x3aad62] ; 0x100b9d23e nextSibling->parent == parent
0x1007f24dc: lea rsi, [rip + 0x3b54d4] ; 0x100ba79b7 Transform.cpp
0x1007f24e3: mov edx, 0x86
0x1007f24e8: mov ecx, 3
0x1007f24ed: call 0x1007e5f70 ; 0x1007e5f70
0x1007f24f2: ud2 
0x1007f24f4: lea rdi, [rip + 0x3aad43] ; 0x100b9d23e nextSibling->parent == parent
0x1007f24fb: lea rsi, [rip + 0x3b54b5] ; 0x100ba79b7 Transform.cpp
0x1007f2502: mov edx, 0x99
0x1007f2507: mov ecx, 3
0x1007f250c: call 0x1007e5f70 ; 0x1007e5f70
0x1007f2511: ud2 
0x1007f2513: lea rdi, [rip + 0x3aace8] ; 0x100b9d202 parent->firstChild == this
0x1007f251a: lea rsi, [rip + 0x3b5496] ; 0x100ba79b7 Transform.cpp
0x1007f2521: mov edx, 0x7f
0x1007f2526: mov ecx, 3
0x1007f252b: call 0x1007e5f70 ; 0x1007e5f70
0x1007f2530: ud2 
0x1007f2532: nop word ptr cs:[rax + rax]
