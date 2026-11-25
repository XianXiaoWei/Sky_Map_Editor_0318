0x100414530: push rbp
0x100414531: mov rbp, rsp
0x100414534: push r14
0x100414536: push rbx
0x100414537: sub rsp, 0x10
0x10041453b: mov rbx, rsi
0x10041453e: mov r14, rdi
0x100414541: call 0x10077d390 ; 0x10077d390
0x100414546: mov dword ptr [rbx], eax
0x100414548: vmovss xmm3, dword ptr [rip + 0x693774] ; 0x100aa7cc4
0x100414550: vmulss xmm0, xmm3, dword ptr [r14 + 0x20]
0x100414556: vmovss xmm2, dword ptr [rip + 0x69005a] ; 0x100aa45b8
0x10041455e: vaddss xmm0, xmm0, xmm2
0x100414562: vxorps xmm1, xmm1, xmm1
0x100414566: vmaxss xmm0, xmm1, xmm0
0x10041456a: vminss xmm0, xmm3, xmm0
0x10041456e: vcvttss2si eax, xmm0
0x100414572: mov byte ptr [rbx + 4], al
0x100414575: vsqrtss xmm0, xmm4, dword ptr [r14 + 0x24]
0x10041457b: vmulss xmm0, xmm0, xmm3
0x10041457f: vaddss xmm0, xmm0, xmm2
0x100414583: vmaxss xmm0, xmm1, xmm0
0x100414587: vminss xmm0, xmm3, xmm0
0x10041458b: vcvttss2si eax, xmm0
0x10041458f: mov byte ptr [rbx + 5], al
0x100414592: vmovss xmm0, dword ptr [r14 + 0x28]
0x100414598: vmulss xmm0, xmm0, dword ptr [rip + 0x69903c] ; 0x100aad5dc
0x1004145a0: vmovss xmm1, dword ptr [rip + 0x6979a8] ; 0x100aabf50
0x1004145a8: vcmpunordss xmm2, xmm0, xmm0
0x1004145ad: vandps xmm3, xmm2, xmm1
0x1004145b1: vmaxss xmm0, xmm1, xmm0
0x1004145b5: vandnps xmm0, xmm2, xmm0
0x1004145b9: vorps xmm0, xmm0, xmm3
0x1004145bd: lea rdi, [rbp - 0x14]
0x1004145c1: call 0x100aa2786 ; 0x100aa2786 _frexpf
0x1004145c6: vmovss xmm2, dword ptr [rip + 0x6936f6] ; 0x100aa7cc4
0x1004145ce: vmulss xmm0, xmm0, xmm2
0x1004145d2: mov eax, 0x80
0x1004145d7: add eax, dword ptr [rbp - 0x14]
0x1004145da: mov byte ptr [rbx + 6], al
0x1004145dd: vmovss xmm3, dword ptr [rip + 0x68ffd3] ; 0x100aa45b8
0x1004145e5: vaddss xmm0, xmm0, xmm3
0x1004145e9: vxorps xmm4, xmm4, xmm4
0x1004145ed: vmaxss xmm0, xmm4, xmm0
0x1004145f1: vminss xmm0, xmm2, xmm0
0x1004145f5: vcvttss2si eax, xmm0
0x1004145f9: mov byte ptr [rbx + 7], al
0x1004145fc: vmovaps xmm0, xmmword ptr [r14 + 0x10]
0x100414602: vmulss xmm1, xmm0, xmm3
0x100414606: vaddss xmm1, xmm1, xmm3
0x10041460a: vmulss xmm1, xmm1, xmm2
0x10041460e: vaddss xmm1, xmm1, xmm3
0x100414612: vmaxss xmm1, xmm4, xmm1
0x100414616: vminss xmm1, xmm2, xmm1
0x10041461a: vcvttss2si eax, xmm1
0x10041461e: mov byte ptr [rbx + 8], al
0x100414621: vmovshdup xmm1, xmm0
0x100414625: vmulss xmm1, xmm1, xmm3
0x100414629: vaddss xmm1, xmm1, xmm3
0x10041462d: vmulss xmm1, xmm1, xmm2
0x100414631: vaddss xmm1, xmm1, xmm3
0x100414635: vmaxss xmm1, xmm4, xmm1
0x100414639: vminss xmm1, xmm2, xmm1
0x10041463d: vcvttss2si eax, xmm1
0x100414641: mov byte ptr [rbx + 9], al
0x100414644: vpermilpd xmm0, xmm0, 1
0x10041464a: vmulss xmm0, xmm0, xmm3
0x10041464e: vaddss xmm0, xmm0, xmm3
0x100414652: vmulss xmm0, xmm0, xmm2
0x100414656: vaddss xmm0, xmm0, xmm3
0x10041465a: vmaxss xmm0, xmm4, xmm0
0x10041465e: vxorps xmm1, xmm1, xmm1
0x100414662: vminss xmm0, xmm2, xmm0
0x100414666: vcvttss2si eax, xmm0
0x10041466a: mov byte ptr [rbx + 0xa], al
0x10041466d: vmulss xmm0, xmm2, dword ptr [r14 + 0x2c]
0x100414673: vaddss xmm0, xmm0, xmm3
0x100414677: vmaxss xmm0, xmm1, xmm0
0x10041467b: vminss xmm0, xmm2, xmm0
0x10041467f: vcvttss2si eax, xmm0
0x100414683: mov byte ptr [rbx + 0xb], al
0x100414686: add rsp, 0x10
0x10041468a: pop rbx
0x10041468b: pop r14
0x10041468d: pop rbp
0x10041468e: ret 
0x10041468f: nop 
