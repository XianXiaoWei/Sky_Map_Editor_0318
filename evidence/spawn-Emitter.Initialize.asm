0x1002d9f10: push rbp
0x1002d9f11: mov rbp, rsp
0x1002d9f14: mov qword ptr [rdi + 0x198], r9
0x1002d9f1b: mov byte ptr [rdi + 0xb2], 1
0x1002d9f22: mov dword ptr [rdi + 0x1f0], edx
0x1002d9f28: vxorps xmm1, xmm1, xmm1
0x1002d9f2c: vcmpless xmm1, xmm0, xmm1
0x1002d9f31: vandnps xmm0, xmm1, xmm0
0x1002d9f35: vmovss dword ptr [rdi + 0xa8], xmm0
0x1002d9f3d: vmovss dword ptr [rdi + 0x1dc], xmm0
0x1002d9f45: vmovaps xmm0, xmmword ptr [rcx]
0x1002d9f49: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x1002d9f4e: vmovaps xmmword ptr [rdi + 0x130], xmm0
0x1002d9f56: vxorps xmm0, xmm0, xmm0
0x1002d9f5a: vmovaps xmmword ptr [rdi + 0x140], xmm0
0x1002d9f62: vmovaps xmm0, xmmword ptr [r8]
0x1002d9f67: vmulps xmm1, xmm0, xmm0
0x1002d9f6b: vmovshdup xmm2, xmm1
0x1002d9f6f: vaddss xmm2, xmm1, xmm2
0x1002d9f73: vpermilpd xmm1, xmm1, 1
0x1002d9f79: vaddss xmm1, xmm1, xmm2
0x1002d9f7d: vsqrtss xmm1, xmm1, xmm1
0x1002d9f81: vucomiss xmm1, dword ptr [rip + 0x7cd93b] ; 0x100aa78c4
0x1002d9f89: jbe 0x1002d9f95
0x1002d9f8b: vpermilps xmm1, xmm1, 0xc0
0x1002d9f91: vdivps xmm0, xmm0, xmm1
0x1002d9f95: vxorps xmm1, xmm0, xmmword ptr [rip + 0x7cd963] ; 0x100aa7900
0x1002d9f9d: vmulps xmm2, xmm0, xmm0
0x1002d9fa1: vmovshdup xmm3, xmm2
0x1002d9fa5: vaddss xmm3, xmm2, xmm3
0x1002d9fa9: vpermilpd xmm2, xmm2, 1
0x1002d9faf: vaddss xmm2, xmm2, xmm3
0x1002d9fb3: vsqrtss xmm2, xmm2, xmm2
0x1002d9fb7: vucomiss xmm2, dword ptr [rip + 0x7cd905] ; 0x100aa78c4
0x1002d9fbf: jbe 0x1002d9fcb
0x1002d9fc1: vpermilps xmm2, xmm2, 0xc0
0x1002d9fc7: vdivps xmm1, xmm1, xmm2
0x1002d9fcb: vmulps xmm1, xmm1, xmmword ptr [rip + 0x7d16bd] ; 0x100aab690
0x1002d9fd3: vmovshdup xmm2, xmm1
0x1002d9fd7: vaddss xmm2, xmm1, xmm2
0x1002d9fdb: vpermilpd xmm1, xmm1, 1
0x1002d9fe1: vaddss xmm1, xmm1, xmm2
0x1002d9fe5: vaddss xmm1, xmm1, dword ptr [rip + 0x7cb0d7] ; 0x100aa50c4
0x1002d9fed: vandps xmm1, xmm1, xmmword ptr [rip + 0x7cd91b] ; 0x100aa7910
0x1002d9ff5: vmovss xmm2, dword ptr [rip + 0x7cd8c7] ; 0x100aa78c4
0x1002d9ffd: vucomiss xmm2, xmm1
0x1002da001: jae 0x1002da073
0x1002da003: vmovaps xmm1, xmmword ptr [rip + 0x7d1685] ; 0x100aab690
0x1002da00b: vmulps xmm2, xmm0, xmm1
0x1002da00f: vmovshdup xmm3, xmm2
0x1002da013: vaddss xmm3, xmm2, xmm3
0x1002da017: vpermilpd xmm2, xmm2, 1
0x1002da01d: vaddss xmm2, xmm2, xmm3
0x1002da021: vmovss xmm3, dword ptr [rip + 0x7cb097] ; 0x100aa50c0
0x1002da029: vaddss xmm2, xmm2, xmm3
0x1002da02d: vaddss xmm2, xmm2, xmm2
0x1002da031: vsqrtss xmm2, xmm2, xmm2
0x1002da035: vdivss xmm3, xmm3, xmm2
0x1002da039: vmovss xmm4, dword ptr [rip + 0x7cb083] ; 0x100aa50c4
0x1002da041: vmulps xmm4, xmm0, xmm4
0x1002da045: vpermilps xmm0, xmm0, 0xd2
0x1002da04b: vmulps xmm0, xmm0, xmm1
0x1002da04f: vsubps xmm0, xmm4, xmm0
0x1002da053: vpermilps xmm0, xmm0, 0xd2
0x1002da059: vpermilps xmm1, xmm3, 0xc0
0x1002da05f: vmulps xmm0, xmm0, xmm1
0x1002da063: vmulss xmm1, xmm2, dword ptr [rip + 0x7ca54d] ; 0x100aa45b8
0x1002da06b: vinsertps xmm0, xmm0, xmm1, 0x30
0x1002da071: jmp 0x1002da07b ; 0x1002da07b
0x1002da073: vmovaps xmm0, xmmword ptr [rip + 0x7d1625] ; 0x100aab6a0
0x1002da07b: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x1002da080: vpermilps xmm2, xmm0, 0xe7
0x1002da086: vucomiss xmm2, xmm2
0x1002da08a: jp 0x1002da1b6
0x1002da090: vmovshdup xmm3, xmm0
0x1002da094: vucomiss xmm0, xmm3
0x1002da098: jp 0x1002da1b6
0x1002da09e: vpermilpd xmm4, xmm0, 1
0x1002da0a4: vucomiss xmm4, xmm4
0x1002da0a8: jp 0x1002da1b6
0x1002da0ae: mov al, byte ptr [rbp + 0x10]
0x1002da0b1: vxorps xmm8, xmm8, xmm8
0x1002da0b6: vmulss xmm5, xmm2, xmm8
0x1002da0bb: vsubss xmm6, xmm5, xmm3
0x1002da0bf: vmulss xmm7, xmm4, xmm8
0x1002da0c4: vsubss xmm6, xmm6, xmm7
0x1002da0c8: vaddss xmm5, xmm5, xmm7
0x1002da0cc: vaddss xmm10, xmm0, xmm5
0x1002da0d0: vmulss xmm7, xmm0, xmm8
0x1002da0d5: vsubss xmm9, xmm7, xmm2
0x1002da0d9: vmulss xmm1, xmm3, xmm8
0x1002da0de: vsubss xmm5, xmm9, xmm1
0x1002da0e2: vaddss xmm1, xmm7, xmm1
0x1002da0e6: vsubss xmm1, xmm1, xmm4
0x1002da0ea: vmulss xmm9, xmm0, xmm1
0x1002da0ee: vmulss xmm7, xmm2, xmm6
0x1002da0f2: vaddss xmm9, xmm9, xmm7
0x1002da0f6: vmulss xmm7, xmm4, xmm10
0x1002da0fb: vsubss xmm9, xmm9, xmm7
0x1002da0ff: vmulss xmm7, xmm3, xmm5
0x1002da103: vaddss xmm9, xmm7, xmm9
0x1002da108: vmulss xmm11, xmm3, xmm1
0x1002da10c: vmulss xmm7, xmm2, xmm10
0x1002da111: vaddss xmm11, xmm11, xmm7
0x1002da115: vmulss xmm7, xmm0, xmm5
0x1002da119: vsubss xmm11, xmm11, xmm7
0x1002da11d: vmulss xmm7, xmm4, xmm6
0x1002da121: vaddss xmm7, xmm7, xmm11
0x1002da126: vmulss xmm1, xmm4, xmm1
0x1002da12a: vmulss xmm2, xmm2, xmm5
0x1002da12e: vaddss xmm1, xmm1, xmm2
0x1002da132: vmulss xmm2, xmm3, xmm6
0x1002da136: vsubss xmm1, xmm1, xmm2
0x1002da13a: vmulss xmm0, xmm0, xmm10
0x1002da13f: vaddss xmm0, xmm0, xmm1
0x1002da143: vinsertps xmm1, xmm9, xmm7, 0x10
0x1002da149: vinsertps xmm0, xmm1, xmm0, 0x20
0x1002da14f: vmovaps xmmword ptr [rdi + 0x150], xmm0
0x1002da157: mov byte ptr [rdi + 0xad], al
0x1002da15d: mov dword ptr [rdi + 0x1ec], 0
0x1002da167: mov byte ptr [rdi + 0xb0], 1
0x1002da16e: mov byte ptr [rdi + 0xac], 1
0x1002da175: mov byte ptr [rdi + 0x18b], 0
0x1002da17c: mov qword ptr [rdi + 0x1a0], rsi
0x1002da183: vmovaps xmm0, xmmword ptr [rdi + 0x40]
0x1002da188: vmulps xmm0, xmm0, xmm0
0x1002da18c: vmovshdup xmm1, xmm0
0x1002da190: vaddss xmm1, xmm0, xmm1
0x1002da194: vpermilpd xmm0, xmm0, 1
0x1002da19a: vaddss xmm0, xmm0, xmm1
0x1002da19e: vucomiss xmm0, xmm8
0x1002da1a3: jne 0x1002da1b4
0x1002da1a5: jp 0x1002da1b4
0x1002da1a7: vmovaps xmm0, xmmword ptr [rip + 0x7d0711] ; 0x100aaa8c0
0x1002da1af: vmovaps xmmword ptr [rdi + 0x40], xmm0
0x1002da1b4: pop rbp
0x1002da1b5: ret 
0x1002da1b6: lea rdi, [rip + 0x89a2b9] ; 0x100b74476 !isNan( quat )
0x1002da1bd: lea rsi, [rip + 0x89a2c1] ; 0x100b74485 ./Emitter.h
0x1002da1c4: mov edx, 0x26
0x1002da1c9: mov ecx, 3
0x1002da1ce: call 0x1007e5f70 ; 0x1007e5f70
0x1002da1d3: ud2 
0x1002da1d5: nop word ptr cs:[rax + rax]
