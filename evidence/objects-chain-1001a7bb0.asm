0x1001a7bb0: push rbp
0x1001a7bb1: mov rbp, rsp
0x1001a7bb4: cmp rsi, rdi
0x1001a7bb7: sete byte ptr [rsi + 0x18]
0x1001a7bbb: je 0x1001a7c16
0x1001a7bbd: nop dword ptr [rax]
0x1001a7bc0: mov rcx, qword ptr [rsi + 0x10]
0x1001a7bc4: cmp byte ptr [rcx + 0x18], 0
0x1001a7bc8: jne 0x1001a7c16
0x1001a7bca: mov rax, qword ptr [rcx + 0x10]
0x1001a7bce: mov rdx, qword ptr [rax]
0x1001a7bd1: cmp rdx, rcx
0x1001a7bd4: je 0x1001a7bf0
0x1001a7bd6: test rdx, rdx
0x1001a7bd9: je 0x1001a7c18
0x1001a7bdb: cmp byte ptr [rdx + 0x18], 0
0x1001a7bdf: je 0x1001a7bff
0x1001a7be1: jmp 0x1001a7c18 ; 0x1001a7c18
0x1001a7be3: nop word ptr cs:[rax + rax]
0x1001a7bf0: mov rdx, qword ptr [rax + 8]
0x1001a7bf4: test rdx, rdx
0x1001a7bf7: je 0x1001a7c22
0x1001a7bf9: cmp byte ptr [rdx + 0x18], 0
0x1001a7bfd: jne 0x1001a7c22
0x1001a7bff: add rdx, 0x18
0x1001a7c03: mov byte ptr [rcx + 0x18], 1
0x1001a7c07: cmp rax, rdi
0x1001a7c0a: sete byte ptr [rax + 0x18]
0x1001a7c0e: mov byte ptr [rdx], 1
0x1001a7c11: mov rsi, rax
0x1001a7c14: jne 0x1001a7bc0
0x1001a7c16: pop rbp
0x1001a7c17: ret 
0x1001a7c18: cmp qword ptr [rcx], rsi
0x1001a7c1b: je 0x1001a7c66
0x1001a7c1d: mov rsi, rcx
0x1001a7c20: jmp 0x1001a7c9c ; 0x1001a7c9c
0x1001a7c22: cmp qword ptr [rcx], rsi
0x1001a7c25: je 0x1001a7cdb
0x1001a7c2b: mov rdx, qword ptr [rcx + 8]
0x1001a7c2f: mov rsi, qword ptr [rdx]
0x1001a7c32: mov qword ptr [rcx + 8], rsi
0x1001a7c36: test rsi, rsi
0x1001a7c39: je 0x1001a7c43
0x1001a7c3b: mov qword ptr [rsi + 0x10], rcx
0x1001a7c3f: mov rax, qword ptr [rcx + 0x10]
0x1001a7c43: mov qword ptr [rdx + 0x10], rax
0x1001a7c47: mov rax, qword ptr [rcx + 0x10]
0x1001a7c4b: lea rsi, [rax + 8]
0x1001a7c4f: cmp qword ptr [rax], rcx
0x1001a7c52: cmove rsi, rax
0x1001a7c56: mov qword ptr [rsi], rdx
0x1001a7c59: mov qword ptr [rdx], rcx
0x1001a7c5c: mov qword ptr [rcx + 0x10], rdx
0x1001a7c60: mov rax, qword ptr [rdx + 0x10]
0x1001a7c64: jmp 0x1001a7cde ; 0x1001a7cde
0x1001a7c66: mov rdx, qword ptr [rsi + 8]
0x1001a7c6a: mov qword ptr [rcx], rdx
0x1001a7c6d: test rdx, rdx
0x1001a7c70: je 0x1001a7c7a
0x1001a7c72: mov qword ptr [rdx + 0x10], rcx
0x1001a7c76: mov rax, qword ptr [rcx + 0x10]
0x1001a7c7a: mov qword ptr [rsi + 0x10], rax
0x1001a7c7e: mov rax, qword ptr [rcx + 0x10]
0x1001a7c82: lea rdx, [rax + 8]
0x1001a7c86: cmp qword ptr [rax], rcx
0x1001a7c89: cmove rdx, rax
0x1001a7c8d: mov qword ptr [rdx], rsi
0x1001a7c90: mov qword ptr [rsi + 8], rcx
0x1001a7c94: mov qword ptr [rcx + 0x10], rsi
0x1001a7c98: mov rax, qword ptr [rsi + 0x10]
0x1001a7c9c: mov byte ptr [rsi + 0x18], 1
0x1001a7ca0: mov byte ptr [rax + 0x18], 0
0x1001a7ca4: mov rcx, qword ptr [rax + 8]
0x1001a7ca8: mov rdx, qword ptr [rcx]
0x1001a7cab: mov qword ptr [rax + 8], rdx
0x1001a7caf: test rdx, rdx
0x1001a7cb2: je 0x1001a7cb8
0x1001a7cb4: mov qword ptr [rdx + 0x10], rax
0x1001a7cb8: mov rdx, qword ptr [rax + 0x10]
0x1001a7cbc: mov qword ptr [rcx + 0x10], rdx
0x1001a7cc0: mov rdx, qword ptr [rax + 0x10]
0x1001a7cc4: lea rsi, [rdx + 8]
0x1001a7cc8: cmp qword ptr [rdx], rax
0x1001a7ccb: cmove rsi, rdx
0x1001a7ccf: mov qword ptr [rsi], rcx
0x1001a7cd2: mov qword ptr [rcx], rax
0x1001a7cd5: mov qword ptr [rax + 0x10], rcx
0x1001a7cd9: pop rbp
0x1001a7cda: ret 
0x1001a7cdb: mov rdx, rcx
0x1001a7cde: mov byte ptr [rdx + 0x18], 1
0x1001a7ce2: mov byte ptr [rax + 0x18], 0
0x1001a7ce6: mov rcx, qword ptr [rax]
0x1001a7ce9: mov rdx, qword ptr [rcx + 8]
0x1001a7ced: mov qword ptr [rax], rdx
0x1001a7cf0: test rdx, rdx
0x1001a7cf3: je 0x1001a7cf9
0x1001a7cf5: mov qword ptr [rdx + 0x10], rax
0x1001a7cf9: mov rdx, qword ptr [rax + 0x10]
0x1001a7cfd: mov qword ptr [rcx + 0x10], rdx
0x1001a7d01: mov rdx, qword ptr [rax + 0x10]
0x1001a7d05: lea rsi, [rdx + 8]
0x1001a7d09: cmp qword ptr [rdx], rax
0x1001a7d0c: cmove rsi, rdx
0x1001a7d10: mov qword ptr [rsi], rcx
0x1001a7d13: mov qword ptr [rcx + 8], rax
0x1001a7d17: mov qword ptr [rax + 0x10], rcx
0x1001a7d1b: pop rbp
0x1001a7d1c: ret 
0x1001a7d1d: nop dword ptr [rax]
