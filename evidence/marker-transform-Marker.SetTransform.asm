0x10043ccd0: vmovaps xmm0, xmmword ptr [rsi]
0x10043ccd4: vpermilps xmm1, xmm0, 0xe7
0x10043ccda: vucomiss xmm1, xmm1
0x10043ccde: jp 0x10043cfc4
0x10043cce4: vmovshdup xmm1, xmm0
0x10043cce8: vucomiss xmm0, xmm1
0x10043ccec: jp 0x10043cfc4
0x10043ccf2: vpermilpd xmm0, xmm0, 1
0x10043ccf8: vucomiss xmm0, xmm0
0x10043ccfc: jp 0x10043cfc4
0x10043cd02: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x10043cd07: vpermilps xmm1, xmm0, 0xe7
0x10043cd0d: vucomiss xmm1, xmm1
0x10043cd11: jp 0x10043cfc4
0x10043cd17: vmovshdup xmm1, xmm0
0x10043cd1b: vucomiss xmm0, xmm1
0x10043cd1f: jp 0x10043cfc4
0x10043cd25: vpermilpd xmm0, xmm0, 1
0x10043cd2b: vucomiss xmm0, xmm0
0x10043cd2f: jp 0x10043cfc4
0x10043cd35: vmovaps xmm0, xmmword ptr [rsi + 0x20]
0x10043cd3a: vpermilps xmm1, xmm0, 0xe7
0x10043cd40: vucomiss xmm1, xmm1
0x10043cd44: jp 0x10043cfc4
0x10043cd4a: vmovshdup xmm1, xmm0
0x10043cd4e: vucomiss xmm0, xmm1
0x10043cd52: jp 0x10043cfc4
0x10043cd58: vpermilpd xmm0, xmm0, 1
0x10043cd5e: vucomiss xmm0, xmm0
0x10043cd62: jp 0x10043cfc4
0x10043cd68: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x10043cd6d: vpermilps xmm1, xmm0, 0xe7
0x10043cd73: vucomiss xmm1, xmm1
0x10043cd77: jp 0x10043cfc4
0x10043cd7d: vmovshdup xmm1, xmm0
0x10043cd81: vucomiss xmm0, xmm1
0x10043cd85: jp 0x10043cfc4
0x10043cd8b: vpermilpd xmm1, xmm0, 1
0x10043cd91: vucomiss xmm1, xmm1
0x10043cd95: jp 0x10043cfc4
0x10043cd9b: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x10043cda0: vmovaps xmm2, xmmword ptr [rsi]
0x10043cda4: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x10043cda9: vmovaps xmm1, xmmword ptr [rsi + 0x20]
0x10043cdae: vmulps xmm3, xmm2, xmm2
0x10043cdb2: vmovshdup xmm4, xmm3
0x10043cdb6: vaddss xmm4, xmm3, xmm4
0x10043cdba: vpermilpd xmm3, xmm3, 1
0x10043cdc0: vaddss xmm3, xmm3, xmm4
0x10043cdc4: vsqrtss xmm3, xmm3, xmm3
0x10043cdc8: vmovss dword ptr [rdi + 0x30], xmm3
0x10043cdcd: vucomiss xmm3, dword ptr [rip + 0x66aaef] ; 0x100aa78c4
0x10043cdd5: jbe 0x10043cde1
0x10043cdd7: vpermilps xmm3, xmm3, 0xc0
0x10043cddd: vdivps xmm2, xmm2, xmm3
0x10043cde1: vmulps xmm3, xmm0, xmm0
0x10043cde5: vmovshdup xmm4, xmm3
0x10043cde9: vaddss xmm4, xmm3, xmm4
0x10043cded: vpermilpd xmm3, xmm3, 1
0x10043cdf3: vaddss xmm3, xmm3, xmm4
0x10043cdf7: vsqrtss xmm3, xmm3, xmm3
0x10043cdfb: vmovss dword ptr [rdi + 0x34], xmm3
0x10043ce00: vucomiss xmm3, dword ptr [rip + 0x66aabc] ; 0x100aa78c4
0x10043ce08: jbe 0x10043ce14
0x10043ce0a: vpermilps xmm3, xmm3, 0xc0
0x10043ce10: vdivps xmm0, xmm0, xmm3
0x10043ce14: vmulps xmm3, xmm1, xmm1
0x10043ce18: vmovshdup xmm4, xmm3
0x10043ce1c: vaddss xmm4, xmm3, xmm4
0x10043ce20: vpermilpd xmm3, xmm3, 1
0x10043ce26: vaddss xmm3, xmm3, xmm4
0x10043ce2a: vsqrtss xmm3, xmm3, xmm3
0x10043ce2e: vmovss dword ptr [rdi + 0x38], xmm3
0x10043ce33: vucomiss xmm3, dword ptr [rip + 0x66aa89] ; 0x100aa78c4
0x10043ce3b: jbe 0x10043ce47
0x10043ce3d: vpermilps xmm3, xmm3, 0xc0
0x10043ce43: vdivps xmm1, xmm1, xmm3
0x10043ce47: vpermilpd xmm3, xmm2, 1
0x10043ce4d: vmovshdup xmm4, xmm0
0x10043ce51: vmovshdup xmm9, xmm1
0x10043ce55: vpermilpd xmm5, xmm1, 1
0x10043ce5b: vaddss xmm6, xmm2, xmm4
0x10043ce5f: vaddss xmm6, xmm6, xmm5
0x10043ce63: vxorps xmm7, xmm7, xmm7
0x10043ce67: vucomiss xmm7, xmm6
0x10043ce6b: seta sil
0x10043ce6f: vucomiss xmm5, xmm2
0x10043ce73: seta dl
0x10043ce76: vucomiss xmm5, xmm4
0x10043ce7a: seta r9b
0x10043ce7e: vucomiss xmm4, xmm2
0x10043ce82: setbe al
0x10043ce85: seta r8b
0x10043ce89: or r8b, dl
0x10043ce8c: or al, r9b
0x10043ce8f: vmovaps xmm7, xmmword ptr [rip + 0x66aa69] ; 0x100aa7900
0x10043ce97: mov ecx, r8d
0x10043ce9a: and cl, sil
0x10043ce9d: jne 0x10043cea5
0x10043ce9f: vmovaps xmm8, xmm2
0x10043cea3: jmp 0x10043cead ; 0x10043cead
0x10043cea5: vxorps xmm8, xmm2, xmm7
0x10043cea9: vxorps xmm9, xmm9, xmm7
0x10043cead: and dl, r9b
0x10043ceb0: vxorpd xmm10, xmm3, xmm7
0x10043ceb4: and al, sil
0x10043ceb7: je 0x10043cebd
0x10043ceb9: vxorps xmm4, xmm4, xmm7
0x10043cebd: xor dl, 1
0x10043cec0: test al, al
0x10043cec2: jne 0x10043cec8
0x10043cec4: vmovapd xmm10, xmm3
0x10043cec8: vmovshdup xmm2, xmm2
0x10043cecc: vpermilpd xmm3, xmm0, 1
0x10043ced2: and dl, sil
0x10043ced5: je 0x10043cedf
0x10043ced7: vxorps xmm5, xmm5, xmm7
0x10043cedb: vxorps xmm0, xmm0, xmm7
0x10043cedf: vaddss xmm4, xmm8, xmm4
0x10043cee3: vaddss xmm4, xmm5, xmm4
0x10043cee7: vmovss xmm5, dword ptr [rip + 0x6681d1] ; 0x100aa50c0
0x10043ceef: vaddss xmm7, xmm4, xmm5
0x10043cef3: vsqrtss xmm4, xmm7, xmm7
0x10043cef7: vdivss xmm4, xmm5, xmm4
0x10043cefb: vmulss xmm6, xmm4, dword ptr [rip + 0x6676b5] ; 0x100aa45b8
0x10043cf03: vsubss xmm3, xmm3, xmm9
0x10043cf08: vmulss xmm3, xmm6, xmm3
0x10043cf0c: vsubss xmm1, xmm1, xmm10
0x10043cf11: vmulss xmm4, xmm6, xmm1
0x10043cf15: vsubss xmm0, xmm2, xmm0
0x10043cf19: vmulss xmm5, xmm6, xmm0
0x10043cf1d: vmulss xmm0, xmm6, xmm7
0x10043cf21: jne 0x10043cf41
0x10043cf23: vmovaps xmm1, xmm4
0x10043cf27: vmovaps xmm2, xmm0
0x10043cf2b: mov eax, r8d
0x10043cf2e: and al, sil
0x10043cf31: je 0x10043cf55
0x10043cf33: vmovaps xmm4, xmm2
0x10043cf37: vmovaps xmm2, xmm5
0x10043cf3b: test dl, dl
0x10043cf3d: je 0x10043cf5d
0x10043cf3f: jmp 0x10043cf61 ; 0x10043cf61
0x10043cf41: vmovaps xmm1, xmm5
0x10043cf45: vmovaps xmm5, xmm4
0x10043cf49: vmovaps xmm2, xmm3
0x10043cf4d: mov eax, r8d
0x10043cf50: and al, sil
0x10043cf53: jne 0x10043cf33
0x10043cf55: vmovaps xmm4, xmm5
0x10043cf59: test dl, dl
0x10043cf5b: jne 0x10043cf61
0x10043cf5d: vmovaps xmm0, xmm3
0x10043cf61: vmovaps xmm3, xmm0
0x10043cf65: and r8b, sil
0x10043cf68: je 0x10043cfb9
0x10043cf6a: test r8b, r8b
0x10043cf6d: jne 0x10043cf73
0x10043cf6f: vmovaps xmm1, xmm0
0x10043cf73: vinsertps xmm0, xmm1, xmm3, 0x10
0x10043cf79: vinsertps xmm0, xmm0, xmm4, 0x20
0x10043cf7f: vinsertps xmm0, xmm0, xmm2, 0x30
0x10043cf85: vmulps xmm1, xmm0, xmm0
0x10043cf89: vpermilpd xmm2, xmm1, 1
0x10043cf8f: vaddps xmm1, xmm1, xmm2
0x10043cf93: vmovshdup xmm2, xmm1
0x10043cf97: vaddss xmm1, xmm1, xmm2
0x10043cf9b: vsqrtss xmm1, xmm1, xmm1
0x10043cf9f: vucomiss xmm1, dword ptr [rip + 0x66a91d] ; 0x100aa78c4
0x10043cfa7: jbe 0x10043cfb3
0x10043cfa9: vpermilps xmm1, xmm1, 0
0x10043cfaf: vdivps xmm0, xmm0, xmm1
0x10043cfb3: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x10043cfb8: ret 
0x10043cfb9: vmovaps xmm3, xmm1
0x10043cfbd: test r8b, r8b
0x10043cfc0: je 0x10043cf6f
0x10043cfc2: jmp 0x10043cf73 ; 0x10043cf73
0x10043cfc4: push rbp
0x10043cfc5: mov rbp, rsp
0x10043cfc8: lea rdi, [rip + 0x748ce1] ; 0x100b85cb0 !isNan( mat )
0x10043cfcf: lea rsi, [rip + 0x74baaf] ; 0x100b88a85 Marker.cpp
0x10043cfd6: mov edx, 0x4e
0x10043cfdb: mov ecx, 3
0x10043cfe0: call 0x1007e5f70 ; 0x1007e5f70
0x10043cfe5: ud2 
0x10043cfe7: nop word ptr [rax + rax]
