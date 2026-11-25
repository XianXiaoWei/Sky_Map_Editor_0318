0x100715760: push rbp
0x100715761: mov rbp, rsp
0x100715764: push r14
0x100715766: push rbx
0x100715767: mov rbx, rdi
0x10071576a: lea r14, [rbx + 0x10]
0x10071576e: mov esi, 0x280
0x100715773: mov rdi, r14
0x100715776: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10071577b: xor eax, eax
0x10071577d: call 0x100011c10 ; 0x100011c10
0x100715782: lea rax, [rbx + 0x288]
0x100715789: mov qword ptr [rbx + 0x288], 0
0x100715794: lea rcx, [rbx + 0x280]
0x10071579b: mov qword ptr [rbx + 0x280], rax
0x1007157a2: lea rax, [rbx + 0x278]
0x1007157a9: mov qword ptr [rbx + 0x278], rcx
0x1007157b0: lea rcx, [rbx + 0x270]
0x1007157b7: mov qword ptr [rbx + 0x270], rax
0x1007157be: lea rax, [rbx + 0x268]
0x1007157c5: lea rdx, [rbx + 0x260]
0x1007157cc: lea rsi, [rbx + 0x258]
0x1007157d3: vmovq xmm0, rcx
0x1007157d8: vmovq xmm1, rax
0x1007157dd: vpunpcklqdq xmm0, xmm1, xmm0
0x1007157e1: vmovq xmm1, rdx
0x1007157e6: vmovq xmm2, rsi
0x1007157eb: vpunpcklqdq xmm1, xmm2, xmm1
0x1007157ef: vinsertf128 ymm0, ymm1, xmm0, 1
0x1007157f5: lea rax, [rbx + 0x250]
0x1007157fc: vmovups ymmword ptr [rbx + 0x250], ymm0
0x100715804: lea rcx, [rbx + 0x248]
0x10071580b: lea rdx, [rbx + 0x240]
0x100715812: lea rsi, [rbx + 0x238]
0x100715819: vmovq xmm0, rax
0x10071581e: vmovq xmm1, rcx
0x100715823: vpunpcklqdq xmm0, xmm1, xmm0
0x100715827: vmovq xmm1, rdx
0x10071582c: vmovq xmm2, rsi
0x100715831: vpunpcklqdq xmm1, xmm2, xmm1
0x100715835: vinsertf128 ymm0, ymm1, xmm0, 1
0x10071583b: lea rax, [rbx + 0x230]
0x100715842: vmovups ymmword ptr [rbx + 0x230], ymm0
0x10071584a: lea rcx, [rbx + 0x228]
0x100715851: lea rdx, [rbx + 0x220]
0x100715858: lea rsi, [rbx + 0x218]
0x10071585f: vmovq xmm0, rax
0x100715864: vmovq xmm1, rcx
0x100715869: vpunpcklqdq xmm0, xmm1, xmm0
0x10071586d: vmovq xmm1, rdx
0x100715872: vmovq xmm2, rsi
0x100715877: vpunpcklqdq xmm1, xmm2, xmm1
0x10071587b: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715881: lea rax, [rbx + 0x210]
0x100715888: vmovups ymmword ptr [rbx + 0x210], ymm0
0x100715890: lea rcx, [rbx + 0x208]
0x100715897: lea rdx, [rbx + 0x200]
0x10071589e: lea rsi, [rbx + 0x1f8]
0x1007158a5: vmovq xmm0, rax
0x1007158aa: vmovq xmm1, rcx
0x1007158af: vpunpcklqdq xmm0, xmm1, xmm0
0x1007158b3: vmovq xmm1, rdx
0x1007158b8: vmovq xmm2, rsi
0x1007158bd: vpunpcklqdq xmm1, xmm2, xmm1
0x1007158c1: vinsertf128 ymm0, ymm1, xmm0, 1
0x1007158c7: lea rax, [rbx + 0x1f0]
0x1007158ce: vmovups ymmword ptr [rbx + 0x1f0], ymm0
0x1007158d6: lea rcx, [rbx + 0x1e8]
0x1007158dd: lea rdx, [rbx + 0x1e0]
0x1007158e4: lea rsi, [rbx + 0x1d8]
0x1007158eb: vmovq xmm0, rax
0x1007158f0: vmovq xmm1, rcx
0x1007158f5: vpunpcklqdq xmm0, xmm1, xmm0
0x1007158f9: vmovq xmm1, rdx
0x1007158fe: vmovq xmm2, rsi
0x100715903: vpunpcklqdq xmm1, xmm2, xmm1
0x100715907: vinsertf128 ymm0, ymm1, xmm0, 1
0x10071590d: lea rax, [rbx + 0x1d0]
0x100715914: vmovups ymmword ptr [rbx + 0x1d0], ymm0
0x10071591c: lea rcx, [rbx + 0x1c8]
0x100715923: lea rdx, [rbx + 0x1c0]
0x10071592a: lea rsi, [rbx + 0x1b8]
0x100715931: vmovq xmm0, rax
0x100715936: vmovq xmm1, rcx
0x10071593b: vpunpcklqdq xmm0, xmm1, xmm0
0x10071593f: vmovq xmm1, rdx
0x100715944: vmovq xmm2, rsi
0x100715949: vpunpcklqdq xmm1, xmm2, xmm1
0x10071594d: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715953: lea rax, [rbx + 0x1b0]
0x10071595a: vmovups ymmword ptr [rbx + 0x1b0], ymm0
0x100715962: lea rcx, [rbx + 0x1a8]
0x100715969: lea rdx, [rbx + 0x1a0]
0x100715970: lea rsi, [rbx + 0x198]
0x100715977: vmovq xmm0, rax
0x10071597c: vmovq xmm1, rcx
0x100715981: vpunpcklqdq xmm0, xmm1, xmm0
0x100715985: vmovq xmm1, rdx
0x10071598a: vmovq xmm2, rsi
0x10071598f: vpunpcklqdq xmm1, xmm2, xmm1
0x100715993: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715999: lea rax, [rbx + 0x190]
0x1007159a0: vmovups ymmword ptr [rbx + 0x190], ymm0
0x1007159a8: lea rcx, [rbx + 0x188]
0x1007159af: lea rdx, [rbx + 0x180]
0x1007159b6: lea rsi, [rbx + 0x178]
0x1007159bd: vmovq xmm0, rax
0x1007159c2: vmovq xmm1, rcx
0x1007159c7: vpunpcklqdq xmm0, xmm1, xmm0
0x1007159cb: vmovq xmm1, rdx
0x1007159d0: vmovq xmm2, rsi
0x1007159d5: vpunpcklqdq xmm1, xmm2, xmm1
0x1007159d9: vinsertf128 ymm0, ymm1, xmm0, 1
0x1007159df: lea rax, [rbx + 0x170]
0x1007159e6: vmovups ymmword ptr [rbx + 0x170], ymm0
0x1007159ee: lea rcx, [rbx + 0x168]
0x1007159f5: lea rdx, [rbx + 0x160]
0x1007159fc: lea rsi, [rbx + 0x158]
0x100715a03: vmovq xmm0, rax
0x100715a08: vmovq xmm1, rcx
0x100715a0d: vpunpcklqdq xmm0, xmm1, xmm0
0x100715a11: vmovq xmm1, rdx
0x100715a16: vmovq xmm2, rsi
0x100715a1b: vpunpcklqdq xmm1, xmm2, xmm1
0x100715a1f: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715a25: lea rax, [rbx + 0x150]
0x100715a2c: vmovups ymmword ptr [rbx + 0x150], ymm0
0x100715a34: lea rcx, [rbx + 0x148]
0x100715a3b: lea rdx, [rbx + 0x140]
0x100715a42: lea rsi, [rbx + 0x138]
0x100715a49: vmovq xmm0, rax
0x100715a4e: vmovq xmm1, rcx
0x100715a53: vpunpcklqdq xmm0, xmm1, xmm0
0x100715a57: vmovq xmm1, rdx
0x100715a5c: vmovq xmm2, rsi
0x100715a61: vpunpcklqdq xmm1, xmm2, xmm1
0x100715a65: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715a6b: lea rax, [rbx + 0x130]
0x100715a72: vmovups ymmword ptr [rbx + 0x130], ymm0
0x100715a7a: lea rcx, [rbx + 0x128]
0x100715a81: lea rdx, [rbx + 0x120]
0x100715a88: lea rsi, [rbx + 0x118]
0x100715a8f: vmovq xmm0, rax
0x100715a94: vmovq xmm1, rcx
0x100715a99: vpunpcklqdq xmm0, xmm1, xmm0
0x100715a9d: vmovq xmm1, rdx
0x100715aa2: vmovq xmm2, rsi
0x100715aa7: vpunpcklqdq xmm1, xmm2, xmm1
0x100715aab: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715ab1: lea rax, [rbx + 0x110]
0x100715ab8: vmovups ymmword ptr [rbx + 0x110], ymm0
0x100715ac0: lea rcx, [rbx + 0x108]
0x100715ac7: lea rdx, [rbx + 0x100]
0x100715ace: lea rsi, [rbx + 0xf8]
0x100715ad5: vmovq xmm0, rax
0x100715ada: vmovq xmm1, rcx
0x100715adf: vpunpcklqdq xmm0, xmm1, xmm0
0x100715ae3: vmovq xmm1, rdx
0x100715ae8: vmovq xmm2, rsi
0x100715aed: vpunpcklqdq xmm1, xmm2, xmm1
0x100715af1: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715af7: lea rax, [rbx + 0xf0]
0x100715afe: vmovups ymmword ptr [rbx + 0xf0], ymm0
0x100715b06: lea rcx, [rbx + 0xe8]
0x100715b0d: lea rdx, [rbx + 0xe0]
0x100715b14: lea rsi, [rbx + 0xd8]
0x100715b1b: vmovq xmm0, rax
0x100715b20: vmovq xmm1, rcx
0x100715b25: vpunpcklqdq xmm0, xmm1, xmm0
0x100715b29: vmovq xmm1, rdx
0x100715b2e: vmovq xmm2, rsi
0x100715b33: vpunpcklqdq xmm1, xmm2, xmm1
0x100715b37: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715b3d: lea rax, [rbx + 0xd0]
0x100715b44: vmovups ymmword ptr [rbx + 0xd0], ymm0
0x100715b4c: lea rcx, [rbx + 0xc8]
0x100715b53: lea rdx, [rbx + 0xc0]
0x100715b5a: lea rsi, [rbx + 0xb8]
0x100715b61: vmovq xmm0, rax
0x100715b66: vmovq xmm1, rcx
0x100715b6b: vpunpcklqdq xmm0, xmm1, xmm0
0x100715b6f: vmovq xmm1, rdx
0x100715b74: vmovq xmm2, rsi
0x100715b79: vpunpcklqdq xmm1, xmm2, xmm1
0x100715b7d: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715b83: lea rax, [rbx + 0xb0]
0x100715b8a: vmovups ymmword ptr [rbx + 0xb0], ymm0
0x100715b92: lea rcx, [rbx + 0xa8]
0x100715b99: lea rdx, [rbx + 0xa0]
0x100715ba0: lea rsi, [rbx + 0x98]
0x100715ba7: vmovq xmm0, rax
0x100715bac: vmovq xmm1, rcx
0x100715bb1: vpunpcklqdq xmm0, xmm1, xmm0
0x100715bb5: vmovq xmm1, rdx
0x100715bba: vmovq xmm2, rsi
0x100715bbf: vpunpcklqdq xmm1, xmm2, xmm1
0x100715bc3: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715bc9: lea rax, [rbx + 0x90]
0x100715bd0: vmovups ymmword ptr [rbx + 0x90], ymm0
0x100715bd8: lea rcx, [rbx + 0x88]
0x100715bdf: mov rdx, rbx
0x100715be2: sub rdx, -0x80
0x100715be6: lea rsi, [rbx + 0x78]
0x100715bea: vmovq xmm0, rax
0x100715bef: vmovq xmm1, rcx
0x100715bf4: vpunpcklqdq xmm0, xmm1, xmm0
0x100715bf8: vmovq xmm1, rdx
0x100715bfd: vmovq xmm2, rsi
0x100715c02: vpunpcklqdq xmm1, xmm2, xmm1
0x100715c06: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715c0c: lea rax, [rbx + 0x70]
0x100715c10: vmovups ymmword ptr [rbx + 0x70], ymm0
0x100715c15: lea rcx, [rbx + 0x68]
0x100715c19: lea rdx, [rbx + 0x60]
0x100715c1d: lea rsi, [rbx + 0x58]
0x100715c21: vmovq xmm0, rax
0x100715c26: vmovq xmm1, rcx
0x100715c2b: vpunpcklqdq xmm0, xmm1, xmm0
0x100715c2f: vmovq xmm1, rdx
0x100715c34: vmovq xmm2, rsi
0x100715c39: vpunpcklqdq xmm1, xmm2, xmm1
0x100715c3d: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715c43: lea rax, [rbx + 0x50]
0x100715c47: vmovups ymmword ptr [rbx + 0x50], ymm0
0x100715c4c: lea rcx, [rbx + 0x48]
0x100715c50: lea rdx, [rbx + 0x40]
0x100715c54: lea rsi, [rbx + 0x38]
0x100715c58: vmovq xmm0, rax
0x100715c5d: vmovq xmm1, rcx
0x100715c62: vpunpcklqdq xmm0, xmm1, xmm0
0x100715c66: vmovq xmm1, rdx
0x100715c6b: vmovq xmm2, rsi
0x100715c70: vpunpcklqdq xmm1, xmm2, xmm1
0x100715c74: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715c7a: lea rax, [rbx + 0x30]
0x100715c7e: vmovups ymmword ptr [rbx + 0x30], ymm0
0x100715c83: lea rcx, [rbx + 0x28]
0x100715c87: lea rdx, [rbx + 0x20]
0x100715c8b: lea rsi, [rbx + 0x18]
0x100715c8f: vmovq xmm0, rax
0x100715c94: vmovq xmm1, rcx
0x100715c99: vpunpcklqdq xmm0, xmm1, xmm0
0x100715c9d: vmovq xmm1, rdx
0x100715ca2: vmovq xmm2, rsi
0x100715ca7: vpunpcklqdq xmm1, xmm2, xmm1
0x100715cab: vinsertf128 ymm0, ymm1, xmm0, 1
0x100715cb1: vmovups ymmword ptr [rbx + 0x10], ymm0
0x100715cb6: mov qword ptr [rbx + 0x290], r14
0x100715cbd: pop rbx
0x100715cbe: pop r14
0x100715cc0: pop rbp
0x100715cc1: vzeroupper 
0x100715cc4: ret 
0x100715cc5: nop word ptr cs:[rax + rax]
