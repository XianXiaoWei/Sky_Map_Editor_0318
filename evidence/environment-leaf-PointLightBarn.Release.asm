0x100540a90: push rbp
0x100540a91: mov rbp, rsp
0x100540a94: test rsi, rsi
0x100540a97: je 0x100540ab4
0x100540a99: cmp byte ptr [rsi + 0x50], 0
0x100540a9d: je 0x100540ab4
0x100540a9f: mov byte ptr [rsi + 0x50], 0
0x100540aa3: mov rax, qword ptr [rdi + 0x6010]
0x100540aaa: mov qword ptr [rsi], rax
0x100540aad: mov qword ptr [rdi + 0x6010], rsi
0x100540ab4: pop rbp
0x100540ab5: ret 
0x100540ab6: nop word ptr cs:[rax + rax]
