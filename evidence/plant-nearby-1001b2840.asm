0x1001b2840: push rbp
0x1001b2841: mov rbp, rsp
0x1001b2844: push rbx
0x1001b2845: push rax
0x1001b2846: mov rbx, rdi
0x1001b2849: call 0x1007abbf0 ; 0x1007abbf0
0x1001b284e: mov qword ptr [rbx], rax
0x1001b2851: mov al, byte ptr [rip + 0xad9349] ; 0x100c8bba0
0x1001b2857: test al, al
0x1001b2859: jne 0x1001b2883
0x1001b285b: lea rdi, [rip + 0xad933e] ; 0x100c8bba0
0x1001b2862: call 0x100aa24e0 ; 0x100aa24e0 ___cxa_guard_acquire
0x1001b2867: test eax, eax
0x1001b2869: je 0x1001b2883
0x1001b286b: call 0x100375c20 ; 0x100375c20
0x1001b2870: mov qword ptr [rip + 0xad9321], rax ; 0x100c8bb98
0x1001b2877: lea rdi, [rip + 0xad9322] ; 0x100c8bba0
0x1001b287e: call 0x100aa24e6 ; 0x100aa24e6 ___cxa_guard_release
0x1001b2883: lea rax, [rip + 0xad930e] ; 0x100c8bb98
0x1001b288a: mov qword ptr [rbx + 8], rax
0x1001b288e: mov dword ptr [rbx + 0x10], 1
0x1001b2895: add rsp, 8
0x1001b2899: pop rbx
0x1001b289a: pop rbp
0x1001b289b: ret 
0x1001b289c: mov rbx, rax
0x1001b289f: lea rdi, [rip + 0xad92fa] ; 0x100c8bba0
0x1001b28a6: call 0x100aa24da ; 0x100aa24da ___cxa_guard_abort
0x1001b28ab: mov rdi, rbx
0x1001b28ae: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001b28b3: nop word ptr cs:[rax + rax]
