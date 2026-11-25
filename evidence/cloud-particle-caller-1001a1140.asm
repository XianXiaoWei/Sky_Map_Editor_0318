0x1001a1140: push rbp
0x1001a1141: mov rbp, rsp
0x1001a1144: push r15
0x1001a1146: push r14
0x1001a1148: push r12
0x1001a114a: push rbx
0x1001a114b: sub rsp, 0xc0
0x1001a1152: vmovss dword ptr [rbp - 0x90], xmm1
0x1001a115a: mov r14, r8
0x1001a115d: vmovss dword ptr [rbp - 0x64], xmm0
0x1001a1162: mov r15, rdx
0x1001a1165: mov r12, rsi
0x1001a1168: mov rbx, rdi
0x1001a116b: mov rax, qword ptr [rip + 0xa6c766] ; 0x100c0d8d8
0x1001a1172: mov rax, qword ptr [rax]
0x1001a1175: mov qword ptr [rbp - 0x28], rax
0x1001a1179: vmovaps xmm0, xmmword ptr [r12]
0x1001a117f: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x1001a1187: lea rsi, [rbp - 0xe0]
0x1001a118e: lea rdx, [rbp - 0x94]
0x1001a1195: lea rax, [rbp - 0x60]
0x1001a1199: xor r8d, r8d
0x1001a119c: mov rdi, rcx
0x1001a119f: mov rcx, rax
0x1001a11a2: call 0x1002149c0 ; 0x1002149c0
0x1001a11a7: vmovss xmm0, dword ptr [rbp - 0x94]
0x1001a11af: vxorps xmm1, xmm1, xmm1
0x1001a11b3: vucomiss xmm0, xmm1
0x1001a11b7: jbe 0x1001a11c3
0x1001a11b9: vmovss xmm1, dword ptr [rip + 0x903eff] ; 0x100aa50c0
0x1001a11c1: jmp 0x1001a11e3 ; 0x1001a11e3
0x1001a11c3: vaddss xmm2, xmm0, dword ptr [rip + 0x9058e1] ; 0x100aa6aac
0x1001a11cb: vdivss xmm2, xmm2, dword ptr [rip + 0x90661d] ; 0x100aa77f0
0x1001a11d3: vmaxss xmm1, xmm1, xmm2
0x1001a11d7: vmovss xmm2, dword ptr [rip + 0x903ee1] ; 0x100aa50c0
0x1001a11df: vminss xmm1, xmm2, xmm1
0x1001a11e3: vmulss xmm1, xmm1, xmm1
0x1001a11e7: vmovss xmm2, dword ptr [rbx]
0x1001a11eb: vucomiss xmm1, xmm2
0x1001a11ef: ja 0x1001a1230
0x1001a11f1: xor ecx, ecx
0x1001a11f3: vucomiss xmm2, dword ptr [rip + 0x90740d] ; 0x100aa8608
0x1001a11fb: seta cl
0x1001a11fe: lea rdx, [rip + 0x90c7ab] ; 0x100aad9b0
0x1001a1205: vmovss xmm3, dword ptr [rbp - 0x90]
0x1001a120d: vmulss xmm3, xmm3, dword ptr [rdx + rcx*4]
0x1001a1212: vsubss xmm4, xmm1, xmm3
0x1001a1216: vucomiss xmm4, xmm2
0x1001a121a: jbe 0x1001a1222
0x1001a121c: vaddss xmm1, xmm2, xmm3
0x1001a1220: jmp 0x1001a1230 ; 0x1001a1230
0x1001a1222: vaddss xmm4, xmm1, xmm3
0x1001a1226: vucomiss xmm2, xmm4
0x1001a122a: jbe 0x1001a1230
0x1001a122c: vsubss xmm1, xmm2, xmm3
0x1001a1230: vmovss dword ptr [rbx], xmm1
0x1001a1234: vucomiss xmm0, dword ptr [rip + 0x90a5b0] ; 0x100aab7ec
0x1001a123c: seta cl
0x1001a123f: and al, cl
0x1001a1241: cmp al, 1
0x1001a1243: jne 0x1001a156f
0x1001a1249: vmovaps xmm0, xmmword ptr [r12]
0x1001a124f: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1001a1257: vmovaps xmm0, xmmword ptr [r15]
0x1001a125c: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1001a1264: vmovss xmm0, dword ptr [rbp - 0x64]
0x1001a1269: vmulss xmm0, xmm0, dword ptr [rip + 0x90c6d3] ; 0x100aad944
0x1001a1271: vmovss dword ptr [rbp - 0x64], xmm0
0x1001a1276: vmulss xmm0, xmm0, dword ptr [rip + 0x9091fe] ; 0x100aaa47c
0x1001a127e: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1001a1286: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a128b: vcvtsi2ss xmm0, xmm5, eax
0x1001a128f: vmulss xmm0, xmm0, dword ptr [rip + 0x905e59] ; 0x100aa70f0
0x1001a1297: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1001a129c: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a12a1: vcvtsi2ss xmm0, xmm5, eax
0x1001a12a5: vmulss xmm0, xmm0, dword ptr [rip + 0x905e43] ; 0x100aa70f0
0x1001a12ad: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x1001a12b5: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a12ba: vcvtsi2ss xmm0, xmm5, eax
0x1001a12be: vmulss xmm0, xmm0, dword ptr [rip + 0x905e2a] ; 0x100aa70f0
0x1001a12c6: vmovaps xmm1, xmmword ptr [rbp - 0x80]
0x1001a12cb: vinsertps xmm1, xmm1, dword ptr [rbp - 0xc0], 0x10
0x1001a12d5: vinsertps xmm0, xmm1, xmm0, 0x20
0x1001a12db: vmulps xmm0, xmm0, xmmword ptr [rip + 0x906c6d] ; 0x100aa7f50
0x1001a12e3: vaddps xmm2, xmm0, xmmword ptr [rip + 0x9065f5] ; 0x100aa78e0
0x1001a12eb: vmulps xmm0, xmm2, xmm2
0x1001a12ef: vmovshdup xmm1, xmm0
0x1001a12f3: vaddss xmm1, xmm0, xmm1
0x1001a12f7: vpermilpd xmm0, xmm0, 1
0x1001a12fd: vaddss xmm0, xmm0, xmm1
0x1001a1301: vsqrtss xmm0, xmm0, xmm0
0x1001a1305: vucomiss xmm0, dword ptr [rip + 0x9065b7] ; 0x100aa78c4
0x1001a130d: jbe 0x1001a1319
0x1001a130f: vpermilps xmm0, xmm0, 0xc0
0x1001a1315: vdivps xmm2, xmm2, xmm0
0x1001a1319: vmovaps xmmword ptr [rbp - 0x80], xmm2
0x1001a131e: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a1323: vcvtsi2ss xmm0, xmm5, eax
0x1001a1327: vmovss xmm1, dword ptr [rip + 0x905dc1] ; 0x100aa70f0
0x1001a132f: vmulss xmm0, xmm0, xmm1
0x1001a1333: vmovss xmm1, dword ptr [rip + 0x903d85] ; 0x100aa50c0
0x1001a133b: vsubss xmm1, xmm1, xmm0
0x1001a133f: vmulss xmm1, xmm1, dword ptr [rip + 0x90726d] ; 0x100aa85b4
0x1001a1347: vmulss xmm0, xmm0, dword ptr [rip + 0x90657d] ; 0x100aa78cc
0x1001a134f: vaddss xmm0, xmm0, xmm1
0x1001a1353: vpermilps xmm0, xmm0, 0xc0
0x1001a1359: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x80]
0x1001a135e: vpermilps xmm1, xmmword ptr [rbp - 0x90], 0xc0
0x1001a1368: vmovaps xmmword ptr [rbp - 0x90], xmm1
0x1001a1370: vmulps xmm0, xmm1, xmm0
0x1001a1374: vaddps xmm0, xmm0, xmmword ptr [rbp - 0xd0]
0x1001a137c: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001a1381: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x1001a1389: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1001a138e: vmovss xmm0, dword ptr [rbx]
0x1001a1392: vmovss dword ptr [rbp - 0xb0], xmm0
0x1001a139a: vmovss xmm1, dword ptr [rip + 0x90644a] ; 0x100aa77ec
0x1001a13a2: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x1001a13a7: vxorps xmm1, xmm1, xmm1
0x1001a13ab: vmovss xmm3, dword ptr [rbp - 0xb0]
0x1001a13b3: vmaxss xmm1, xmm1, xmm3
0x1001a13b7: vmovss xmm2, dword ptr [rip + 0x903d01] ; 0x100aa50c0
0x1001a13bf: vminss xmm1, xmm2, xmm1
0x1001a13c3: vsubss xmm2, xmm2, xmm1
0x1001a13c7: vmulss xmm0, xmm0, xmm2
0x1001a13cb: vmulss xmm1, xmm3, xmm1
0x1001a13cf: vaddss xmm0, xmm1, xmm0
0x1001a13d3: vmulss xmm0, xmm0, dword ptr [rip + 0x9031dd] ; 0x100aa45b8
0x1001a13db: vmovss dword ptr [rbp - 0x3c], xmm0
0x1001a13e0: vmovss xmm0, dword ptr [rbp - 0x64]
0x1001a13e5: vmovss dword ptr [rbp - 0x40], xmm0
0x1001a13ea: lea rsi, [rbp - 0x60]
0x1001a13ee: mov rdi, r14
0x1001a13f1: call 0x100228a30 ; 0x100228a30
0x1001a13f6: vmovaps xmm0, xmmword ptr [r12]
0x1001a13fc: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1001a1404: vmovaps xmm0, xmmword ptr [r15]
0x1001a1409: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1001a1411: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a1416: vcvtsi2ss xmm0, xmm5, eax
0x1001a141a: vmulss xmm0, xmm0, dword ptr [rip + 0x905cce] ; 0x100aa70f0
0x1001a1422: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1001a1427: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a142c: vcvtsi2ss xmm0, xmm5, eax
0x1001a1430: vmulss xmm0, xmm0, dword ptr [rip + 0x905cb8] ; 0x100aa70f0
0x1001a1438: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x1001a1440: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a1445: vcvtsi2ss xmm0, xmm5, eax
0x1001a1449: vmulss xmm0, xmm0, dword ptr [rip + 0x905c9f] ; 0x100aa70f0
0x1001a1451: vmovaps xmm1, xmmword ptr [rbp - 0x80]
0x1001a1456: vinsertps xmm1, xmm1, dword ptr [rbp - 0xc0], 0x10
0x1001a1460: vinsertps xmm0, xmm1, xmm0, 0x20
0x1001a1466: vmulps xmm0, xmm0, xmmword ptr [rip + 0x906ae2] ; 0x100aa7f50
0x1001a146e: vaddps xmm2, xmm0, xmmword ptr [rip + 0x90646a] ; 0x100aa78e0
0x1001a1476: vmulps xmm0, xmm2, xmm2
0x1001a147a: vmovshdup xmm1, xmm0
0x1001a147e: vaddss xmm1, xmm0, xmm1
0x1001a1482: vpermilpd xmm0, xmm0, 1
0x1001a1488: vaddss xmm0, xmm0, xmm1
0x1001a148c: vsqrtss xmm0, xmm0, xmm0
0x1001a1490: vucomiss xmm0, dword ptr [rip + 0x90642c] ; 0x100aa78c4
0x1001a1498: jbe 0x1001a14a4
0x1001a149a: vpermilps xmm0, xmm0, 0xc0
0x1001a14a0: vdivps xmm2, xmm2, xmm0
0x1001a14a4: vmovaps xmmword ptr [rbp - 0x80], xmm2
0x1001a14a9: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a14ae: vcvtsi2ss xmm0, xmm5, eax
0x1001a14b2: vmulss xmm0, xmm0, dword ptr [rip + 0x905c36] ; 0x100aa70f0
0x1001a14ba: vmovss xmm1, dword ptr [rip + 0x903bfe] ; 0x100aa50c0
0x1001a14c2: vsubss xmm1, xmm1, xmm0
0x1001a14c6: vmulss xmm1, xmm1, dword ptr [rip + 0x9070e6] ; 0x100aa85b4
0x1001a14ce: vmulss xmm0, xmm0, dword ptr [rip + 0x9063f6] ; 0x100aa78cc
0x1001a14d6: vaddss xmm0, xmm0, xmm1
0x1001a14da: vpermilps xmm0, xmm0, 0xc0
0x1001a14e0: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x80]
0x1001a14e5: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x90]
0x1001a14ed: vaddps xmm0, xmm0, xmmword ptr [rbp - 0xd0]
0x1001a14f5: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001a14fa: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x1001a1502: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1001a1507: vmovss xmm0, dword ptr [rbx]
0x1001a150b: vmovss dword ptr [rbp - 0x90], xmm0
0x1001a1513: vmovss xmm1, dword ptr [rip + 0x9062d1] ; 0x100aa77ec
0x1001a151b: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x1001a1520: vxorps xmm1, xmm1, xmm1
0x1001a1524: vmovss xmm3, dword ptr [rbp - 0x90]
0x1001a152c: vmaxss xmm1, xmm1, xmm3
0x1001a1530: vmovss xmm2, dword ptr [rip + 0x903b88] ; 0x100aa50c0
0x1001a1538: vminss xmm1, xmm2, xmm1
0x1001a153c: vsubss xmm2, xmm2, xmm1
0x1001a1540: vmulss xmm0, xmm0, xmm2
0x1001a1544: vmulss xmm1, xmm3, xmm1
0x1001a1548: vaddss xmm0, xmm1, xmm0
0x1001a154c: vmulss xmm0, xmm0, dword ptr [rip + 0x903064] ; 0x100aa45b8
0x1001a1554: vmovss dword ptr [rbp - 0x3c], xmm0
0x1001a1559: vmovss xmm0, dword ptr [rbp - 0x64]
0x1001a155e: vmovss dword ptr [rbp - 0x40], xmm0
0x1001a1563: lea rsi, [rbp - 0x60]
0x1001a1567: mov rdi, r14
0x1001a156a: call 0x100228a30 ; 0x100228a30
0x1001a156f: mov rax, qword ptr [rip + 0xa6c362] ; 0x100c0d8d8
0x1001a1576: mov rax, qword ptr [rax]
0x1001a1579: cmp rax, qword ptr [rbp - 0x28]
0x1001a157d: jne 0x1001a158f
0x1001a157f: add rsp, 0xc0
0x1001a1586: pop rbx
0x1001a1587: pop r12
0x1001a1589: pop r14
0x1001a158b: pop r15
0x1001a158d: pop rbp
0x1001a158e: ret 
0x1001a158f: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001a1594: nop word ptr cs:[rax + rax]
