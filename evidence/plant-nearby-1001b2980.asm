0x1001b2980: push rbp
0x1001b2981: mov rbp, rsp
0x1001b2984: push rbx
0x1001b2985: push rax
0x1001b2986: mov rbx, rdi
0x1001b2989: mov rax, qword ptr [rip + 0x1c28470] ; 0x101ddae00
0x1001b2990: mov qword ptr [rbx], rax
0x1001b2993: mov al, byte ptr [rip + 0xad9217] ; 0x100c8bbb0
0x1001b2999: test al, al
0x1001b299b: jne 0x1001b29c5
0x1001b299d: lea rdi, [rip + 0xad920c] ; 0x100c8bbb0
0x1001b29a4: call 0x100aa24e0 ; 0x100aa24e0 ___cxa_guard_acquire
0x1001b29a9: test eax, eax
0x1001b29ab: je 0x1001b29c5
0x1001b29ad: call 0x1007abc30 ; 0x1007abc30
0x1001b29b2: mov qword ptr [rip + 0xad91ef], rax ; 0x100c8bba8
0x1001b29b9: lea rdi, [rip + 0xad91f0] ; 0x100c8bbb0
0x1001b29c0: call 0x100aa24e6 ; 0x100aa24e6 ___cxa_guard_release
0x1001b29c5: lea rax, [rip + 0xad91dc] ; 0x100c8bba8
0x1001b29cc: mov qword ptr [rbx + 8], rax
0x1001b29d0: mov dword ptr [rbx + 0x10], 1
0x1001b29d7: add rsp, 8
0x1001b29db: pop rbx
0x1001b29dc: pop rbp
0x1001b29dd: ret 
0x1001b29de: mov rbx, rax
0x1001b29e1: lea rdi, [rip + 0xad91c8] ; 0x100c8bbb0
0x1001b29e8: call 0x100aa24da ; 0x100aa24da ___cxa_guard_abort
0x1001b29ed: mov rdi, rbx
0x1001b29f0: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001b29f5: nop word ptr cs:[rax + rax]
