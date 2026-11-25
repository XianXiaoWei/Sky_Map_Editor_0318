0x1006c39a0: push rbp
0x1006c39a1: mov rbp, rsp
0x1006c39a4: push r15
0x1006c39a6: push r14
0x1006c39a8: push r12
0x1006c39aa: push rbx
0x1006c39ab: mov r12, rdi
0x1006c39ae: call 0x1007abc10 ; 0x1007abc10
0x1006c39b3: mov rax, qword ptr [rip + 0x19720fe] ; 0x102035ab8
0x1006c39ba: mov eax, dword ptr [rax + 0x38]
0x1006c39bd: mov dword ptr [r12], eax
0x1006c39c1: lea r15, [r12 + 0x20]
0x1006c39c6: vxorps xmm0, xmm0, xmm0
0x1006c39ca: vmovups xmmword ptr [r12 + 0x20], xmm0
0x1006c39d1: mov qword ptr [r12 + 0x30], 0
0x1006c39da: mov ebx, 0x488
0x1006c39df: nop 
0x1006c39e0: call 0x1007abc10 ; 0x1007abc10
0x1006c39e5: mov rax, qword ptr [rip + 0x197206c] ; 0x102035a58
0x1006c39ec: mov eax, dword ptr [rax + 0x38]
0x1006c39ef: mov dword ptr [r12 + rbx], eax
0x1006c39f3: add rbx, 0x18
0x1006c39f7: cmp rbx, 0x1088
0x1006c39fe: jne 0x1006c39e0
0x1006c3a00: mov dword ptr [r12 + 0x18], 0x38d1b717
0x1006c3a09: mov word ptr [r12 + 0x1c], 0
0x1006c3a11: mov qword ptr [r12 + 0x108c], 0
0x1006c3a1d: mov byte ptr [r12 + 0x1088], 0
0x1006c3a26: mov word ptr [r12 + 0x1095], 0
0x1006c3a31: mov dword ptr [r12 + 0x480], 0
0x1006c3a3d: vmovq xmm0, r12
0x1006c3a42: vpshufd xmm0, xmm0, 0x44
0x1006c3a47: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413a01] ; 0x100ad7450
0x1006c3a4f: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413a09] ; 0x100ad7460
0x1006c3a57: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413a11] ; 0x100ad7470
0x1006c3a5f: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413a19] ; 0x100ad7480
0x1006c3a67: vmovdqu xmmword ptr [r12 + 0x80], xmm1
0x1006c3a71: vmovdqu xmmword ptr [r12 + 0x90], xmm2
0x1006c3a7b: vmovdqu xmmword ptr [r12 + 0xa0], xmm3
0x1006c3a85: vmovdqu xmmword ptr [r12 + 0xb0], xmm4
0x1006c3a8f: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x4139f9] ; 0x100ad7490
0x1006c3a97: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413a01] ; 0x100ad74a0
0x1006c3a9f: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413a09] ; 0x100ad74b0
0x1006c3aa7: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413a11] ; 0x100ad74c0
0x1006c3aaf: vmovdqu xmmword ptr [r12 + 0xc0], xmm1
0x1006c3ab9: vmovdqu xmmword ptr [r12 + 0xd0], xmm2
0x1006c3ac3: vmovdqu xmmword ptr [r12 + 0xe0], xmm3
0x1006c3acd: vmovdqu xmmword ptr [r12 + 0xf0], xmm4
0x1006c3ad7: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x4139f1] ; 0x100ad74d0
0x1006c3adf: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x4139f9] ; 0x100ad74e0
0x1006c3ae7: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413a01] ; 0x100ad74f0
0x1006c3aef: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413a09] ; 0x100ad7500
0x1006c3af7: vmovdqu xmmword ptr [r12 + 0x100], xmm1
0x1006c3b01: vmovdqu xmmword ptr [r12 + 0x110], xmm2
0x1006c3b0b: vmovdqu xmmword ptr [r12 + 0x120], xmm3
0x1006c3b15: vmovdqu xmmword ptr [r12 + 0x130], xmm4
0x1006c3b1f: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x4139e9] ; 0x100ad7510
0x1006c3b27: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x4139f1] ; 0x100ad7520
0x1006c3b2f: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x4139f9] ; 0x100ad7530
0x1006c3b37: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413a01] ; 0x100ad7540
0x1006c3b3f: vmovdqu xmmword ptr [r12 + 0x140], xmm1
0x1006c3b49: vmovdqu xmmword ptr [r12 + 0x150], xmm2
0x1006c3b53: vmovdqu xmmword ptr [r12 + 0x160], xmm3
0x1006c3b5d: vmovdqu xmmword ptr [r12 + 0x170], xmm4
0x1006c3b67: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x4139e1] ; 0x100ad7550
0x1006c3b6f: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x4139e9] ; 0x100ad7560
0x1006c3b77: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x4139f1] ; 0x100ad7570
0x1006c3b7f: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x4139f9] ; 0x100ad7580
0x1006c3b87: vmovdqu xmmword ptr [r12 + 0x180], xmm1
0x1006c3b91: vmovdqu xmmword ptr [r12 + 0x190], xmm2
0x1006c3b9b: vmovdqu xmmword ptr [r12 + 0x1a0], xmm3
0x1006c3ba5: vmovdqu xmmword ptr [r12 + 0x1b0], xmm4
0x1006c3baf: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x4139d9] ; 0x100ad7590
0x1006c3bb7: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x4139e1] ; 0x100ad75a0
0x1006c3bbf: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x4139e9] ; 0x100ad75b0
0x1006c3bc7: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x4139f1] ; 0x100ad75c0
0x1006c3bcf: vmovdqu xmmword ptr [r12 + 0x1c0], xmm1
0x1006c3bd9: vmovdqu xmmword ptr [r12 + 0x1d0], xmm2
0x1006c3be3: vmovdqu xmmword ptr [r12 + 0x1e0], xmm3
0x1006c3bed: vmovdqu xmmword ptr [r12 + 0x1f0], xmm4
0x1006c3bf7: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x4139d1] ; 0x100ad75d0
0x1006c3bff: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x4139d9] ; 0x100ad75e0
0x1006c3c07: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x4139e1] ; 0x100ad75f0
0x1006c3c0f: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x4139e9] ; 0x100ad7600
0x1006c3c17: vmovdqu xmmword ptr [r12 + 0x200], xmm1
0x1006c3c21: vmovdqu xmmword ptr [r12 + 0x210], xmm2
0x1006c3c2b: vmovdqu xmmword ptr [r12 + 0x220], xmm3
0x1006c3c35: vmovdqu xmmword ptr [r12 + 0x230], xmm4
0x1006c3c3f: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x4139c9] ; 0x100ad7610
0x1006c3c47: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x4139d1] ; 0x100ad7620
0x1006c3c4f: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x4139d9] ; 0x100ad7630
0x1006c3c57: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x4139e1] ; 0x100ad7640
0x1006c3c5f: vmovdqu xmmword ptr [r12 + 0x240], xmm1
0x1006c3c69: vmovdqu xmmword ptr [r12 + 0x250], xmm2
0x1006c3c73: vmovdqu xmmword ptr [r12 + 0x260], xmm3
0x1006c3c7d: vmovdqu xmmword ptr [r12 + 0x270], xmm4
0x1006c3c87: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x4139c1] ; 0x100ad7650
0x1006c3c8f: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x4139c9] ; 0x100ad7660
0x1006c3c97: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x4139d1] ; 0x100ad7670
0x1006c3c9f: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x4139d9] ; 0x100ad7680
0x1006c3ca7: vmovdqu xmmword ptr [r12 + 0x280], xmm1
0x1006c3cb1: vmovdqu xmmword ptr [r12 + 0x290], xmm2
0x1006c3cbb: vmovdqu xmmword ptr [r12 + 0x2a0], xmm3
0x1006c3cc5: vmovdqu xmmword ptr [r12 + 0x2b0], xmm4
0x1006c3ccf: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x4139b9] ; 0x100ad7690
0x1006c3cd7: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x4139c1] ; 0x100ad76a0
0x1006c3cdf: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x4139c9] ; 0x100ad76b0
0x1006c3ce7: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x4139d1] ; 0x100ad76c0
0x1006c3cef: vmovdqu xmmword ptr [r12 + 0x2c0], xmm1
0x1006c3cf9: vmovdqu xmmword ptr [r12 + 0x2d0], xmm2
0x1006c3d03: vmovdqu xmmword ptr [r12 + 0x2e0], xmm3
0x1006c3d0d: vmovdqu xmmword ptr [r12 + 0x2f0], xmm4
0x1006c3d17: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x4139b1] ; 0x100ad76d0
0x1006c3d1f: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x4139b9] ; 0x100ad76e0
0x1006c3d27: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x4139c1] ; 0x100ad76f0
0x1006c3d2f: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x4139c9] ; 0x100ad7700
0x1006c3d37: vmovdqu xmmword ptr [r12 + 0x300], xmm1
0x1006c3d41: vmovdqu xmmword ptr [r12 + 0x310], xmm2
0x1006c3d4b: vmovdqu xmmword ptr [r12 + 0x320], xmm3
0x1006c3d55: vmovdqu xmmword ptr [r12 + 0x330], xmm4
0x1006c3d5f: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x4139a9] ; 0x100ad7710
0x1006c3d67: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x4139b1] ; 0x100ad7720
0x1006c3d6f: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x4139b9] ; 0x100ad7730
0x1006c3d77: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x4139c1] ; 0x100ad7740
0x1006c3d7f: vmovdqu xmmword ptr [r12 + 0x340], xmm1
0x1006c3d89: vmovdqu xmmword ptr [r12 + 0x350], xmm2
0x1006c3d93: vmovdqu xmmword ptr [r12 + 0x360], xmm3
0x1006c3d9d: vmovdqu xmmword ptr [r12 + 0x370], xmm4
0x1006c3da7: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x4139a1] ; 0x100ad7750
0x1006c3daf: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x4139a9] ; 0x100ad7760
0x1006c3db7: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x4139b1] ; 0x100ad7770
0x1006c3dbf: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x4139b9] ; 0x100ad7780
0x1006c3dc7: vmovdqu xmmword ptr [r12 + 0x380], xmm1
0x1006c3dd1: vmovdqu xmmword ptr [r12 + 0x390], xmm2
0x1006c3ddb: vmovdqu xmmword ptr [r12 + 0x3a0], xmm3
0x1006c3de5: vmovdqu xmmword ptr [r12 + 0x3b0], xmm4
0x1006c3def: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413999] ; 0x100ad7790
0x1006c3df7: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x4139a1] ; 0x100ad77a0
0x1006c3dff: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x4139a9] ; 0x100ad77b0
0x1006c3e07: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x4139b1] ; 0x100ad77c0
0x1006c3e0f: vmovdqu xmmword ptr [r12 + 0x3c0], xmm1
0x1006c3e19: vmovdqu xmmword ptr [r12 + 0x3d0], xmm2
0x1006c3e23: vmovdqu xmmword ptr [r12 + 0x3e0], xmm3
0x1006c3e2d: vmovdqu xmmword ptr [r12 + 0x3f0], xmm4
0x1006c3e37: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413991] ; 0x100ad77d0
0x1006c3e3f: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413999] ; 0x100ad77e0
0x1006c3e47: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x4139a1] ; 0x100ad77f0
0x1006c3e4f: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x4139a9] ; 0x100ad7800
0x1006c3e57: vmovdqu xmmword ptr [r12 + 0x400], xmm1
0x1006c3e61: vmovdqu xmmword ptr [r12 + 0x410], xmm2
0x1006c3e6b: vmovdqu xmmword ptr [r12 + 0x420], xmm3
0x1006c3e75: vmovdqu xmmword ptr [r12 + 0x430], xmm4
0x1006c3e7f: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413989] ; 0x100ad7810
0x1006c3e87: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413991] ; 0x100ad7820
0x1006c3e8f: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413999] ; 0x100ad7830
0x1006c3e97: vpaddq xmm0, xmm0, xmmword ptr [rip + 0x4139a1] ; 0x100ad7840
0x1006c3e9f: vmovdqu xmmword ptr [r12 + 0x440], xmm1
0x1006c3ea9: vmovdqu xmmword ptr [r12 + 0x450], xmm2
0x1006c3eb3: vmovdqu xmmword ptr [r12 + 0x460], xmm3
0x1006c3ebd: vmovdqu xmmword ptr [r12 + 0x470], xmm0
0x1006c3ec7: pop rbx
0x1006c3ec8: pop r12
0x1006c3eca: pop r14
0x1006c3ecc: pop r15
0x1006c3ece: pop rbp
0x1006c3ecf: ret 
0x1006c3ed0: mov r14, rax
0x1006c3ed3: test byte ptr [r15], 1
0x1006c3ed7: je 0x1006c3eee
0x1006c3ed9: mov rbx, qword ptr [r12 + 0x30]
0x1006c3ede: call 0x1007e50d0 ; 0x1007e50d0
0x1006c3ee3: mov rdi, rax
0x1006c3ee6: mov rsi, rbx
0x1006c3ee9: call 0x1007e5db0 ; 0x1007e5db0
0x1006c3eee: mov rdi, r14
0x1006c3ef1: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006c3ef6: mov rdi, rax
0x1006c3ef9: call 0x100011bf0 ; 0x100011bf0
0x1006c3efe: nop 
