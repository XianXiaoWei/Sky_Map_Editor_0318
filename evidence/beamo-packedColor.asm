0x10077d390: push rbp
0x10077d391: mov rbp, rsp
0x10077d394: vmovapd xmm0, xmmword ptr [rdi]
0x10077d398: vpermilpd xmm1, xmm0, 1
0x10077d39e: vmaxss xmm2, xmm1, xmm0
0x10077d3a2: vcmpunordss xmm3, xmm0, xmm0
0x10077d3a7: vblendvps xmm2, xmm2, xmm1, xmm3
0x10077d3ad: vmovshdup xmm3, xmm0
0x10077d3b1: vcmpunordss xmm4, xmm2, xmm2
0x10077d3b6: vmaxss xmm2, xmm3, xmm2
0x10077d3ba: vblendvps xmm2, xmm2, xmm3, xmm4
0x10077d3c0: vmovss xmm4, dword ptr [rip + 0x327cf8] ; 0x100aa50c0
0x10077d3c8: vmaxss xmm5, xmm4, xmm2
0x10077d3cc: vcmpunordss xmm2, xmm2, xmm2
0x10077d3d1: vandnps xmm5, xmm2, xmm5
0x10077d3d5: vandps xmm2, xmm2, xmm4
0x10077d3d9: vorps xmm2, xmm5, xmm2
0x10077d3dd: vdivss xmm0, xmm0, xmm2
0x10077d3e1: vsqrtss xmm0, xmm0, xmm0
0x10077d3e5: vmovss xmm5, dword ptr [rip + 0x32a8d7] ; 0x100aa7cc4
0x10077d3ed: vmulss xmm0, xmm0, xmm5
0x10077d3f1: vxorps xmm6, xmm6, xmm6
0x10077d3f5: vmaxss xmm0, xmm6, xmm0
0x10077d3f9: vminss xmm0, xmm5, xmm0
0x10077d3fd: vcvttss2si eax, xmm0
0x10077d401: vdivss xmm0, xmm3, xmm2
0x10077d405: vsqrtss xmm0, xmm0, xmm0
0x10077d409: vmulss xmm0, xmm0, xmm5
0x10077d40d: vmaxss xmm0, xmm6, xmm0
0x10077d411: vminss xmm0, xmm5, xmm0
0x10077d415: vcvttss2si ecx, xmm0
0x10077d419: vdivss xmm0, xmm1, xmm2
0x10077d41d: vsqrtss xmm0, xmm0, xmm0
0x10077d421: vmulss xmm0, xmm0, xmm5
0x10077d425: vmaxss xmm0, xmm6, xmm0
0x10077d429: vminss xmm0, xmm5, xmm0
0x10077d42d: vcvttss2si edx, xmm0
0x10077d431: vdivss xmm0, xmm4, xmm2
0x10077d435: vmulss xmm0, xmm0, xmm5
0x10077d439: vmaxss xmm0, xmm4, xmm0
0x10077d43d: vminss xmm0, xmm5, xmm0
0x10077d441: vcvttss2si esi, xmm0
0x10077d445: shl esi, 0x18
0x10077d448: movzx edx, dl
0x10077d44b: shl edx, 0x10
0x10077d44e: movzx ecx, cl
0x10077d451: shl ecx, 8
0x10077d454: movzx eax, al
0x10077d457: or eax, esi
0x10077d459: or eax, ecx
0x10077d45b: or eax, edx
0x10077d45d: pop rbp
0x10077d45e: ret 
0x10077d45f: nop 
