0x1000962f0: push rbp
0x1000962f1: mov rbp, rsp
0x1000962f4: push rbx
0x1000962f5: push rax
0x1000962f6: mov r9, rdi
0x1000962f9: movabs r10, 0xcbf29ce484222325
0x100096303: movabs r8, 0x100000001b3
0x10009630d: mov r11b, byte ptr [r9]
0x100096310: mov rcx, r10
0x100096313: test r11b, r11b
0x100096316: je 0x10009633a
0x100096318: lea rdi, [r9 + 1]
0x10009631c: mov rax, r10
0x10009631f: nop 
0x100096320: movsx rcx, r11b
0x100096324: xor rcx, rax
0x100096327: imul rcx, r8
0x10009632b: movzx r11d, byte ptr [rdi]
0x10009632f: inc rdi
0x100096332: mov rax, rcx
0x100096335: test r11b, r11b
0x100096338: jne 0x100096320
0x10009633a: test rdx, rdx
0x10009633d: je 0x10009636c
0x10009633f: mov r11b, byte ptr [rdx]
0x100096342: test r11b, r11b
0x100096345: je 0x100096370
0x100096347: lea rax, [rdx + 1]
0x10009634b: nop dword ptr [rax + rax]
0x100096350: movsx rdi, r11b
0x100096354: xor rdi, r10
0x100096357: imul rdi, r8
0x10009635b: movzx r11d, byte ptr [rax]
0x10009635f: inc rax
0x100096362: mov r10, rdi
0x100096365: test r11b, r11b
0x100096368: jne 0x100096350
0x10009636a: jmp 0x100096373 ; 0x100096373
0x10009636c: xor edi, edi
0x10009636e: jmp 0x100096373 ; 0x100096373
0x100096370: mov rdi, r10
0x100096373: lea r8, [rip + 0x1d39bb6] ; 0x101dcff30
0x10009637a: movsxd r10, dword ptr [r8]
0x10009637d: mov eax, 0xffffffff
0x100096382: test r10, r10
0x100096385: jle 0x1000963b1
0x100096387: xor r11d, r11d
0x10009638a: nop word ptr [rax + rax]
0x100096390: mov rbx, qword ptr [r8 + r11*8 + 8]
0x100096395: cmp qword ptr [rbx + 8], rcx
0x100096399: jne 0x1000963a9
0x10009639b: mov rbx, qword ptr [rbx + 0x10]
0x10009639f: test rbx, rbx
0x1000963a2: je 0x1000963c2
0x1000963a4: cmp rbx, rdi
0x1000963a7: je 0x1000963c2
0x1000963a9: inc r11
0x1000963ac: cmp r11, r10
0x1000963af: jl 0x100096390
0x1000963b1: cmp eax, -1
0x1000963b4: jne 0x1000963bb
0x1000963b6: test sil, sil
0x1000963b9: jne 0x1000963cc
0x1000963bb: add rsp, 8
0x1000963bf: pop rbx
0x1000963c0: pop rbp
0x1000963c1: ret 
0x1000963c2: mov eax, r11d
0x1000963c5: cmp eax, -1
0x1000963c8: je 0x1000963b6
0x1000963ca: jmp 0x1000963bb ; 0x1000963bb
0x1000963cc: test rdx, rdx
0x1000963cf: lea rax, [rip + 0xac86c1] ; 0x100b5ea97 null
0x1000963d6: cmovne rax, rdx
0x1000963da: mov qword ptr [rsp], rax
0x1000963de: lea rdi, [rip + 0xacf70f] ; 0x100b65af4 id != -1
0x1000963e5: lea rsi, [rip + 0xacf208] ; 0x100b655f4 AnimationInstance.cpp
0x1000963ec: lea r8, [rip + 0xacf70a] ; 0x100b65afd Animation Sequence %s not found in %s.
0x1000963f3: mov edx, 0x2d2
0x1000963f8: mov ecx, 4
0x1000963fd: xor eax, eax
0x1000963ff: call 0x1007e6030 ; 0x1007e6030
0x100096404: ud2 
0x100096406: nop word ptr cs:[rax + rax]
