0x1002585e0: push rbp
0x1002585e1: mov rbp, rsp
0x1002585e4: push r14
0x1002585e6: push rbx
0x1002585e7: mov r14, rcx
0x1002585ea: mov rbx, rdi
0x1002585ed: mov qword ptr [rbx + 0x10], rsi
0x1002585f1: mov dword ptr [rbx + 0x1cc], 0
0x1002585fb: mov dword ptr [rbx + 0x90], 0
0x100258605: mov dword ptr [rbx + 0x50], 0
0x10025860c: vxorps xmm0, xmm0, xmm0
0x100258610: vmovups xmmword ptr [rbx + 0x18], xmm0
0x100258615: vmovups xmmword ptr [rbx + 0x58], xmm0
0x10025861a: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x10025861f: mov dword ptr [rbx + 0x80], 0
0x100258629: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x10025862e: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x100258633: mov dword ptr [rbx + 0x40], edx
0x100258636: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10025863b: vcvtsi2ss xmm0, xmm1, eax
0x10025863f: vmulss xmm0, xmm0, dword ptr [rip + 0x84eaa9] ; 0x100aa70f0
0x100258647: vmovss dword ptr [rbx + 0x94], xmm0
0x10025864f: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100258654: vcvtsi2ss xmm0, xmm1, eax
0x100258658: vmulss xmm0, xmm0, dword ptr [rip + 0x84ea90] ; 0x100aa70f0
0x100258660: vmovss dword ptr [rbx + 0x98], xmm0
0x100258668: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10025866d: vcvtsi2ss xmm0, xmm1, eax
0x100258671: vmulss xmm0, xmm0, dword ptr [rip + 0x84ea77] ; 0x100aa70f0
0x100258679: vmovss dword ptr [rbx + 0x9c], xmm0
0x100258681: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100258686: vcvtsi2ss xmm0, xmm1, eax
0x10025868a: vmulss xmm0, xmm0, dword ptr [rip + 0x84ea5e] ; 0x100aa70f0
0x100258692: vmovss dword ptr [rbx + 0xa0], xmm0
0x10025869a: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10025869f: vcvtsi2ss xmm0, xmm1, eax
0x1002586a3: vmulss xmm0, xmm0, dword ptr [rip + 0x84ea45] ; 0x100aa70f0
0x1002586ab: vmovss dword ptr [rbx + 0xa4], xmm0
0x1002586b3: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1002586b8: vcvtsi2ss xmm0, xmm1, eax
0x1002586bc: vmulss xmm0, xmm0, dword ptr [rip + 0x84ea2c] ; 0x100aa70f0
0x1002586c4: vmovss dword ptr [rbx + 0xa8], xmm0
0x1002586cc: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1002586d1: vcvtsi2ss xmm0, xmm1, eax
0x1002586d5: vmulss xmm0, xmm0, dword ptr [rip + 0x84ea13] ; 0x100aa70f0
0x1002586dd: vmovss dword ptr [rbx + 0xac], xmm0
0x1002586e5: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1002586ea: vcvtsi2ss xmm0, xmm1, eax
0x1002586ee: vmulss xmm0, xmm0, dword ptr [rip + 0x84e9fa] ; 0x100aa70f0
0x1002586f6: vmovss dword ptr [rbx + 0xb0], xmm0
0x1002586fe: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100258703: vcvtsi2ss xmm0, xmm1, eax
0x100258707: vmulss xmm0, xmm0, dword ptr [rip + 0x84e9e1] ; 0x100aa70f0
0x10025870f: vmovss dword ptr [rbx + 0xb4], xmm0
0x100258717: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10025871c: vcvtsi2ss xmm0, xmm1, eax
0x100258720: vmulss xmm0, xmm0, dword ptr [rip + 0x84e9c8] ; 0x100aa70f0
0x100258728: vmovss dword ptr [rbx + 0xb8], xmm0
0x100258730: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100258735: vcvtsi2ss xmm0, xmm1, eax
0x100258739: vmulss xmm0, xmm0, dword ptr [rip + 0x84e9af] ; 0x100aa70f0
0x100258741: vmovss dword ptr [rbx + 0xbc], xmm0
0x100258749: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10025874e: vcvtsi2ss xmm0, xmm1, eax
0x100258752: vmulss xmm0, xmm0, dword ptr [rip + 0x84e996] ; 0x100aa70f0
0x10025875a: vmovss dword ptr [rbx + 0xc0], xmm0
0x100258762: add rbx, 0x1d0
0x100258769: mov rcx, qword ptr [r14 + 0x138]
0x100258770: mov rsi, qword ptr [r14 + 0x220]
0x100258777: mov rdx, qword ptr [r14 + 0x398]
0x10025877e: mov rdi, rbx
0x100258781: pop rbx
0x100258782: pop r14
0x100258784: pop rbp
0x100258785: jmp 0x10062e5b0 ; 0x10062e5b0
0x10025878a: nop word ptr [rax + rax]
