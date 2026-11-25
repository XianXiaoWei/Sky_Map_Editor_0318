0x10019ff50: push rbp
0x10019ff51: mov rbp, rsp
0x10019ff54: push r14
0x10019ff56: push rbx
0x10019ff57: sub rsp, 0x10
0x10019ff5b: mov rbx, rdi
0x10019ff5e: mov qword ptr [rbx + 0x10], rsi
0x10019ff62: mov qword ptr [rbx + 0x18], 0
0x10019ff6a: mov word ptr [rbx + 0x20], 0
0x10019ff70: mov qword ptr [rbx + 0x24], 0
0x10019ff78: lea rdi, [rbx + 0x90]
0x10019ff7f: mov rcx, qword ptr [rdx + 0x138]
0x10019ff86: mov rsi, qword ptr [rdx + 0x220]
0x10019ff8d: mov rdx, qword ptr [rdx + 0x398]
0x10019ff94: call 0x10062e5b0 ; 0x10062e5b0
0x10019ff99: vxorps xmm0, xmm0, xmm0
0x10019ff9d: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x10019ffa2: mov qword ptr [rbx + 0x40], 0
0x10019ffaa: mov byte ptr [rbx + 0x48], 0
0x10019ffae: vmovups xmmword ptr [rbx + 0x58], xmm0
0x10019ffb3: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x10019ffb8: mov dword ptr [rbx + 0x80], 0
0x10019ffc2: mov rax, qword ptr [rbx + 8]
0x10019ffc6: mov rcx, qword ptr [rax + 0x30]
0x10019ffca: test rcx, rcx
0x10019ffcd: je 0x1001a0019
0x10019ffcf: cmp dword ptr [rcx + 0x10], 0
0x10019ffd3: je 0x1001a0019
0x10019ffd5: mov rax, qword ptr [rcx + 8]
0x10019ffd9: mov rax, qword ptr [rax]
0x10019ffdc: mov qword ptr [rbp - 0x20], rax
0x10019ffe0: call 0x1007abc10 ; 0x1007abc10
0x10019ffe5: mov r14, rax
0x10019ffe8: mov qword ptr [rbp - 0x18], 0
0x10019fff0: call 0x10043ccc0 ; 0x10043ccc0
0x10019fff5: mov r8, qword ptr [rax]
0x10019fff8: lea rsi, [rbp - 0x18]
0x10019fffc: lea rdx, [rbp - 0x20]
0x1001a0000: mov rdi, rax
0x1001a0003: mov rcx, r14
0x1001a0006: call qword ptr [r8 + 0x40]
0x1001a000a: mov rcx, qword ptr [rbp - 0x18]
0x1001a000e: test rcx, rcx
0x1001a0011: je 0x1001a0034
0x1001a0013: mov rax, qword ptr [rbx + 8]
0x1001a0017: jmp 0x1001a001b ; 0x1001a001b
0x1001a0019: xor ecx, ecx
0x1001a001b: mov qword ptr [rbx + 0x50], rcx
0x1001a001f: mov al, byte ptr [rax + 0x88]
0x1001a0025: mov byte ptr [rbx + 0x84], al
0x1001a002b: add rsp, 0x10
0x1001a002f: pop rbx
0x1001a0030: pop r14
0x1001a0032: pop rbp
0x1001a0033: ret 
0x1001a0034: lea rdi, [rip + 0x9c1abd] ; 0x100b61af8 ret
0x1001a003b: lea rsi, [rip + 0x9c1921] ; 0x100b61963 ./Clump.h
0x1001a0042: mov edx, 0x47
0x1001a0047: mov ecx, 3
0x1001a004c: call 0x1007e5f70 ; 0x1007e5f70
0x1001a0051: ud2 
0x1001a0053: nop word ptr cs:[rax + rax]
