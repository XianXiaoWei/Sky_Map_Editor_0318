0x100198510: push rbp
0x100198511: mov rbp, rsp
0x100198514: push rbx
0x100198515: push rax
0x100198516: lea rax, [rip + 0xa7a1b3] ; 0x100c126d0
0x10019851d: mov qword ptr [rdi], rax
0x100198520: test byte ptr [rdi + 0x58], 1
0x100198524: je 0x10019853a
0x100198526: mov rbx, qword ptr [rdi + 0x68]
0x10019852a: call 0x1007e50d0 ; 0x1007e50d0
0x10019852f: mov rdi, rax
0x100198532: mov rsi, rbx
0x100198535: call 0x1007e5db0 ; 0x1007e5db0
0x10019853a: add rsp, 8
0x10019853e: pop rbx
0x10019853f: pop rbp
0x100198540: ret 
0x100198541: mov rdi, rax
0x100198544: call 0x100011bf0 ; 0x100011bf0
0x100198549: nop dword ptr [rax]
