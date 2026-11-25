0x1003a1470: push rbp
0x1003a1471: mov rbp, rsp
0x1003a1474: push r14
0x1003a1476: push rbx
0x1003a1477: sub rsp, 0x10
0x1003a147b: mov r14, rcx
0x1003a147e: mov rax, rdx
0x1003a1481: mov rcx, rsi
0x1003a1484: mov qword ptr [rbp - 0x18], 0
0x1003a148c: mov rbx, qword ptr [rdi]
0x1003a148f: lea rsi, [rbp - 0x18]
0x1003a1493: mov rdx, rcx
0x1003a1496: mov rcx, rax
0x1003a1499: call qword ptr [rbx + 0x40]
0x1003a149c: mov rax, qword ptr [rbp - 0x18]
0x1003a14a0: test rax, rax
0x1003a14a3: je 0x1003a14b1
0x1003a14a5: add rax, r14
0x1003a14a8: add rsp, 0x10
0x1003a14ac: pop rbx
0x1003a14ad: pop r14
0x1003a14af: pop rbp
0x1003a14b0: ret 
0x1003a14b1: lea rdi, [rip + 0x801c04] ; 0x100ba30bc t
0x1003a14b8: lea rsi, [rip + 0x7bc119] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1003a14bf: mov edx, 0x3a9
0x1003a14c4: mov ecx, 3
0x1003a14c9: call 0x1007e5f70 ; 0x1007e5f70
0x1003a14ce: ud2 
