0x1002129f0: push rbp
0x1002129f1: mov rbp, rsp
0x1002129f4: push r15
0x1002129f6: push r14
0x1002129f8: push r13
0x1002129fa: push r12
0x1002129fc: push rbx
0x1002129fd: and rsp, 0xffffffffffffffe0
0x100212a01: sub rsp, 0x1a0
0x100212a08: mov r14, r9
0x100212a0b: mov qword ptr [rsp + 0x28], r8
0x100212a10: mov r12, rcx
0x100212a13: mov rbx, rdx
0x100212a16: mov r15, rsi
0x100212a19: mov r13, rdi
0x100212a1c: mov rax, qword ptr [rip + 0x9faeb5] ; 0x100c0d8d8
0x100212a23: mov rax, qword ptr [rax]
0x100212a26: mov qword ptr [rsp + 0x180], rax
0x100212a2e: vxorps xmm0, xmm0, xmm0
0x100212a32: vmovaps xmmword ptr [r13 + 0x40d80], xmm0
0x100212a3b: call 0x10043fb50 ; 0x10043fb50
0x100212a40: mov esi, 0x50
0x100212a45: mov rdi, rax
0x100212a48: call 0x1004434f0 ; 0x1004434f0
0x100212a4d: vmovaps xmm0, xmmword ptr [rax + 0x20]
0x100212a52: vmovaps xmmword ptr [r13 + 0x40da0], xmm0
0x100212a5b: test r15, r15
0x100212a5e: je 0x100212c3a
0x100212a64: mov qword ptr [rsp + 0xb0], rbx
0x100212a6c: mov qword ptr [rsp + 0xb8], r12
0x100212a74: mov qword ptr [rsp + 0xa8], r14
0x100212a7c: mov eax, dword ptr [r15 + 8]
0x100212a80: mov dword ptr [r13 + 0x2a8], eax
0x100212a87: mov rax, qword ptr [r15]
0x100212a8a: mov qword ptr [r13 + 0x2a0], rax
0x100212a91: mov eax, dword ptr [r15 + 0x14]
0x100212a95: mov dword ptr [r13 + 0x2b4], eax
0x100212a9c: mov rax, qword ptr [r15 + 0xc]
0x100212aa0: mov qword ptr [r13 + 0x2ac], rax
0x100212aa7: mov eax, dword ptr [r15 + 0x5c]
0x100212aab: mov dword ptr [r13 + 0x2c0], eax
0x100212ab2: mov eax, dword ptr [r15 + 0x20]
0x100212ab6: mov dword ptr [r13 + 0x2c4], eax
0x100212abd: add eax, eax
0x100212abf: lea ebx, [rax + rax*2]
0x100212ac2: mov rdx, qword ptr [rip + 0x1bcf07f] ; 0x101de1b48
0x100212ac9: mov ecx, 0x10
0x100212ace: mov r14, qword ptr [rsp + 0x28]
0x100212ad3: mov rdi, r14
0x100212ad6: mov rsi, rbx
0x100212ad9: call 0x100795530 ; 0x100795530
0x100212ade: mov qword ptr [r13 + 0x2c8], rax
0x100212ae5: mov rsi, qword ptr [r15 + 0x28]
0x100212ae9: mov rdi, rax
0x100212aec: mov rdx, rbx
0x100212aef: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x100212af4: mov ebx, dword ptr [r13 + 0x2b0]
0x100212afb: imul ebx, dword ptr [r13 + 0x2ac]
0x100212b03: imul ebx, dword ptr [r13 + 0x2b4]
0x100212b0b: mov rdx, qword ptr [rip + 0x1bcf036] ; 0x101de1b48
0x100212b12: mov ecx, 0x10
0x100212b17: mov rdi, r14
0x100212b1a: mov rsi, rbx
0x100212b1d: call 0x100795530 ; 0x100795530
0x100212b22: mov qword ptr [r13 + 0x2b8], rax
0x100212b29: mov rsi, qword ptr [r15 + 0x18]
0x100212b2d: mov rdi, rax
0x100212b30: mov rdx, rbx
0x100212b33: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x100212b38: vmovaps xmm0, xmmword ptr [r13 + 0x40da0]
0x100212b41: vinsertps xmm0, xmm0, dword ptr [r15 + 0x58], 0x30
0x100212b48: vmovaps xmmword ptr [r13 + 0x40da0], xmm0
0x100212b51: mov eax, dword ptr [r15 + 0x5c]
0x100212b55: mov ecx, dword ptr [r15 + 0x60]
0x100212b59: vcvtsi2ss xmm0, xmm1, rax
0x100212b5e: vcvtsi2ss xmm1, xmm1, rcx
0x100212b63: vmovss xmm2, dword ptr [rip + 0x892555] ; 0x100aa50c0
0x100212b6b: vaddss xmm3, xmm0, xmm2
0x100212b6f: vaddss xmm4, xmm1, xmm2
0x100212b73: vinsertps xmm0, xmm0, xmm1, 0x10
0x100212b79: vinsertps xmm0, xmm0, xmm3, 0x20
0x100212b7f: vinsertps xmm0, xmm0, xmm4, 0x30
0x100212b85: vmovaps xmm1, xmmword ptr [rip + 0x89ea43] ; 0x100ab15d0
0x100212b8d: vdivps xmm0, xmm1, xmm0
0x100212b91: vmovups xmmword ptr [r13 + 0x40dc0], xmm0
0x100212b9a: mov eax, dword ptr [r15 + 0x20]
0x100212b9e: vcvtsi2ss xmm0, xmm5, rax
0x100212ba3: vsqrtss xmm0, xmm0, xmm0
0x100212ba7: vroundss xmm0, xmm0, xmm0, 0xa
0x100212bad: vcvttss2si rax, xmm0
0x100212bb2: mov qword ptr [rsp + 0x48], rax
0x100212bb7: mov eax, eax
0x100212bb9: vcvtsi2ss xmm0, xmm5, rax
0x100212bbe: vdivss xmm0, xmm2, xmm0
0x100212bc2: vmovss dword ptr [r13 + 0x10], xmm0
0x100212bc8: mov ebx, dword ptr [r15 + 0x10]
0x100212bcc: imul ebx, dword ptr [r15 + 0xc]
0x100212bd1: imul ebx, dword ptr [r15 + 0x14]
0x100212bd6: lea r14d, [rbx*4]
0x100212bde: call 0x1007c6c20 ; 0x1007c6c20
0x100212be3: lea rcx, [rip + 0x1e35f66] ; 0x102048b50
0x100212bea: mov rdx, qword ptr [rcx]
0x100212bed: mov ecx, 1
0x100212bf2: mov rdi, rax
0x100212bf5: mov rsi, r14
0x100212bf8: call 0x100795530 ; 0x100795530
0x100212bfd: mov r12, rax
0x100212c00: mov esi, 0xff
0x100212c05: mov rdi, r12
0x100212c08: mov rdx, r14
0x100212c0b: call 0x100aa2900 ; 0x100aa2900 _memset
0x100212c10: test ebx, ebx
0x100212c12: je 0x10021304c
0x100212c18: mov r14d, ebx
0x100212c1b: mov eax, r14d
0x100212c1e: and eax, 1
0x100212c21: cmp ebx, 1
0x100212c24: jne 0x100213051
0x100212c2a: xor ecx, ecx
0x100212c2c: test rax, rax
0x100212c2f: jne 0x100213098
0x100212c35: jmp 0x1002130aa ; 0x1002130aa
0x100212c3a: mov dword ptr [rsp + 0xc0], 0xffffffff
0x100212c45: lea rbx, [r13 + 0x18]
0x100212c49: mov dword ptr [rsp + 8], 0
0x100212c51: mov dword ptr [rsp], 6
0x100212c58: lea rsi, [rip + 0x967ab5] ; 0x100b7a714 CloudSparseGrid
0x100212c5f: mov edx, 1
0x100212c64: mov ecx, 1
0x100212c69: mov r8d, 1
0x100212c6f: mov r9d, 1
0x100212c75: mov rdi, rbx
0x100212c78: call 0x1007f0960 ; 0x1007f0960
0x100212c7d: mov esi, 1
0x100212c82: mov rdi, rbx
0x100212c85: call 0x1007f0c80 ; 0x1007f0c80
0x100212c8a: lea rax, [r13 + 0x330]
0x100212c91: mov qword ptr [r13 + 0x20], rax
0x100212c95: lea rsi, [rsp + 0xc0]
0x100212c9d: mov qword ptr [rsp + 0x90], rbx
0x100212ca5: mov rdi, rbx
0x100212ca8: call 0x1007f0e00 ; 0x1007f0e00
0x100212cad: mov byte ptr [rsp + 0x100], 0
0x100212cb5: lea rbx, [r13 + 0x90]
0x100212cbc: mov dword ptr [rsp + 8], 0
0x100212cc4: mov dword ptr [rsp], 2
0x100212ccb: lea rsi, [rip + 0x967a52] ; 0x100b7a724 CloudPackedDistGrid
0x100212cd2: mov edx, 1
0x100212cd7: mov ecx, 1
0x100212cdc: mov r8d, 1
0x100212ce2: mov r9d, 1
0x100212ce8: mov rdi, rbx
0x100212ceb: call 0x1007f0960 ; 0x1007f0960
0x100212cf0: mov esi, 1
0x100212cf5: mov rdi, rbx
0x100212cf8: call 0x1007f0c80 ; 0x1007f0c80
0x100212cfd: lea rsi, [rsp + 0x100]
0x100212d05: mov qword ptr [rsp + 0x88], rbx
0x100212d0d: mov rdi, rbx
0x100212d10: call 0x1007f0e00 ; 0x1007f0e00
0x100212d15: mov dword ptr [rsp + 0x148], 0xffffffff
0x100212d20: lea r12, [r13 + 0x108]
0x100212d27: mov dword ptr [rsp + 8], 0
0x100212d2f: mov dword ptr [rsp], 6
0x100212d36: lea rsi, [rip + 0x9679fb] ; 0x100b7a738 CloudPackedAmb0Grid
0x100212d3d: mov edx, 1
0x100212d42: mov ecx, 1
0x100212d47: mov r8d, 1
0x100212d4d: mov r9d, 1
0x100212d53: mov rdi, r12
0x100212d56: call 0x1007f0960 ; 0x1007f0960
0x100212d5b: lea r14, [r13 + 0x180]
0x100212d62: mov dword ptr [rsp + 8], 0
0x100212d6a: mov dword ptr [rsp], 6
0x100212d71: lea rsi, [rip + 0x9679d4] ; 0x100b7a74c CloudPackedAmb1Grid
0x100212d78: mov edx, 1
0x100212d7d: mov ecx, 1
0x100212d82: mov r8d, 1
0x100212d88: mov r9d, 1
0x100212d8e: mov rdi, r14
0x100212d91: call 0x1007f0960 ; 0x1007f0960
0x100212d96: lea r15, [r13 + 0x1f8]
0x100212d9d: mov dword ptr [rsp + 8], 0
0x100212da5: mov dword ptr [rsp], 2
0x100212dac: lea rsi, [rip + 0x9679ad] ; 0x100b7a760 CloudPackedAmb2Grid
0x100212db3: mov edx, 1
0x100212db8: mov ecx, 1
0x100212dbd: mov r8d, 1
0x100212dc3: mov r9d, 1
0x100212dc9: mov rdi, r15
0x100212dcc: call 0x1007f0960 ; 0x1007f0960
0x100212dd1: lea rax, [r13 + 0x2e0]
0x100212dd8: mov qword ptr [r13 + 0x110], rax
0x100212ddf: mov qword ptr [r13 + 0x188], rax
0x100212de6: mov qword ptr [r13 + 0x200], rax
0x100212ded: mov esi, 1
0x100212df2: mov rdi, r12
0x100212df5: call 0x1007f0c80 ; 0x1007f0c80
0x100212dfa: mov esi, 1
0x100212dff: mov rdi, r14
0x100212e02: call 0x1007f0c80 ; 0x1007f0c80
0x100212e07: mov esi, 1
0x100212e0c: mov rdi, r15
0x100212e0f: call 0x1007f0c80 ; 0x1007f0c80
0x100212e14: lea rbx, [rsp + 0x148]
0x100212e1c: mov rdi, r12
0x100212e1f: mov rsi, rbx
0x100212e22: call 0x1007f0e00 ; 0x1007f0e00
0x100212e27: mov rdi, r14
0x100212e2a: mov rsi, rbx
0x100212e2d: call 0x1007f0e00 ; 0x1007f0e00
0x100212e32: mov rdi, r15
0x100212e35: mov rsi, rbx
0x100212e38: call 0x1007f0e00 ; 0x1007f0e00
0x100212e3d: lea rax, [r13 + 0x10]
0x100212e41: mov qword ptr [rsp + 0x40], rax
0x100212e46: lea rax, [r13 + 0x40dc0]
0x100212e4d: mov qword ptr [rsp + 0x28], rax
0x100212e52: mov rbx, r13
0x100212e55: lea r13, [rbx + 0x40d80]
0x100212e5c: lea rax, [rbx + 0x40da0]
0x100212e63: mov qword ptr [rsp + 0x48], rax
0x100212e68: call 0x1007945e0 ; 0x1007945e0
0x100212e6d: lea rsi, [rip + 0x967914] ; 0x100b7a788 u_cloudDist
0x100212e74: xor ecx, ecx
0x100212e76: mov rdi, rax
0x100212e79: mov rdx, qword ptr [rsp + 0x88]
0x100212e81: call 0x100794050 ; 0x100794050
0x100212e86: call 0x1007945e0 ; 0x1007945e0
0x100212e8b: lea rsi, [rip + 0x967902] ; 0x100b7a794 u_cloudAmb0
0x100212e92: xor ecx, ecx
0x100212e94: mov rdi, rax
0x100212e97: mov rdx, r12
0x100212e9a: call 0x100794050 ; 0x100794050
0x100212e9f: call 0x1007945e0 ; 0x1007945e0
0x100212ea4: lea rsi, [rip + 0x9678f5] ; 0x100b7a7a0 u_cloudAmb1
0x100212eab: xor ecx, ecx
0x100212ead: mov rdi, rax
0x100212eb0: mov rdx, r14
0x100212eb3: call 0x100794050 ; 0x100794050
0x100212eb8: call 0x1007945e0 ; 0x1007945e0
0x100212ebd: lea rsi, [rip + 0x9678e8] ; 0x100b7a7ac u_cloudAmb2
0x100212ec4: xor ecx, ecx
0x100212ec6: mov rdi, rax
0x100212ec9: mov rdx, r15
0x100212ecc: call 0x100794050 ; 0x100794050
0x100212ed1: call 0x1007945e0 ; 0x1007945e0
0x100212ed6: lea rsi, [rip + 0x9678db] ; 0x100b7a7b8 u_cloudSparse
0x100212edd: xor ecx, ecx
0x100212edf: mov rdi, rax
0x100212ee2: mov rdx, qword ptr [rsp + 0x90]
0x100212eea: call 0x100794050 ; 0x100794050
0x100212eef: call 0x1007945e0 ; 0x1007945e0
0x100212ef4: lea rdx, [rbx + 0x270]
0x100212efb: lea rsi, [rip + 0x9678c4] ; 0x100b7a7c6 u_cloudBinMinWorld
0x100212f02: mov ecx, 3
0x100212f07: mov rdi, rax
0x100212f0a: call 0x100793f20 ; 0x100793f20
0x100212f0f: call 0x1007945e0 ; 0x1007945e0
0x100212f14: lea rdx, [rbx + 0x290]
0x100212f1b: lea rsi, [rip + 0x9678b7] ; 0x100b7a7d9 u_cloudBinRangeWorld
0x100212f22: mov ecx, 3
0x100212f27: mov rdi, rax
0x100212f2a: call 0x100793f20 ; 0x100793f20
0x100212f2f: call 0x1007945e0 ; 0x1007945e0
0x100212f34: lea rsi, [rip + 0x9678b3] ; 0x100b7a7ee u_cloudPackedBinDimInv
0x100212f3b: mov ecx, 1
0x100212f40: mov rdi, rax
0x100212f43: mov rdx, qword ptr [rsp + 0x40]
0x100212f48: call 0x100793f20 ; 0x100793f20
0x100212f4d: call 0x1007945e0 ; 0x1007945e0
0x100212f52: lea rdx, [rbx + 0x40358]
0x100212f59: lea rsi, [rip + 0x9678a5] ; 0x100b7a805 u_cloudNoise3D
0x100212f60: xor ecx, ecx
0x100212f62: mov rdi, rax
0x100212f65: call 0x100794050 ; 0x100794050
0x100212f6a: call 0x1007945e0 ; 0x1007945e0
0x100212f6f: lea rdx, [rbx + 0x40d90]
0x100212f76: lea rsi, [rip + 0x967897] ; 0x100b7a814 u_cloudWindMove
0x100212f7d: mov ecx, 3
0x100212f82: mov rdi, rax
0x100212f85: call 0x100793f20 ; 0x100793f20
0x100212f8a: call 0x1007945e0 ; 0x1007945e0
0x100212f8f: lea rsi, [rip + 0x96788e] ; 0x100b7a824 u_cloudWindScroll
0x100212f96: mov ecx, 3
0x100212f9b: mov rdi, rax
0x100212f9e: mov rdx, r13
0x100212fa1: call 0x100793f20 ; 0x100793f20
0x100212fa6: call 0x1007945e0 ; 0x1007945e0
0x100212fab: lea rdx, [rbx + 0x40db0]
0x100212fb2: lea rsi, [rip + 0x96787d] ; 0x100b7a836 u_cloudNoiseTweaks
0x100212fb9: mov ecx, 4
0x100212fbe: mov rdi, rax
0x100212fc1: call 0x100793f20 ; 0x100793f20
0x100212fc6: call 0x1007945e0 ; 0x1007945e0
0x100212fcb: lea rsi, [rip + 0x967877] ; 0x100b7a849 u_cloudVoxelScales
0x100212fd2: mov ecx, 4
0x100212fd7: mov rdi, rax
0x100212fda: mov rdx, qword ptr [rsp + 0x28]
0x100212fdf: call 0x100793f20 ; 0x100793f20
0x100212fe4: call 0x1007945e0 ; 0x1007945e0
0x100212fe9: lea rsi, [rip + 0x96786c] ; 0x100b7a85c u_cloudMat
0x100212ff0: mov ecx, 4
0x100212ff5: mov rdi, rax
0x100212ff8: mov rdx, qword ptr [rsp + 0x48]
0x100212ffd: call 0x100793f20 ; 0x100793f20
0x100213002: call 0x1007945e0 ; 0x1007945e0
0x100213007: add rbx, 0x40d74
0x10021300e: lea rsi, [rip + 0x967852] ; 0x100b7a867 u_cloudUndulationScale
0x100213015: mov ecx, 1
0x10021301a: mov rdi, rax
0x10021301d: mov rdx, rbx
0x100213020: call 0x100793f20 ; 0x100793f20
0x100213025: mov rax, qword ptr [rip + 0x9fa8ac] ; 0x100c0d8d8
0x10021302c: mov rax, qword ptr [rax]
0x10021302f: cmp rax, qword ptr [rsp + 0x180]
0x100213037: jne 0x100213c72
0x10021303d: lea rsp, [rbp - 0x28]
0x100213041: pop rbx
0x100213042: pop r12
0x100213044: pop r13
0x100213046: pop r14
0x100213048: pop r15
0x10021304a: pop rbp
0x10021304b: ret 
0x10021304c: xor r14d, r14d
0x10021304f: jmp 0x1002130aa ; 0x1002130aa
0x100213051: mov rdx, r14
0x100213054: sub rdx, rax
0x100213057: xor ecx, ecx
0x100213059: mov esi, 4
0x10021305e: nop 
0x100213060: mov rdi, qword ptr [r15 + 0x18]
0x100213064: movzx ebx, byte ptr [rdi + rcx]
0x100213068: lea edi, [rsi - 4]
0x10021306b: and edi, 0xfffffff8
0x10021306e: mov byte ptr [r12 + rdi + 2], bl
0x100213073: mov rdi, qword ptr [r15 + 0x18]
0x100213077: movzx ebx, byte ptr [rdi + rcx + 1]
0x10021307c: mov edi, esi
0x10021307e: and edi, 0xfffffffc
0x100213081: mov byte ptr [r12 + rdi + 2], bl
0x100213086: add rcx, 2
0x10021308a: add rsi, 8
0x10021308e: cmp rdx, rcx
0x100213091: jne 0x100213060
0x100213093: test rax, rax
0x100213096: je 0x1002130aa
0x100213098: mov rax, qword ptr [r15 + 0x18]
0x10021309c: mov al, byte ptr [rax + rcx]
0x10021309f: and ecx, 0x3fffffff
0x1002130a5: mov byte ptr [r12 + rcx*4 + 2], al
0x1002130aa: mov rdi, qword ptr [rsp + 0x28]
0x1002130af: shl r14, 2
0x1002130b3: mov rdx, qword ptr [rip + 0x1bcea8e] ; 0x101de1b48
0x1002130ba: mov ecx, 0x10
0x1002130bf: mov rsi, r14
0x1002130c2: call 0x100795530 ; 0x100795530
0x1002130c7: mov qword ptr [r13 + 0x2d8], rax
0x1002130ce: mov esi, 0xff
0x1002130d3: mov rdi, rax
0x1002130d6: mov rdx, r14
0x1002130d9: call 0x100aa2900 ; 0x100aa2900 _memset
0x1002130de: cmp dword ptr [r15 + 0x20], 0
0x1002130e3: mov r8, qword ptr [rsp + 0x48]
0x1002130e8: je 0x100213158
0x1002130ea: xor ecx, ecx
0x1002130ec: mov esi, 2
0x1002130f1: nop word ptr cs:[rax + rax]
0x100213100: mov rax, qword ptr [r15 + 0x28]
0x100213104: lea edx, [rsi - 2]
0x100213107: movsx edx, word ptr [rax + rdx*2]
0x10021310b: lea edi, [rsi - 1]
0x10021310e: movsx edi, word ptr [rax + rdi*2]
0x100213112: mov ebx, esi
0x100213114: movsx ebx, word ptr [rax + rbx*2]
0x100213118: imul ebx, dword ptr [r15 + 0x10]
0x10021311d: add ebx, edi
0x10021311f: imul ebx, dword ptr [r15 + 0xc]
0x100213124: add ebx, edx
0x100213126: xor edx, edx
0x100213128: mov eax, ecx
0x10021312a: div r8d
0x10021312d: lea edi, [rbx*4]
0x100213134: mov byte ptr [r12 + rdi], dl
0x100213138: lea edx, [rbx*4 + 1]
0x10021313f: mov byte ptr [r12 + rdx], al
0x100213143: mov rax, qword ptr [r13 + 0x2d8]
0x10021314a: mov dword ptr [rax + rbx*4], ecx
0x10021314d: inc ecx
0x10021314f: add esi, 3
0x100213152: cmp ecx, dword ptr [r15 + 0x20]
0x100213156: jb 0x100213100
0x100213158: lea r14, [r13 + 0x18]
0x10021315c: mov ecx, dword ptr [r15 + 0xc]
0x100213160: mov r8d, dword ptr [r15 + 0x10]
0x100213164: mov r9d, dword ptr [r15 + 0x14]
0x100213168: mov dword ptr [rsp + 8], 0
0x100213170: mov dword ptr [rsp], 6
0x100213177: lea rsi, [rip + 0x967596] ; 0x100b7a714 CloudSparseGrid
0x10021317e: mov edx, 1
0x100213183: mov rdi, r14
0x100213186: call 0x1007f0960 ; 0x1007f0960
0x10021318b: mov esi, 1
0x100213190: mov rdi, r14
0x100213193: call 0x1007f0c80 ; 0x1007f0c80
0x100213198: lea rax, [r13 + 0x330]
0x10021319f: mov qword ptr [r13 + 0x20], rax
0x1002131a3: mov rdi, r14
0x1002131a6: mov rsi, r12
0x1002131a9: call 0x1007f0e00 ; 0x1007f0e00
0x1002131ae: mov ebx, dword ptr [r15 + 0x5c]
0x1002131b2: mov eax, dword ptr [r15 + 0x20]
0x1002131b6: imul eax, ebx
0x1002131b9: imul ebx, ebx
0x1002131bc: imul ebx, eax
0x1002131bf: mov rdx, qword ptr [rip + 0x1bce982] ; 0x101de1b48
0x1002131c6: mov ecx, 0x10
0x1002131cb: mov rdi, qword ptr [rsp + 0x28]
0x1002131d0: mov rsi, rbx
0x1002131d3: call 0x100795530 ; 0x100795530
0x1002131d8: mov qword ptr [r13 + 0x2d0], rax
0x1002131df: mov rsi, qword ptr [r15 + 0x40]
0x1002131e3: mov ecx, dword ptr [r15 + 0x30]
0x1002131e7: mov edi, 1
0x1002131ec: mov rdx, rax
0x1002131ef: mov r8d, ebx
0x1002131f2: call 0x100780880 ; 0x100780880
0x1002131f7: mov ebx, dword ptr [r15 + 0x5c]
0x1002131fb: call 0x1007c6c20 ; 0x1007c6c20
0x100213200: inc ebx
0x100213202: mov ecx, ebx
0x100213204: imul ecx, dword ptr [rsp + 0x48]
0x100213209: imul ebx, ecx
0x10021320c: imul ebx, ecx
0x10021320f: lea rcx, [rip + 0x1e3593a] ; 0x102048b50
0x100213216: mov rdx, qword ptr [rcx]
0x100213219: mov ecx, 1
0x10021321e: mov rdi, rax
0x100213221: mov rsi, rbx
0x100213224: call 0x100795530 ; 0x100795530
0x100213229: mov qword ptr [rsp + 0x38], rax
0x10021322e: lea rax, [r15 + 0xc]
0x100213232: mov qword ptr [rsp + 0x28], rax
0x100213237: cmp dword ptr [r15 + 0x20], 0
0x10021323c: mov qword ptr [rsp + 0x90], r14
0x100213244: je 0x10021348c
0x10021324a: mov ebx, dword ptr [r15 + 0x5c]
0x10021324e: xor edx, edx
0x100213250: mov qword ptr [rsp + 0x68], r12
0x100213255: mov rax, qword ptr [r15 + 0x28]
0x100213259: lea ecx, [rdx + rdx*2]
0x10021325c: movsx esi, word ptr [rax + rcx*2]
0x100213260: lea ecx, [rdx + rdx*2 + 1]
0x100213264: movsx edi, word ptr [rax + rcx*2]
0x100213268: mov qword ptr [rsp + 0x50], rdx
0x10021326d: lea ecx, [rdx + rdx*2 + 2]
0x100213271: mov rdx, r12
0x100213274: movsx r12d, word ptr [rax + rcx*2]
0x100213279: mov eax, dword ptr [r15 + 0x10]
0x10021327d: imul eax, r12d
0x100213281: mov dword ptr [rsp + 0x40], edi
0x100213285: add eax, edi
0x100213287: imul eax, dword ptr [r15 + 0xc]
0x10021328c: mov r14d, esi
0x10021328f: add eax, esi
0x100213291: lea ecx, [rax*4]
0x100213298: mov cl, byte ptr [rdx + rcx]
0x10021329b: mov byte ptr [rsp + 0x60], cl
0x10021329f: lea eax, [rax*4 + 1]
0x1002132a6: mov al, byte ptr [rdx + rax]
0x1002132a9: mov byte ptr [rsp + 0x58], al
0x1002132ad: mov dword ptr [rsp + 0xc8], 0
0x1002132b8: mov dword ptr [rsp + 0xc4], 0
0x1002132c3: xor eax, eax
0x1002132c5: mov dword ptr [rsp + 0xc0], 0
0x1002132d0: xor ecx, ecx
0x1002132d2: nop word ptr cs:[rax + rax]
0x1002132e0: mov dword ptr [rsp + 0x148], ecx
0x1002132e7: mov dword ptr [rsp + 0x14c], eax
0x1002132ee: mov edx, dword ptr [rsp + 0xc8]
0x1002132f5: mov dword ptr [rsp + 0x150], edx
0x1002132fc: mov dword ptr [rsp + 0x100], r14d
0x100213304: mov esi, dword ptr [rsp + 0x40]
0x100213308: mov dword ptr [rsp + 0x104], esi
0x10021330f: mov dword ptr [rsp + 0x108], r12d
0x100213317: cmp ecx, ebx
0x100213319: je 0x100213327
0x10021331b: cmp eax, ebx
0x10021331d: je 0x100213327
0x10021331f: cmp edx, ebx
0x100213321: jne 0x1002133cb
0x100213327: lea rdi, [rsp + 0x100]
0x10021332f: mov rsi, qword ptr [rsp + 0x28]
0x100213334: lea rdx, [rsp + 0x148]
0x10021333c: mov ecx, ebx
0x10021333e: call 0x100216530 ; 0x100216530
0x100213343: test al, al
0x100213345: je 0x100213370
0x100213347: mov rdi, qword ptr [r13 + 0x2d8]
0x10021334e: lea rsi, [rsp + 0x100]
0x100213356: mov rdx, qword ptr [rsp + 0x28]
0x10021335b: call 0x100216510 ; 0x100216510
0x100213360: test al, al
0x100213362: je 0x100213370
0x100213364: mov ebx, dword ptr [r15 + 0x5c]
0x100213368: jmp 0x1002133cb ; 0x1002133cb
0x10021336a: nop word ptr [rax + rax]
0x100213370: mov dword ptr [rsp + 0x100], r14d
0x100213378: mov eax, dword ptr [rsp + 0x40]
0x10021337c: mov dword ptr [rsp + 0x104], eax
0x100213383: mov dword ptr [rsp + 0x108], r12d
0x10021338b: mov ebx, dword ptr [r15 + 0x5c]
0x10021338f: lea eax, [rbx - 1]
0x100213392: mov ecx, dword ptr [rsp + 0xc0]
0x100213399: mov edx, dword ptr [rsp + 0xc4]
0x1002133a0: cmp ecx, eax
0x1002133a2: cmovg ecx, eax
0x1002133a5: mov dword ptr [rsp + 0x148], ecx
0x1002133ac: cmp edx, eax
0x1002133ae: cmovg edx, eax
0x1002133b1: mov dword ptr [rsp + 0x14c], edx
0x1002133b8: mov ecx, dword ptr [rsp + 0xc8]
0x1002133bf: cmp ecx, eax
0x1002133c1: cmovle eax, ecx
0x1002133c4: mov dword ptr [rsp + 0x150], eax
0x1002133cb: mov rdi, qword ptr [r13 + 0x2d8]
0x1002133d2: lea rsi, [rsp + 0x100]
0x1002133da: mov rdx, qword ptr [rsp + 0x28]
0x1002133df: lea rcx, [rsp + 0x148]
0x1002133e7: mov r8d, ebx
0x1002133ea: call 0x1002164b0 ; 0x1002164b0
0x1002133ef: mov ebx, eax
0x1002133f1: mov r8d, dword ptr [r15 + 0x5c]
0x1002133f5: movzx edi, byte ptr [rsp + 0x60]
0x1002133fa: movzx esi, byte ptr [rsp + 0x58]
0x1002133ff: mov rdx, qword ptr [rsp + 0x48]
0x100213404: lea rcx, [rsp + 0xc0]
0x10021340c: call 0x100216480 ; 0x100216480
0x100213411: mov rcx, qword ptr [r13 + 0x2d0]
0x100213418: mov edx, ebx
0x10021341a: movzx ecx, byte ptr [rcx + rdx]
0x10021341e: mov eax, eax
0x100213420: mov rdx, qword ptr [rsp + 0x38]
0x100213425: mov byte ptr [rdx + rax], cl
0x100213428: mov ecx, dword ptr [rsp + 0xc0]
0x10021342f: mov eax, dword ptr [rsp + 0xc4]
0x100213436: inc ecx
0x100213438: mov dword ptr [rsp + 0xc0], ecx
0x10021343f: mov ebx, dword ptr [r15 + 0x5c]
0x100213443: cmp ecx, ebx
0x100213445: jbe 0x1002132e0
0x10021344b: inc eax
0x10021344d: mov dword ptr [rsp + 0xc4], eax
0x100213454: cmp eax, ebx
0x100213456: jbe 0x1002132c5
0x10021345c: mov eax, dword ptr [rsp + 0xc8]
0x100213463: inc eax
0x100213465: mov dword ptr [rsp + 0xc8], eax
0x10021346c: cmp eax, ebx
0x10021346e: jbe 0x1002132b8
0x100213474: mov rdx, qword ptr [rsp + 0x50]
0x100213479: inc edx
0x10021347b: cmp edx, dword ptr [r15 + 0x20]
0x10021347f: mov r12, qword ptr [rsp + 0x68]
0x100213484: jb 0x100213255
0x10021348a: jmp 0x100213490 ; 0x100213490
0x10021348c: mov ebx, dword ptr [r15 + 0x5c]
0x100213490: lea r14, [r13 + 0x90]
0x100213497: inc ebx
0x100213499: mov ecx, ebx
0x10021349b: imul ecx, dword ptr [rsp + 0x48]
0x1002134a0: mov dword ptr [rsp + 8], 0
0x1002134a8: mov dword ptr [rsp], 2
0x1002134af: lea rsi, [rip + 0x96726e] ; 0x100b7a724 CloudPackedDistGrid
0x1002134b6: mov edx, 1
0x1002134bb: mov rdi, r14
0x1002134be: mov r8d, ecx
0x1002134c1: mov r9d, ebx
0x1002134c4: call 0x1007f0960 ; 0x1007f0960
0x1002134c9: mov esi, 1
0x1002134ce: mov rdi, r14
0x1002134d1: call 0x1007f0c80 ; 0x1007f0c80
0x1002134d6: lea rbx, [r13 + 0x2e0]
0x1002134dd: mov qword ptr [r13 + 0x98], rbx
0x1002134e4: mov rdi, r14
0x1002134e7: mov rsi, qword ptr [rsp + 0x38]
0x1002134ec: call 0x1007f0e00 ; 0x1007f0e00
0x1002134f1: mov qword ptr [rsp + 0xa0], rbx
0x1002134f9: mov qword ptr [rsp + 0x88], r14
0x100213501: call 0x1007c6c20 ; 0x1007c6c20
0x100213506: mov rdi, rax
0x100213509: mov rsi, qword ptr [rsp + 0x38]
0x10021350e: call 0x100795a70 ; 0x100795a70
0x100213513: mov ebx, dword ptr [r15 + 0x60]
0x100213517: mov r14d, dword ptr [r15 + 0x20]
0x10021351b: imul r14d, ebx
0x10021351f: call 0x1007c6c20 ; 0x1007c6c20
0x100213524: imul ebx, ebx
0x100213527: imul r14d, ebx
0x10021352b: lea ebx, [r14*8]
0x100213533: mov esi, ebx
0x100213535: lea rcx, [rip + 0x1e35614] ; 0x102048b50
0x10021353c: mov rdx, qword ptr [rcx]
0x10021353f: mov ecx, 1
0x100213544: mov rdi, rax
0x100213547: call 0x100795530 ; 0x100795530
0x10021354c: mov rsi, qword ptr [r15 + 0x48]
0x100213550: mov ecx, dword ptr [r15 + 0x34]
0x100213554: mov edi, 1
0x100213559: mov qword ptr [rsp + 0x80], rax
0x100213561: mov rdx, rax
0x100213564: mov r8d, ebx
0x100213567: call 0x100780880 ; 0x100780880
0x10021356c: call 0x1007c6c20 ; 0x1007c6c20
0x100213571: mov esi, r14d
0x100213574: lea rcx, [rip + 0x1e355d5] ; 0x102048b50
0x10021357b: mov rdx, qword ptr [rcx]
0x10021357e: mov ecx, 1
0x100213583: mov rdi, rax
0x100213586: call 0x100795530 ; 0x100795530
0x10021358b: mov rsi, qword ptr [r15 + 0x50]
0x10021358f: mov ecx, dword ptr [r15 + 0x38]
0x100213593: mov edi, 1
0x100213598: mov qword ptr [rsp + 0x78], rax
0x10021359d: mov rdx, rax
0x1002135a0: mov r8d, r14d
0x1002135a3: call 0x100780880 ; 0x100780880
0x1002135a8: mov ebx, dword ptr [r15 + 0x60]
0x1002135ac: call 0x1007c6c20 ; 0x1007c6c20
0x1002135b1: mov r14, qword ptr [rsp + 0x48]
0x1002135b6: inc ebx
0x1002135b8: mov ecx, ebx
0x1002135ba: imul ecx, r14d
0x1002135be: imul ebx, ecx
0x1002135c1: imul ebx, ecx
0x1002135c4: shl ebx, 2
0x1002135c7: mov esi, ebx
0x1002135c9: lea rcx, [rip + 0x1e35580] ; 0x102048b50
0x1002135d0: mov rdx, qword ptr [rcx]
0x1002135d3: mov ecx, 1
0x1002135d8: mov rdi, rax
0x1002135db: mov qword ptr [rsp + 0x40], rsi
0x1002135e0: call 0x100795530 ; 0x100795530
0x1002135e5: mov qword ptr [rsp + 0x60], rax
0x1002135ea: call 0x1007c6c20 ; 0x1007c6c20
0x1002135ef: lea rcx, [rip + 0x1e3555a] ; 0x102048b50
0x1002135f6: mov rdx, qword ptr [rcx]
0x1002135f9: mov ecx, 1
0x1002135fe: mov rdi, rax
0x100213601: mov rsi, qword ptr [rsp + 0x40]
0x100213606: call 0x100795530 ; 0x100795530
0x10021360b: mov qword ptr [rsp + 0x58], rax
0x100213610: call 0x1007c6c20 ; 0x1007c6c20
0x100213615: shr ebx, 2
0x100213618: lea rcx, [rip + 0x1e35531] ; 0x102048b50
0x10021361f: mov rdx, qword ptr [rcx]
0x100213622: mov ecx, 1
0x100213627: mov rdi, rax
0x10021362a: mov rsi, rbx
0x10021362d: call 0x100795530 ; 0x100795530
0x100213632: mov qword ptr [rsp + 0x50], rax
0x100213637: cmp dword ptr [r15 + 0x20], 0
0x10021363c: mov r14, qword ptr [rsp + 0x48]
0x100213641: je 0x1002138b7
0x100213647: mov ebx, dword ptr [r15 + 0x60]
0x10021364b: xor edx, edx
0x10021364d: mov qword ptr [rsp + 0x68], r12
0x100213652: mov rax, qword ptr [r15 + 0x28]
0x100213656: lea ecx, [rdx + rdx*2]
0x100213659: movsx esi, word ptr [rax + rcx*2]
0x10021365d: lea ecx, [rdx + rdx*2 + 1]
0x100213661: movsx edi, word ptr [rax + rcx*2]
0x100213665: mov qword ptr [rsp + 0x98], rdx
0x10021366d: lea ecx, [rdx + rdx*2 + 2]
0x100213671: movsx ecx, word ptr [rax + rcx*2]
0x100213675: mov eax, dword ptr [r15 + 0x10]
0x100213679: mov dword ptr [rsp + 0x38], ecx
0x10021367d: imul eax, ecx
0x100213680: mov dword ptr [rsp + 0x40], edi
0x100213684: add eax, edi
0x100213686: imul eax, dword ptr [r15 + 0xc]
0x10021368b: mov r14d, esi
0x10021368e: add eax, esi
0x100213690: lea ecx, [rax*4]
0x100213697: mov cl, byte ptr [r12 + rcx]
0x10021369b: mov byte ptr [rsp + 0x70], cl
0x10021369f: lea eax, [rax*4 + 1]
0x1002136a6: mov r12b, byte ptr [r12 + rax]
0x1002136aa: mov dword ptr [rsp + 0xc8], 0
0x1002136b5: mov dword ptr [rsp + 0xc4], 0
0x1002136c0: xor eax, eax
0x1002136c2: mov dword ptr [rsp + 0xc0], 0
0x1002136cd: xor ecx, ecx
0x1002136cf: nop 
0x1002136d0: mov dword ptr [rsp + 0x148], ecx
0x1002136d7: mov dword ptr [rsp + 0x14c], eax
0x1002136de: mov edx, dword ptr [rsp + 0xc8]
0x1002136e5: mov dword ptr [rsp + 0x150], edx
0x1002136ec: mov dword ptr [rsp + 0x100], r14d
0x1002136f4: mov esi, dword ptr [rsp + 0x40]
0x1002136f8: mov dword ptr [rsp + 0x104], esi
0x1002136ff: mov esi, dword ptr [rsp + 0x38]
0x100213703: mov dword ptr [rsp + 0x108], esi
0x10021370a: cmp ecx, ebx
0x10021370c: je 0x10021371a
0x10021370e: cmp eax, ebx
0x100213710: je 0x10021371a
0x100213712: cmp edx, ebx
0x100213714: jne 0x1002137be
0x10021371a: lea rdi, [rsp + 0x100]
0x100213722: mov rsi, qword ptr [rsp + 0x28]
0x100213727: lea rdx, [rsp + 0x148]
0x10021372f: mov ecx, ebx
0x100213731: call 0x100216530 ; 0x100216530
0x100213736: test al, al
0x100213738: je 0x100213760
0x10021373a: mov rdi, qword ptr [r13 + 0x2d8]
0x100213741: lea rsi, [rsp + 0x100]
0x100213749: mov rdx, qword ptr [rsp + 0x28]
0x10021374e: call 0x100216510 ; 0x100216510
0x100213753: test al, al
0x100213755: je 0x100213760
0x100213757: mov ebx, dword ptr [r15 + 0x60]
0x10021375b: jmp 0x1002137be ; 0x1002137be
0x10021375d: nop dword ptr [rax]
0x100213760: mov dword ptr [rsp + 0x100], r14d
0x100213768: mov eax, dword ptr [rsp + 0x40]
0x10021376c: mov dword ptr [rsp + 0x104], eax
0x100213773: mov eax, dword ptr [rsp + 0x38]
0x100213777: mov dword ptr [rsp + 0x108], eax
0x10021377e: mov ebx, dword ptr [r15 + 0x60]
0x100213782: lea eax, [rbx - 1]
0x100213785: mov ecx, dword ptr [rsp + 0xc0]
0x10021378c: mov edx, dword ptr [rsp + 0xc4]
0x100213793: cmp ecx, eax
0x100213795: cmovg ecx, eax
0x100213798: mov dword ptr [rsp + 0x148], ecx
0x10021379f: cmp edx, eax
0x1002137a1: cmovg edx, eax
0x1002137a4: mov dword ptr [rsp + 0x14c], edx
0x1002137ab: mov ecx, dword ptr [rsp + 0xc8]
0x1002137b2: cmp ecx, eax
0x1002137b4: cmovle eax, ecx
0x1002137b7: mov dword ptr [rsp + 0x150], eax
0x1002137be: mov rdi, qword ptr [r13 + 0x2d8]
0x1002137c5: lea rsi, [rsp + 0x100]
0x1002137cd: mov rdx, qword ptr [rsp + 0x28]
0x1002137d2: lea rcx, [rsp + 0x148]
0x1002137da: mov r8d, ebx
0x1002137dd: call 0x1002164b0 ; 0x1002164b0
0x1002137e2: mov ebx, eax
0x1002137e4: mov r8d, dword ptr [r15 + 0x60]
0x1002137e8: movzx edi, byte ptr [rsp + 0x70]
0x1002137ed: movzx esi, r12b
0x1002137f1: mov rdx, qword ptr [rsp + 0x48]
0x1002137f6: lea rcx, [rsp + 0xc0]
0x1002137fe: call 0x100216480 ; 0x100216480
0x100213803: lea ecx, [rax*4]
0x10021380a: lea edx, [rbx*8]
0x100213811: mov rsi, qword ptr [rsp + 0x80]
0x100213819: mov edx, dword ptr [rsi + rdx]
0x10021381c: mov rdi, qword ptr [rsp + 0x60]
0x100213821: mov dword ptr [rdi + rcx], edx
0x100213824: lea edx, [rbx*8 + 4]
0x10021382b: mov edx, dword ptr [rsi + rdx]
0x10021382e: mov rsi, qword ptr [rsp + 0x58]
0x100213833: mov dword ptr [rsi + rcx], edx
0x100213836: mov ecx, ebx
0x100213838: mov rdx, qword ptr [rsp + 0x78]
0x10021383d: movzx ecx, byte ptr [rdx + rcx]
0x100213841: mov eax, eax
0x100213843: mov rdx, qword ptr [rsp + 0x50]
0x100213848: mov byte ptr [rdx + rax], cl
0x10021384b: mov ecx, dword ptr [rsp + 0xc0]
0x100213852: mov eax, dword ptr [rsp + 0xc4]
0x100213859: inc ecx
0x10021385b: mov dword ptr [rsp + 0xc0], ecx
0x100213862: mov ebx, dword ptr [r15 + 0x60]
0x100213866: cmp ecx, ebx
0x100213868: jbe 0x1002136d0
0x10021386e: inc eax
0x100213870: mov dword ptr [rsp + 0xc4], eax
0x100213877: cmp eax, ebx
0x100213879: jbe 0x1002136c2
0x10021387f: mov eax, dword ptr [rsp + 0xc8]
0x100213886: inc eax
0x100213888: mov dword ptr [rsp + 0xc8], eax
0x10021388f: cmp eax, ebx
0x100213891: jbe 0x1002136b5
0x100213897: mov rdx, qword ptr [rsp + 0x98]
0x10021389f: inc edx
0x1002138a1: cmp edx, dword ptr [r15 + 0x20]
0x1002138a5: mov r12, qword ptr [rsp + 0x68]
0x1002138aa: mov r14, qword ptr [rsp + 0x48]
0x1002138af: jb 0x100213652
0x1002138b5: jmp 0x1002138bb ; 0x1002138bb
0x1002138b7: mov ebx, dword ptr [r15 + 0x60]
0x1002138bb: lea rdi, [r13 + 0x108]
0x1002138c2: inc ebx
0x1002138c4: mov ecx, ebx
0x1002138c6: imul ecx, r14d
0x1002138ca: mov dword ptr [rsp + 8], 0
0x1002138d2: mov dword ptr [rsp], 6
0x1002138d9: lea rsi, [rip + 0x966e58] ; 0x100b7a738 CloudPackedAmb0Grid
0x1002138e0: mov edx, 1
0x1002138e5: mov qword ptr [rsp + 0x38], rdi
0x1002138ea: mov r8d, ecx
0x1002138ed: mov r9d, ebx
0x1002138f0: call 0x1007f0960 ; 0x1007f0960
0x1002138f5: mov rbx, qword ptr [rsp + 0xa0]
0x1002138fd: mov esi, 1
0x100213902: mov rdi, qword ptr [rsp + 0x38]
0x100213907: call 0x1007f0c80 ; 0x1007f0c80
0x10021390c: mov qword ptr [r13 + 0x110], rbx
0x100213913: mov rdi, qword ptr [rsp + 0x38]
0x100213918: mov rsi, qword ptr [rsp + 0x60]
0x10021391d: call 0x1007f0e00 ; 0x1007f0e00
0x100213922: lea rdi, [r13 + 0x180]
0x100213929: mov r9d, dword ptr [r15 + 0x60]
0x10021392d: inc r9d
0x100213930: mov ecx, r9d
0x100213933: imul ecx, r14d
0x100213937: mov dword ptr [rsp + 8], 0
0x10021393f: mov dword ptr [rsp], 6
0x100213946: lea rsi, [rip + 0x966dff] ; 0x100b7a74c CloudPackedAmb1Grid
0x10021394d: mov edx, 1
0x100213952: mov qword ptr [rsp + 0x70], rdi
0x100213957: mov r8d, ecx
0x10021395a: call 0x1007f0960 ; 0x1007f0960
0x10021395f: mov esi, 1
0x100213964: mov rdi, qword ptr [rsp + 0x70]
0x100213969: call 0x1007f0c80 ; 0x1007f0c80
0x10021396e: mov qword ptr [r13 + 0x188], rbx
0x100213975: mov rdi, qword ptr [rsp + 0x70]
0x10021397a: mov rsi, qword ptr [rsp + 0x58]
0x10021397f: call 0x1007f0e00 ; 0x1007f0e00
0x100213984: lea rdi, [r13 + 0x1f8]
0x10021398b: mov r9d, dword ptr [r15 + 0x60]
0x10021398f: inc r9d
0x100213992: imul r14d, r9d
0x100213996: mov dword ptr [rsp + 8], 0
0x10021399e: mov dword ptr [rsp], 2
0x1002139a5: lea rsi, [rip + 0x966db4] ; 0x100b7a760 CloudPackedAmb2Grid
0x1002139ac: mov edx, 1
0x1002139b1: mov ecx, r14d
0x1002139b4: mov r8d, r14d
0x1002139b7: mov r14, rdi
0x1002139ba: call 0x1007f0960 ; 0x1007f0960
0x1002139bf: mov esi, 1
0x1002139c4: mov rdi, r14
0x1002139c7: call 0x1007f0c80 ; 0x1007f0c80
0x1002139cc: mov qword ptr [r13 + 0x200], rbx
0x1002139d3: mov rdi, r14
0x1002139d6: mov rsi, qword ptr [rsp + 0x50]
0x1002139db: call 0x1007f0e00 ; 0x1007f0e00
0x1002139e0: call 0x1007c6c20 ; 0x1007c6c20
0x1002139e5: mov rdi, rax
0x1002139e8: mov rsi, qword ptr [rsp + 0x50]
0x1002139ed: call 0x100795a70 ; 0x100795a70
0x1002139f2: call 0x1007c6c20 ; 0x1007c6c20
0x1002139f7: mov rdi, rax
0x1002139fa: mov rsi, qword ptr [rsp + 0x58]
0x1002139ff: call 0x100795a70 ; 0x100795a70
0x100213a04: call 0x1007c6c20 ; 0x1007c6c20
0x100213a09: mov rdi, rax
0x100213a0c: mov rsi, qword ptr [rsp + 0x60]
0x100213a11: call 0x100795a70 ; 0x100795a70
0x100213a16: call 0x1007c6c20 ; 0x1007c6c20
0x100213a1b: mov rdi, rax
0x100213a1e: mov rsi, qword ptr [rsp + 0x78]
0x100213a23: call 0x100795a70 ; 0x100795a70
0x100213a28: call 0x1007c6c20 ; 0x1007c6c20
0x100213a2d: mov rdi, rax
0x100213a30: mov rsi, qword ptr [rsp + 0x80]
0x100213a38: call 0x100795a70 ; 0x100795a70
0x100213a3d: mov edx, dword ptr [r15 + 0x64]
0x100213a41: test edx, edx
0x100213a43: je 0x100213c3b
0x100213a49: lea rbx, [r13 + 0x403d0]
0x100213a50: lea rsi, [rip + 0x966d1d] ; 0x100b7a774 CloudMesh
0x100213a57: mov rdi, rbx
0x100213a5a: call 0x1007f53c0 ; 0x1007f53c0
0x100213a5f: mov rax, qword ptr [r15 + 0x70]
0x100213a63: lea rcx, [rsp + 0xc8]
0x100213a6b: vmovaps xmm0, xmmword ptr [rip + 0x89db6d] ; 0x100ab15e0
0x100213a73: vmovaps xmmword ptr [rsp + 0xc0], xmm0
0x100213a7c: mov qword ptr [rsp + 8], rax
0x100213a81: mov dword ptr [rsp], 0
0x100213a88: lea rdx, [rsp + 0xc0]
0x100213a90: mov esi, 0
0x100213a95: mov r8d, 2
0x100213a9b: mov r9d, 1
0x100213aa1: mov rdi, rbx
0x100213aa4: call 0x1007f5430 ; 0x1007f5430
0x100213aa9: mov r8d, dword ptr [r15 + 0x68]
0x100213aad: mov r9, qword ptr [r15 + 0x78]
0x100213ab1: mov esi, 0
0x100213ab6: mov edx, 0x11
0x100213abb: mov ecx, 1
0x100213ac0: mov rdi, rbx
0x100213ac3: call 0x1007f55d0 ; 0x1007f55d0
0x100213ac8: mov rdi, rbx
0x100213acb: call 0x1007f5690 ; 0x1007f5690
0x100213ad0: lea rdi, [r13 + 0x40810]
0x100213ad7: mov r8, qword ptr [rsp + 0xb8]
0x100213adf: add r8, 0x10
0x100213ae3: lea rcx, [rip + 0x966c94] ; 0x100b7a77e CloudCore
0x100213aea: mov r9d, 6
0x100213af0: mov rsi, rbx
0x100213af3: mov rdx, qword ptr [rsp + 0xb0]
0x100213afb: call 0x1007f5d90 ; 0x1007f5d90
0x100213b00: vxorps ymm0, ymm0, ymm0
0x100213b04: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x100213b0d: mov dword ptr [rsp + 0x134], 0x3f800000
0x100213b18: mov eax, dword ptr [r15 + 0x68]
0x100213b1c: mov dword ptr [rsp + 0x148], eax
0x100213b23: mov rax, qword ptr [r15 + 0x78]
0x100213b27: mov qword ptr [rsp + 0x150], rax
0x100213b2f: mov dword ptr [rsp + 0x158], 2
0x100213b3a: mov eax, dword ptr [r15 + 0x64]
0x100213b3e: mov dword ptr [rsp + 0x15c], eax
0x100213b45: mov rax, qword ptr [r15 + 0x70]
0x100213b49: mov qword ptr [rsp + 0x160], rax
0x100213b51: mov dword ptr [rsp + 0x168], 0x10
0x100213b5c: add rax, 0xc
0x100213b60: mov qword ptr [rsp + 0x170], rax
0x100213b68: movabs rax, 0x1000000018
0x100213b72: mov qword ptr [rsp + 0x178], rax
0x100213b7a: mov byte ptr [rsp + 0x37], 0x50
0x100213b7f: lea rax, [rsp + 0x37]
0x100213b84: mov qword ptr [rsp + 0x120], rax
0x100213b8c: mov qword ptr [rsp + 0x128], 0x19
0x100213b98: mov dword ptr [rsp + 0x130], 0x10
0x100213ba3: mov word ptr [r13 + 0x40d60], 0x100
0x100213bad: lea rsi, [rsp + 0x148]
0x100213bb5: mov rbx, qword ptr [rsp + 0xa8]
0x100213bbd: mov rdi, rbx
0x100213bc0: vzeroupper 
0x100213bc3: call 0x100778b90 ; 0x100778b90
0x100213bc8: lea r8, [r13 + 0x40d58]
0x100213bcf: mov dword ptr [r13 + 0x40d50], eax
0x100213bd6: vmovss xmm0, dword ptr [rip + 0x8914e2] ; 0x100aa50c0
0x100213bde: vmovaps xmmword ptr [rsp + 0xc0], xmm0
0x100213be7: vmovaps xmm0, xmmword ptr [rip + 0x8944b1] ; 0x100aa80a0
0x100213bef: vmovaps xmmword ptr [rsp + 0xd0], xmm0
0x100213bf8: vmovaps xmm0, xmmword ptr [rip + 0x894e30] ; 0x100aa8a30
0x100213c00: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x100213c09: vmovaps xmm0, xmmword ptr [rip + 0x894def] ; 0x100aa8a00
0x100213c11: vmovaps xmmword ptr [rsp + 0xf0], xmm0
0x100213c1a: lea rdx, [rsp + 0xc0]
0x100213c22: lea rcx, [rsp + 0x100]
0x100213c2a: mov rdi, rbx
0x100213c2d: mov esi, eax
0x100213c2f: call 0x100778fd0 ; 0x100778fd0
0x100213c34: mov qword ptr [r13 + 0x40d68], rax
0x100213c3b: mov r15, r14
0x100213c3e: call 0x1007c6c20 ; 0x1007c6c20
0x100213c43: mov rdi, rax
0x100213c46: mov rsi, r12
0x100213c49: call 0x100795a70 ; 0x100795a70
0x100213c4e: lea rax, [r13 + 0x40dc0]
0x100213c55: mov qword ptr [rsp + 0x28], rax
0x100213c5a: lea rax, [r13 + 0x10]
0x100213c5e: mov qword ptr [rsp + 0x40], rax
0x100213c63: mov r12, qword ptr [rsp + 0x38]
0x100213c68: mov r14, qword ptr [rsp + 0x70]
0x100213c6d: jmp 0x100212e52 ; 0x100212e52
0x100213c72: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100213c77: jmp 0x100213cde ; 0x100213cde
0x100213c79: jmp 0x100213cde ; 0x100213cde
0x100213c7b: mov rdi, rax
0x100213c7e: call 0x100011bf0 ; 0x100011bf0
0x100213c83: mov rdi, rax
0x100213c86: call 0x100011bf0 ; 0x100011bf0
0x100213c8b: mov rdi, rax
0x100213c8e: call 0x100011bf0 ; 0x100011bf0
0x100213c93: mov rdi, rax
0x100213c96: call 0x100011bf0 ; 0x100011bf0
0x100213c9b: mov rdi, rax
0x100213c9e: call 0x100011bf0 ; 0x100011bf0
0x100213ca3: mov rdi, rax
0x100213ca6: call 0x100011bf0 ; 0x100011bf0
0x100213cab: jmp 0x100213cb9 ; 0x100213cb9
0x100213cad: jmp 0x100213cbe ; 0x100213cbe
0x100213caf: mov rbx, rax
0x100213cb2: jmp 0x100213d04 ; 0x100213d04
0x100213cb4: mov rbx, rax
0x100213cb7: jmp 0x100213d16 ; 0x100213d16
0x100213cb9: mov rbx, rax
0x100213cbc: jmp 0x100213d28 ; 0x100213d28
0x100213cbe: mov rbx, rax
0x100213cc1: jmp 0x100213d3a ; 0x100213d3a
0x100213cc3: jmp 0x100213cde ; 0x100213cde
0x100213cc5: mov rdi, rax
0x100213cc8: call 0x100011bf0 ; 0x100011bf0
0x100213ccd: mov rbx, rax
0x100213cd0: jmp 0x100213d85 ; 0x100213d85
0x100213cd5: mov rbx, rax
0x100213cd8: jmp 0x100213cf2 ; 0x100213cf2
0x100213cda: jmp 0x100213cde ; 0x100213cde
0x100213cdc: jmp 0x100213cde ; 0x100213cde
0x100213cde: mov rbx, rax
0x100213ce1: jmp 0x100213d97 ; 0x100213d97
0x100213ce6: jmp 0x100213cea ; 0x100213cea
0x100213ce8: jmp 0x100213cea ; 0x100213cea
0x100213cea: mov rbx, rax
0x100213ced: mov r12, qword ptr [rsp + 0x68]
0x100213cf2: call 0x1007c6c20 ; 0x1007c6c20
0x100213cf7: mov rdi, rax
0x100213cfa: mov rsi, qword ptr [rsp + 0x50]
0x100213cff: call 0x100795a70 ; 0x100795a70
0x100213d04: call 0x1007c6c20 ; 0x1007c6c20
0x100213d09: mov rdi, rax
0x100213d0c: mov rsi, qword ptr [rsp + 0x58]
0x100213d11: call 0x100795a70 ; 0x100795a70
0x100213d16: call 0x1007c6c20 ; 0x1007c6c20
0x100213d1b: mov rdi, rax
0x100213d1e: mov rsi, qword ptr [rsp + 0x60]
0x100213d23: call 0x100795a70 ; 0x100795a70
0x100213d28: call 0x1007c6c20 ; 0x1007c6c20
0x100213d2d: mov rdi, rax
0x100213d30: mov rsi, qword ptr [rsp + 0x78]
0x100213d35: call 0x100795a70 ; 0x100795a70
0x100213d3a: call 0x1007c6c20 ; 0x1007c6c20
0x100213d3f: mov rdi, rax
0x100213d42: mov rsi, qword ptr [rsp + 0x80]
0x100213d4a: call 0x100795a70 ; 0x100795a70
0x100213d4f: jmp 0x100213d97 ; 0x100213d97
0x100213d51: mov rdi, rax
0x100213d54: call 0x100011bf0 ; 0x100011bf0
0x100213d59: mov rdi, rax
0x100213d5c: call 0x100011bf0 ; 0x100011bf0
0x100213d61: mov rdi, rax
0x100213d64: call 0x100011bf0 ; 0x100011bf0
0x100213d69: mov rdi, rax
0x100213d6c: call 0x100011bf0 ; 0x100011bf0
0x100213d71: mov rdi, rax
0x100213d74: call 0x100011bf0 ; 0x100011bf0
0x100213d79: jmp 0x100213d7d ; 0x100213d7d
0x100213d7b: jmp 0x100213d7d ; 0x100213d7d
0x100213d7d: mov rbx, rax
0x100213d80: mov r12, qword ptr [rsp + 0x68]
0x100213d85: call 0x1007c6c20 ; 0x1007c6c20
0x100213d8a: mov rdi, rax
0x100213d8d: mov rsi, qword ptr [rsp + 0x38]
0x100213d92: call 0x100795a70 ; 0x100795a70
0x100213d97: call 0x1007c6c20 ; 0x1007c6c20
0x100213d9c: mov rdi, rax
0x100213d9f: mov rsi, r12
0x100213da2: call 0x100795a70 ; 0x100795a70
0x100213da7: mov rdi, rbx
0x100213daa: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100213daf: mov rdi, rax
0x100213db2: call 0x100011bf0 ; 0x100011bf0
0x100213db7: mov rdi, rax
0x100213dba: call 0x100011bf0 ; 0x100011bf0
0x100213dbf: nop 
