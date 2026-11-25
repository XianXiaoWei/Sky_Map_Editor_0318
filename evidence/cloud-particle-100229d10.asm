0x100229d10: push rbp
0x100229d11: mov rbp, rsp
0x100229d14: push rbx
0x100229d15: movzx r10d, word ptr [rsi]
0x100229d19: movzx r11d, word ptr [rdi]
0x100229d1d: mov r9, qword ptr [r9]
0x100229d20: vmovss xmm1, dword ptr [r9 + r10*4]
0x100229d26: vmovss xmm0, dword ptr [r9 + r11*4]
0x100229d2c: vucomiss xmm0, xmm1
0x100229d30: movzx ebx, word ptr [rdx]
0x100229d33: vmovss xmm2, dword ptr [r9 + rbx*4]
0x100229d39: jbe 0x100229d4f
0x100229d3b: vucomiss xmm1, xmm2
0x100229d3f: jbe 0x100229d8a
0x100229d41: mov word ptr [rdi], bx
0x100229d44: mov word ptr [rdx], r11w
0x100229d48: mov eax, 1
0x100229d4d: jmp 0x100229db0 ; 0x100229db0
0x100229d4f: xor eax, eax
0x100229d51: vucomiss xmm1, xmm2
0x100229d55: jbe 0x100229db6
0x100229d57: mov word ptr [rsi], bx
0x100229d5a: mov word ptr [rdx], r10w
0x100229d5e: movzx r11d, word ptr [rsi]
0x100229d62: movzx ebx, word ptr [rdi]
0x100229d65: vmovss xmm0, dword ptr [r9 + rbx*4]
0x100229d6b: mov eax, 1
0x100229d70: vucomiss xmm0, dword ptr [r9 + r11*4]
0x100229d76: jbe 0x100229dba
0x100229d78: mov word ptr [rdi], r11w
0x100229d7c: mov word ptr [rsi], bx
0x100229d7f: mov r10w, word ptr [rdx]
0x100229d83: mov eax, 2
0x100229d88: jmp 0x100229dba ; 0x100229dba
0x100229d8a: mov word ptr [rdi], r10w
0x100229d8e: mov word ptr [rsi], r11w
0x100229d92: movzx r10d, word ptr [rdx]
0x100229d96: mov eax, 1
0x100229d9b: vucomiss xmm0, dword ptr [r9 + r10*4]
0x100229da1: jbe 0x100229dba
0x100229da3: mov word ptr [rsi], r10w
0x100229da7: mov word ptr [rdx], r11w
0x100229dab: mov eax, 2
0x100229db0: mov r10w, r11w
0x100229db4: jmp 0x100229dba ; 0x100229dba
0x100229db6: mov r10w, bx
0x100229dba: movzx r11d, word ptr [rcx]
0x100229dbe: movzx ebx, r10w
0x100229dc2: vmovss xmm0, dword ptr [r9 + rbx*4]
0x100229dc8: vucomiss xmm0, dword ptr [r9 + r11*4]
0x100229dce: jbe 0x100229e1c
0x100229dd0: mov word ptr [rdx], r11w
0x100229dd4: mov word ptr [rcx], r10w
0x100229dd8: movzx r10d, word ptr [rdx]
0x100229ddc: movzx ebx, word ptr [rsi]
0x100229ddf: vmovss xmm0, dword ptr [r9 + rbx*4]
0x100229de5: vucomiss xmm0, dword ptr [r9 + r10*4]
0x100229deb: jbe 0x100229e15
0x100229ded: mov word ptr [rsi], r10w
0x100229df1: mov word ptr [rdx], bx
0x100229df4: movzx r10d, word ptr [rsi]
0x100229df8: movzx ebx, word ptr [rdi]
0x100229dfb: vmovss xmm0, dword ptr [r9 + rbx*4]
0x100229e01: vucomiss xmm0, dword ptr [r9 + r10*4]
0x100229e07: jbe 0x100229e19
0x100229e09: mov word ptr [rdi], r10w
0x100229e0d: mov word ptr [rsi], bx
0x100229e10: add eax, 3
0x100229e13: jmp 0x100229e1c ; 0x100229e1c
0x100229e15: inc eax
0x100229e17: jmp 0x100229e1c ; 0x100229e1c
0x100229e19: add eax, 2
0x100229e1c: movzx r10d, word ptr [r8]
0x100229e20: movzx ebx, word ptr [rcx]
0x100229e23: vmovss xmm0, dword ptr [r9 + rbx*4]
0x100229e29: vucomiss xmm0, dword ptr [r9 + r10*4]
0x100229e2f: jbe 0x100229e8c
0x100229e31: mov word ptr [rcx], r10w
0x100229e35: mov word ptr [r8], bx
0x100229e39: movzx r8d, word ptr [rcx]
0x100229e3d: movzx ebx, word ptr [rdx]
0x100229e40: vmovss xmm0, dword ptr [r9 + rbx*4]
0x100229e46: vucomiss xmm0, dword ptr [r9 + r8*4]
0x100229e4c: jbe 0x100229e8f
0x100229e4e: mov word ptr [rdx], r8w
0x100229e52: mov word ptr [rcx], bx
0x100229e55: movzx ecx, word ptr [rdx]
0x100229e58: movzx ebx, word ptr [rsi]
0x100229e5b: vmovss xmm0, dword ptr [r9 + rbx*4]
0x100229e61: vucomiss xmm0, dword ptr [r9 + rcx*4]
0x100229e67: jbe 0x100229e94
0x100229e69: mov word ptr [rsi], cx
0x100229e6c: mov word ptr [rdx], bx
0x100229e6f: movzx ecx, word ptr [rsi]
0x100229e72: movzx edx, word ptr [rdi]
0x100229e75: vmovss xmm0, dword ptr [r9 + rdx*4]
0x100229e7b: vucomiss xmm0, dword ptr [r9 + rcx*4]
0x100229e81: jbe 0x100229e9a
0x100229e83: mov word ptr [rdi], cx
0x100229e86: mov word ptr [rsi], dx
0x100229e89: add eax, 4
0x100229e8c: pop rbx
0x100229e8d: pop rbp
0x100229e8e: ret 
0x100229e8f: inc eax
0x100229e91: pop rbx
0x100229e92: pop rbp
0x100229e93: ret 
0x100229e94: add eax, 2
0x100229e97: pop rbx
0x100229e98: pop rbp
0x100229e99: ret 
0x100229e9a: add eax, 3
0x100229e9d: pop rbx
0x100229e9e: pop rbp
0x100229e9f: ret 
