0x1001b2000: push rbp
0x1001b2001: mov rbp, rsp
0x1001b2004: push rbx
0x1001b2005: sub rsp, 0x48
0x1001b2009: mov rbx, rdi
0x1001b200c: call 0x1007abbf0 ; 0x1007abbf0
0x1001b2011: mov qword ptr [rbx], rax
0x1001b2014: mov al, byte ptr [rip + 0xad9a46] ; 0x100c8ba60
0x1001b201a: test al, al
0x1001b201c: jne 0x1001b204a
0x1001b201e: lea rdi, [rip + 0xad9a3b] ; 0x100c8ba60
0x1001b2025: call 0x100aa24e0 ; 0x100aa24e0 ___cxa_guard_acquire
0x1001b202a: test eax, eax
0x1001b202c: je 0x1001b204a
0x1001b202e: lea rdi, [rbp - 0x50]
0x1001b2032: call 0x1007fa3b0 ; 0x1007fa3b0
0x1001b2037: mov qword ptr [rip + 0xad9a1a], rax ; 0x100c8ba58
0x1001b203e: lea rdi, [rip + 0xad9a1b] ; 0x100c8ba60
0x1001b2045: call 0x100aa24e6 ; 0x100aa24e6 ___cxa_guard_release
0x1001b204a: lea rax, [rip + 0xad9a07] ; 0x100c8ba58
0x1001b2051: mov qword ptr [rbx + 8], rax
0x1001b2055: mov dword ptr [rbx + 0x10], 1
0x1001b205c: add rsp, 0x48
0x1001b2060: pop rbx
0x1001b2061: pop rbp
0x1001b2062: ret 
0x1001b2063: mov rbx, rax
0x1001b2066: lea rdi, [rip + 0xad99f3] ; 0x100c8ba60
0x1001b206d: call 0x100aa24da ; 0x100aa24da ___cxa_guard_abort
0x1001b2072: mov rdi, rbx
0x1001b2075: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001b207a: nop word ptr [rax + rax]
