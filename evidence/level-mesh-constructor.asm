0x1004003b0: push rbp
0x1004003b1: mov rbp, rsp
0x1004003b4: push r15
0x1004003b6: push r14
0x1004003b8: push r13
0x1004003ba: push r12
0x1004003bc: push rbx
0x1004003bd: sub rsp, 0x58
0x1004003c1: mov rbx, rdi
0x1004003c4: call 0x1007abc10 ; 0x1007abc10
0x1004003c9: mov eax, dword ptr [rax + 0x38]
0x1004003cc: mov dword ptr [rbx + 8], eax
0x1004003cf: call 0x10074a170 ; 0x10074a170
0x1004003d4: mov eax, dword ptr [rax + 0x38]
0x1004003d7: mov dword ptr [rbx + 8], eax
0x1004003da: mov rax, qword ptr [rip + 0x80d28f] ; 0x100c0d670
0x1004003e1: add rax, 0x10
0x1004003e5: mov qword ptr [rbx], rax
0x1004003e8: call 0x100407ab0 ; 0x100407ab0
0x1004003ed: mov rax, qword ptr [rip + 0x1c015b4] ; 0x1020019a8
0x1004003f4: mov eax, dword ptr [rax + 0x38]
0x1004003f7: mov dword ptr [rbx + 8], eax
0x1004003fa: lea rax, [rip + 0x81656f] ; 0x100c16970 P*@
0x100400401: mov qword ptr [rbx], rax
0x100400404: vxorps xmm1, xmm1, xmm1
0x100400408: vmovups xmmword ptr [rbx + 0x58], xmm1
0x10040040d: mov qword ptr [rbx + 0x68], 0
0x100400415: mov byte ptr [rbx + 0x71], 1
0x100400419: mov dword ptr [rbx + 0x74], 0x3f800000
0x100400420: mov byte ptr [rbx + 0x78], 1
0x100400424: mov byte ptr [rbx + 0xb1], 0
0x10040042b: vxorps ymm0, ymm0, ymm0
0x10040042f: vmovups ymmword ptr [rbx + 0x90], ymm0
0x100400437: vmovups ymmword ptr [rbx + 0x80], ymm0
0x10040043f: mov word ptr [rbx + 0xb2], 1
0x100400448: mov byte ptr [rbx + 0xb4], 0
0x10040044f: vmovups xmmword ptr [rbx + 0xb8], xmm1
0x100400457: mov qword ptr [rbx + 0xc8], 0
0x100400462: mov byte ptr [rbx + 0xd9], 0
0x100400469: mov byte ptr [rbx + 0xe4], 0
0x100400470: mov byte ptr [rbx + 0xe5], 0
0x100400477: mov dword ptr [rbx + 0xe8], 0x3f800000
0x100400481: mov dword ptr [rbx + 0xec], 0x3f800000
0x10040048b: mov byte ptr [rbx + 0xf0], 0
0x100400492: mov byte ptr [rbx + 0xf1], 0
0x100400499: mov byte ptr [rbx + 0xf8], 0
0x1004004a0: mov byte ptr [rbx + 0xf9], 0
0x1004004a7: mov dword ptr [rbx + 0xfc], 0xc11cf5c3
0x1004004b1: mov dword ptr [rbx + 0x100], 0x447a0000
0x1004004bb: mov byte ptr [rbx + 0x105], 1
0x1004004c2: mov byte ptr [rbx + 0x108], 0
0x1004004c9: mov byte ptr [rbx + 0x109], 0
0x1004004d0: vmovups xmmword ptr [rbx + 0x148], xmm1
0x1004004d8: mov qword ptr [rbx + 0x158], 0
0x1004004e3: vmovups ymmword ptr [rbx + 0x124], ymm0
0x1004004eb: vmovups ymmword ptr [rbx + 0x110], ymm0
0x1004004f3: mov byte ptr [rbx + 0x168], 1
0x1004004fa: mov rax, qword ptr [rip + 0x6aba5f] ; 0x100aabf60
0x100400501: mov qword ptr [rbx + 0x180], rax
0x100400508: mov dword ptr [rbx + 0x188], 0xbf800000
0x100400512: mov dword ptr [rbx + 0x220], 0
0x10040051c: vzeroupper 
0x10040051f: call 0x1007abc10 ; 0x1007abc10
0x100400524: mov rax, qword ptr [rip + 0x1c0141d] ; 0x102001948
0x10040052b: mov eax, dword ptr [rax + 0x38]
0x10040052e: mov dword ptr [rbx + 0x230], eax
0x100400534: vxorps xmm0, xmm0, xmm0
0x100400538: vmovups xmmword ptr [rbx + 0x238], xmm0
0x100400540: mov qword ptr [rbx + 0x248], 0
0x10040054b: vmovups xmmword ptr [rbx + 0x270], xmm0
0x100400553: mov qword ptr [rbx + 0x280], 0
0x10040055e: lea r15, [rbx + 0x2b0]
0x100400565: mov qword ptr [rbp - 0x80], r15
0x100400569: call 0x1007abc10 ; 0x1007abc10
0x10040056e: mov rax, qword ptr [rip + 0x1c013d3] ; 0x102001948
0x100400575: mov eax, dword ptr [rax + 0x38]
0x100400578: mov dword ptr [rbx + 0x2b0], eax
0x10040057e: vxorps xmm0, xmm0, xmm0
0x100400582: vmovups xmmword ptr [rbx + 0x2b8], xmm0
0x10040058a: mov qword ptr [rbx + 0x2c8], 0
0x100400595: vmovups xmmword ptr [rbx + 0x2f0], xmm0
0x10040059d: mov qword ptr [rbx + 0x300], 0
0x1004005a8: lea r15, [rbx + 0x330]
0x1004005af: mov qword ptr [rbp - 0x78], r15
0x1004005b3: call 0x1007abc10 ; 0x1007abc10
0x1004005b8: mov rax, qword ptr [rip + 0x1c01389] ; 0x102001948
0x1004005bf: mov eax, dword ptr [rax + 0x38]
0x1004005c2: mov dword ptr [rbx + 0x330], eax
0x1004005c8: vxorps xmm0, xmm0, xmm0
0x1004005cc: vmovups xmmword ptr [rbx + 0x338], xmm0
0x1004005d4: mov qword ptr [rbx + 0x348], 0
0x1004005df: vmovups xmmword ptr [rbx + 0x370], xmm0
0x1004005e7: mov qword ptr [rbx + 0x380], 0
0x1004005f2: lea r15, [rbx + 0x3b0]
0x1004005f9: mov qword ptr [rbp - 0x70], r15
0x1004005fd: call 0x1007abc10 ; 0x1007abc10
0x100400602: mov rax, qword ptr [rip + 0x1c0133f] ; 0x102001948
0x100400609: mov eax, dword ptr [rax + 0x38]
0x10040060c: mov dword ptr [rbx + 0x3b0], eax
0x100400612: vxorps xmm0, xmm0, xmm0
0x100400616: vmovups xmmword ptr [rbx + 0x3b8], xmm0
0x10040061e: mov qword ptr [rbx + 0x3c8], 0
0x100400629: vmovups xmmword ptr [rbx + 0x3f0], xmm0
0x100400631: mov qword ptr [rbx + 0x400], 0
0x10040063c: lea r15, [rbx + 0x430]
0x100400643: mov qword ptr [rbp - 0x68], r15
0x100400647: call 0x1007abc10 ; 0x1007abc10
0x10040064c: mov rax, qword ptr [rip + 0x1c012f5] ; 0x102001948
0x100400653: mov eax, dword ptr [rax + 0x38]
0x100400656: mov dword ptr [rbx + 0x430], eax
0x10040065c: vxorps xmm0, xmm0, xmm0
0x100400660: vmovups xmmword ptr [rbx + 0x438], xmm0
0x100400668: mov qword ptr [rbx + 0x448], 0
0x100400673: vmovups xmmword ptr [rbx + 0x470], xmm0
0x10040067b: mov qword ptr [rbx + 0x480], 0
0x100400686: lea r15, [rbx + 0x4b0]
0x10040068d: mov qword ptr [rbp - 0x60], r15
0x100400691: call 0x1007abc10 ; 0x1007abc10
0x100400696: mov rax, qword ptr [rip + 0x1c012ab] ; 0x102001948
0x10040069d: mov eax, dword ptr [rax + 0x38]
0x1004006a0: mov dword ptr [rbx + 0x4b0], eax
0x1004006a6: vxorps xmm0, xmm0, xmm0
0x1004006aa: vmovups xmmword ptr [rbx + 0x4b8], xmm0
0x1004006b2: mov qword ptr [rbx + 0x4c8], 0
0x1004006bd: vmovups xmmword ptr [rbx + 0x4f0], xmm0
0x1004006c5: mov qword ptr [rbx + 0x500], 0
0x1004006d0: lea r15, [rbx + 0x530]
0x1004006d7: mov qword ptr [rbp - 0x58], r15
0x1004006db: call 0x1007abc10 ; 0x1007abc10
0x1004006e0: mov rax, qword ptr [rip + 0x1c01261] ; 0x102001948
0x1004006e7: mov eax, dword ptr [rax + 0x38]
0x1004006ea: mov dword ptr [rbx + 0x530], eax
0x1004006f0: vxorps xmm0, xmm0, xmm0
0x1004006f4: vmovups xmmword ptr [rbx + 0x538], xmm0
0x1004006fc: mov qword ptr [rbx + 0x548], 0
0x100400707: vmovups xmmword ptr [rbx + 0x570], xmm0
0x10040070f: mov qword ptr [rbx + 0x580], 0
0x10040071a: lea r15, [rbx + 0x5b0]
0x100400721: mov qword ptr [rbp - 0x50], r15
0x100400725: call 0x1007abc10 ; 0x1007abc10
0x10040072a: mov rax, qword ptr [rip + 0x1c01217] ; 0x102001948
0x100400731: mov eax, dword ptr [rax + 0x38]
0x100400734: mov dword ptr [rbx + 0x5b0], eax
0x10040073a: vxorps xmm0, xmm0, xmm0
0x10040073e: vmovups xmmword ptr [rbx + 0x5b8], xmm0
0x100400746: mov qword ptr [rbx + 0x5c8], 0
0x100400751: vmovups xmmword ptr [rbx + 0x5f0], xmm0
0x100400759: mov qword ptr [rbx + 0x600], 0
0x100400764: lea r15, [rbx + 0x630]
0x10040076b: mov qword ptr [rbp - 0x48], r15
0x10040076f: call 0x1007abc10 ; 0x1007abc10
0x100400774: mov rax, qword ptr [rip + 0x1c011cd] ; 0x102001948
0x10040077b: mov eax, dword ptr [rax + 0x38]
0x10040077e: mov dword ptr [rbx + 0x630], eax
0x100400784: vxorps xmm0, xmm0, xmm0
0x100400788: vmovups xmmword ptr [rbx + 0x638], xmm0
0x100400790: mov qword ptr [rbx + 0x648], 0
0x10040079b: vmovups xmmword ptr [rbx + 0x670], xmm0
0x1004007a3: mov qword ptr [rbx + 0x680], 0
0x1004007ae: lea r15, [rbx + 0x6b0]
0x1004007b5: mov qword ptr [rbp - 0x40], r15
0x1004007b9: call 0x1007abc10 ; 0x1007abc10
0x1004007be: mov rax, qword ptr [rip + 0x1c01183] ; 0x102001948
0x1004007c5: mov eax, dword ptr [rax + 0x38]
0x1004007c8: mov dword ptr [rbx + 0x6b0], eax
0x1004007ce: vxorps xmm0, xmm0, xmm0
0x1004007d2: vmovups xmmword ptr [rbx + 0x6b8], xmm0
0x1004007da: mov qword ptr [rbx + 0x6c8], 0
0x1004007e5: vmovups xmmword ptr [rbx + 0x6f0], xmm0
0x1004007ed: mov qword ptr [rbx + 0x700], 0
0x1004007f8: lea r15, [rbx + 0x730]
0x1004007ff: mov qword ptr [rbp - 0x38], r15
0x100400803: call 0x1007abc10 ; 0x1007abc10
0x100400808: mov rax, qword ptr [rip + 0x1c01139] ; 0x102001948
0x10040080f: mov eax, dword ptr [rax + 0x38]
0x100400812: mov dword ptr [rbx + 0x730], eax
0x100400818: vxorps xmm0, xmm0, xmm0
0x10040081c: vmovups xmmword ptr [rbx + 0x738], xmm0
0x100400824: mov qword ptr [rbx + 0x748], 0
0x10040082f: vmovups xmmword ptr [rbx + 0x770], xmm0
0x100400837: mov qword ptr [rbx + 0x780], 0
0x100400842: lea r15, [rbx + 0x7b0]
0x100400849: mov qword ptr [rbp - 0x30], r15
0x10040084d: call 0x1007abc10 ; 0x1007abc10
0x100400852: mov rax, qword ptr [rip + 0x1c010ef] ; 0x102001948
0x100400859: mov eax, dword ptr [rax + 0x38]
0x10040085c: mov dword ptr [rbx + 0x7b0], eax
0x100400862: vxorps xmm0, xmm0, xmm0
0x100400866: vmovups xmmword ptr [rbx + 0x7b8], xmm0
0x10040086e: mov qword ptr [rbx + 0x7c8], 0
0x100400879: vmovups xmmword ptr [rbx + 0x7f0], xmm0
0x100400881: mov qword ptr [rbx + 0x800], 0
0x10040088c: lea r12, [rbx + 0x830]
0x100400893: mov r15, r12
0x100400896: call 0x1007abc10 ; 0x1007abc10
0x10040089b: mov rax, qword ptr [rip + 0x1c010a6] ; 0x102001948
0x1004008a2: mov eax, dword ptr [rax + 0x38]
0x1004008a5: mov dword ptr [rbx + 0x830], eax
0x1004008ab: vxorps xmm0, xmm0, xmm0
0x1004008af: vmovups xmmword ptr [rbx + 0x838], xmm0
0x1004008b7: mov qword ptr [rbx + 0x848], 0
0x1004008c2: vmovups xmmword ptr [rbx + 0x870], xmm0
0x1004008ca: mov qword ptr [rbx + 0x880], 0
0x1004008d5: lea r13, [rbx + 0x8b0]
0x1004008dc: mov r15, r13
0x1004008df: call 0x1007abc10 ; 0x1007abc10
0x1004008e4: mov rax, qword ptr [rip + 0x1c0105d] ; 0x102001948
0x1004008eb: mov eax, dword ptr [rax + 0x38]
0x1004008ee: mov dword ptr [rbx + 0x8b0], eax
0x1004008f4: vxorps xmm0, xmm0, xmm0
0x1004008f8: vmovups xmmword ptr [rbx + 0x8b8], xmm0
0x100400900: mov qword ptr [rbx + 0x8c8], 0
0x10040090b: vmovups xmmword ptr [rbx + 0x8f0], xmm0
0x100400913: mov qword ptr [rbx + 0x900], 0
0x10040091e: lea r14, [rbx + 0x930]
0x100400925: mov r15, r14
0x100400928: call 0x1007abc10 ; 0x1007abc10
0x10040092d: mov rax, qword ptr [rip + 0x1c01014] ; 0x102001948
0x100400934: mov eax, dword ptr [rax + 0x38]
0x100400937: mov dword ptr [rbx + 0x930], eax
0x10040093d: vxorps xmm0, xmm0, xmm0
0x100400941: vmovups xmmword ptr [rbx + 0x938], xmm0
0x100400949: mov qword ptr [rbx + 0x948], 0
0x100400954: vmovups xmmword ptr [rbx + 0x970], xmm0
0x10040095c: mov qword ptr [rbx + 0x980], 0
0x100400967: lea r15, [rbx + 0x9b0]
0x10040096e: call 0x1007abc10 ; 0x1007abc10
0x100400973: mov rax, qword ptr [rip + 0x1c00fce] ; 0x102001948
0x10040097a: mov eax, dword ptr [rax + 0x38]
0x10040097d: mov dword ptr [rbx + 0x9b0], eax
0x100400983: vxorps xmm0, xmm0, xmm0
0x100400987: vmovups xmmword ptr [rbx + 0x9b8], xmm0
0x10040098f: mov qword ptr [rbx + 0x9c8], 0
0x10040099a: vmovups xmmword ptr [rbx + 0x9f0], xmm0
0x1004009a2: mov qword ptr [rbx + 0xa00], 0
0x1004009ad: mov dword ptr [rbx + 0xa34], 0xffffffff
0x1004009b7: vmovups xmmword ptr [rbx + 0xa38], xmm0
0x1004009bf: mov qword ptr [rbx + 0xa48], 0
0x1004009ca: mov byte ptr [rbx + 0xa55], 0
0x1004009d1: lea rax, [rbx + 0x230]
0x1004009d8: mov qword ptr [rbx + 0x1a0], rax
0x1004009df: mov rax, qword ptr [rbp - 0x80]
0x1004009e3: mov qword ptr [rbx + 0x1a8], rax
0x1004009ea: mov rax, qword ptr [rbp - 0x78]
0x1004009ee: mov qword ptr [rbx + 0x1b0], rax
0x1004009f5: mov rax, qword ptr [rbp - 0x70]
0x1004009f9: mov qword ptr [rbx + 0x1b8], rax
0x100400a00: mov rax, qword ptr [rbp - 0x68]
0x100400a04: mov qword ptr [rbx + 0x1c0], rax
0x100400a0b: mov rax, qword ptr [rbp - 0x60]
0x100400a0f: mov qword ptr [rbx + 0x1c8], rax
0x100400a16: mov rax, qword ptr [rbp - 0x58]
0x100400a1a: mov qword ptr [rbx + 0x1d0], rax
0x100400a21: mov rax, qword ptr [rbp - 0x50]
0x100400a25: mov qword ptr [rbx + 0x1d8], rax
0x100400a2c: mov rax, qword ptr [rbp - 0x48]
0x100400a30: mov qword ptr [rbx + 0x1e0], rax
0x100400a37: mov rax, qword ptr [rbp - 0x40]
0x100400a3b: mov qword ptr [rbx + 0x1e8], rax
0x100400a42: mov rax, qword ptr [rbp - 0x38]
0x100400a46: mov qword ptr [rbx + 0x1f0], rax
0x100400a4d: mov rax, qword ptr [rbp - 0x30]
0x100400a51: mov qword ptr [rbx + 0x1f8], rax
0x100400a58: mov qword ptr [rbx + 0x200], r12
0x100400a5f: mov qword ptr [rbx + 0x208], r13
0x100400a66: mov qword ptr [rbx + 0x210], r14
0x100400a6d: mov qword ptr [rbx + 0x218], r15
0x100400a74: add rsp, 0x58
0x100400a78: pop rbx
0x100400a79: pop r12
0x100400a7b: pop r13
0x100400a7d: pop r14
0x100400a7f: pop r15
0x100400a81: pop rbp
0x100400a82: ret 
0x100400a83: mov r14, rax
0x100400a86: lea rax, [rbx + 0x148]
0x100400a8d: test byte ptr [rax], 1
0x100400a90: je 0x100400aa9
0x100400a92: mov r15, qword ptr [rbx + 0x158]
0x100400a99: call 0x1007e50d0 ; 0x1007e50d0
0x100400a9e: mov rdi, rax
0x100400aa1: mov rsi, r15
0x100400aa4: call 0x1007e5db0 ; 0x1007e5db0
0x100400aa9: test byte ptr [rbx + 0x128], 1
0x100400ab0: je 0x100400ac9
0x100400ab2: mov r15, qword ptr [rbx + 0x138]
0x100400ab9: call 0x1007e50d0 ; 0x1007e50d0
0x100400abe: mov rdi, rax
0x100400ac1: mov rsi, r15
0x100400ac4: call 0x1007e5db0 ; 0x1007e5db0
0x100400ac9: lea rax, [rbx + 0x110]
0x100400ad0: test byte ptr [rax], 1
0x100400ad3: je 0x100400aec
0x100400ad5: mov r15, qword ptr [rbx + 0x120]
0x100400adc: call 0x1007e50d0 ; 0x1007e50d0
0x100400ae1: mov rdi, rax
0x100400ae4: mov rsi, r15
0x100400ae7: call 0x1007e5db0 ; 0x1007e5db0
0x100400aec: lea rax, [rbx + 0xb8]
0x100400af3: test byte ptr [rax], 1
0x100400af6: je 0x100400b0f
0x100400af8: mov r15, qword ptr [rbx + 0xc8]
0x100400aff: call 0x1007e50d0 ; 0x1007e50d0
0x100400b04: mov rdi, rax
0x100400b07: mov rsi, r15
0x100400b0a: call 0x1007e5db0 ; 0x1007e5db0
0x100400b0f: test byte ptr [rbx + 0x98], 1
0x100400b16: je 0x100400b2f
0x100400b18: mov r15, qword ptr [rbx + 0xa8]
0x100400b1f: call 0x1007e50d0 ; 0x1007e50d0
0x100400b24: mov rdi, rax
0x100400b27: mov rsi, r15
0x100400b2a: call 0x1007e5db0 ; 0x1007e5db0
0x100400b2f: mov rax, rbx
0x100400b32: sub rax, -0x80
0x100400b36: test byte ptr [rax], 1
0x100400b39: je 0x100400b52
0x100400b3b: mov r15, qword ptr [rbx + 0x90]
0x100400b42: call 0x1007e50d0 ; 0x1007e50d0
0x100400b47: mov rdi, rax
0x100400b4a: mov rsi, r15
0x100400b4d: call 0x1007e5db0 ; 0x1007e5db0
0x100400b52: lea rax, [rbx + 0x58]
0x100400b56: test byte ptr [rax], 1
0x100400b59: je 0x100400b6f
0x100400b5b: mov rbx, qword ptr [rbx + 0x68]
0x100400b5f: call 0x1007e50d0 ; 0x1007e50d0
0x100400b64: mov rdi, rax
0x100400b67: mov rsi, rbx
0x100400b6a: call 0x1007e5db0 ; 0x1007e5db0
0x100400b6f: mov rdi, r14
0x100400b72: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100400b77: mov rdi, rax
0x100400b7a: call 0x100011bf0 ; 0x100011bf0
0x100400b7f: mov rdi, rax
0x100400b82: call 0x100011bf0 ; 0x100011bf0
0x100400b87: mov rdi, rax
0x100400b8a: call 0x100011bf0 ; 0x100011bf0
0x100400b8f: mov rdi, rax
0x100400b92: call 0x100011bf0 ; 0x100011bf0
0x100400b97: mov rdi, rax
0x100400b9a: call 0x100011bf0 ; 0x100011bf0
0x100400b9f: mov rdi, rax
0x100400ba2: call 0x100011bf0 ; 0x100011bf0
0x100400ba7: mov rdi, rax
0x100400baa: call 0x100011bf0 ; 0x100011bf0
0x100400baf: mov r14, rax
0x100400bb2: add r15, -0x230
0x100400bb9: test byte ptr [r15 + 0x1f0], 1
0x100400bc1: je 0x100400bda
0x100400bc3: mov r12, qword ptr [r15 + 0x200]
0x100400bca: call 0x1007e50d0 ; 0x1007e50d0
0x100400bcf: mov rdi, rax
0x100400bd2: mov rsi, r12
0x100400bd5: call 0x1007e5db0 ; 0x1007e5db0
0x100400bda: test byte ptr [r15 + 0x1b8], 1
0x100400be2: je 0x100400bfb
0x100400be4: mov r12, qword ptr [r15 + 0x1c8]
0x100400beb: call 0x1007e50d0 ; 0x1007e50d0
0x100400bf0: mov rdi, rax
0x100400bf3: mov rsi, r12
0x100400bf6: call 0x1007e5db0 ; 0x1007e5db0
0x100400bfb: add r15, -0x80
0x100400bff: cmp rbx, r15
0x100400c02: jne 0x100400bb9
0x100400c04: jmp 0x100400a86 ; 0x100400a86
0x100400c09: mov rdi, rax
0x100400c0c: call 0x100011bf0 ; 0x100011bf0
0x100400c11: mov rdi, rax
0x100400c14: call 0x100011bf0 ; 0x100011bf0
0x100400c19: nop dword ptr [rax]
