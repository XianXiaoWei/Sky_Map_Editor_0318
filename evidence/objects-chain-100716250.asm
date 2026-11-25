0x100716250: push rbp
0x100716251: mov rbp, rsp
0x100716254: push r15
0x100716256: push r14
0x100716258: push r13
0x10071625a: push r12
0x10071625c: push rbx
0x10071625d: sub rsp, 0x18
0x100716261: mov r14, rsi
0x100716264: mov rbx, rdi
0x100716267: mov r13, qword ptr [rbx + 0x290]
0x10071626e: test r13, r13
0x100716271: je 0x10071631b
0x100716277: mov rax, qword ptr [r13]
0x10071627b: mov qword ptr [rbx + 0x290], rax
0x100716282: mov qword ptr [r13], 0
0x10071628a: add rbx, 0x298
0x100716291: mov rax, qword ptr [r14]
0x100716294: mov rdi, r14
0x100716297: call qword ptr [rax + 0xa0]
0x10071629d: mov r15, rax
0x1007162a0: mov r12, qword ptr [rip + 0x19249e1] ; 0x10203ac88
0x1007162a7: mov rax, qword ptr [r14]
0x1007162aa: mov rdi, r14
0x1007162ad: call qword ptr [rax + 0xa8]
0x1007162b3: mov rdi, rbx
0x1007162b6: mov rsi, r15
0x1007162b9: mov rdx, r12
0x1007162bc: mov rcx, rax
0x1007162bf: call 0x100795530 ; 0x100795530
0x1007162c4: mov rcx, qword ptr [r14]
0x1007162c7: mov rdi, r14
0x1007162ca: mov rsi, rax
0x1007162cd: call qword ptr [rcx + 0xc0]
0x1007162d3: mov qword ptr [rbp - 0x38], rax
0x1007162d7: mov qword ptr [rbp - 0x30], 0
0x1007162df: mov rdi, qword ptr [rip + 0x19246b2] ; 0x10203a998
0x1007162e6: mov rax, qword ptr [rdi]
0x1007162e9: lea rsi, [rbp - 0x30]
0x1007162ed: lea rdx, [rbp - 0x38]
0x1007162f1: mov rcx, r14
0x1007162f4: call qword ptr [rax + 0x40]
0x1007162f7: mov rax, qword ptr [rbp - 0x30]
0x1007162fb: mov qword ptr [r13], rax
0x1007162ff: test rax, rax
0x100716302: je 0x10071633a
0x100716304: mov qword ptr [rax + 8], r13
0x100716308: mov rax, qword ptr [r13]
0x10071630c: add rsp, 0x18
0x100716310: pop rbx
0x100716311: pop r12
0x100716313: pop r13
0x100716315: pop r14
0x100716317: pop r15
0x100716319: pop rbp
0x10071631a: ret 
0x10071631b: lea rdi, [rip + 0x447a37] ; 0x100b5dd59 value
0x100716322: lea rsi, [rip + 0x4862f8] ; 0x100b9c621 Value.cpp
0x100716329: mov edx, 0x4a
0x10071632e: mov ecx, 3
0x100716333: call 0x1007e5f70 ; 0x1007e5f70
0x100716338: ud2 
0x10071633a: lea rdi, [rip + 0x4862ea] ; 0x100b9c62b *value
0x100716341: lea rsi, [rip + 0x4862d9] ; 0x100b9c621 Value.cpp
0x100716348: mov edx, 0x4f
0x10071634d: mov ecx, 3
0x100716352: call 0x1007e5f70 ; 0x1007e5f70
0x100716357: ud2 
0x100716359: nop dword ptr [rax]
