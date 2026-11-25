0x100241e30: movsxd r9, dword ptr [rsi]
0x100241e33: mov r8d, dword ptr [rip + 0xa5729a] ; 0x100c990d4
0x100241e3a: cmp r9d, r8d
0x100241e3d: jne 0x100241e62
0x100241e3f: vcvttss2si rax, dword ptr [rdi + 0x28]
0x100241e45: mov dword ptr [rdx], eax
0x100241e47: vcvttss2si rax, dword ptr [rdi + 0x2c]
0x100241e4d: mov dword ptr [rdx + 4], eax
0x100241e50: mov byte ptr [rdx + 0x1c], 1
0x100241e54: mov dword ptr [rdx + 8], 0x11
0x100241e5b: cmp r9d, r8d
0x100241e5e: sete al
0x100241e61: ret 
0x100241e62: imul rax, r9, 0xf8
0x100241e69: cmp dword ptr [rdi + rax + 0x1b800], 0
0x100241e71: je 0x100241f43
0x100241e77: mov ecx, dword ptr [rdi + rax + 0x1b818]
0x100241e7e: mov dword ptr [rdx], ecx
0x100241e80: mov ecx, dword ptr [rdi + rax + 0x1b81c]
0x100241e87: mov dword ptr [rdx + 4], ecx
0x100241e8a: mov r10b, byte ptr [rdi + rax + 0x1b834]
0x100241e92: mov byte ptr [rdx + 0x1c], r10b
0x100241e96: mov ecx, dword ptr [rdi + rax + 0x1b82c]
0x100241e9d: mov dword ptr [rdx + 8], ecx
0x100241ea0: mov al, byte ptr [rdi + rax + 0x1b804]
0x100241ea7: cmp al, r10b
0x100241eaa: jbe 0x100241eb2
0x100241eac: mov byte ptr [rdx + 0x1c], al
0x100241eaf: mov r10d, eax
0x100241eb2: movsxd rax, dword ptr [rsi + 0x20]
0x100241eb6: imul rax, rax, 0xf8
0x100241ebd: mov ecx, dword ptr [rdi + rax + 0x1b82c]
0x100241ec4: mov dword ptr [rdx + 0xc], ecx
0x100241ec7: mov al, byte ptr [rdi + rax + 0x1b804]
0x100241ece: cmp al, r10b
0x100241ed1: jbe 0x100241ed9
0x100241ed3: mov byte ptr [rdx + 0x1c], al
0x100241ed6: mov r10d, eax
0x100241ed9: movsxd rax, dword ptr [rsi + 0x40]
0x100241edd: imul rax, rax, 0xf8
0x100241ee4: mov ecx, dword ptr [rdi + rax + 0x1b82c]
0x100241eeb: mov dword ptr [rdx + 0x10], ecx
0x100241eee: mov al, byte ptr [rdi + rax + 0x1b804]
0x100241ef5: cmp al, r10b
0x100241ef8: jbe 0x100241f00
0x100241efa: mov byte ptr [rdx + 0x1c], al
0x100241efd: mov r10d, eax
0x100241f00: movsxd rax, dword ptr [rsi + 0x60]
0x100241f04: imul rax, rax, 0xf8
0x100241f0b: mov ecx, dword ptr [rdi + rax + 0x1b82c]
0x100241f12: mov dword ptr [rdx + 0x14], ecx
0x100241f15: mov al, byte ptr [rdi + rax + 0x1b804]
0x100241f1c: cmp al, r10b
0x100241f1f: jbe 0x100241f24
0x100241f21: mov byte ptr [rdx + 0x1c], al
0x100241f24: movsxd rax, dword ptr [rsi + 0x80]
0x100241f2b: imul rax, rax, 0xf8
0x100241f32: mov eax, dword ptr [rdi + rax + 0x1b82c]
0x100241f39: mov dword ptr [rdx + 0x18], eax
0x100241f3c: cmp r9d, r8d
0x100241f3f: sete al
0x100241f42: ret 
0x100241f43: push rbp
0x100241f44: mov rbp, rsp
0x100241f47: lea rdi, [rip + 0x93a03e] ; 0x100b7bf8c i < m_texCount
0x100241f4e: lea rsi, [rip + 0x93a046] ; 0x100b7bf9b ./Compositor.h
0x100241f55: mov edx, 0x3d
0x100241f5a: mov ecx, 3
0x100241f5f: call 0x1007e5f70 ; 0x1007e5f70
0x100241f64: ud2 
0x100241f66: nop word ptr cs:[rax + rax]
