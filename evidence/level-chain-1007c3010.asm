0x1007c3010: push rbp
0x1007c3011: mov rbp, rsp
0x1007c3014: push r15
0x1007c3016: push r14
0x1007c3018: push r12
0x1007c301a: push rbx
0x1007c301b: mov r14, rdi
0x1007c301e: lea rdi, [r14 + 0x5e0]
0x1007c3025: call 0x1007ea060 ; 0x1007ea060
0x1007c302a: test al, al
0x1007c302c: je 0x1007c3862
0x1007c3032: mov rbx, qword ptr [r14 + 0x4d0]
0x1007c3039: test rbx, rbx
0x1007c303c: je 0x1007c35ab
0x1007c3042: lea r12, [r14 + 0x4c8]
0x1007c3049: nop dword ptr [rax]
0x1007c3050: mov rax, qword ptr [rbx + 0x68]
0x1007c3054: mov qword ptr [r14 + 0x4d0], rax
0x1007c305b: mov qword ptr [rbx + 0x68], 0
0x1007c3063: mov rax, qword ptr [r14 + 0x4c8]
0x1007c306a: test rax, rax
0x1007c306d: setne cl
0x1007c3070: je 0x1007c33c0
0x1007c3076: cmp rax, rbx
0x1007c3079: je 0x1007c33c0
0x1007c307f: nop 
0x1007c3080: mov rdx, rax
0x1007c3083: mov rax, qword ptr [rdx + 0x60]
0x1007c3087: test rax, rax
0x1007c308a: setne cl
0x1007c308d: je 0x1007c3094
0x1007c308f: cmp rax, rbx
0x1007c3092: jne 0x1007c3080
0x1007c3094: test cl, cl
0x1007c3096: je 0x1007c33ca
0x1007c309c: test rdx, rdx
0x1007c309f: lea rcx, [rdx + 0x60]
0x1007c30a3: mov rdx, qword ptr [rax + 0x60]
0x1007c30a7: cmove rcx, r12
0x1007c30ab: mov qword ptr [rcx], rdx
0x1007c30ae: mov qword ptr [rax + 0x60], 0
0x1007c30b6: cmp qword ptr [r14 + 0x4e0], rbx
0x1007c30bd: jne 0x1007c33d7
0x1007c30c3: mov qword ptr [r14 + 0x4e0], 0
0x1007c30ce: cmp qword ptr [r14 + 0x4e8], rbx
0x1007c30d5: jne 0x1007c33e4
0x1007c30db: mov qword ptr [r14 + 0x4e8], 0
0x1007c30e6: cmp qword ptr [r14 + 0x4f0], rbx
0x1007c30ed: jne 0x1007c33f1
0x1007c30f3: mov qword ptr [r14 + 0x4f0], 0
0x1007c30fe: cmp qword ptr [r14 + 0x4f8], rbx
0x1007c3105: jne 0x1007c33fe
0x1007c310b: mov qword ptr [r14 + 0x4f8], 0
0x1007c3116: cmp qword ptr [r14 + 0x500], rbx
0x1007c311d: jne 0x1007c340b
0x1007c3123: mov qword ptr [r14 + 0x500], 0
0x1007c312e: cmp qword ptr [r14 + 0x508], rbx
0x1007c3135: jne 0x1007c3418
0x1007c313b: mov qword ptr [r14 + 0x508], 0
0x1007c3146: cmp qword ptr [r14 + 0x510], rbx
0x1007c314d: jne 0x1007c3425
0x1007c3153: mov qword ptr [r14 + 0x510], 0
0x1007c315e: cmp qword ptr [r14 + 0x518], rbx
0x1007c3165: jne 0x1007c3432
0x1007c316b: mov qword ptr [r14 + 0x518], 0
0x1007c3176: cmp qword ptr [r14 + 0x520], rbx
0x1007c317d: jne 0x1007c343f
0x1007c3183: mov qword ptr [r14 + 0x520], 0
0x1007c318e: cmp qword ptr [r14 + 0x528], rbx
0x1007c3195: jne 0x1007c344c
0x1007c319b: mov qword ptr [r14 + 0x528], 0
0x1007c31a6: cmp qword ptr [r14 + 0x530], rbx
0x1007c31ad: jne 0x1007c3459
0x1007c31b3: mov qword ptr [r14 + 0x530], 0
0x1007c31be: cmp qword ptr [r14 + 0x538], rbx
0x1007c31c5: jne 0x1007c3466
0x1007c31cb: mov qword ptr [r14 + 0x538], 0
0x1007c31d6: cmp qword ptr [r14 + 0x540], rbx
0x1007c31dd: jne 0x1007c3473
0x1007c31e3: mov qword ptr [r14 + 0x540], 0
0x1007c31ee: cmp qword ptr [r14 + 0x548], rbx
0x1007c31f5: jne 0x1007c3480
0x1007c31fb: mov qword ptr [r14 + 0x548], 0
0x1007c3206: cmp qword ptr [r14 + 0x550], rbx
0x1007c320d: jne 0x1007c348d
0x1007c3213: mov qword ptr [r14 + 0x550], 0
0x1007c321e: cmp qword ptr [r14 + 0x558], rbx
0x1007c3225: jne 0x1007c349a
0x1007c322b: mov qword ptr [r14 + 0x558], 0
0x1007c3236: cmp qword ptr [r14 + 0x560], rbx
0x1007c323d: jne 0x1007c34a7
0x1007c3243: mov qword ptr [r14 + 0x560], 0
0x1007c324e: cmp qword ptr [r14 + 0x568], rbx
0x1007c3255: jne 0x1007c34b4
0x1007c325b: mov qword ptr [r14 + 0x568], 0
0x1007c3266: cmp qword ptr [r14 + 0x570], rbx
0x1007c326d: jne 0x1007c34c1
0x1007c3273: mov qword ptr [r14 + 0x570], 0
0x1007c327e: cmp qword ptr [r14 + 0x578], rbx
0x1007c3285: jne 0x1007c34ce
0x1007c328b: mov qword ptr [r14 + 0x578], 0
0x1007c3296: cmp qword ptr [r14 + 0x580], rbx
0x1007c329d: jne 0x1007c34db
0x1007c32a3: mov qword ptr [r14 + 0x580], 0
0x1007c32ae: cmp qword ptr [r14 + 0x588], rbx
0x1007c32b5: jne 0x1007c34e8
0x1007c32bb: mov qword ptr [r14 + 0x588], 0
0x1007c32c6: cmp qword ptr [r14 + 0x590], rbx
0x1007c32cd: jne 0x1007c34f5
0x1007c32d3: mov qword ptr [r14 + 0x590], 0
0x1007c32de: cmp qword ptr [r14 + 0x598], rbx
0x1007c32e5: jne 0x1007c3502
0x1007c32eb: mov qword ptr [r14 + 0x598], 0
0x1007c32f6: cmp qword ptr [r14 + 0x5a0], rbx
0x1007c32fd: jne 0x1007c350f
0x1007c3303: mov qword ptr [r14 + 0x5a0], 0
0x1007c330e: cmp qword ptr [r14 + 0x5a8], rbx
0x1007c3315: jne 0x1007c351c
0x1007c331b: mov qword ptr [r14 + 0x5a8], 0
0x1007c3326: cmp qword ptr [r14 + 0x5b0], rbx
0x1007c332d: jne 0x1007c3529
0x1007c3333: mov qword ptr [r14 + 0x5b0], 0
0x1007c333e: cmp qword ptr [r14 + 0x5b8], rbx
0x1007c3345: jne 0x1007c3536
0x1007c334b: mov qword ptr [r14 + 0x5b8], 0
0x1007c3356: cmp qword ptr [r14 + 0x5c0], rbx
0x1007c335d: jne 0x1007c3543
0x1007c3363: mov qword ptr [r14 + 0x5c0], 0
0x1007c336e: cmp qword ptr [r14 + 0x5c8], rbx
0x1007c3375: jne 0x1007c3550
0x1007c337b: mov qword ptr [r14 + 0x5c8], 0
0x1007c3386: cmp qword ptr [r14 + 0x5d0], rbx
0x1007c338d: jne 0x1007c355d
0x1007c3393: mov qword ptr [r14 + 0x5d0], 0
0x1007c339e: cmp qword ptr [r14 + 0x5d8], rbx
0x1007c33a5: jne 0x1007c356a
0x1007c33ab: mov qword ptr [r14 + 0x5d8], 0
0x1007c33b6: jmp 0x1007c356a ; 0x1007c356a
0x1007c33bb: nop dword ptr [rax + rax]
0x1007c33c0: xor edx, edx
0x1007c33c2: test cl, cl
0x1007c33c4: jne 0x1007c309c
0x1007c33ca: cmp qword ptr [r14 + 0x4e0], rbx
0x1007c33d1: je 0x1007c30c3
0x1007c33d7: cmp qword ptr [r14 + 0x4e8], rbx
0x1007c33de: je 0x1007c30db
0x1007c33e4: cmp qword ptr [r14 + 0x4f0], rbx
0x1007c33eb: je 0x1007c30f3
0x1007c33f1: cmp qword ptr [r14 + 0x4f8], rbx
0x1007c33f8: je 0x1007c310b
0x1007c33fe: cmp qword ptr [r14 + 0x500], rbx
0x1007c3405: je 0x1007c3123
0x1007c340b: cmp qword ptr [r14 + 0x508], rbx
0x1007c3412: je 0x1007c313b
0x1007c3418: cmp qword ptr [r14 + 0x510], rbx
0x1007c341f: je 0x1007c3153
0x1007c3425: cmp qword ptr [r14 + 0x518], rbx
0x1007c342c: je 0x1007c316b
0x1007c3432: cmp qword ptr [r14 + 0x520], rbx
0x1007c3439: je 0x1007c3183
0x1007c343f: cmp qword ptr [r14 + 0x528], rbx
0x1007c3446: je 0x1007c319b
0x1007c344c: cmp qword ptr [r14 + 0x530], rbx
0x1007c3453: je 0x1007c31b3
0x1007c3459: cmp qword ptr [r14 + 0x538], rbx
0x1007c3460: je 0x1007c31cb
0x1007c3466: cmp qword ptr [r14 + 0x540], rbx
0x1007c346d: je 0x1007c31e3
0x1007c3473: cmp qword ptr [r14 + 0x548], rbx
0x1007c347a: je 0x1007c31fb
0x1007c3480: cmp qword ptr [r14 + 0x550], rbx
0x1007c3487: je 0x1007c3213
0x1007c348d: cmp qword ptr [r14 + 0x558], rbx
0x1007c3494: je 0x1007c322b
0x1007c349a: cmp qword ptr [r14 + 0x560], rbx
0x1007c34a1: je 0x1007c3243
0x1007c34a7: cmp qword ptr [r14 + 0x568], rbx
0x1007c34ae: je 0x1007c325b
0x1007c34b4: cmp qword ptr [r14 + 0x570], rbx
0x1007c34bb: je 0x1007c3273
0x1007c34c1: cmp qword ptr [r14 + 0x578], rbx
0x1007c34c8: je 0x1007c328b
0x1007c34ce: cmp qword ptr [r14 + 0x580], rbx
0x1007c34d5: je 0x1007c32a3
0x1007c34db: cmp qword ptr [r14 + 0x588], rbx
0x1007c34e2: je 0x1007c32bb
0x1007c34e8: cmp qword ptr [r14 + 0x590], rbx
0x1007c34ef: je 0x1007c32d3
0x1007c34f5: cmp qword ptr [r14 + 0x598], rbx
0x1007c34fc: je 0x1007c32eb
0x1007c3502: cmp qword ptr [r14 + 0x5a0], rbx
0x1007c3509: je 0x1007c3303
0x1007c350f: cmp qword ptr [r14 + 0x5a8], rbx
0x1007c3516: je 0x1007c331b
0x1007c351c: cmp qword ptr [r14 + 0x5b0], rbx
0x1007c3523: je 0x1007c3333
0x1007c3529: cmp qword ptr [r14 + 0x5b8], rbx
0x1007c3530: je 0x1007c334b
0x1007c3536: cmp qword ptr [r14 + 0x5c0], rbx
0x1007c353d: je 0x1007c3363
0x1007c3543: cmp qword ptr [r14 + 0x5c8], rbx
0x1007c354a: je 0x1007c337b
0x1007c3550: cmp qword ptr [r14 + 0x5d0], rbx
0x1007c3557: je 0x1007c3393
0x1007c355d: cmp qword ptr [r14 + 0x5d8], rbx
0x1007c3564: je 0x1007c33ab
0x1007c356a: mov rax, qword ptr [rbx]
0x1007c356d: mov r15, qword ptr [rbx + 0x30]
0x1007c3571: mov rsi, qword ptr [r14 + 0x10]
0x1007c3575: mov rdi, rbx
0x1007c3578: call qword ptr [rax + 0x18]
0x1007c357b: mov rax, qword ptr [rbx]
0x1007c357e: mov rsi, qword ptr [r14 + 0x10]
0x1007c3582: mov rdi, rbx
0x1007c3585: call qword ptr [rax + 0x20]
0x1007c3588: mov rax, qword ptr [rbx]
0x1007c358b: mov rdi, rbx
0x1007c358e: call qword ptr [rax]
0x1007c3590: mov rdi, r15
0x1007c3593: mov rsi, rbx
0x1007c3596: call 0x100795a70 ; 0x100795a70
0x1007c359b: mov rbx, qword ptr [r14 + 0x4d0]
0x1007c35a2: test rbx, rbx
0x1007c35a5: jne 0x1007c3050
0x1007c35ab: xor ebx, ebx
0x1007c35ad: nop dword ptr [rax]
0x1007c35b0: mov r15, qword ptr [r14 + rbx*8 + 0x4e0]
0x1007c35b8: test r15, r15
0x1007c35bb: je 0x1007c35e8
0x1007c35bd: cmp byte ptr [r15 + 0x3b], 0
0x1007c35c2: je 0x1007c3600
0x1007c35c4: cmp qword ptr [r15 + 0x30], 0
0x1007c35c9: je 0x1007c386b
0x1007c35cf: mov byte ptr [r15 + 0x3a], 0
0x1007c35d4: mov rax, qword ptr [r15]
0x1007c35d7: mov rsi, qword ptr [r14 + 0x10]
0x1007c35db: mov rdi, r15
0x1007c35de: call qword ptr [rax + 0x10]
0x1007c35e1: cmp byte ptr [r15 + 0x3b], 0
0x1007c35e6: je 0x1007c3600
0x1007c35e8: inc rbx
0x1007c35eb: cmp rbx, 0x20
0x1007c35ef: jb 0x1007c35b0
0x1007c35f1: jmp 0x1007c3615 ; 0x1007c3615
0x1007c35f3: nop word ptr cs:[rax + rax]
0x1007c3600: mov qword ptr [r14 + rbx*8 + 0x4e0], 0
0x1007c360c: inc rbx
0x1007c360f: cmp rbx, 0x20
0x1007c3613: jb 0x1007c35b0
0x1007c3615: lea rax, [r14 + 0x4c8]
0x1007c361c: xor ecx, ecx
0x1007c361e: nop 
0x1007c3620: cmp qword ptr [r14 + rcx*8 + 0x4e0], 0
0x1007c3629: jne 0x1007c3669
0x1007c362b: mov rdx, qword ptr [rax]
0x1007c362e: test rdx, rdx
0x1007c3631: je 0x1007c3669
0x1007c3633: xor esi, esi
0x1007c3635: nop word ptr cs:[rax + rax]
0x1007c3640: mov rdi, rsi
0x1007c3643: mov rsi, rdx
0x1007c3646: mov rdx, qword ptr [rsi + 0x60]
0x1007c364a: test rdx, rdx
0x1007c364d: jne 0x1007c3640
0x1007c364f: test rdi, rdi
0x1007c3652: lea rdx, [rdi + 0x60]
0x1007c3656: cmove rdx, rax
0x1007c365a: mov qword ptr [rdx], 0
0x1007c3661: mov qword ptr [r14 + rcx*8 + 0x4e0], rsi
0x1007c3669: inc rcx
0x1007c366c: cmp rcx, 0x20
0x1007c3670: jne 0x1007c3620
0x1007c3672: lea rax, [r14 + 0x4d8]
0x1007c3679: mov rdx, qword ptr [r14 + 0x4e0]
0x1007c3680: xor ecx, ecx
0x1007c3682: test rdx, rdx
0x1007c3685: setne cl
0x1007c3688: mov dword ptr [r14 + 0x4d8], ecx
0x1007c368f: cmp qword ptr [r14 + 0x4e8], 0
0x1007c3697: je 0x1007c36a7
0x1007c3699: cmp rdx, 1
0x1007c369d: mov ecx, 2
0x1007c36a2: sbb ecx, 0
0x1007c36a5: mov dword ptr [rax], ecx
0x1007c36a7: cmp qword ptr [r14 + 0x4f0], 0
0x1007c36af: je 0x1007c36b5
0x1007c36b1: inc ecx
0x1007c36b3: mov dword ptr [rax], ecx
0x1007c36b5: cmp qword ptr [r14 + 0x4f8], 0
0x1007c36bd: je 0x1007c36c3
0x1007c36bf: inc ecx
0x1007c36c1: mov dword ptr [rax], ecx
0x1007c36c3: cmp qword ptr [r14 + 0x500], 0
0x1007c36cb: je 0x1007c36d1
0x1007c36cd: inc ecx
0x1007c36cf: mov dword ptr [rax], ecx
0x1007c36d1: cmp qword ptr [r14 + 0x508], 0
0x1007c36d9: je 0x1007c36df
0x1007c36db: inc ecx
0x1007c36dd: mov dword ptr [rax], ecx
0x1007c36df: cmp qword ptr [r14 + 0x510], 0
0x1007c36e7: je 0x1007c36ed
0x1007c36e9: inc ecx
0x1007c36eb: mov dword ptr [rax], ecx
0x1007c36ed: cmp qword ptr [r14 + 0x518], 0
0x1007c36f5: je 0x1007c36fb
0x1007c36f7: inc ecx
0x1007c36f9: mov dword ptr [rax], ecx
0x1007c36fb: cmp qword ptr [r14 + 0x520], 0
0x1007c3703: je 0x1007c3709
0x1007c3705: inc ecx
0x1007c3707: mov dword ptr [rax], ecx
0x1007c3709: cmp qword ptr [r14 + 0x528], 0
0x1007c3711: je 0x1007c3717
0x1007c3713: inc ecx
0x1007c3715: mov dword ptr [rax], ecx
0x1007c3717: cmp qword ptr [r14 + 0x530], 0
0x1007c371f: je 0x1007c3725
0x1007c3721: inc ecx
0x1007c3723: mov dword ptr [rax], ecx
0x1007c3725: cmp qword ptr [r14 + 0x538], 0
0x1007c372d: je 0x1007c3733
0x1007c372f: inc ecx
0x1007c3731: mov dword ptr [rax], ecx
0x1007c3733: cmp qword ptr [r14 + 0x540], 0
0x1007c373b: je 0x1007c3741
0x1007c373d: inc ecx
0x1007c373f: mov dword ptr [rax], ecx
0x1007c3741: cmp qword ptr [r14 + 0x548], 0
0x1007c3749: je 0x1007c374f
0x1007c374b: inc ecx
0x1007c374d: mov dword ptr [rax], ecx
0x1007c374f: cmp qword ptr [r14 + 0x550], 0
0x1007c3757: je 0x1007c375d
0x1007c3759: inc ecx
0x1007c375b: mov dword ptr [rax], ecx
0x1007c375d: cmp qword ptr [r14 + 0x558], 0
0x1007c3765: je 0x1007c376b
0x1007c3767: inc ecx
0x1007c3769: mov dword ptr [rax], ecx
0x1007c376b: cmp qword ptr [r14 + 0x560], 0
0x1007c3773: je 0x1007c3779
0x1007c3775: inc ecx
0x1007c3777: mov dword ptr [rax], ecx
0x1007c3779: cmp qword ptr [r14 + 0x568], 0
0x1007c3781: je 0x1007c3787
0x1007c3783: inc ecx
0x1007c3785: mov dword ptr [rax], ecx
0x1007c3787: cmp qword ptr [r14 + 0x570], 0
0x1007c378f: je 0x1007c3795
0x1007c3791: inc ecx
0x1007c3793: mov dword ptr [rax], ecx
0x1007c3795: cmp qword ptr [r14 + 0x578], 0
0x1007c379d: je 0x1007c37a3
0x1007c379f: inc ecx
0x1007c37a1: mov dword ptr [rax], ecx
0x1007c37a3: cmp qword ptr [r14 + 0x580], 0
0x1007c37ab: je 0x1007c37b1
0x1007c37ad: inc ecx
0x1007c37af: mov dword ptr [rax], ecx
0x1007c37b1: cmp qword ptr [r14 + 0x588], 0
0x1007c37b9: je 0x1007c37bf
0x1007c37bb: inc ecx
0x1007c37bd: mov dword ptr [rax], ecx
0x1007c37bf: cmp qword ptr [r14 + 0x590], 0
0x1007c37c7: je 0x1007c37cd
0x1007c37c9: inc ecx
0x1007c37cb: mov dword ptr [rax], ecx
0x1007c37cd: cmp qword ptr [r14 + 0x598], 0
0x1007c37d5: je 0x1007c37db
0x1007c37d7: inc ecx
0x1007c37d9: mov dword ptr [rax], ecx
0x1007c37db: cmp qword ptr [r14 + 0x5a0], 0
0x1007c37e3: je 0x1007c37e9
0x1007c37e5: inc ecx
0x1007c37e7: mov dword ptr [rax], ecx
0x1007c37e9: cmp qword ptr [r14 + 0x5a8], 0
0x1007c37f1: je 0x1007c37f7
0x1007c37f3: inc ecx
0x1007c37f5: mov dword ptr [rax], ecx
0x1007c37f7: cmp qword ptr [r14 + 0x5b0], 0
0x1007c37ff: je 0x1007c3805
0x1007c3801: inc ecx
0x1007c3803: mov dword ptr [rax], ecx
0x1007c3805: cmp qword ptr [r14 + 0x5b8], 0
0x1007c380d: je 0x1007c3813
0x1007c380f: inc ecx
0x1007c3811: mov dword ptr [rax], ecx
0x1007c3813: cmp qword ptr [r14 + 0x5c0], 0
0x1007c381b: je 0x1007c3821
0x1007c381d: inc ecx
0x1007c381f: mov dword ptr [rax], ecx
0x1007c3821: cmp qword ptr [r14 + 0x5c8], 0
0x1007c3829: je 0x1007c382f
0x1007c382b: inc ecx
0x1007c382d: mov dword ptr [rax], ecx
0x1007c382f: cmp qword ptr [r14 + 0x5d0], 0
0x1007c3837: je 0x1007c383d
0x1007c3839: inc ecx
0x1007c383b: mov dword ptr [rax], ecx
0x1007c383d: cmp qword ptr [r14 + 0x5d8], 0
0x1007c3845: je 0x1007c384b
0x1007c3847: inc ecx
0x1007c3849: mov dword ptr [rax], ecx
0x1007c384b: add r14, 0x660
0x1007c3852: mov rdi, r14
0x1007c3855: pop rbx
0x1007c3856: pop r12
0x1007c3858: pop r14
0x1007c385a: pop r15
0x1007c385c: pop rbp
0x1007c385d: jmp 0x1007ea170 ; 0x1007ea170
0x1007c3862: pop rbx
0x1007c3863: pop r12
0x1007c3865: pop r14
0x1007c3867: pop r15
0x1007c3869: pop rbp
0x1007c386a: ret 
0x1007c386b: test byte ptr [r15 + 0x10], 1
0x1007c3870: jne 0x1007c387b
0x1007c3872: add r15, 0x10
0x1007c3876: inc r15
0x1007c3879: jmp 0x1007c387f ; 0x1007c387f
0x1007c387b: mov r15, qword ptr [r15 + 0x20]
0x1007c387f: lea rdi, [rip + 0x3e0d37] ; 0x100ba45bd res->heap
0x1007c3886: lea rsi, [rip + 0x3e0d01] ; 0x100ba458e Resource.cpp
0x1007c388d: lea r8, [rip + 0x3e0d33] ; 0x100ba45c7 Missing heap for streaming resource "%s"!
0x1007c3894: mov edx, 0xed
0x1007c3899: mov ecx, 4
0x1007c389e: xor eax, eax
0x1007c38a0: mov r9, r15
0x1007c38a3: call 0x1007e6030 ; 0x1007e6030
0x1007c38a8: ud2 
0x1007c38aa: nop word ptr [rax + rax]
