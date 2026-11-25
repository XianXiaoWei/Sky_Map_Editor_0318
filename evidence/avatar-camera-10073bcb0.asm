0x10073bcb0: push rbp
0x10073bcb1: mov rbp, rsp
0x10073bcb4: push r15
0x10073bcb6: push r14
0x10073bcb8: push rbx
0x10073bcb9: sub rsp, 0x88
0x10073bcc0: mov r14, rsi
0x10073bcc3: mov r15, rdi
0x10073bcc6: test r14, r14
0x10073bcc9: je 0x10073bdf9
0x10073bccf: test r15, r15
0x10073bcd2: je 0x10073bdda
0x10073bcd8: mov rbx, qword ptr [r14 + 0x190]
0x10073bcdf: test rbx, rbx
0x10073bce2: je 0x10073bdda
0x10073bce8: lea rsi, [r15 + 0x10]
0x10073bcec: lea rdx, [rbp - 0xa0]
0x10073bcf3: mov rdi, r15
0x10073bcf6: call 0x10078c950 ; 0x10078c950
0x10073bcfb: cmp byte ptr [rip + 0x1902876], 0 ; 0x10203e578
0x10073bd02: je 0x10073bd24
0x10073bd04: call 0x1002b9810 ; 0x1002b9810
0x10073bd09: lea rdx, [rip + 0x19039a0] ; 0x10203f6b0
0x10073bd10: lea rsi, [rbp - 0xa0]
0x10073bd17: mov ecx, 1
0x10073bd1c: mov rdi, rax
0x10073bd1f: call 0x1002bc290 ; 0x1002bc290
0x10073bd24: add rbx, 0x1c0
0x10073bd2b: lea rdi, [rbp - 0x60]
0x10073bd2f: lea rdx, [rbp - 0xa0]
0x10073bd36: mov rsi, rbx
0x10073bd39: call 0x100076df0 ; 0x100076df0
0x10073bd3e: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10073bd43: vbroadcastss xmm1, dword ptr [rbp - 0x24]
0x10073bd49: vmulps xmm0, xmm0, xmm0
0x10073bd4d: vpermilpd xmm2, xmm0, 1
0x10073bd53: vaddps xmm0, xmm0, xmm2
0x10073bd57: vmovshdup xmm2, xmm0
0x10073bd5b: vaddss xmm0, xmm0, xmm2
0x10073bd5f: vsqrtss xmm0, xmm0, xmm0
0x10073bd63: vaddss xmm0, xmm0, xmm0
0x10073bd67: vmaxss xmm1, xmm1, dword ptr [rip + 0x36c845] ; 0x100aa85b4
0x10073bd6f: vdivss xmm0, xmm0, xmm1
0x10073bd73: vmovss xmm1, dword ptr [rip + 0x369345] ; 0x100aa50c0
0x10073bd7b: vucomiss xmm1, xmm0
0x10073bd7f: jbe 0x10073bda9
0x10073bd81: vmovss xmm1, dword ptr [r14 + 0x188]
0x10073bd8a: vmovss xmm2, dword ptr [rip + 0x36d432] ; 0x100aa91c4
0x10073bd92: vucomiss xmm2, xmm1
0x10073bd96: jbe 0x10073bda9
0x10073bd98: vmulss xmm1, xmm1, dword ptr [rip + 0x36bf20] ; 0x100aa7cc0
0x10073bda0: vucomiss xmm1, xmm0
0x10073bda4: seta cl
0x10073bda7: jmp 0x10073bdab ; 0x10073bdab
0x10073bda9: xor ecx, ecx
0x10073bdab: mov rdx, qword ptr [r15 + 0x1d0]
0x10073bdb2: test rdx, rdx
0x10073bdb5: setne al
0x10073bdb8: or al, cl
0x10073bdba: test cl, cl
0x10073bdbc: jne 0x10073bdca
0x10073bdbe: test rdx, rdx
0x10073bdc1: je 0x10073bdca
0x10073bdc3: cmp byte ptr [rdx + 0xd], 0
0x10073bdc7: sete al
0x10073bdca: xor al, 1
0x10073bdcc: add rsp, 0x88
0x10073bdd3: pop rbx
0x10073bdd4: pop r14
0x10073bdd6: pop r15
0x10073bdd8: pop rbp
0x10073bdd9: ret 
0x10073bdda: lea rdi, [rip + 0x461764] ; 0x100b9d545 inst && camera
0x10073bde1: lea rsi, [rip + 0x461586] ; 0x100b9d36e WhiskerCamera.cpp
0x10073bde8: mov edx, 0x89
0x10073bded: mov ecx, 3
0x10073bdf2: call 0x1007e5f70 ; 0x1007e5f70
0x10073bdf7: ud2 
0x10073bdf9: lea rdi, [rip + 0x461754] ; 0x100b9d554 cam
0x10073be00: lea rsi, [rip + 0x461567] ; 0x100b9d36e WhiskerCamera.cpp
0x10073be07: mov edx, 0xa8
0x10073be0c: mov ecx, 3
0x10073be11: call 0x1007e5f70 ; 0x1007e5f70
0x10073be16: ud2 
0x10073be18: nop dword ptr [rax + rax]
