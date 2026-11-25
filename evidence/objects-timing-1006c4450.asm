0x1006c4450: push rbp
0x1006c4451: mov rbp, rsp
0x1006c4454: push r15
0x1006c4456: push r14
0x1006c4458: push r13
0x1006c445a: push r12
0x1006c445c: push rbx
0x1006c445d: sub rsp, 0x18
0x1006c4461: mov r15, rsi
0x1006c4464: mov r14, qword ptr [rdi + 0x480]
0x1006c446b: vxorps xmm0, xmm0, xmm0
0x1006c446f: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1006c4474: mov qword ptr [rbp - 0x30], 0
0x1006c447c: mov rdi, r15
0x1006c447f: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1006c4484: mov r13, rax
0x1006c4487: cmp r13, 0xff1
0x1006c448e: jae 0x1006c4552
0x1006c4494: cmp r13, 0x17
0x1006c4498: jae 0x1006c44ad
0x1006c449a: mov eax, r13d
0x1006c449d: add al, al
0x1006c449f: mov byte ptr [rbp - 0x40], al
0x1006c44a2: lea r12, [rbp - 0x3f]
0x1006c44a6: test r13, r13
0x1006c44a9: jne 0x1006c44db
0x1006c44ab: jmp 0x1006c44e9 ; 0x1006c44e9
0x1006c44ad: mov rbx, r13
0x1006c44b0: add rbx, 0x10
0x1006c44b4: and rbx, 0xfffffffffffffff0
0x1006c44b8: call 0x1007e50d0 ; 0x1007e50d0
0x1006c44bd: mov rdi, rax
0x1006c44c0: mov rsi, rbx
0x1006c44c3: call 0x1007e5790 ; 0x1007e5790
0x1006c44c8: mov r12, rax
0x1006c44cb: mov qword ptr [rbp - 0x30], r12
0x1006c44cf: or rbx, 1
0x1006c44d3: mov qword ptr [rbp - 0x40], rbx
0x1006c44d7: mov qword ptr [rbp - 0x38], r13
0x1006c44db: mov rdi, r12
0x1006c44de: mov rsi, r15
0x1006c44e1: mov rdx, r13
0x1006c44e4: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1006c44e9: mov byte ptr [r12 + r13], 0
0x1006c44ee: lea rsi, [rbp - 0x40]
0x1006c44f2: mov rdi, r14
0x1006c44f5: call 0x1006c4570 ; 0x1006c4570
0x1006c44fa: mov rbx, rax
0x1006c44fd: test byte ptr [rbp - 0x40], 1
0x1006c4501: je 0x1006c4517
0x1006c4503: mov r14, qword ptr [rbp - 0x30]
0x1006c4507: call 0x1007e50d0 ; 0x1007e50d0
0x1006c450c: mov rdi, rax
0x1006c450f: mov rsi, r14
0x1006c4512: call 0x1007e5db0 ; 0x1007e5db0
0x1006c4517: test rbx, rbx
0x1006c451a: je 0x1006c4543
0x1006c451c: mov al, byte ptr [rbx + 0x1088]
0x1006c4522: mov ecx, eax
0x1006c4524: xor cl, 1
0x1006c4527: mov byte ptr [rbx + 0x1088], cl
0x1006c452d: test al, al
0x1006c452f: jne 0x1006c4543
0x1006c4531: mov qword ptr [rbx + 0x108c], 0
0x1006c453c: mov byte ptr [rbx + 0x1095], 1
0x1006c4543: add rsp, 0x18
0x1006c4547: pop rbx
0x1006c4548: pop r12
0x1006c454a: pop r13
0x1006c454c: pop r14
0x1006c454e: pop r15
0x1006c4550: pop rbp
0x1006c4551: ret 
0x1006c4552: lea rdi, [rbp - 0x40]
0x1006c4556: call 0x100aa230c ; 0x100aa230c __ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
0x1006c455b: mov rdi, rax
0x1006c455e: call 0x100011bf0 ; 0x100011bf0
0x1006c4563: nop word ptr cs:[rax + rax]
