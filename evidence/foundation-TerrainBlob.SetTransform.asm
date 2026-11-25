0x1006ae960: push rbp
0x1006ae961: mov rbp, rsp
0x1006ae964: push r14
0x1006ae966: push rbx
0x1006ae967: sub rsp, 0x40
0x1006ae96b: mov rbx, rdi
0x1006ae96e: lea rax, [rbx + 0x10]
0x1006ae972: vmovaps xmm0, xmmword ptr [rsi]
0x1006ae976: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x1006ae97b: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x1006ae980: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1006ae985: vmovaps xmm0, xmmword ptr [rsi + 0x20]
0x1006ae98a: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1006ae98f: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x1006ae994: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1006ae999: lea rdx, [rbx + 0x210]
0x1006ae9a0: lea r14, [rbp - 0x50]
0x1006ae9a4: mov rdi, r14
0x1006ae9a7: mov rsi, rax
0x1006ae9aa: call 0x100076df0 ; 0x100076df0
0x1006ae9af: lea rsi, [rbx + 0x250]
0x1006ae9b6: lea rdx, [rbx + 0x260]
0x1006ae9bd: mov rdi, r14
0x1006ae9c0: call 0x10078c720 ; 0x10078c720
0x1006ae9c5: add rsp, 0x40
0x1006ae9c9: pop rbx
0x1006ae9ca: pop r14
0x1006ae9cc: pop rbp
0x1006ae9cd: ret 
0x1006ae9ce: nop 
