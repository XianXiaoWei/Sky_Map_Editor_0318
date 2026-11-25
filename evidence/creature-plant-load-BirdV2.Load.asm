0x1001a1840: push rbp
0x1001a1841: mov rbp, rsp
0x1001a1844: push r15
0x1001a1846: push r14
0x1001a1848: push r12
0x1001a184a: push rbx
0x1001a184b: sub rsp, 0x90
0x1001a1852: mov r14, rdx
0x1001a1855: mov rbx, rdi
0x1001a1858: mov rax, qword ptr [rbx + 0x78]
0x1001a185c: mov rcx, qword ptr [rax + 8]
0x1001a1860: lea rdx, [rbx + 0xc0]
0x1001a1867: test rcx, rcx
0x1001a186a: lea rcx, [rcx + 0x10]
0x1001a186e: cmove rcx, rdx
0x1001a1872: vmovaps xmm0, xmmword ptr [rcx]
0x1001a1876: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x1001a187b: vxorps xmm0, xmm0, xmm0
0x1001a187f: vmovaps xmmword ptr [rbx + 0x50], xmm0
0x1001a1884: mov ecx, dword ptr [rax + 0x18]
0x1001a1887: mov dword ptr [rbx + 0x60], ecx
0x1001a188a: mov ecx, dword ptr [rax + 0x1c]
0x1001a188d: mov dword ptr [rbx + 0x64], ecx
0x1001a1890: mov dword ptr [rbx + 0x68], 0x3f800000
0x1001a1897: mov rsi, qword ptr [rax + 8]
0x1001a189b: test rsi, rsi
0x1001a189e: je 0x1001a18bb
0x1001a18a0: mov rax, qword ptr [rsi]
0x1001a18a3: lea rdi, [rbp - 0x70]
0x1001a18a7: call qword ptr [rax + 0x18]
0x1001a18aa: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1001a18af: vmovaps xmm1, xmmword ptr [rbp - 0x60]
0x1001a18b4: vmovaps xmm2, xmmword ptr [rbp - 0x50]
0x1001a18b9: jmp 0x1001a18d3 ; 0x1001a18d3
0x1001a18bb: vmovaps xmm0, xmmword ptr [rbx + 0x90]
0x1001a18c3: vmovaps xmm1, xmmword ptr [rbx + 0xa0]
0x1001a18cb: vmovaps xmm2, xmmword ptr [rbx + 0xb0]
0x1001a18d3: lea rsi, [rbx + 0x20]
0x1001a18d7: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1001a18dc: vmovaps xmmword ptr [rbx + 0x30], xmm1
0x1001a18e1: vmovaps xmmword ptr [rbx + 0x40], xmm2
0x1001a18e6: lea rdi, [rbp - 0x70]
0x1001a18ea: vmovss xmm0, dword ptr [rip + 0x905fd2] ; 0x100aa78c4
0x1001a18f2: call 0x10078a070 ; 0x10078a070
0x1001a18f7: mov rax, qword ptr [rbx + 0x80]
0x1001a18fe: lea rdi, [rbx + 0xe0]
0x1001a1905: mov qword ptr [rbx + 0xe8], rax
0x1001a190c: mov rsi, rbx
0x1001a190f: mov rdx, r14
0x1001a1912: call 0x10019ff50 ; 0x10019ff50
0x1001a1917: lea rdi, [rbx + 0x360]
0x1001a191e: call 0x100192520 ; 0x100192520
0x1001a1923: mov qword ptr [rbx + 0x3a0], 0
0x1001a192e: mov rax, qword ptr [rbx + 0x78]
0x1001a1932: mov rax, qword ptr [rax + 0x10]
0x1001a1936: test rax, rax
0x1001a1939: je 0x1001a2017
0x1001a193f: mov rdi, qword ptr [r14 + 0x5a8]
0x1001a1946: mov rsi, qword ptr [rax + 0x228]
0x1001a194d: call 0x10046ccc0 ; 0x10046ccc0
0x1001a1952: mov qword ptr [rbx + 0x3a0], rax
0x1001a1959: mov rcx, qword ptr [rbx + 0xe8]
0x1001a1960: cmp byte ptr [rcx + 0x88], 0
0x1001a1967: je 0x1001a1972
0x1001a1969: mov byte ptr [rax + 0x348], 0
0x1001a1970: jmp 0x1001a197b ; 0x1001a197b
0x1001a1972: test rax, rax
0x1001a1975: je 0x1001a2017
0x1001a197b: vmovaps xmm0, xmmword ptr [rip + 0x908f3d] ; 0x100aaa8c0
0x1001a1983: vmovaps xmmword ptr [rbx + 0x3b0], xmm0
0x1001a198b: mov rax, qword ptr [rbx + 0x78]
0x1001a198f: mov rsi, qword ptr [rax + 0x10]
0x1001a1993: mov rax, qword ptr [rsi]
0x1001a1996: lea r15, [rbp - 0x70]
0x1001a199a: mov rdi, r15
0x1001a199d: call qword ptr [rax + 0x18]
0x1001a19a0: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1001a19a5: vmulps xmm0, xmm0, xmm0
0x1001a19a9: vmovshdup xmm1, xmm0
0x1001a19ad: vaddss xmm1, xmm0, xmm1
0x1001a19b1: vpermilpd xmm0, xmm0, 1
0x1001a19b7: vaddss xmm0, xmm0, xmm1
0x1001a19bb: vsqrtss xmm0, xmm0, xmm0
0x1001a19bf: vmovaps xmm1, xmmword ptr [rbx + 0x90]
0x1001a19c7: vmulps xmm1, xmm1, xmm1
0x1001a19cb: vmovshdup xmm2, xmm1
0x1001a19cf: vaddss xmm2, xmm1, xmm2
0x1001a19d3: vpermilpd xmm1, xmm1, 1
0x1001a19d9: vaddss xmm1, xmm1, xmm2
0x1001a19dd: vsqrtss xmm1, xmm1, xmm1
0x1001a19e1: vmulss xmm0, xmm0, xmm1
0x1001a19e5: vmovss dword ptr [rbx + 0x3b0], xmm0
0x1001a19ed: mov rax, qword ptr [rbx + 0x78]
0x1001a19f1: mov rsi, qword ptr [rax + 0x10]
0x1001a19f5: mov rax, qword ptr [rsi]
0x1001a19f8: mov rdi, r15
0x1001a19fb: call qword ptr [rax + 0x18]
0x1001a19fe: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1001a1a03: vmulps xmm0, xmm0, xmm0
0x1001a1a07: vmovshdup xmm1, xmm0
0x1001a1a0b: vaddss xmm1, xmm0, xmm1
0x1001a1a0f: vpermilpd xmm0, xmm0, 1
0x1001a1a15: vaddss xmm0, xmm0, xmm1
0x1001a1a19: vsqrtss xmm0, xmm0, xmm0
0x1001a1a1d: vmovaps xmm1, xmmword ptr [rbx + 0xa0]
0x1001a1a25: vmulps xmm1, xmm1, xmm1
0x1001a1a29: vmovshdup xmm2, xmm1
0x1001a1a2d: vaddss xmm2, xmm1, xmm2
0x1001a1a31: vpermilpd xmm1, xmm1, 1
0x1001a1a37: vaddss xmm1, xmm1, xmm2
0x1001a1a3b: vsqrtss xmm1, xmm1, xmm1
0x1001a1a3f: vmulss xmm0, xmm0, xmm1
0x1001a1a43: vmovss dword ptr [rbx + 0x3b4], xmm0
0x1001a1a4b: mov rax, qword ptr [rbx + 0x78]
0x1001a1a4f: mov rsi, qword ptr [rax + 0x10]
0x1001a1a53: mov rax, qword ptr [rsi]
0x1001a1a56: mov rdi, r15
0x1001a1a59: call qword ptr [rax + 0x18]
0x1001a1a5c: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1001a1a61: vmulps xmm0, xmm0, xmm0
0x1001a1a65: vmovshdup xmm1, xmm0
0x1001a1a69: vaddss xmm1, xmm0, xmm1
0x1001a1a6d: vpermilpd xmm0, xmm0, 1
0x1001a1a73: vaddss xmm0, xmm0, xmm1
0x1001a1a77: vsqrtss xmm0, xmm0, xmm0
0x1001a1a7b: vmovaps xmm1, xmmword ptr [rbx + 0xb0]
0x1001a1a83: vmulps xmm1, xmm1, xmm1
0x1001a1a87: vmovshdup xmm2, xmm1
0x1001a1a8b: vaddss xmm2, xmm1, xmm2
0x1001a1a8f: vpermilpd xmm1, xmm1, 1
0x1001a1a95: vaddss xmm1, xmm1, xmm2
0x1001a1a99: vsqrtss xmm1, xmm1, xmm1
0x1001a1a9d: vmulss xmm0, xmm0, xmm1
0x1001a1aa1: vmovss dword ptr [rbx + 0x3b8], xmm0
0x1001a1aa9: mov rax, qword ptr [rbx + 0x3a0]
0x1001a1ab0: mov r15, qword ptr [rax + 0x68]
0x1001a1ab4: test r15, r15
0x1001a1ab7: je 0x1001a1d0c
0x1001a1abd: lea rsi, [rip + 0x9d61ca] ; 0x100b77c8e critterMove
0x1001a1ac4: vmovss xmm0, dword ptr [rip + 0x9035f4] ; 0x100aa50c0
0x1001a1acc: mov rdi, r15
0x1001a1acf: call 0x1000959b0 ; 0x1000959b0
0x1001a1ad4: mov dword ptr [rbx + 0x3c0], eax
0x1001a1ada: lea rsi, [rip + 0x9c90fe] ; 0x100b6abdf critterIdle
0x1001a1ae1: mov rdi, r15
0x1001a1ae4: vmovss xmm0, dword ptr [rip + 0x9035d4] ; 0x100aa50c0
0x1001a1aec: call 0x1000959b0 ; 0x1000959b0
0x1001a1af1: mov dword ptr [rbx + 0x3c4], eax
0x1001a1af7: mov esi, dword ptr [rbx + 0x3c0]
0x1001a1afd: mov rdi, r15
0x1001a1b00: call 0x100097d30 ; 0x100097d30
0x1001a1b05: mov esi, dword ptr [rbx + 0x3c4]
0x1001a1b0b: mov rdi, r15
0x1001a1b0e: call 0x100097d30 ; 0x100097d30
0x1001a1b13: cmp byte ptr [rbx + 0x164], 0
0x1001a1b1a: je 0x1001a1b39
0x1001a1b1c: lea rsi, [rip + 0x9c9139] ; 0x100b6ac5c CritterStruggle
0x1001a1b23: vmovss xmm0, dword ptr [rip + 0x903595] ; 0x100aa50c0
0x1001a1b2b: xor edx, edx
0x1001a1b2d: mov rdi, r15
0x1001a1b30: vmovaps xmm1, xmm0
0x1001a1b34: call 0x1000967b0 ; 0x1000967b0
0x1001a1b39: lea rsi, [rip + 0x9d615a] ; 0x100b77c9a M_head_Sim
0x1001a1b40: xor edx, edx
0x1001a1b42: mov ecx, 1
0x1001a1b47: mov rdi, r15
0x1001a1b4a: call 0x100093a90 ; 0x100093a90
0x1001a1b4f: cmp eax, -1
0x1001a1b52: jne 0x1001a1b6f
0x1001a1b54: lea rsi, [rip + 0x9c3b65] ; 0x100b656c0 M_head
0x1001a1b5b: xor edx, edx
0x1001a1b5d: mov ecx, 1
0x1001a1b62: mov rdi, r15
0x1001a1b65: call 0x100093a90 ; 0x100093a90
0x1001a1b6a: cmp eax, -1
0x1001a1b6d: je 0x1001a1b80
0x1001a1b6f: mov rdi, r15
0x1001a1b72: mov esi, eax
0x1001a1b74: call 0x10009e090 ; 0x10009e090
0x1001a1b79: mov qword ptr [rbx + 0x3d0], rax
0x1001a1b80: lea rsi, [rip + 0x9d611e] ; 0x100b77ca5 R_shoulderRoot
0x1001a1b87: xor edx, edx
0x1001a1b89: mov ecx, 1
0x1001a1b8e: mov rdi, r15
0x1001a1b91: call 0x100093a90 ; 0x100093a90
0x1001a1b96: cmp eax, -1
0x1001a1b99: je 0x1001a1bac
0x1001a1b9b: mov rdi, r15
0x1001a1b9e: mov esi, eax
0x1001a1ba0: call 0x10009e090 ; 0x10009e090
0x1001a1ba5: mov qword ptr [rbx + 0x3d8], rax
0x1001a1bac: lea rsi, [rip + 0x9d6101] ; 0x100b77cb4 R_wingTip
0x1001a1bb3: xor edx, edx
0x1001a1bb5: mov ecx, 1
0x1001a1bba: mov rdi, r15
0x1001a1bbd: call 0x100093a90 ; 0x100093a90
0x1001a1bc2: cmp eax, -1
0x1001a1bc5: je 0x1001a1bd8
0x1001a1bc7: mov rdi, r15
0x1001a1bca: mov esi, eax
0x1001a1bcc: call 0x10009e090 ; 0x10009e090
0x1001a1bd1: mov qword ptr [rbx + 0x3e0], rax
0x1001a1bd8: lea rsi, [rip + 0x9d60df] ; 0x100b77cbe R_wingMidA
0x1001a1bdf: xor edx, edx
0x1001a1be1: mov ecx, 1
0x1001a1be6: mov rdi, r15
0x1001a1be9: call 0x100093a90 ; 0x100093a90
0x1001a1bee: cmp eax, -1
0x1001a1bf1: je 0x1001a1c04
0x1001a1bf3: mov rdi, r15
0x1001a1bf6: mov esi, eax
0x1001a1bf8: call 0x10009e090 ; 0x10009e090
0x1001a1bfd: mov qword ptr [rbx + 0x3e8], rax
0x1001a1c04: lea rsi, [rip + 0x9d60be] ; 0x100b77cc9 R_wingTip1
0x1001a1c0b: xor edx, edx
0x1001a1c0d: mov ecx, 1
0x1001a1c12: mov rdi, r15
0x1001a1c15: call 0x100093a90 ; 0x100093a90
0x1001a1c1a: cmp eax, -1
0x1001a1c1d: je 0x1001a1c30
0x1001a1c1f: mov rdi, r15
0x1001a1c22: mov esi, eax
0x1001a1c24: call 0x10009e090 ; 0x10009e090
0x1001a1c29: mov qword ptr [rbx + 0x3f0], rax
0x1001a1c30: lea rsi, [rip + 0x9d609d] ; 0x100b77cd4 L_shoulderRoot
0x1001a1c37: xor edx, edx
0x1001a1c39: mov ecx, 1
0x1001a1c3e: mov rdi, r15
0x1001a1c41: call 0x100093a90 ; 0x100093a90
0x1001a1c46: cmp eax, -1
0x1001a1c49: je 0x1001a1c5c
0x1001a1c4b: mov rdi, r15
0x1001a1c4e: mov esi, eax
0x1001a1c50: call 0x10009e090 ; 0x10009e090
0x1001a1c55: mov qword ptr [rbx + 0x3f8], rax
0x1001a1c5c: lea rsi, [rip + 0x9d6080] ; 0x100b77ce3 L_wingTip
0x1001a1c63: xor edx, edx
0x1001a1c65: mov ecx, 1
0x1001a1c6a: mov rdi, r15
0x1001a1c6d: call 0x100093a90 ; 0x100093a90
0x1001a1c72: cmp eax, -1
0x1001a1c75: je 0x1001a1c88
0x1001a1c77: mov rdi, r15
0x1001a1c7a: mov esi, eax
0x1001a1c7c: call 0x10009e090 ; 0x10009e090
0x1001a1c81: mov qword ptr [rbx + 0x400], rax
0x1001a1c88: lea rsi, [rip + 0x9d605e] ; 0x100b77ced L_wingMidA
0x1001a1c8f: xor edx, edx
0x1001a1c91: mov ecx, 1
0x1001a1c96: mov rdi, r15
0x1001a1c99: call 0x100093a90 ; 0x100093a90
0x1001a1c9e: cmp eax, -1
0x1001a1ca1: je 0x1001a1cb4
0x1001a1ca3: mov rdi, r15
0x1001a1ca6: mov esi, eax
0x1001a1ca8: call 0x10009e090 ; 0x10009e090
0x1001a1cad: mov qword ptr [rbx + 0x408], rax
0x1001a1cb4: lea rsi, [rip + 0x9d603d] ; 0x100b77cf8 L_wingTip1
0x1001a1cbb: xor edx, edx
0x1001a1cbd: mov ecx, 1
0x1001a1cc2: mov rdi, r15
0x1001a1cc5: call 0x100093a90 ; 0x100093a90
0x1001a1cca: cmp eax, -1
0x1001a1ccd: je 0x1001a1ce0
0x1001a1ccf: mov rdi, r15
0x1001a1cd2: mov esi, eax
0x1001a1cd4: call 0x10009e090 ; 0x10009e090
0x1001a1cd9: mov qword ptr [rbx + 0x410], rax
0x1001a1ce0: lea rsi, [rip + 0x9d601c] ; 0x100b77d03 M_tail7_Sim
0x1001a1ce7: xor edx, edx
0x1001a1ce9: mov ecx, 1
0x1001a1cee: mov rdi, r15
0x1001a1cf1: call 0x100093a90 ; 0x100093a90
0x1001a1cf6: cmp eax, -1
0x1001a1cf9: je 0x1001a1d0c
0x1001a1cfb: mov rdi, r15
0x1001a1cfe: mov esi, eax
0x1001a1d00: call 0x10009e090 ; 0x10009e090
0x1001a1d05: mov qword ptr [rbx + 0x418], rax
0x1001a1d0c: mov byte ptr [rbx + 0x3c8], 0
0x1001a1d13: mov rax, qword ptr [rbx + 0x78]
0x1001a1d17: cmp byte ptr [rax + 0x28], 0
0x1001a1d1b: je 0x1001a1dd1
0x1001a1d21: cmp qword ptr [rbx + 0x3f0], 0
0x1001a1d29: je 0x1001a1d4d
0x1001a1d2b: mov rdi, qword ptr [r14 + 0x3f0]
0x1001a1d32: call 0x10039a7f0 ; 0x10039a7f0
0x1001a1d37: mov qword ptr [rbx + 0x420], rax
0x1001a1d3e: mov dword ptr [rax + 0x54], 4
0x1001a1d45: lea rcx, [rbx + 8]
0x1001a1d49: mov qword ptr [rax + 0x70], rcx
0x1001a1d4d: cmp qword ptr [rbx + 0x3e8], 0
0x1001a1d55: je 0x1001a1d79
0x1001a1d57: mov rdi, qword ptr [r14 + 0x3f0]
0x1001a1d5e: call 0x10039a7f0 ; 0x10039a7f0
0x1001a1d63: mov qword ptr [rbx + 0x428], rax
0x1001a1d6a: mov dword ptr [rax + 0x54], 4
0x1001a1d71: lea rcx, [rbx + 8]
0x1001a1d75: mov qword ptr [rax + 0x70], rcx
0x1001a1d79: cmp qword ptr [rbx + 0x410], 0
0x1001a1d81: je 0x1001a1da5
0x1001a1d83: mov rdi, qword ptr [r14 + 0x3f0]
0x1001a1d8a: call 0x10039a7f0 ; 0x10039a7f0
0x1001a1d8f: mov qword ptr [rbx + 0x430], rax
0x1001a1d96: mov dword ptr [rax + 0x54], 4
0x1001a1d9d: lea rcx, [rbx + 8]
0x1001a1da1: mov qword ptr [rax + 0x70], rcx
0x1001a1da5: cmp qword ptr [rbx + 0x408], 0
0x1001a1dad: je 0x1001a1dd1
0x1001a1daf: mov rdi, qword ptr [r14 + 0x3f0]
0x1001a1db6: call 0x10039a7f0 ; 0x10039a7f0
0x1001a1dbb: mov qword ptr [rbx + 0x438], rax
0x1001a1dc2: mov dword ptr [rax + 0x54], 4
0x1001a1dc9: lea rcx, [rbx + 8]
0x1001a1dcd: mov qword ptr [rax + 0x70], rcx
0x1001a1dd1: mov rax, qword ptr [rbx + 0x78]
0x1001a1dd5: cmp byte ptr [rax + 0x3c], 0
0x1001a1dd9: je 0x1001a1e96
0x1001a1ddf: mov rsi, qword ptr [rbx + 0x3e0]
0x1001a1de6: test rsi, rsi
0x1001a1de9: je 0x1001a1e3f
0x1001a1deb: mov r15, qword ptr [r14 + 0x438]
0x1001a1df2: lea r12, [rbp - 0xb0]
0x1001a1df9: mov rdi, r12
0x1001a1dfc: call 0x1007f26b0 ; 0x1007f26b0
0x1001a1e01: mov rax, qword ptr [rip + 0x909888] ; 0x100aab690
0x1001a1e08: mov qword ptr [rbp - 0x90], rax
0x1001a1e0f: mov dword ptr [rbp - 0x88], 0xbf800000
0x1001a1e19: lea rax, [rip + 0x1c4d9f8] ; 0x101def818
0x1001a1e20: mov rcx, qword ptr [rax]
0x1001a1e23: lea rdx, [rbp - 0x90]
0x1001a1e2a: xor r8d, r8d
0x1001a1e2d: mov rdi, r15
0x1001a1e30: mov rsi, r12
0x1001a1e33: call 0x1002de940 ; 0x1002de940
0x1001a1e38: mov qword ptr [rbx + 0x448], rax
0x1001a1e3f: mov rsi, qword ptr [rbx + 0x400]
0x1001a1e46: test rsi, rsi
0x1001a1e49: je 0x1001a1e96
0x1001a1e4b: mov r15, qword ptr [r14 + 0x438]
0x1001a1e52: lea r12, [rbp - 0xa0]
0x1001a1e59: mov rdi, r12
0x1001a1e5c: call 0x1007f26b0 ; 0x1007f26b0
0x1001a1e61: mov rax, qword ptr [rip + 0x909828] ; 0x100aab690
0x1001a1e68: mov qword ptr [rbp - 0x80], rax
0x1001a1e6c: mov dword ptr [rbp - 0x78], 0xbf800000
0x1001a1e73: lea rax, [rip + 0x1c4d99e] ; 0x101def818
0x1001a1e7a: mov rcx, qword ptr [rax]
0x1001a1e7d: lea rdx, [rbp - 0x80]
0x1001a1e81: xor r8d, r8d
0x1001a1e84: mov rdi, r15
0x1001a1e87: mov rsi, r12
0x1001a1e8a: call 0x1002de940 ; 0x1002de940
0x1001a1e8f: mov qword ptr [rbx + 0x450], rax
0x1001a1e96: mov rax, qword ptr [rbx + 0x78]
0x1001a1e9a: cmp byte ptr [rax + 0x3e], 0
0x1001a1e9e: je 0x1001a1f66
0x1001a1ea4: cmp qword ptr [rbx + 0x3e8], 0
0x1001a1eac: je 0x1001a1f05
0x1001a1eae: mov r15, qword ptr [r14 + 0x2c8]
0x1001a1eb5: call 0x100327f70 ; 0x100327f70
0x1001a1eba: mov rdi, r15
0x1001a1ebd: mov rsi, rax
0x1001a1ec0: call 0x100327790 ; 0x100327790
0x1001a1ec5: mov qword ptr [rbp - 0x28], rax
0x1001a1ec9: call 0x100327e10 ; 0x100327e10
0x1001a1ece: mov r15, rax
0x1001a1ed1: mov qword ptr [rbp - 0x70], 0
0x1001a1ed9: call 0x100327f70 ; 0x100327f70
0x1001a1ede: mov r8, qword ptr [rax]
0x1001a1ee1: lea rsi, [rbp - 0x70]
0x1001a1ee5: lea rdx, [rbp - 0x28]
0x1001a1ee9: mov rdi, rax
0x1001a1eec: mov rcx, r15
0x1001a1eef: call qword ptr [r8 + 0x40]
0x1001a1ef3: mov rax, qword ptr [rbp - 0x70]
0x1001a1ef7: mov qword ptr [rbx + 0x458], rax
0x1001a1efe: mov dword ptr [rax + 0x58], 0x40e00000
0x1001a1f05: cmp qword ptr [rbx + 0x408], 0
0x1001a1f0d: je 0x1001a1f66
0x1001a1f0f: mov r15, qword ptr [r14 + 0x2c8]
0x1001a1f16: call 0x100327f70 ; 0x100327f70
0x1001a1f1b: mov rdi, r15
0x1001a1f1e: mov rsi, rax
0x1001a1f21: call 0x100327790 ; 0x100327790
0x1001a1f26: mov qword ptr [rbp - 0x28], rax
0x1001a1f2a: call 0x100327e10 ; 0x100327e10
0x1001a1f2f: mov r15, rax
0x1001a1f32: mov qword ptr [rbp - 0x70], 0
0x1001a1f3a: call 0x100327f70 ; 0x100327f70
0x1001a1f3f: mov r8, qword ptr [rax]
0x1001a1f42: lea rsi, [rbp - 0x70]
0x1001a1f46: lea rdx, [rbp - 0x28]
0x1001a1f4a: mov rdi, rax
0x1001a1f4d: mov rcx, r15
0x1001a1f50: call qword ptr [r8 + 0x40]
0x1001a1f54: mov rax, qword ptr [rbp - 0x70]
0x1001a1f58: mov qword ptr [rbx + 0x460], rax
0x1001a1f5f: mov dword ptr [rax + 0x58], 0x40e00000
0x1001a1f66: mov qword ptr [rbx + 0x500], 0
0x1001a1f71: mov dword ptr [rbx + 0x508], 0
0x1001a1f7b: mov rax, qword ptr [rbx + 0x78]
0x1001a1f7f: vmovss xmm0, dword ptr [rax + 0x34]
0x1001a1f84: vmovss dword ptr [rbp - 0x30], xmm0
0x1001a1f89: vmovss xmm0, dword ptr [rax + 0x38]
0x1001a1f8e: vmovss dword ptr [rbp - 0x2c], xmm0
0x1001a1f93: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a1f98: vcvtsi2ss xmm0, xmm3, eax
0x1001a1f9c: vmulss xmm0, xmm0, dword ptr [rip + 0x90514c] ; 0x100aa70f0
0x1001a1fa4: vmovss xmm1, dword ptr [rip + 0x903114] ; 0x100aa50c0
0x1001a1fac: vsubss xmm1, xmm1, xmm0
0x1001a1fb0: vmulss xmm1, xmm1, dword ptr [rbp - 0x30]
0x1001a1fb5: vmulss xmm0, xmm0, dword ptr [rbp - 0x2c]
0x1001a1fba: vaddss xmm0, xmm0, xmm1
0x1001a1fbe: vmovss dword ptr [rbx + 0x514], xmm0
0x1001a1fc6: movabs rax, 0x3f80000000000000
0x1001a1fd0: mov qword ptr [rbx + 0x50c], rax
0x1001a1fd7: mov byte ptr [rbx + 0x440], 0
0x1001a1fde: mov rax, qword ptr [r14 + 0x380]
0x1001a1fe5: mov ecx, dword ptr [rax + 0x210]
0x1001a1feb: cmp rcx, 0x40
0x1001a1fef: jae 0x1001a2036
0x1001a1ff1: cmp qword ptr [rax + rcx*8 + 0x10], 0
0x1001a1ff7: jne 0x1001a2055
0x1001a1ff9: lea edx, [rcx + 1]
0x1001a1ffc: mov dword ptr [rax + 0x210], edx
0x1001a2002: mov qword ptr [rax + rcx*8 + 0x10], rbx
0x1001a2007: add rsp, 0x90
0x1001a200e: pop rbx
0x1001a200f: pop r12
0x1001a2011: pop r14
0x1001a2013: pop r15
0x1001a2015: pop rbp
0x1001a2016: ret 
0x1001a2017: lea rdi, [rip + 0x9d5c5d] ; 0x100b77c7b m_model
0x1001a201e: lea rsi, [rip + 0x9d5c5e] ; 0x100b77c83 BirdV2.cpp
0x1001a2025: mov edx, 0x609
0x1001a202a: mov ecx, 3
0x1001a202f: call 0x1007e5f70 ; 0x1007e5f70
0x1001a2034: ud2 
0x1001a2036: lea rdi, [rip + 0x9d5ceb] ; 0x100b77d28 m_birdCount < kMaxBirdCount
0x1001a203d: lea rsi, [rip + 0x9d5c3f] ; 0x100b77c83 BirdV2.cpp
0x1001a2044: mov edx, 0x7c0
0x1001a2049: mov ecx, 3
0x1001a204e: call 0x1007e5f70 ; 0x1007e5f70
0x1001a2053: ud2 
0x1001a2055: lea rdi, [rip + 0x9d5ce8] ; 0x100b77d44 m_birds[ m_birdCount ] == nullptr
0x1001a205c: lea rsi, [rip + 0x9d5c20] ; 0x100b77c83 BirdV2.cpp
0x1001a2063: mov edx, 0x7c1
0x1001a2068: mov ecx, 3
0x1001a206d: call 0x1007e5f70 ; 0x1007e5f70
0x1001a2072: ud2 
0x1001a2074: nop word ptr cs:[rax + rax]
