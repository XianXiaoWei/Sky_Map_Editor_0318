0x10040d9e0: push rbp
0x10040d9e1: mov rbp, rsp
0x10040d9e4: push r15
0x10040d9e6: push r14
0x10040d9e8: push r13
0x10040d9ea: push r12
0x10040d9ec: push rbx
0x10040d9ed: sub rsp, 0x78
0x10040d9f1: mov r13, rdi
0x10040d9f4: mov rax, qword ptr [rip + 0x7ffedd] ; 0x100c0d8d8
0x10040d9fb: mov rax, qword ptr [rax]
0x10040d9fe: mov qword ptr [rbp - 0x30], rax
0x10040da02: mov qword ptr [rbp - 0x90], rsi
0x10040da09: call 0x1007c6580 ; 0x1007c6580
0x10040da0e: mov r14, rax
0x10040da11: mov qword ptr [rbp - 0x50], 0
0x10040da19: call 0x1003869c0 ; 0x1003869c0
0x10040da1e: mov rbx, qword ptr [rax]
0x10040da21: lea rsi, [rbp - 0x50]
0x10040da25: lea rdx, [rbp - 0x90]
0x10040da2c: mov rdi, rax
0x10040da2f: mov rcx, r14
0x10040da32: call qword ptr [rbx + 0x40]
0x10040da35: mov rax, qword ptr [rbp - 0x50]
0x10040da39: mov qword ptr [rbp - 0x88], rax
0x10040da40: lea r15, [r13 + 0x88]
0x10040da47: vxorps xmm0, xmm0, xmm0
0x10040da4b: vmovups xmmword ptr [r13 + 0x3a8], xmm0
0x10040da54: mov qword ptr [r13 + 0x3b8], 0
0x10040da5f: test byte ptr [r13 + 0x88], 1
0x10040da67: jne 0x10040da6f
0x10040da69: lea r12, [r15 + 1]
0x10040da6d: jmp 0x10040da76 ; 0x10040da76
0x10040da6f: mov r12, qword ptr [r13 + 0x98]
0x10040da76: lea rax, [r13 + 0x3a8]
0x10040da7d: mov qword ptr [rbp - 0x80], rax
0x10040da81: lea rbx, [r13 + 0x3b0]
0x10040da88: lea rax, [r13 + 0x3b8]
0x10040da8f: mov qword ptr [rbp - 0x78], rax
0x10040da93: mov rdi, r12
0x10040da96: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040da9b: mov r14, rsp
0x10040da9e: add rax, 0x14
0x10040daa2: and rax, 0xfffffffffffffff0
0x10040daa6: sub r14, rax
0x10040daa9: mov rsp, r14
0x10040daac: mov rdi, r14
0x10040daaf: mov rsi, r12
0x10040dab2: call 0x100aa2c5a ; 0x100aa2c5a _strcpy
0x10040dab7: mov rdi, r14
0x10040daba: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040dabf: mov byte ptr [rax + r14 + 4], 0
0x10040dac5: mov dword ptr [r14 + rax], 0x6e69622e
0x10040dacd: test byte ptr [r15], 1
0x10040dad1: jne 0x10040dad8
0x10040dad3: inc r15
0x10040dad6: jmp 0x10040dadf ; 0x10040dadf
0x10040dad8: mov r15, qword ptr [r13 + 0x98]
0x10040dadf: mov rdi, r15
0x10040dae2: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040dae7: mov r12, rsp
0x10040daea: add rax, 0x14
0x10040daee: and rax, 0xfffffffffffffff0
0x10040daf2: sub r12, rax
0x10040daf5: mov rsp, r12
0x10040daf8: mov rdi, r12
0x10040dafb: mov rsi, r15
0x10040dafe: call 0x100aa2c5a ; 0x100aa2c5a _strcpy
0x10040db03: mov rdi, r12
0x10040db06: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040db0b: mov byte ptr [rax + r12 + 4], 0
0x10040db11: mov dword ptr [r12 + rax], 0x6e69622e
0x10040db19: mov rdi, r12
0x10040db1c: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10040db21: add rax, 0x15
0x10040db25: and rax, 0xfffffffffffffff0
0x10040db29: mov rcx, rsp
0x10040db2c: mov r15, rcx
0x10040db2f: sub r15, rax
0x10040db32: neg rax
0x10040db35: mov rsp, r15
0x10040db38: mov dword ptr [rcx + rax], 0x61746144
0x10040db3f: mov word ptr [r15 + 4], 0x2f
0x10040db46: mov rdi, r15
0x10040db49: mov rsi, r14
0x10040db4c: call 0x100aa2c42 ; 0x100aa2c42 _strcat
0x10040db51: mov rdx, qword ptr [r13 + 0x30]
0x10040db55: mov rax, qword ptr [rbp - 0x88]
0x10040db5c: mov rdi, qword ptr [rax + 0x10]
0x10040db60: mov rax, qword ptr [rax + 0x48]
0x10040db64: mov rcx, qword ptr [rax + 0x98]
0x10040db6b: mov r9, qword ptr [rax + 0x1f0]
0x10040db72: sub rsp, 0x20
0x10040db76: mov rax, qword ptr [rbp - 0x78]
0x10040db7a: mov qword ptr [rsp + 0x10], rax
0x10040db7f: mov qword ptr [rsp + 8], rbx
0x10040db84: mov rax, qword ptr [rbp - 0x80]
0x10040db88: mov qword ptr [rsp], rax
0x10040db8c: mov rsi, r15
0x10040db8f: call 0x10040bc00 ; 0x10040bc00
0x10040db94: add rsp, 0x20
0x10040db98: cmp dword ptr [r13 + 0x3b8], 0
0x10040dba0: je 0x10040dbfd
0x10040dba2: xor ebx, ebx
0x10040dba4: lea r14, [rbp - 0x50]
0x10040dba8: nop dword ptr [rax + rax]
0x10040dbb0: mov rax, qword ptr [rbp - 0x80]
0x10040dbb4: mov rax, qword ptr [rax]
0x10040dbb7: mov ecx, ebx
0x10040dbb9: lea r15, [rax + rcx*8]
0x10040dbbd: call 0x1007abc10 ; 0x1007abc10
0x10040dbc2: mov r12, rax
0x10040dbc5: mov qword ptr [rbp - 0x50], 0
0x10040dbcd: call 0x10022b750 ; 0x10022b750
0x10040dbd2: mov r8, qword ptr [rax]
0x10040dbd5: mov rdi, rax
0x10040dbd8: mov rsi, r14
0x10040dbdb: mov rdx, r15
0x10040dbde: mov rcx, r12
0x10040dbe1: call qword ptr [r8 + 0x40]
0x10040dbe5: mov rdi, qword ptr [rbp - 0x50]
0x10040dbe9: test rdi, rdi
0x10040dbec: je 0x10040dbf3
0x10040dbee: call 0x10022b8d0 ; 0x10022b8d0
0x10040dbf3: inc ebx
0x10040dbf5: mov rax, qword ptr [rbp - 0x78]
0x10040dbf9: cmp ebx, dword ptr [rax]
0x10040dbfb: jb 0x10040dbb0
0x10040dbfd: mov rax, qword ptr [rbp - 0x88]
0x10040dc04: mov r14, qword ptr [rax + 0x20]
0x10040dc08: vxorps xmm0, xmm0, xmm0
0x10040dc0c: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10040dc11: mov qword ptr [rbp - 0x60], 0
0x10040dc19: test byte ptr [r13 + 0x70], 1
0x10040dc1e: jne 0x10040dc37
0x10040dc20: lea rax, [r13 + 0x70]
0x10040dc24: mov rcx, qword ptr [rax + 0x10]
0x10040dc28: mov qword ptr [rbp - 0x60], rcx
0x10040dc2c: vmovups xmm0, xmmword ptr [rax]
0x10040dc30: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10040dc35: jmp 0x10040dca9 ; 0x10040dca9
0x10040dc37: mov r15, qword ptr [r13 + 0x78]
0x10040dc3b: cmp r15, 0xff1
0x10040dc42: jae 0x10040ddda
0x10040dc48: mov rsi, qword ptr [r13 + 0x80]
0x10040dc4f: cmp r15, 0x17
0x10040dc53: jae 0x10040dc68
0x10040dc55: mov eax, r15d
0x10040dc58: add al, al
0x10040dc5a: mov byte ptr [rbp - 0x70], al
0x10040dc5d: lea rbx, [rbp - 0x6f]
0x10040dc61: test r15, r15
0x10040dc64: jne 0x10040dc99
0x10040dc66: jmp 0x10040dca4 ; 0x10040dca4
0x10040dc68: lea r12, [r15 + 0x10]
0x10040dc6c: and r12, 0xfffffffffffffff0
0x10040dc70: mov rbx, rsi
0x10040dc73: call 0x1007e50d0 ; 0x1007e50d0
0x10040dc78: mov rdi, rax
0x10040dc7b: mov rsi, r12
0x10040dc7e: call 0x1007e5790 ; 0x1007e5790
0x10040dc83: mov rsi, rbx
0x10040dc86: mov rbx, rax
0x10040dc89: mov qword ptr [rbp - 0x60], rbx
0x10040dc8d: or r12, 1
0x10040dc91: mov qword ptr [rbp - 0x70], r12
0x10040dc95: mov qword ptr [rbp - 0x68], r15
0x10040dc99: mov rdi, rbx
0x10040dc9c: mov rdx, r15
0x10040dc9f: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10040dca4: mov byte ptr [rbx + r15], 0
0x10040dca9: mov qword ptr [rbp - 0x98], r13
0x10040dcb0: lea rax, [rbp - 0x70]
0x10040dcb4: mov qword ptr [rbp - 0x50], rax
0x10040dcb8: xor edi, edi
0x10040dcba: xor esi, esi
0x10040dcbc: call 0x100020a00 ; 0x100020a00
0x10040dcc1: mov qword ptr [rbp - 0x48], rax
0x10040dcc5: lea rax, [rbp - 0x98]
0x10040dccc: mov qword ptr [rbp - 0x40], rax
0x10040dcd0: mov rax, qword ptr [rip + 0x1bf5909] ; 0x1020035e0
0x10040dcd7: mov qword ptr [rbp - 0x38], rax
0x10040dcdb: call 0x1007abbf0 ; 0x1007abbf0
0x10040dce0: sub rsp, 0x10
0x10040dce4: mov dword ptr [rsp], 2
0x10040dceb: lea rdx, [rip + 0x779fb6] ; 0x100b87ca8 RegisterLevelObjectsForHotDate
0x10040dcf2: lea r9, [rbp - 0x50]
0x10040dcf6: xor esi, esi
0x10040dcf8: xor ecx, ecx
0x10040dcfa: mov rdi, r14
0x10040dcfd: mov r8, rax
0x10040dd00: call 0x1000f0760 ; 0x1000f0760
0x10040dd05: add rsp, 0x10
0x10040dd09: test byte ptr [rbp - 0x70], 1
0x10040dd0d: je 0x10040dd23
0x10040dd0f: mov r14, qword ptr [rbp - 0x60]
0x10040dd13: call 0x1007e50d0 ; 0x1007e50d0
0x10040dd18: mov rdi, rax
0x10040dd1b: mov rsi, r14
0x10040dd1e: call 0x1007e5db0 ; 0x1007e5db0
0x10040dd23: mov dword ptr [r13 + 0x3bc], 0x811c9dc5
0x10040dd2e: cmp dword ptr [r13 + 0x3b8], 0
0x10040dd36: je 0x10040ddb6
0x10040dd3c: xor ebx, ebx
0x10040dd3e: nop 
0x10040dd40: mov rax, qword ptr [rbp - 0x80]
0x10040dd44: mov rax, qword ptr [rax]
0x10040dd47: mov ecx, ebx
0x10040dd49: mov rax, qword ptr [rax + rcx*8]
0x10040dd4d: test rax, rax
0x10040dd50: je 0x10040dd60
0x10040dd52: mov edi, dword ptr [rax]
0x10040dd54: call 0x1007abd30 ; 0x1007abd30
0x10040dd59: jmp 0x10040dd65 ; 0x10040dd65
0x10040dd5b: nop dword ptr [rax + rax]
0x10040dd60: call 0x1007abbf0 ; 0x1007abbf0
0x10040dd65: mov rcx, qword ptr [rax]
0x10040dd68: mov rdi, rax
0x10040dd6b: call qword ptr [rcx + 0x68]
0x10040dd6e: test rax, rax
0x10040dd71: jne 0x10040dd78
0x10040dd73: call 0x1007abc60 ; 0x1007abc60
0x10040dd78: mov rax, qword ptr [rax + 8]
0x10040dd7c: mov cl, byte ptr [rax]
0x10040dd7e: test cl, cl
0x10040dd80: je 0x10040ddac
0x10040dd82: mov edx, dword ptr [r13 + 0x3bc]
0x10040dd89: inc rax
0x10040dd8c: nop dword ptr [rax]
0x10040dd90: movsx ecx, cl
0x10040dd93: xor ecx, edx
0x10040dd95: imul edx, ecx, 0x1000193
0x10040dd9b: mov dword ptr [r13 + 0x3bc], edx
0x10040dda2: movzx ecx, byte ptr [rax]
0x10040dda5: inc rax
0x10040dda8: test cl, cl
0x10040ddaa: jne 0x10040dd90
0x10040ddac: inc ebx
0x10040ddae: mov rax, qword ptr [rbp - 0x78]
0x10040ddb2: cmp ebx, dword ptr [rax]
0x10040ddb4: jb 0x10040dd40
0x10040ddb6: mov rax, qword ptr [rip + 0x7ffb1b] ; 0x100c0d8d8
0x10040ddbd: mov rax, qword ptr [rax]
0x10040ddc0: cmp rax, qword ptr [rbp - 0x30]
0x10040ddc4: jne 0x10040ddd5
0x10040ddc6: lea rsp, [rbp - 0x28]
0x10040ddca: pop rbx
0x10040ddcb: pop r12
0x10040ddcd: pop r13
0x10040ddcf: pop r14
0x10040ddd1: pop r15
0x10040ddd3: pop rbp
0x10040ddd4: ret 
0x10040ddd5: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10040ddda: lea rdi, [rbp - 0x70]
0x10040ddde: call 0x100aa230c ; 0x100aa230c __ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
0x10040dde3: mov rdi, rax
0x10040dde6: call 0x100011bf0 ; 0x100011bf0
0x10040ddeb: mov rbx, rax
0x10040ddee: test byte ptr [rbp - 0x70], 1
0x10040ddf2: je 0x10040de08
0x10040ddf4: mov r14, qword ptr [rbp - 0x60]
0x10040ddf8: call 0x1007e50d0 ; 0x1007e50d0
0x10040ddfd: mov rdi, rax
0x10040de00: mov rsi, r14
0x10040de03: call 0x1007e5db0 ; 0x1007e5db0
0x10040de08: mov rdi, rbx
0x10040de0b: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10040de10: mov rdi, rax
0x10040de13: call 0x100011bf0 ; 0x100011bf0
0x10040de18: nop dword ptr [rax + rax]
