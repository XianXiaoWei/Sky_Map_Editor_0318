0x100a472a0: push rbp
0x100a472a1: mov rbp, rsp
0x100a472a4: push r15
0x100a472a6: push r14
0x100a472a8: push r13
0x100a472aa: push r12
0x100a472ac: push rbx
0x100a472ad: sub rsp, 0x18
0x100a472b1: mov r13, rdi
0x100a472b4: mov rsi, qword ptr [rip + 0x220af5] ; 0x100c67db0
0x100a472bb: mov rbx, qword ptr [rip + 0x1c684e] ; 0x100c0db10
0x100a472c2: call rbx
0x100a472c4: mov rdi, rax
0x100a472c7: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a472cc: mov rsi, qword ptr [rip + 0x22206d] ; 0x100c69340
0x100a472d3: mov qword ptr [rbp - 0x30], rax
0x100a472d7: mov rdi, rax
0x100a472da: call rbx
0x100a472dc: mov rdi, rax
0x100a472df: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a472e4: mov rbx, rax
0x100a472e7: mov rsi, qword ptr [rip + 0x22205a] ; 0x100c69348
0x100a472ee: mov rdi, rbx
0x100a472f1: call qword ptr [rip + 0x1c6819] ; 0x100c0db10
0x100a472f7: cvtsd2ss xmm0, xmm0
0x100a472fb: mov rax, qword ptr [rip + 0x2251e6] ; 0x100c6c4e8
0x100a47302: movss dword ptr [r13 + rax], xmm0
0x100a47309: mov rdi, rbx
0x100a4730c: call qword ptr [rip + 0x1c6806] ; 0x100c0db18
0x100a47312: mov rbx, qword ptr [rip + 0x2251bf] ; 0x100c6c4d8 p
0x100a47319: mov rdi, qword ptr [r13 + rbx]
0x100a4731e: mov rsi, qword ptr [rip + 0x22202b] ; 0x100c69350
0x100a47325: call qword ptr [rip + 0x1c67e5] ; 0x100c0db10
0x100a4732b: mov rdi, rax
0x100a4732e: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a47333: mov r14, qword ptr [rip + 0x2251b6] ; 0x100c6c4f0
0x100a4733a: mov rdi, qword ptr [r13 + r14]
0x100a4733f: mov qword ptr [r13 + r14], rax
0x100a47344: call qword ptr [rip + 0x1c67ce] ; 0x100c0db18
0x100a4734a: mov r15, qword ptr [rip + 0x220a4f] ; 0x100c67da0
0x100a47351: mov rdi, r13
0x100a47354: mov rsi, r15
0x100a47357: call qword ptr [rip + 0x1c67b3] ; 0x100c0db10
0x100a4735d: mov rdi, rax
0x100a47360: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a47365: mov r12, rax
0x100a47368: mov rsi, qword ptr [rip + 0x221fe9] ; 0x100c69358
0x100a4736f: mov rdi, r12
0x100a47372: call qword ptr [rip + 0x1c6798] ; 0x100c0db10
0x100a47378: cmp byte ptr [rax + 4], 0
0x100a4737c: mov eax, 0x51
0x100a47381: mov edx, 0x73
0x100a47386: cmove rdx, rax
0x100a4738a: mov rdi, qword ptr [r13 + rbx]
0x100a4738f: mov rsi, qword ptr [rip + 0x221fca] ; 0x100c69360
0x100a47396: call qword ptr [rip + 0x1c6774] ; 0x100c0db10
0x100a4739c: mov rdi, r12
0x100a4739f: call qword ptr [rip + 0x1c6773] ; 0x100c0db18
0x100a473a5: mov edi, 0x2230
0x100a473aa: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100a473af: mov rbx, rax
0x100a473b2: mov rdi, rbx
0x100a473b5: call 0x100a6f870 ; 0x100a6f870
0x100a473ba: mov r12, qword ptr [rip + 0x225137] ; 0x100c6c4f8 h
0x100a473c1: mov qword ptr [r13 + r12], rbx
0x100a473c6: mov rsi, qword ptr [r13 + r14]
0x100a473cb: mov rdi, rbx
0x100a473ce: call 0x100a70a30 ; 0x100a70a30
0x100a473d3: mov rdi, r13
0x100a473d6: mov rsi, r15
0x100a473d9: call qword ptr [rip + 0x1c6731] ; 0x100c0db10
0x100a473df: mov rdi, rax
0x100a473e2: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a473e7: mov rbx, rax
0x100a473ea: mov rdx, qword ptr [r13 + r12]
0x100a473ef: mov rsi, qword ptr [rip + 0x221f72] ; 0x100c69368
0x100a473f6: mov rdi, rbx
0x100a473f9: call qword ptr [rip + 0x1c6711] ; 0x100c0db10
0x100a473ff: mov rdi, rbx
0x100a47402: call qword ptr [rip + 0x1c6710] ; 0x100c0db18
0x100a47408: mov rax, qword ptr [rip + 0x2250f1] ; 0x100c6c500
0x100a4740f: mov byte ptr [r13 + rax], 1
0x100a47415: mov rbx, qword ptr [rip + 0x2250ec] ; 0x100c6c508 x
0x100a4741c: add rbx, r13
0x100a4741f: mov rdi, rbx
0x100a47422: call 0x100aa1f64 ; 0x100aa1f64 _CVDisplayLinkCreateWithActiveCGDisplays
0x100a47427: mov rdi, qword ptr [rbx]
0x100a4742a: lea rsi, [rip + 0x9f] ; 0x100a474d0
0x100a47431: mov rdx, r13
0x100a47434: call 0x100aa1f70 ; 0x100aa1f70 _CVDisplayLinkSetOutputCallback
0x100a47439: mov rdi, qword ptr [rbx]
0x100a4743c: call 0x100aa1f76 ; 0x100aa1f76 _CVDisplayLinkStart
0x100a47441: mov rsi, qword ptr [rip + 0x221f28] ; 0x100c69370
0x100a47448: mov edx, 0x3c
0x100a4744d: mov rdi, r13
0x100a47450: call qword ptr [rip + 0x1c66ba] ; 0x100c0db10
0x100a47456: mov qword ptr [rbp - 0x40], r13
0x100a4745a: mov rax, qword ptr [rip + 0x224457] ; 0x100c6b8b8
0x100a47461: mov qword ptr [rbp - 0x38], rax
0x100a47465: mov rsi, qword ptr [rip + 0x2209d4] ; 0x100c67e40
0x100a4746c: lea rdi, [rbp - 0x40]
0x100a47470: call 0x100aa29a2 ; 0x100aa29a2 _objc_msgSendSuper2
0x100a47475: mov rdi, qword ptr [rbp - 0x30]
0x100a47479: call qword ptr [rip + 0x1c6699] ; 0x100c0db18
0x100a4747f: add rsp, 0x18
0x100a47483: pop rbx
0x100a47484: pop r12
0x100a47486: pop r13
0x100a47488: pop r14
0x100a4748a: pop r15
0x100a4748c: pop rbp
0x100a4748d: ret 
0x100a4748e: jmp 0x100a4749d ; 0x100a4749d
0x100a47490: mov r15, rax
0x100a47493: mov rdi, rbx
0x100a47496: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x100a4749b: jmp 0x100a474b6 ; 0x100a474b6
0x100a4749d: mov r15, rax
0x100a474a0: mov rdi, rbx
0x100a474a3: jmp 0x100a474ab ; 0x100a474ab
0x100a474a5: mov r15, rax
0x100a474a8: mov rdi, r12
0x100a474ab: call qword ptr [rip + 0x1c6667] ; 0x100c0db18
0x100a474b1: jmp 0x100a474b6 ; 0x100a474b6
0x100a474b3: mov r15, rax
0x100a474b6: mov rdi, qword ptr [rbp - 0x30]
0x100a474ba: call qword ptr [rip + 0x1c6658] ; 0x100c0db18
0x100a474c0: mov rdi, r15
0x100a474c3: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100a474c8: ud2 
0x100a474ca: nop word ptr [rax + rax]
