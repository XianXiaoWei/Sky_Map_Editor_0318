0x1002582b0: push rbp
0x1002582b1: mov rbp, rsp
0x1002582b4: push r14
0x1002582b6: push rbx
0x1002582b7: sub rsp, 0x30
0x1002582bb: mov r14, rsi
0x1002582be: mov rbx, rdi
0x1002582c1: mov rdi, r14
0x1002582c4: mov rsi, rbx
0x1002582c7: call 0x10076a280 ; 0x10076a280
0x1002582cc: lea rsi, [rbx + 4]
0x1002582d0: mov eax, dword ptr [rbx + 8]
0x1002582d3: dec eax
0x1002582d5: test eax, eax
0x1002582d7: mov ecx, 1
0x1002582dc: cmovg ecx, eax
0x1002582df: movzx ecx, cl
0x1002582e2: xor edx, edx
0x1002582e4: mov rdi, r14
0x1002582e7: call 0x10076ae50 ; 0x10076ae50
0x1002582ec: lea rsi, [rbx + 0xc]
0x1002582f0: xor edx, edx
0x1002582f2: mov ecx, 0xb
0x1002582f7: mov rdi, r14
0x1002582fa: call 0x10076ae50 ; 0x10076ae50
0x1002582ff: lea rsi, [rbx + 0xd]
0x100258303: xor edx, edx
0x100258305: mov ecx, 3
0x10025830a: mov rdi, r14
0x10025830d: call 0x10076ae50 ; 0x10076ae50
0x100258312: mov al, byte ptr [rbx + 0xd]
0x100258315: test al, al
0x100258317: je 0x100258371
0x100258319: cmp al, 3
0x10025831b: jne 0x10025837f
0x10025831d: lea rsi, [rbx + 0x20]
0x100258321: mov rax, qword ptr [rip + 0x856948] ; 0x100aaec70
0x100258328: mov qword ptr [rbp - 0x40], rax
0x10025832c: mov dword ptr [rbp - 0x38], 0xc2c80000
0x100258333: mov rax, qword ptr [rip + 0x84fb96] ; 0x100aa7ed0
0x10025833a: mov qword ptr [rbp - 0x30], rax
0x10025833e: mov dword ptr [rbp - 0x28], 0x42c80000
0x100258345: vxorps xmm0, xmm0, xmm0
0x100258349: vmovlps qword ptr [rbp - 0x20], xmm0
0x10025834e: mov dword ptr [rbp - 0x18], 0
0x100258355: lea rdx, [rbp - 0x40]
0x100258359: lea rcx, [rbp - 0x30]
0x10025835d: lea r8, [rbp - 0x20]
0x100258361: mov r9d, 8
0x100258367: mov rdi, r14
0x10025836a: call 0x10076b4e0 ; 0x10076b4e0
0x10025836f: jmp 0x10025838b ; 0x10025838b
0x100258371: lea rdi, [rbx + 0x10]
0x100258375: mov rsi, r14
0x100258378: call 0x10049d9b0 ; 0x10049d9b0
0x10025837d: jmp 0x10025838b ; 0x10025838b
0x10025837f: lea rsi, [rbx + 0x14]
0x100258383: mov rdi, r14
0x100258386: call 0x10076a270 ; 0x10076a270
0x10025838b: lea rsi, [rbx + 0x30]
0x10025838f: vmovss xmm1, dword ptr [rip + 0x84cd29] ; 0x100aa50c0
0x100258397: vmovss xmm2, dword ptr [rip + 0x84c219] ; 0x100aa45b8
0x10025839f: vxorps xmm0, xmm0, xmm0
0x1002583a3: mov edx, 4
0x1002583a8: mov rdi, r14
0x1002583ab: call 0x10076af70 ; 0x10076af70
0x1002583b0: lea rsi, [rbx + 0x34]
0x1002583b4: vxorps xmm0, xmm0, xmm0
0x1002583b8: mov edx, 4
0x1002583bd: mov rdi, r14
0x1002583c0: vmovss xmm1, dword ptr [rip + 0x84ccf8] ; 0x100aa50c0
0x1002583c8: vmovss xmm2, dword ptr [rip + 0x84c1e8] ; 0x100aa45b8
0x1002583d0: call 0x10076af70 ; 0x10076af70
0x1002583d5: lea rsi, [rbx + 0x38]
0x1002583d9: vxorps xmm0, xmm0, xmm0
0x1002583dd: mov edx, 4
0x1002583e2: mov rdi, r14
0x1002583e5: vmovss xmm1, dword ptr [rip + 0x84ccd3] ; 0x100aa50c0
0x1002583ed: vmovss xmm2, dword ptr [rip + 0x84c1c3] ; 0x100aa45b8
0x1002583f5: call 0x10076af70 ; 0x10076af70
0x1002583fa: lea rsi, [rbx + 0x3c]
0x1002583fe: vxorps xmm0, xmm0, xmm0
0x100258402: mov edx, 4
0x100258407: mov rdi, r14
0x10025840a: vmovss xmm1, dword ptr [rip + 0x84ccae] ; 0x100aa50c0
0x100258412: vmovss xmm2, dword ptr [rip + 0x84c19e] ; 0x100aa45b8
0x10025841a: call 0x10076af70 ; 0x10076af70
0x10025841f: lea rsi, [rbx + 0x40]
0x100258423: vxorps xmm0, xmm0, xmm0
0x100258427: mov edx, 4
0x10025842c: mov rdi, r14
0x10025842f: vmovss xmm1, dword ptr [rip + 0x84cc89] ; 0x100aa50c0
0x100258437: vmovss xmm2, dword ptr [rip + 0x84c179] ; 0x100aa45b8
0x10025843f: call 0x10076af70 ; 0x10076af70
0x100258444: lea rsi, [rbx + 0x44]
0x100258448: vxorps xmm0, xmm0, xmm0
0x10025844c: mov edx, 4
0x100258451: mov rdi, r14
0x100258454: vmovss xmm1, dword ptr [rip + 0x84cc64] ; 0x100aa50c0
0x10025845c: vmovss xmm2, dword ptr [rip + 0x84c154] ; 0x100aa45b8
0x100258464: call 0x10076af70 ; 0x10076af70
0x100258469: lea rsi, [rbx + 0x48]
0x10025846d: vxorps xmm0, xmm0, xmm0
0x100258471: mov edx, 4
0x100258476: mov rdi, r14
0x100258479: vmovss xmm1, dword ptr [rip + 0x84cc3f] ; 0x100aa50c0
0x100258481: vmovss xmm2, dword ptr [rip + 0x84c12f] ; 0x100aa45b8
0x100258489: call 0x10076af70 ; 0x10076af70
0x10025848e: lea rsi, [rbx + 0x4c]
0x100258492: vxorps xmm0, xmm0, xmm0
0x100258496: mov edx, 4
0x10025849b: mov rdi, r14
0x10025849e: vmovss xmm1, dword ptr [rip + 0x84cc1a] ; 0x100aa50c0
0x1002584a6: vmovss xmm2, dword ptr [rip + 0x84c10a] ; 0x100aa45b8
0x1002584ae: call 0x10076af70 ; 0x10076af70
0x1002584b3: lea rsi, [rbx + 0x50]
0x1002584b7: vxorps xmm0, xmm0, xmm0
0x1002584bb: mov edx, 4
0x1002584c0: mov rdi, r14
0x1002584c3: vmovss xmm1, dword ptr [rip + 0x84cbf5] ; 0x100aa50c0
0x1002584cb: vmovss xmm2, dword ptr [rip + 0x84c0e5] ; 0x100aa45b8
0x1002584d3: call 0x10076af70 ; 0x10076af70
0x1002584d8: lea rsi, [rbx + 0x54]
0x1002584dc: vxorps xmm0, xmm0, xmm0
0x1002584e0: mov edx, 4
0x1002584e5: mov rdi, r14
0x1002584e8: vmovss xmm1, dword ptr [rip + 0x84cbd0] ; 0x100aa50c0
0x1002584f0: vmovss xmm2, dword ptr [rip + 0x84c0c0] ; 0x100aa45b8
0x1002584f8: call 0x10076af70 ; 0x10076af70
0x1002584fd: lea rsi, [rbx + 0x58]
0x100258501: vxorps xmm0, xmm0, xmm0
0x100258505: mov edx, 4
0x10025850a: mov rdi, r14
0x10025850d: vmovss xmm1, dword ptr [rip + 0x84cbab] ; 0x100aa50c0
0x100258515: vmovss xmm2, dword ptr [rip + 0x84c09b] ; 0x100aa45b8
0x10025851d: call 0x10076af70 ; 0x10076af70
0x100258522: lea rsi, [rbx + 0x5c]
0x100258526: vxorps xmm0, xmm0, xmm0
0x10025852a: mov edx, 4
0x10025852f: mov rdi, r14
0x100258532: vmovss xmm1, dword ptr [rip + 0x84cb86] ; 0x100aa50c0
0x10025853a: vmovss xmm2, dword ptr [rip + 0x84c076] ; 0x100aa45b8
0x100258542: call 0x10076af70 ; 0x10076af70
0x100258547: lea rsi, [rbx + 0x60]
0x10025854b: mov rdi, r14
0x10025854e: call 0x10076a360 ; 0x10076a360
0x100258553: lea rsi, [rbx + 0x70]
0x100258557: mov rdi, r14
0x10025855a: call 0x10076aae0 ; 0x10076aae0
0x10025855f: cmp byte ptr [rbx + 0x70], 0
0x100258563: je 0x100258574
0x100258565: add rbx, 0x74
0x100258569: mov rdi, rbx
0x10025856c: mov rsi, r14
0x10025856f: call 0x10049d9b0 ; 0x10049d9b0
0x100258574: add rsp, 0x30
0x100258578: pop rbx
0x100258579: pop r14
0x10025857b: pop rbp
0x10025857c: ret 
0x10025857d: nop dword ptr [rax]
