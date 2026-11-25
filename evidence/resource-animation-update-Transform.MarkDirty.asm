0x1007f2740: push rbp
0x1007f2741: mov rbp, rsp
0x1007f2744: push rbx
0x1007f2745: push rax
0x1007f2746: cmp byte ptr [rdi + 0xe0], 0
0x1007f274d: jne 0x1007f2784
0x1007f274f: mov byte ptr [rdi + 0xe0], 1
0x1007f2756: mov rbx, qword ptr [rdi + 0xd8]
0x1007f275d: test rbx, rbx
0x1007f2760: je 0x1007f2784
0x1007f2762: nop word ptr cs:[rax + rax]
0x1007f2770: mov rdi, rbx
0x1007f2773: call 0x1007f2740 ; 0x1007f2740
0x1007f2778: mov rbx, qword ptr [rbx + 0xd0]
0x1007f277f: test rbx, rbx
0x1007f2782: jne 0x1007f2770
0x1007f2784: add rsp, 8
0x1007f2788: pop rbx
0x1007f2789: pop rbp
0x1007f278a: ret 
0x1007f278b: nop dword ptr [rax + rax]
