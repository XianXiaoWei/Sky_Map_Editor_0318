0x100242120: push rbp
0x100242121: mov rbp, rsp
0x100242124: push r15
0x100242126: push r14
0x100242128: push r13
0x10024212a: push r12
0x10024212c: push rbx
0x10024212d: sub rsp, 0x38
0x100242131: mov rbx, rdx
0x100242134: mov r14d, esi
0x100242137: mov r15d, edi
0x10024213a: vmovss dword ptr [rbp - 0x30], xmm0
0x10024213f: vmulss xmm0, xmm1, dword ptr [rip + 0x862471] ; 0x100aa45b8
0x100242147: vmovss dword ptr [rbp - 0x2c], xmm0
0x10024214c: call 0x100aa2cfc ; 0x100aa2cfc _tanf
0x100242151: vmovss xmm3, dword ptr [rbp - 0x30]
0x100242156: mov qword ptr [rbp - 0x58], r14
0x10024215a: test r14d, r14d
0x10024215d: je 0x1002422c7
0x100242163: test r15d, r15d
0x100242166: je 0x1002422c7
0x10024216c: vmulss xmm1, xmm3, xmm3
0x100242170: vmovss xmm2, dword ptr [rip + 0x864f7c] ; 0x100aa70f4
0x100242178: vdivss xmm1, xmm2, xmm1
0x10024217c: vaddss xmm1, xmm1, xmm2
0x100242180: vsqrtss xmm1, xmm1, xmm1
0x100242184: vdivss xmm2, xmm1, xmm0
0x100242188: vmovss xmm0, dword ptr [rbp - 0x2c]
0x10024218d: vdivss xmm1, xmm0, xmm1
0x100242191: lea eax, [r15 - 1]
0x100242195: mov rcx, qword ptr [rbp - 0x58]
0x100242199: lea ecx, [rcx - 1]
0x10024219c: vcvtsi2ss xmm4, xmm4, rax
0x1002421a1: vcvtsi2ss xmm0, xmm5, rcx
0x1002421a6: vmovss dword ptr [rbp - 0x34], xmm0
0x1002421ab: mov r12d, r15d
0x1002421ae: add r15d, r15d
0x1002421b1: mov qword ptr [rbp - 0x60], r15
0x1002421b5: xor r13d, r13d
0x1002421b8: mov ecx, 1
0x1002421bd: vmovss xmm5, dword ptr [rip + 0x86645b] ; 0x100aa8620
0x1002421c5: vmovss xmm6, dword ptr [rip + 0x870f83] ; 0x100ab3150
0x1002421cd: vmovss dword ptr [rbp - 0x44], xmm2
0x1002421d2: vmovss dword ptr [rbp - 0x40], xmm1
0x1002421d7: vmovss dword ptr [rbp - 0x3c], xmm4
0x1002421dc: nop dword ptr [rax]
0x1002421e0: mov eax, r13d
0x1002421e3: vcvtsi2ss xmm0, xmm8, rax
0x1002421e8: vdivss xmm0, xmm0, dword ptr [rbp - 0x34]
0x1002421ed: vaddss xmm0, xmm0, xmm5
0x1002421f1: vdivss xmm0, xmm0, xmm3
0x1002421f5: vmovss dword ptr [rbp - 0x4c], xmm0
0x1002421fa: vmulss xmm0, xmm0, xmm0
0x1002421fe: vmovss dword ptr [rbp - 0x48], xmm0
0x100242203: mov dword ptr [rbp - 0x38], ecx
0x100242206: mov r15d, ecx
0x100242209: xor r14d, r14d
0x10024220c: nop dword ptr [rax]
0x100242210: mov eax, r14d
0x100242213: vcvtsi2ss xmm0, xmm8, rax
0x100242218: vdivss xmm0, xmm0, xmm4
0x10024221c: vaddss xmm0, xmm0, xmm5
0x100242220: vmovss dword ptr [rbp - 0x2c], xmm0
0x100242225: vmulss xmm0, xmm0, xmm0
0x100242229: vaddss xmm0, xmm0, dword ptr [rbp - 0x48]
0x10024222e: vmaxss xmm0, xmm6, xmm0
0x100242232: vsqrtss xmm0, xmm0, xmm0
0x100242236: vdivss xmm2, xmm2, xmm0
0x10024223a: vmovss dword ptr [rbp - 0x50], xmm2
0x10024223f: vmulss xmm0, xmm1, xmm0
0x100242243: call 0x100aa2cfc ; 0x100aa2cfc _tanf
0x100242248: vmovss xmm1, dword ptr [rip + 0x862368] ; 0x100aa45b8
0x100242250: vmovaps xmm7, xmm1
0x100242254: vmovss xmm6, dword ptr [rip + 0x870ef4] ; 0x100ab3150
0x10024225c: vmovss xmm5, dword ptr [rip + 0x8663bc] ; 0x100aa8620
0x100242264: vmovss xmm4, dword ptr [rbp - 0x3c]
0x100242269: vmovss xmm2, dword ptr [rbp - 0x44]
0x10024226e: vmovss xmm3, dword ptr [rbp - 0x30]
0x100242273: vmulss xmm0, xmm0, dword ptr [rbp - 0x50]
0x100242278: vmulss xmm1, xmm0, dword ptr [rbp - 0x2c]
0x10024227d: vaddss xmm1, xmm1, xmm7
0x100242281: lea eax, [r15 - 1]
0x100242285: vmovss dword ptr [rbx + rax*4], xmm1
0x10024228a: vmovss xmm1, dword ptr [rbp - 0x40]
0x10024228f: vmulss xmm0, xmm0, dword ptr [rbp - 0x4c]
0x100242294: vmulss xmm0, xmm0, xmm3
0x100242298: vaddss xmm0, xmm0, xmm7
0x10024229c: mov eax, r15d
0x10024229f: vmovss dword ptr [rbx + rax*4], xmm0
0x1002422a4: inc r14
0x1002422a7: add r15d, 2
0x1002422ab: cmp r12, r14
0x1002422ae: jne 0x100242210
0x1002422b4: inc r13d
0x1002422b7: mov ecx, dword ptr [rbp - 0x38]
0x1002422ba: add ecx, dword ptr [rbp - 0x60]
0x1002422bd: cmp r13d, dword ptr [rbp - 0x58]
0x1002422c1: jne 0x1002421e0
0x1002422c7: add rsp, 0x38
0x1002422cb: pop rbx
0x1002422cc: pop r12
0x1002422ce: pop r13
0x1002422d0: pop r14
0x1002422d2: pop r15
0x1002422d4: pop rbp
0x1002422d5: ret 
0x1002422d6: nop word ptr cs:[rax + rax]
