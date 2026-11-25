0x1006c34b0: push rbp
0x1006c34b1: mov rbp, rsp
0x1006c34b4: push rbx
0x1006c34b5: push rax
0x1006c34b6: mov rbx, qword ptr [rdi + 0x42810]
0x1006c34bd: test rbx, rbx
0x1006c34c0: je 0x1006c38f3
0x1006c34c6: mov rax, qword ptr [rbx]
0x1006c34c9: mov qword ptr [rdi + 0x42810], rax
0x1006c34d0: mov rdi, rbx
0x1006c34d3: call 0x1006c39a0 ; 0x1006c39a0
0x1006c34d8: mov byte ptr [rbx + 0x1094], 1
0x1006c34df: vmovq xmm0, rbx
0x1006c34e4: vpshufd xmm0, xmm0, 0x44
0x1006c34e9: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad7450
0x1006c34f1: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad7460
0x1006c34f9: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad7470
0x1006c3501: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad7480
0x1006c3509: vmovdqu xmmword ptr [rbx + 0x80], xmm1
0x1006c3511: vmovdqu xmmword ptr [rbx + 0x90], xmm2
0x1006c3519: vmovdqu xmmword ptr [rbx + 0xa0], xmm3
0x1006c3521: vmovdqu xmmword ptr [rbx + 0xb0], xmm4
0x1006c3529: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad7490
0x1006c3531: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad74a0
0x1006c3539: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad74b0
0x1006c3541: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad74c0
0x1006c3549: vmovdqu xmmword ptr [rbx + 0xc0], xmm1
0x1006c3551: vmovdqu xmmword ptr [rbx + 0xd0], xmm2
0x1006c3559: vmovdqu xmmword ptr [rbx + 0xe0], xmm3
0x1006c3561: vmovdqu xmmword ptr [rbx + 0xf0], xmm4
0x1006c3569: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad74d0
0x1006c3571: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad74e0
0x1006c3579: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad74f0
0x1006c3581: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad7500
0x1006c3589: vmovdqu xmmword ptr [rbx + 0x100], xmm1
0x1006c3591: vmovdqu xmmword ptr [rbx + 0x110], xmm2
0x1006c3599: vmovdqu xmmword ptr [rbx + 0x120], xmm3
0x1006c35a1: vmovdqu xmmword ptr [rbx + 0x130], xmm4
0x1006c35a9: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad7510
0x1006c35b1: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad7520
0x1006c35b9: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad7530
0x1006c35c1: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad7540
0x1006c35c9: vmovdqu xmmword ptr [rbx + 0x140], xmm1
0x1006c35d1: vmovdqu xmmword ptr [rbx + 0x150], xmm2
0x1006c35d9: vmovdqu xmmword ptr [rbx + 0x160], xmm3
0x1006c35e1: vmovdqu xmmword ptr [rbx + 0x170], xmm4
0x1006c35e9: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad7550
0x1006c35f1: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad7560
0x1006c35f9: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad7570
0x1006c3601: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad7580
0x1006c3609: vmovdqu xmmword ptr [rbx + 0x180], xmm1
0x1006c3611: vmovdqu xmmword ptr [rbx + 0x190], xmm2
0x1006c3619: vmovdqu xmmword ptr [rbx + 0x1a0], xmm3
0x1006c3621: vmovdqu xmmword ptr [rbx + 0x1b0], xmm4
0x1006c3629: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad7590
0x1006c3631: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad75a0
0x1006c3639: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad75b0
0x1006c3641: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad75c0
0x1006c3649: vmovdqu xmmword ptr [rbx + 0x1c0], xmm1
0x1006c3651: vmovdqu xmmword ptr [rbx + 0x1d0], xmm2
0x1006c3659: vmovdqu xmmword ptr [rbx + 0x1e0], xmm3
0x1006c3661: vmovdqu xmmword ptr [rbx + 0x1f0], xmm4
0x1006c3669: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad75d0
0x1006c3671: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad75e0
0x1006c3679: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad75f0
0x1006c3681: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad7600
0x1006c3689: vmovdqu xmmword ptr [rbx + 0x200], xmm1
0x1006c3691: vmovdqu xmmword ptr [rbx + 0x210], xmm2
0x1006c3699: vmovdqu xmmword ptr [rbx + 0x220], xmm3
0x1006c36a1: vmovdqu xmmword ptr [rbx + 0x230], xmm4
0x1006c36a9: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad7610
0x1006c36b1: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad7620
0x1006c36b9: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad7630
0x1006c36c1: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad7640
0x1006c36c9: vmovdqu xmmword ptr [rbx + 0x240], xmm1
0x1006c36d1: vmovdqu xmmword ptr [rbx + 0x250], xmm2
0x1006c36d9: vmovdqu xmmword ptr [rbx + 0x260], xmm3
0x1006c36e1: vmovdqu xmmword ptr [rbx + 0x270], xmm4
0x1006c36e9: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad7650
0x1006c36f1: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad7660
0x1006c36f9: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad7670
0x1006c3701: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad7680
0x1006c3709: vmovdqu xmmword ptr [rbx + 0x280], xmm1
0x1006c3711: vmovdqu xmmword ptr [rbx + 0x290], xmm2
0x1006c3719: vmovdqu xmmword ptr [rbx + 0x2a0], xmm3
0x1006c3721: vmovdqu xmmword ptr [rbx + 0x2b0], xmm4
0x1006c3729: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad7690
0x1006c3731: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad76a0
0x1006c3739: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad76b0
0x1006c3741: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad76c0
0x1006c3749: vmovdqu xmmword ptr [rbx + 0x2c0], xmm1
0x1006c3751: vmovdqu xmmword ptr [rbx + 0x2d0], xmm2
0x1006c3759: vmovdqu xmmword ptr [rbx + 0x2e0], xmm3
0x1006c3761: vmovdqu xmmword ptr [rbx + 0x2f0], xmm4
0x1006c3769: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad76d0
0x1006c3771: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad76e0
0x1006c3779: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad76f0
0x1006c3781: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad7700
0x1006c3789: vmovdqu xmmword ptr [rbx + 0x300], xmm1
0x1006c3791: vmovdqu xmmword ptr [rbx + 0x310], xmm2
0x1006c3799: vmovdqu xmmword ptr [rbx + 0x320], xmm3
0x1006c37a1: vmovdqu xmmword ptr [rbx + 0x330], xmm4
0x1006c37a9: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad7710
0x1006c37b1: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad7720
0x1006c37b9: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad7730
0x1006c37c1: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad7740
0x1006c37c9: vmovdqu xmmword ptr [rbx + 0x340], xmm1
0x1006c37d1: vmovdqu xmmword ptr [rbx + 0x350], xmm2
0x1006c37d9: vmovdqu xmmword ptr [rbx + 0x360], xmm3
0x1006c37e1: vmovdqu xmmword ptr [rbx + 0x370], xmm4
0x1006c37e9: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad7750
0x1006c37f1: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad7760
0x1006c37f9: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad7770
0x1006c3801: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad7780
0x1006c3809: vmovdqu xmmword ptr [rbx + 0x380], xmm1
0x1006c3811: vmovdqu xmmword ptr [rbx + 0x390], xmm2
0x1006c3819: vmovdqu xmmword ptr [rbx + 0x3a0], xmm3
0x1006c3821: vmovdqu xmmword ptr [rbx + 0x3b0], xmm4
0x1006c3829: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad7790
0x1006c3831: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad77a0
0x1006c3839: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad77b0
0x1006c3841: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad77c0
0x1006c3849: vmovdqu xmmword ptr [rbx + 0x3c0], xmm1
0x1006c3851: vmovdqu xmmword ptr [rbx + 0x3d0], xmm2
0x1006c3859: vmovdqu xmmword ptr [rbx + 0x3e0], xmm3
0x1006c3861: vmovdqu xmmword ptr [rbx + 0x3f0], xmm4
0x1006c3869: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad77d0
0x1006c3871: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad77e0
0x1006c3879: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad77f0
0x1006c3881: vpaddq xmm4, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad7800
0x1006c3889: vmovdqu xmmword ptr [rbx + 0x400], xmm1
0x1006c3891: vmovdqu xmmword ptr [rbx + 0x410], xmm2
0x1006c3899: vmovdqu xmmword ptr [rbx + 0x420], xmm3
0x1006c38a1: vmovdqu xmmword ptr [rbx + 0x430], xmm4
0x1006c38a9: vpaddq xmm1, xmm0, xmmword ptr [rip + 0x413f5f] ; 0x100ad7810
0x1006c38b1: vpaddq xmm2, xmm0, xmmword ptr [rip + 0x413f67] ; 0x100ad7820
0x1006c38b9: vpaddq xmm3, xmm0, xmmword ptr [rip + 0x413f6f] ; 0x100ad7830
0x1006c38c1: vpaddq xmm0, xmm0, xmmword ptr [rip + 0x413f77] ; 0x100ad7840
0x1006c38c9: vmovdqu xmmword ptr [rbx + 0x440], xmm1
0x1006c38d1: vmovdqu xmmword ptr [rbx + 0x450], xmm2
0x1006c38d9: vmovdqu xmmword ptr [rbx + 0x460], xmm3
0x1006c38e1: vmovdqu xmmword ptr [rbx + 0x470], xmm0
0x1006c38e9: mov rax, rbx
0x1006c38ec: add rsp, 8
0x1006c38f0: pop rbx
0x1006c38f1: pop rbp
0x1006c38f2: ret 
0x1006c38f3: lea rdi, [rip + 0x4d7690] ; 0x100b9af8a timeline
0x1006c38fa: lea rsi, [rip + 0x4d75b4] ; 0x100b9aeb5 Timeline.cpp
0x1006c3901: mov edx, 0x173
0x1006c3906: mov ecx, 3
0x1006c390b: call 0x1007e5f70 ; 0x1007e5f70
0x1006c3910: ud2 
0x1006c3912: nop word ptr cs:[rax + rax]
