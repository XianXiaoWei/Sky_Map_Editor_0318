0x100388360: push rbp
0x100388361: mov rbp, rsp
0x100388364: push r15
0x100388366: push r14
0x100388368: push r12
0x10038836a: push rbx
0x10038836b: sub rsp, 0x10
0x10038836f: mov r15, r9
0x100388372: mov rbx, rdx
0x100388375: mov r12, rsi
0x100388378: mov r14, rdi
0x10038837b: cmp dword ptr [rbp + 0x10], 1
0x10038837f: jne 0x1003883d6
0x100388381: call 0x1007abbf0 ; 0x1007abbf0
0x100388386: add rbx, r12
0x100388389: test r14b, 1
0x10038838d: je 0x100388397
0x10038838f: mov rax, qword ptr [rbx]
0x100388392: mov r14, qword ptr [rax + r14 - 1]
0x100388397: mov r12, qword ptr [r15]
0x10038839a: mov r15, qword ptr [r15 + 8]
0x10038839e: mov qword ptr [rbp - 0x28], 0
0x1003883a6: call 0x1004a25a0 ; 0x1004a25a0
0x1003883ab: mov r8, qword ptr [rax]
0x1003883ae: lea rsi, [rbp - 0x28]
0x1003883b2: mov rdi, rax
0x1003883b5: mov rdx, r12
0x1003883b8: mov rcx, r15
0x1003883bb: call qword ptr [r8 + 0x40]
0x1003883bf: mov rsi, qword ptr [rbp - 0x28]
0x1003883c3: mov rdi, rbx
0x1003883c6: call r14
0x1003883c9: add rsp, 0x10
0x1003883cd: pop rbx
0x1003883ce: pop r12
0x1003883d0: pop r14
0x1003883d2: pop r15
0x1003883d4: pop rbp
0x1003883d5: ret 
0x1003883d6: lea rdi, [rip + 0x7d5223] ; 0x100b5d600 1 == argCount
0x1003883dd: lea rsi, [rip + 0x7d51f4] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1003883e4: mov edx, 0x23d
0x1003883e9: mov ecx, 3
0x1003883ee: call 0x1007e5f70 ; 0x1007e5f70
0x1003883f3: ud2 
0x1003883f5: nop word ptr cs:[rax + rax]
