0x1003ffe10: push rbp
0x1003ffe11: mov rbp, rsp
0x1003ffe14: vmovaps xmm0, xmmword ptr [rsi]
0x1003ffe18: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x1003ffe1d: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x1003ffe22: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x1003ffe27: vmovaps xmm0, xmmword ptr [rsi + 0x20]
0x1003ffe2c: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x1003ffe31: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x1003ffe36: vmovaps xmmword ptr [rdi + 0x40], xmm0
0x1003ffe3b: mov rdi, qword ptr [rdi + 0x228]
0x1003ffe42: test rdi, rdi
0x1003ffe45: je 0x1003ffe4d
0x1003ffe47: pop rbp
0x1003ffe48: jmp 0x100463750 ; 0x100463750
0x1003ffe4d: pop rbp
0x1003ffe4e: ret 
0x1003ffe4f: nop 
