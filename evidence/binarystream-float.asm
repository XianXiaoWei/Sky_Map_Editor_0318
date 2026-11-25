0x10076af70: push rbp
0x10076af71: mov rbp, rsp
0x10076af74: push r15
0x10076af76: push r14
0x10076af78: push r12
0x10076af7a: push rbx
0x10076af7b: sub rsp, 0x20
0x10076af7f: vmovaps xmm3, xmm1
0x10076af83: vmovaps xmm4, xmm0
0x10076af87: mov r14, rsi
0x10076af8a: mov r15, rdi
0x10076af8d: vucomiss xmm3, xmm4
0x10076af91: jbe 0x10076b1ae
0x10076af97: vucomiss xmm3, xmm2
0x10076af9b: jb 0x10076b17a
0x10076afa1: vucomiss xmm2, xmm4
0x10076afa5: jb 0x10076b17a
0x10076afab: lea eax, [rdx - 1]
0x10076afae: cmp eax, 0x1f
0x10076afb1: jae 0x10076b1d2
0x10076afb7: mov ebx, 1
0x10076afbc: mov ecx, edx
0x10076afbe: shl ebx, cl
0x10076afc0: dec ebx
0x10076afc2: vsubss xmm0, xmm2, xmm4
0x10076afc6: vsubss xmm1, xmm3, xmm4
0x10076afca: vdivss xmm1, xmm0, xmm1
0x10076afce: vcvtsi2ss xmm5, xmm5, rbx
0x10076afd3: vmulss xmm1, xmm1, xmm5
0x10076afd7: vcvttss2si r12, xmm1
0x10076afdc: cmp dword ptr [r15], 1
0x10076afe0: vmovsd qword ptr [rbp - 0x38], xmm4
0x10076afe5: vmovsd qword ptr [rbp - 0x28], xmm3
0x10076afea: jne 0x10076b03a
0x10076afec: vmovss xmm1, dword ptr [r14]
0x10076aff1: vucomiss xmm2, xmm4
0x10076aff5: jbe 0x10076b08e
0x10076affb: vucomiss xmm2, xmm1
0x10076afff: jbe 0x10076b08e
0x10076b005: vsubss xmm1, xmm1, xmm4
0x10076b009: vdivss xmm0, xmm1, xmm0
0x10076b00d: vxorps xmm1, xmm1, xmm1
0x10076b011: vmaxss xmm0, xmm1, xmm0
0x10076b015: vmovss xmm1, dword ptr [rip + 0x33a0a3] ; 0x100aa50c0
0x10076b01d: vminss xmm0, xmm1, xmm0
0x10076b021: mov eax, r12d
0x10076b024: vcvtsi2ss xmm1, xmm6, rax
0x10076b029: vmulss xmm0, xmm0, xmm1
0x10076b02d: vaddss xmm0, xmm0, dword ptr [rip + 0x339583] ; 0x100aa45b8
0x10076b035: jmp 0x10076b13f ; 0x10076b13f
0x10076b03a: vmovsd qword ptr [rbp - 0x30], xmm2
0x10076b03f: lea rdi, [r15 + 8]
0x10076b043: mov esi, edx
0x10076b045: call 0x1007693f0 ; 0x1007693f0
0x10076b04a: mov ecx, eax
0x10076b04c: sub ecx, r12d
0x10076b04f: jbe 0x10076b0ca
0x10076b051: vmovsd xmm2, qword ptr [rbp - 0x28]
0x10076b056: vmovaps xmm0, xmm2
0x10076b05a: sub ebx, r12d
0x10076b05d: vmovsd xmm3, qword ptr [rbp - 0x30]
0x10076b062: je 0x10076b10d
0x10076b068: vcvtsi2ss xmm0, xmm6, rcx
0x10076b06d: mov eax, ebx
0x10076b06f: vcvtsi2ss xmm1, xmm6, rax
0x10076b074: vdivss xmm0, xmm0, xmm1
0x10076b078: vmovss xmm1, dword ptr [rip + 0x33a040] ; 0x100aa50c0
0x10076b080: vsubss xmm1, xmm1, xmm0
0x10076b084: vmulss xmm1, xmm1, xmm3
0x10076b088: vmulss xmm0, xmm0, xmm2
0x10076b08c: jmp 0x10076b109 ; 0x10076b109
0x10076b08e: mov esi, r12d
0x10076b091: mov ecx, ebx
0x10076b093: mov rax, rcx
0x10076b096: sub rax, rsi
0x10076b099: sub rcx, rsi
0x10076b09c: vsubss xmm0, xmm1, xmm2
0x10076b0a0: vsubss xmm1, xmm3, xmm2
0x10076b0a4: vdivss xmm0, xmm0, xmm1
0x10076b0a8: vxorps xmm1, xmm1, xmm1
0x10076b0ac: vmaxss xmm0, xmm1, xmm0
0x10076b0b0: vmovss xmm1, dword ptr [rip + 0x33a008] ; 0x100aa50c0
0x10076b0b8: vminss xmm1, xmm1, xmm0
0x10076b0bc: vcvtsi2ss xmm0, xmm6, rsi
0x10076b0c1: js 0x10076b11a
0x10076b0c3: vcvtsi2ss xmm2, xmm6, rcx
0x10076b0c8: jmp 0x10076b12f ; 0x10076b12f
0x10076b0ca: vmovsd xmm3, qword ptr [rbp - 0x38]
0x10076b0cf: vmovaps xmm0, xmm3
0x10076b0d3: test r12d, r12d
0x10076b0d6: vmovsd xmm2, qword ptr [rbp - 0x28]
0x10076b0db: vmovsd xmm4, qword ptr [rbp - 0x30]
0x10076b0e0: je 0x10076b10d
0x10076b0e2: mov eax, eax
0x10076b0e4: vcvtsi2ss xmm0, xmm6, rax
0x10076b0e9: mov eax, r12d
0x10076b0ec: vcvtsi2ss xmm1, xmm6, rax
0x10076b0f1: vdivss xmm0, xmm0, xmm1
0x10076b0f5: vmovss xmm1, dword ptr [rip + 0x339fc3] ; 0x100aa50c0
0x10076b0fd: vsubss xmm1, xmm1, xmm0
0x10076b101: vmulss xmm1, xmm1, xmm3
0x10076b105: vmulss xmm0, xmm0, xmm4
0x10076b109: vaddss xmm0, xmm0, xmm1
0x10076b10d: vmovss dword ptr [r14], xmm0
0x10076b112: vucomiss xmm0, xmm0
0x10076b116: jnp 0x10076b16d
0x10076b118: jmp 0x10076b15d ; 0x10076b15d
0x10076b11a: mov rcx, rax
0x10076b11d: shr rcx, 1
0x10076b120: and eax, 1
0x10076b123: or rax, rcx
0x10076b126: vcvtsi2ss xmm2, xmm6, rax
0x10076b12b: vaddss xmm2, xmm2, xmm2
0x10076b12f: vmulss xmm1, xmm1, xmm2
0x10076b133: vaddss xmm1, xmm1, dword ptr [rip + 0x33947d] ; 0x100aa45b8
0x10076b13b: vaddss xmm0, xmm1, xmm0
0x10076b13f: vcvttss2si rsi, xmm0
0x10076b144: lea rdi, [r15 + 8]
0x10076b148: call 0x1007692c0 ; 0x1007692c0
0x10076b14d: vmovss xmm0, dword ptr [r14]
0x10076b152: vmovsd xmm2, qword ptr [rbp - 0x28]
0x10076b157: vucomiss xmm0, xmm0
0x10076b15b: jnp 0x10076b16d
0x10076b15d: cmp byte ptr [r15 + 0x30], 1
0x10076b162: je 0x10076b1f1
0x10076b168: mov byte ptr [r15 + 8], 0
0x10076b16d: add rsp, 0x20
0x10076b171: pop rbx
0x10076b172: pop r12
0x10076b174: pop r14
0x10076b176: pop r15
0x10076b178: pop rbp
0x10076b179: ret 
0x10076b17a: vcvtss2sd xmm0, xmm2, xmm2
0x10076b17e: vcvtss2sd xmm1, xmm4, xmm4
0x10076b182: vcvtss2sd xmm2, xmm3, xmm3
0x10076b186: lea rdi, [rip + 0x432fe3] ; 0x100b9e170 pivot >= min && pivot <= max
0x10076b18d: lea rsi, [rip + 0x432e2d] ; 0x100b9dfc1 BinaryStream.cpp
0x10076b194: lea r8, [rip + 0x432ff2] ; 0x100b9e18d Pivot %f outside of bounds: %f - %f
0x10076b19b: mov edx, 0x1f9
0x10076b1a0: mov ecx, 4
0x10076b1a5: mov al, 3
0x10076b1a7: call 0x1007e6030 ; 0x1007e6030
0x10076b1ac: ud2 
0x10076b1ae: vcvtss2sd xmm0, xmm4, xmm4
0x10076b1b2: vcvtss2sd xmm1, xmm3, xmm3
0x10076b1b6: lea rdi, [rip + 0x432f98] ; 0x100b9e155 min < max
0x10076b1bd: lea rsi, [rip + 0x432dfd] ; 0x100b9dfc1 BinaryStream.cpp
0x10076b1c4: lea r8, [rip + 0x432f94] ; 0x100b9e15f Min: %f, Max: %f
0x10076b1cb: mov edx, 0x1f8
0x10076b1d0: jmp 0x10076b218 ; 0x10076b218
0x10076b1d2: lea rdi, [rip + 0x432fd8] ; 0x100b9e1b1 bits > 0 && bits < 32
0x10076b1d9: lea rsi, [rip + 0x432de1] ; 0x100b9dfc1 BinaryStream.cpp
0x10076b1e0: mov edx, 0x1fa
0x10076b1e5: mov ecx, 3
0x10076b1ea: call 0x1007e5f70 ; 0x1007e5f70
0x10076b1ef: ud2 
0x10076b1f1: vmovsd xmm0, qword ptr [rbp - 0x38]
0x10076b1f6: vcvtss2sd xmm0, xmm0, xmm0
0x10076b1fa: vcvtss2sd xmm1, xmm2, xmm2
0x10076b1fe: lea rdi, [rip + 0x432dcd] ; 0x100b9dfd2 !m_assert
0x10076b205: lea rsi, [rip + 0x432db5] ; 0x100b9dfc1 BinaryStream.cpp
0x10076b20c: lea r8, [rip + 0x432fb4] ; 0x100b9e1c7 Serialized nan: [%i, %i]
0x10076b213: mov edx, 0x21b
0x10076b218: mov ecx, 4
0x10076b21d: mov al, 2
0x10076b21f: call 0x1007e6030 ; 0x1007e6030
0x10076b224: ud2 
0x10076b226: nop word ptr cs:[rax + rax]
