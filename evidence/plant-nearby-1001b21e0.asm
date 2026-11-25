0x1001b21e0: push rbp
0x1001b21e1: mov rbp, rsp
0x1001b21e4: push rbx
0x1001b21e5: push rax
0x1001b21e6: mov rbx, rdi
0x1001b21e9: call 0x1007abbf0 ; 0x1007abbf0
0x1001b21ee: mov qword ptr [rbx], rax
0x1001b21f1: mov al, byte ptr [rip + 0xad9879] ; 0x100c8ba70
0x1001b21f7: test al, al
0x1001b21f9: jne 0x1001b222b
0x1001b21fb: lea rdi, [rip + 0xad986e] ; 0x100c8ba70
0x1001b2202: call 0x100aa24e0 ; 0x100aa24e0 ___cxa_guard_acquire
0x1001b2207: test eax, eax
0x1001b2209: je 0x1001b222b
0x1001b220b: mov byte ptr [rbp - 9], 0
0x1001b220f: lea rdi, [rbp - 9]
0x1001b2213: call 0x1007abbd0 ; 0x1007abbd0
0x1001b2218: mov qword ptr [rip + 0xad9849], rax ; 0x100c8ba68
0x1001b221f: lea rdi, [rip + 0xad984a] ; 0x100c8ba70
0x1001b2226: call 0x100aa24e6 ; 0x100aa24e6 ___cxa_guard_release
0x1001b222b: lea rax, [rip + 0xad9836] ; 0x100c8ba68
0x1001b2232: mov qword ptr [rbx + 8], rax
0x1001b2236: mov dword ptr [rbx + 0x10], 1
0x1001b223d: add rsp, 8
0x1001b2241: pop rbx
0x1001b2242: pop rbp
0x1001b2243: ret 
0x1001b2244: mov rbx, rax
0x1001b2247: lea rdi, [rip + 0xad9822] ; 0x100c8ba70
0x1001b224e: call 0x100aa24da ; 0x100aa24da ___cxa_guard_abort
0x1001b2253: mov rdi, rbx
0x1001b2256: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001b225b: nop dword ptr [rax + rax]
