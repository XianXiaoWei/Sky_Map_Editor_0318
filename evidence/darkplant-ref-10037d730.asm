0x10037d730: push rbp
0x10037d731: mov rbp, rsp
0x10037d734: push r15
0x10037d736: push r14
0x10037d738: push rbx
0x10037d739: push rax
0x10037d73a: mov dword ptr [rip + 0x9ae594], 0 ; 0x100d2bcd8
0x10037d744: mov dword ptr [rip + 0x9ae58e], 0x3f248dbb ; 0x100d2bcdc
0x10037d74e: lea rdi, [rip + 0x9ae58b] ; 0x100d2bce0
0x10037d755: lea rsi, [rip + 0x1a7b834] ; 0x101df8f90
0x10037d75c: lea rdx, [rip + 0x8056c4] ; 0x100b82e27 tag_UpdateSync
0x10037d763: call 0x1007951b0 ; 0x1007951b0
0x10037d768: lea rdi, [rip + 0x9ae589] ; 0x100d2bcf8
0x10037d76f: lea rsi, [rip + 0x1a7b822] ; 0x101df8f98
0x10037d776: lea rdx, [rip + 0x8056b9] ; 0x100b82e36 tag_Collision
0x10037d77d: call 0x1007951b0 ; 0x1007951b0
0x10037d782: lea rax, [rip + 0x8056d8] ; 0x100b82e61 kTraceLevelLoad
0x10037d789: mov qword ptr [rip + 0x1c7b820], rax ; 0x101ff8fb0
0x10037d790: lea rdx, [rip + 0x1c7b819] ; 0x101ff8fb0
0x10037d797: mov rax, qword ptr [rip + 0x912502] ; 0x100c8fca0
0x10037d79e: mov qword ptr [rip + 0x1c7b81b], rax ; 0x101ff8fc0
0x10037d7a5: lea rax, [rip + 0x1c7b7fc] ; 0x101ff8fa8
0x10037d7ac: vmovq xmm0, rax
0x10037d7b1: lea rax, [rip + 0x8056b9] ; 0x100b82e71 Game.cpp
0x10037d7b8: vmovq xmm1, rax
0x10037d7bd: vpunpcklqdq xmm0, xmm1, xmm0
0x10037d7c1: vmovdqu xmmword ptr [rip + 0x1c7b807], xmm0 ; 0x101ff8fd0
0x10037d7c9: mov rcx, qword ptr [rip + 0x889d88] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x10037d7d0: mov qword ptr [rip + 0x1c7b809], rcx ; 0x101ff8fe0
0x10037d7d7: mov qword ptr [rip + 0x1c7b806], 0 ; 0x101ff8fe8
0x10037d7e2: lea rbx, [rip - 0x363dc9] ; 0x100019a20
0x10037d7e9: mov qword ptr [rip + 0x1c7b800], rbx ; 0x101ff8ff0
0x10037d7f0: mov qword ptr [rip + 0x1c7b7fd], 0 ; 0x101ff8ff8
0x10037d7fb: lea rsi, [rip + 0x7e7e08] ; 0x100b6560a Profile
0x10037d802: vmovq xmm2, rsi
0x10037d807: lea rsi, [rip + 0x7e080f] ; 0x100b5e01d TweakCategory
0x10037d80e: vmovq xmm0, rsi
0x10037d813: vpunpcklqdq xmm2, xmm0, xmm2
0x10037d817: vmovdqa xmmword ptr [rip + 0x1c7b7e1], xmm2 ; 0x101ff9000
0x10037d81f: lea rsi, [rip + 0x1c7b7da] ; 0x101ff9000
0x10037d826: mov qword ptr [rip + 0x1c7b7df], 0 ; 0x101ff9010
0x10037d831: mov qword ptr [rip + 0x1c7b780], rsi ; 0x101ff8fb8
0x10037d838: lea rsi, [rip + 0x80563b] ; 0x100b82e7a kScreenshotsEnabled
0x10037d83f: mov qword ptr [rip + 0x1c7b7da], rsi ; 0x101ff9020
0x10037d846: lea rsi, [rip + 0x1c7b7d3] ; 0x101ff9020
0x10037d84d: mov qword ptr [rip + 0x1c7b7dc], rdx ; 0x101ff9030
0x10037d854: lea rdx, [rip + 0x1c7b7bd] ; 0x101ff9018
0x10037d85b: vmovq xmm2, rdx
0x10037d860: vpunpcklqdq xmm2, xmm1, xmm2
0x10037d864: vmovdqu xmmword ptr [rip + 0x1c7b7d4], xmm2 ; 0x101ff9040
0x10037d86c: mov qword ptr [rip + 0x1c7b7dd], rcx ; 0x101ff9050
0x10037d873: mov qword ptr [rip + 0x1c7b7da], 0 ; 0x101ff9058
0x10037d87e: mov qword ptr [rip + 0x1c7b7db], rbx ; 0x101ff9060
0x10037d885: mov qword ptr [rip + 0x1c7b7d8], 0 ; 0x101ff9068
0x10037d890: lea rdx, [rip + 0x7f941c] ; 0x100b76cb3 Screenshot
0x10037d897: vmovq xmm2, rdx
0x10037d89c: vpunpcklqdq xmm2, xmm0, xmm2
0x10037d8a0: vmovdqa xmmword ptr [rip + 0x1c7b7c8], xmm2 ; 0x101ff9070
0x10037d8a8: lea rdx, [rip + 0x1c7b7c1] ; 0x101ff9070
0x10037d8af: mov qword ptr [rip + 0x1c7b7c6], 0 ; 0x101ff9080
0x10037d8ba: mov qword ptr [rip + 0x1c7b767], rdx ; 0x101ff9028
0x10037d8c1: lea rdx, [rip + 0x8055c6] ; 0x100b82e8e kEnableNetProfileHud
0x10037d8c8: mov qword ptr [rip + 0x1c7b7b9], rdx ; 0x101ff9088
0x10037d8cf: lea rdx, [rip + 0x1c7b7b2] ; 0x101ff9088
0x10037d8d6: mov qword ptr [rip + 0x1c7b7bb], rsi ; 0x101ff9098
0x10037d8dd: lea rsi, [rip + 0x935d24] ; 0x100cb3608
0x10037d8e4: vmovq xmm2, rsi
0x10037d8e9: vpunpcklqdq xmm1, xmm1, xmm2
0x10037d8ed: vmovdqu xmmword ptr [rip + 0x1c7b7b3], xmm1 ; 0x101ff90a8
0x10037d8f5: mov qword ptr [rip + 0x1c7b7bc], rcx ; 0x101ff90b8
0x10037d8fc: mov qword ptr [rip + 0x1c7b7b9], 0 ; 0x101ff90c0
0x10037d907: mov qword ptr [rip + 0x1c7b7ba], rbx ; 0x101ff90c8
0x10037d90e: mov qword ptr [rip + 0x1c7b7b7], 0 ; 0x101ff90d0
0x10037d919: lea rcx, [rip + 0x7e4512] ; 0x100b61e32 Debug
0x10037d920: vmovq xmm1, rcx
0x10037d925: vpunpcklqdq xmm1, xmm0, xmm1
0x10037d929: vmovdqa xmmword ptr [rip + 0x1c7b7af], xmm1 ; 0x101ff90e0
0x10037d931: lea rcx, [rip + 0x1c7b7a8] ; 0x101ff90e0
0x10037d938: mov qword ptr [rip + 0x1c7b7ad], 0 ; 0x101ff90f0
0x10037d943: mov qword ptr [rip + 0x1c7b746], rcx ; 0x101ff9090
0x10037d94a: lea rcx, [rip + 0x805552] ; 0x100b82ea3 kHitchFps
0x10037d951: mov qword ptr [rip + 0x1c7b7a0], rcx ; 0x101ff90f8
0x10037d958: lea rcx, [rip + 0x1c7b799] ; 0x101ff90f8
0x10037d95f: mov qword ptr [rip + 0x1c7b7a2], rdx ; 0x101ff9108
0x10037d966: mov qword ptr [rip + 0x912333], rcx ; 0x100c8fca0
0x10037d96d: mov qword ptr [rip + 0x1c7b7a4], rax ; 0x101ff9118
0x10037d974: lea rax, [rip + 0x935c91] ; 0x100cb360c
0x10037d97b: mov qword ptr [rip + 0x1c7b79e], rax ; 0x101ff9120
0x10037d982: mov rax, qword ptr [rip + 0x889bd7] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x10037d989: mov qword ptr [rip + 0x1c7b798], rax ; 0x101ff9128
0x10037d990: mov qword ptr [rip + 0x1c7b795], 0 ; 0x101ff9130
0x10037d99b: mov qword ptr [rip + 0x1c7b796], rbx ; 0x101ff9138
0x10037d9a2: mov qword ptr [rip + 0x1c7b793], 0 ; 0x101ff9140
0x10037d9ad: lea rax, [rip + 0x8054f9] ; 0x100b82ead ProfileHitches
0x10037d9b4: vmovq xmm1, rax
0x10037d9b9: vpunpcklqdq xmm0, xmm0, xmm1
0x10037d9bd: vmovdqa xmmword ptr [rip + 0x1c7b78b], xmm0 ; 0x101ff9150
0x10037d9c5: lea rax, [rip + 0x1c7b784] ; 0x101ff9150
0x10037d9cc: mov qword ptr [rip + 0x1c7b789], 0 ; 0x101ff9160
0x10037d9d7: lea rcx, [rip + 0x8054de] ; 0x100b82ebc 1 29
0x10037d9de: vmovq xmm0, rcx
0x10037d9e3: lea rcx, [rip + 0x7e2764] ; 0x100b6014e TweakRange
0x10037d9ea: vmovq xmm1, rcx
0x10037d9ef: vpunpcklqdq xmm0, xmm1, xmm0
0x10037d9f3: vmovdqa xmmword ptr [rip + 0x1c7b775], xmm0 ; 0x101ff9170
0x10037d9fb: lea rcx, [rip + 0x1c7b76e] ; 0x101ff9170
0x10037da02: mov qword ptr [rip + 0x1c7b777], rax ; 0x101ff9180
0x10037da09: mov qword ptr [rip + 0x1c7b6f0], rcx ; 0x101ff9100
0x10037da10: lea rax, [rip + 0x8054aa] ; 0x100b82ec1 SystemAccounts
0x10037da17: mov qword ptr [rip + 0x1c7b772], rax ; 0x101ff9190
0x10037da1e: lea rax, [rip + 0x1c7b763] ; 0x101ff9188
0x10037da25: mov qword ptr [rip + 0x1c7b768], 0 ; 0x101ff9198
0x10037da30: mov rcx, qword ptr [rip + 0x8f2521] ; 0x100c6ff58
0x10037da37: mov qword ptr [rip + 0x1c7b762], rcx ; 0x101ff91a0
0x10037da3e: mov qword ptr [rip + 0x8f2513], rax ; 0x100c6ff58
0x10037da45: mov qword ptr [rip + 0x1c7b764], rax ; 0x101ff91b0
0x10037da4c: mov qword ptr [rip + 0x1c7b761], 0 ; 0x101ff91b8
0x10037da57: mov dword ptr [rip + 0x1c7b75f], 0xffffffff ; 0x101ff91c0
0x10037da61: mov dword ptr [rip + 0x1c7b759], 0xffffffff ; 0x101ff91c4
0x10037da6b: mov qword ptr [rip + 0x1c7b76a], 0 ; 0x101ff91e0
0x10037da76: mov rax, qword ptr [rip + 0x88dafb] ; 0x100c0b578
0x10037da7d: add rax, 0x10
0x10037da81: mov qword ptr [rip + 0x1c7b700], rax ; 0x101ff9188
0x10037da88: xor eax, eax
0x10037da8a: call 0x100011c10 ; 0x100011c10
0x10037da8f: lea rax, [rip + 0x80543a] ; 0x100b82ed0 SystemAnalytics
0x10037da96: mov qword ptr [rip + 0x1c7b753], rax ; 0x101ff91f0
0x10037da9d: lea rax, [rip + 0x1c7b744] ; 0x101ff91e8
0x10037daa4: mov qword ptr [rip + 0x1c7b749], 0 ; 0x101ff91f8
0x10037daaf: mov rcx, qword ptr [rip + 0x8f24a2] ; 0x100c6ff58
0x10037dab6: mov qword ptr [rip + 0x1c7b743], rcx ; 0x101ff9200
0x10037dabd: mov qword ptr [rip + 0x8f2494], rax ; 0x100c6ff58
0x10037dac4: mov qword ptr [rip + 0x1c7b745], rax ; 0x101ff9210
0x10037dacb: mov qword ptr [rip + 0x1c7b742], 0 ; 0x101ff9218
0x10037dad6: mov qword ptr [rip + 0x1c7b73f], 0xffffffffffffffff ; 0x101ff9220
0x10037dae1: mov qword ptr [rip + 0x1c7b754], 0 ; 0x101ff9240
0x10037daec: mov rax, qword ptr [rip + 0x88dd15] ; 0x100c0b808
0x10037daf3: add rax, 0x10
0x10037daf7: mov qword ptr [rip + 0x1c7b6ea], rax ; 0x101ff91e8
0x10037dafe: xor eax, eax
0x10037db00: call 0x100011c10 ; 0x100011c10
0x10037db05: lea rax, [rip + 0x8053d4] ; 0x100b82ee0 SystemCommerce
0x10037db0c: mov qword ptr [rip + 0x1c7b73d], rax ; 0x101ff9250
0x10037db13: lea rax, [rip + 0x1c7b72e] ; 0x101ff9248
0x10037db1a: mov qword ptr [rip + 0x1c7b733], 0 ; 0x101ff9258
0x10037db25: mov rcx, qword ptr [rip + 0x8f242c] ; 0x100c6ff58
0x10037db2c: mov qword ptr [rip + 0x1c7b72d], rcx ; 0x101ff9260
0x10037db33: mov qword ptr [rip + 0x8f241e], rax ; 0x100c6ff58
0x10037db3a: mov qword ptr [rip + 0x1c7b72f], rax ; 0x101ff9270
0x10037db41: mov qword ptr [rip + 0x1c7b72c], 0 ; 0x101ff9278
0x10037db4c: mov qword ptr [rip + 0x1c7b729], 0xffffffffffffffff ; 0x101ff9280
0x10037db57: mov qword ptr [rip + 0x1c7b73e], 0 ; 0x101ff92a0
0x10037db62: mov rax, qword ptr [rip + 0x88da17] ; 0x100c0b580
0x10037db69: add rax, 0x10
0x10037db6d: mov qword ptr [rip + 0x1c7b6d4], rax ; 0x101ff9248
0x10037db74: xor eax, eax
0x10037db76: call 0x100011c10 ; 0x100011c10
0x10037db7b: lea rax, [rip + 0x80536d] ; 0x100b82eef SystemIO
0x10037db82: mov qword ptr [rip + 0x1c7b727], rax ; 0x101ff92b0
0x10037db89: lea rax, [rip + 0x1c7b718] ; 0x101ff92a8
0x10037db90: mov qword ptr [rip + 0x1c7b71d], 0 ; 0x101ff92b8
0x10037db9b: mov rcx, qword ptr [rip + 0x8f23b6] ; 0x100c6ff58
0x10037dba2: mov qword ptr [rip + 0x1c7b717], rcx ; 0x101ff92c0
0x10037dba9: mov qword ptr [rip + 0x8f23a8], rax ; 0x100c6ff58
0x10037dbb0: mov qword ptr [rip + 0x1c7b719], rax ; 0x101ff92d0
0x10037dbb7: mov qword ptr [rip + 0x1c7b716], 0 ; 0x101ff92d8
0x10037dbc2: mov qword ptr [rip + 0x1c7b713], 0xffffffffffffffff ; 0x101ff92e0
0x10037dbcd: mov qword ptr [rip + 0x1c7b728], 0 ; 0x101ff9300
0x10037dbd8: mov rax, qword ptr [rip + 0x88ebe1] ; 0x100c0c7c0
0x10037dbdf: add rax, 0x10
0x10037dbe3: mov qword ptr [rip + 0x1c7b6be], rax ; 0x101ff92a8
0x10037dbea: xor eax, eax
0x10037dbec: call 0x100011c10 ; 0x100011c10
0x10037dbf1: lea rax, [rip + 0x805300] ; 0x100b82ef8 SystemProperties
0x10037dbf8: mov qword ptr [rip + 0x1c7b711], rax ; 0x101ff9310
0x10037dbff: lea rax, [rip + 0x1c7b702] ; 0x101ff9308
0x10037dc06: mov qword ptr [rip + 0x1c7b707], 0 ; 0x101ff9318
0x10037dc11: mov rcx, qword ptr [rip + 0x8f2340] ; 0x100c6ff58
0x10037dc18: mov qword ptr [rip + 0x1c7b701], rcx ; 0x101ff9320
0x10037dc1f: mov qword ptr [rip + 0x8f2332], rax ; 0x100c6ff58
0x10037dc26: mov qword ptr [rip + 0x1c7b703], rax ; 0x101ff9330
0x10037dc2d: mov qword ptr [rip + 0x1c7b700], 0 ; 0x101ff9338
0x10037dc38: mov qword ptr [rip + 0x1c7b6fd], 0xffffffffffffffff ; 0x101ff9340
0x10037dc43: mov qword ptr [rip + 0x1c7b712], 0 ; 0x101ff9360
0x10037dc4e: mov rax, qword ptr [rip + 0x88ddd3] ; 0x100c0ba28
0x10037dc55: add rax, 0x10
0x10037dc59: mov qword ptr [rip + 0x1c7b6a8], rax ; 0x101ff9308
0x10037dc60: xor eax, eax
0x10037dc62: call 0x100011c10 ; 0x100011c10
0x10037dc67: lea rax, [rip + 0x80529b] ; 0x100b82f09 SystemSupport
0x10037dc6e: mov qword ptr [rip + 0x1c7b6fb], rax ; 0x101ff9370
0x10037dc75: lea rax, [rip + 0x1c7b6ec] ; 0x101ff9368
0x10037dc7c: mov qword ptr [rip + 0x1c7b6f1], 0 ; 0x101ff9378
0x10037dc87: mov rcx, qword ptr [rip + 0x8f22ca] ; 0x100c6ff58
0x10037dc8e: mov qword ptr [rip + 0x1c7b6eb], rcx ; 0x101ff9380
0x10037dc95: mov qword ptr [rip + 0x8f22bc], rax ; 0x100c6ff58
0x10037dc9c: mov qword ptr [rip + 0x1c7b6ed], rax ; 0x101ff9390
0x10037dca3: mov qword ptr [rip + 0x1c7b6ea], 0 ; 0x101ff9398
0x10037dcae: mov qword ptr [rip + 0x1c7b6e7], 0xffffffffffffffff ; 0x101ff93a0
0x10037dcb9: mov qword ptr [rip + 0x1c7b6fc], 0 ; 0x101ff93c0
0x10037dcc4: mov rax, qword ptr [rip + 0x88d60d] ; 0x100c0b2d8
0x10037dccb: add rax, 0x10
0x10037dccf: mov qword ptr [rip + 0x1c7b692], rax ; 0x101ff9368
0x10037dcd6: xor eax, eax
0x10037dcd8: call 0x100011c10 ; 0x100011c10
0x10037dcdd: lea rax, [rip + 0x805233] ; 0x100b82f17 SystemUI
0x10037dce4: mov qword ptr [rip + 0x1c7b6e5], rax ; 0x101ff93d0
0x10037dceb: lea rax, [rip + 0x1c7b6d6] ; 0x101ff93c8
0x10037dcf2: mov qword ptr [rip + 0x1c7b6db], 0 ; 0x101ff93d8
0x10037dcfd: mov rcx, qword ptr [rip + 0x8f2254] ; 0x100c6ff58
0x10037dd04: mov qword ptr [rip + 0x1c7b6d5], rcx ; 0x101ff93e0
0x10037dd0b: mov qword ptr [rip + 0x8f2246], rax ; 0x100c6ff58
0x10037dd12: mov qword ptr [rip + 0x1c7b6d7], rax ; 0x101ff93f0
0x10037dd19: mov qword ptr [rip + 0x1c7b6d4], 0 ; 0x101ff93f8
0x10037dd24: mov qword ptr [rip + 0x1c7b6d1], 0xffffffffffffffff ; 0x101ff9400
0x10037dd2f: mov qword ptr [rip + 0x1c7b6e6], 0 ; 0x101ff9420
0x10037dd3a: mov rax, qword ptr [rip + 0x88ea87] ; 0x100c0c7c8
0x10037dd41: add rax, 0x10
0x10037dd45: mov qword ptr [rip + 0x1c7b67c], rax ; 0x101ff93c8
0x10037dd4c: xor eax, eax
0x10037dd4e: call 0x100011c10 ; 0x100011c10
0x10037dd53: lea r15, [rip + 0x8050f5] ; 0x100b82e4f Game
0x10037dd5a: mov qword ptr [rip + 0x1c7b6cf], r15 ; 0x101ff9430
0x10037dd61: lea rax, [rip + 0x1c7b6c0] ; 0x101ff9428
0x10037dd68: mov qword ptr [rip + 0x1c7b6c5], 0 ; 0x101ff9438
0x10037dd73: mov rcx, qword ptr [rip + 0x8f21de] ; 0x100c6ff58
0x10037dd7a: mov qword ptr [rip + 0x1c7b6bf], rcx ; 0x101ff9440
0x10037dd81: mov qword ptr [rip + 0x8f21d0], rax ; 0x100c6ff58
0x10037dd88: mov qword ptr [rip + 0x1c7b6c1], rax ; 0x101ff9450
0x10037dd8f: lea r14, [rip - 0x3484d6] ; 0x1000358c0
0x10037dd96: mov qword ptr [rip + 0x1c7b6bb], r14 ; 0x101ff9458
0x10037dd9d: mov qword ptr [rip + 0x1c7b6b8], 0xffffffffffffffff ; 0x101ff9460
0x10037dda8: mov qword ptr [rip + 0x1c7b6cd], 0 ; 0x101ff9480
0x10037ddb3: mov rax, qword ptr [rip + 0x88e5de] ; 0x100c0c398
0x10037ddba: add rax, 0x10
0x10037ddbe: mov qword ptr [rip + 0x1c7b663], rax ; 0x101ff9428
0x10037ddc5: xor eax, eax
0x10037ddc7: call 0x100011c10 ; 0x100011c10
0x10037ddcc: lea rax, [rip + 0x80514d] ; 0x100b82f20 lua
0x10037ddd3: mov qword ptr [rip + 0x935836], rax ; 0x100cb3610
0x10037ddda: lea rcx, [rip + 0x93582f] ; 0x100cb3610
0x10037dde1: mov qword ptr [rip + 0x93582c], 0 ; 0x100cb3618
0x10037ddec: mov rax, qword ptr [rip + 0x8f9e6d] ; 0x100c77c60
0x10037ddf3: mov qword ptr [rip + 0x935826], rax ; 0x100cb3620
0x10037ddfa: mov qword ptr [rip + 0x93582b], 0x18 ; 0x100cb3630
0x10037de05: mov rax, qword ptr [rip + 0x88970c] ; 0x100c07518 -> 0x10037c890 __Z17GetMetaTypeByTypeIP9lua_StateERK8MetaTypev
0x10037de0c: mov qword ptr [rip + 0x935825], rax ; 0x100cb3638
0x10037de13: mov rax, qword ptr [rip + 0x88a736] ; 0x100c08550 -> 0x10037a9d0 __Z18GetMetaClassByTypeIP4GameERK9MetaClassv
0x10037de1a: mov qword ptr [rip + 0x93581f], rax ; 0x100cb3640
0x10037de21: mov qword ptr [rip + 0x93581c], 0xffffffffffffffff ; 0x100cb3648
0x10037de2c: mov qword ptr [rip + 0x93581d], rbx ; 0x100cb3650
0x10037de33: mov qword ptr [rip + 0x93581a], 0 ; 0x100cb3658
0x10037de3e: lea rdx, [rip + 0x8050df] ; 0x100b82f24 systemAccounts
0x10037de45: mov qword ptr [rip + 0x935814], rdx ; 0x100cb3660
0x10037de4c: lea rdx, [rip + 0x93580d] ; 0x100cb3660
0x10037de53: mov qword ptr [rip + 0x93580a], 0 ; 0x100cb3668
0x10037de5e: mov qword ptr [rip + 0x93580b], rcx ; 0x100cb3670
0x10037de65: mov qword ptr [rip + 0x935810], 0x28 ; 0x100cb3680
0x10037de70: mov rcx, qword ptr [rip + 0x889259] ; 0x100c070d0 -> 0x10037c8a0 __Z17GetMetaTypeByTypeIP14SystemAccountsERK8MetaTypev
0x10037de77: mov qword ptr [rip + 0x93580a], rcx ; 0x100cb3688
0x10037de7e: mov qword ptr [rip + 0x93580b], rax ; 0x100cb3690
0x10037de85: mov qword ptr [rip + 0x935808], 0xffffffffffffffff ; 0x100cb3698
0x10037de90: mov qword ptr [rip + 0x935809], rbx ; 0x100cb36a0
0x10037de97: mov qword ptr [rip + 0x935806], 0 ; 0x100cb36a8
0x10037dea2: lea rcx, [rip + 0x80508a] ; 0x100b82f33 systemAnalytics
0x10037dea9: mov qword ptr [rip + 0x935800], rcx ; 0x100cb36b0
0x10037deb0: lea rcx, [rip + 0x9357f9] ; 0x100cb36b0
0x10037deb7: mov qword ptr [rip + 0x9357f6], 0 ; 0x100cb36b8
0x10037dec2: mov qword ptr [rip + 0x9357f7], rdx ; 0x100cb36c0
0x10037dec9: mov qword ptr [rip + 0x9357fc], 0x30 ; 0x100cb36d0
0x10037ded4: mov rdx, qword ptr [rip + 0x88925d] ; 0x100c07138 -> 0x10037c8b0 __Z17GetMetaTypeByTypeIP15SystemAnalyticsERK8MetaTypev
0x10037dedb: mov qword ptr [rip + 0x9357f6], rdx ; 0x100cb36d8
0x10037dee2: mov qword ptr [rip + 0x9357f7], rax ; 0x100cb36e0
0x10037dee9: mov qword ptr [rip + 0x9357f4], 0xffffffffffffffff ; 0x100cb36e8
0x10037def4: mov qword ptr [rip + 0x9357f5], rbx ; 0x100cb36f0
0x10037defb: mov qword ptr [rip + 0x9357f2], 0 ; 0x100cb36f8
0x10037df06: lea rdx, [rip + 0x805036] ; 0x100b82f43 systemCommerce
0x10037df0d: mov qword ptr [rip + 0x9357ec], rdx ; 0x100cb3700
0x10037df14: lea rdx, [rip + 0x9357e5] ; 0x100cb3700
0x10037df1b: mov qword ptr [rip + 0x9357e2], 0 ; 0x100cb3708
0x10037df26: mov qword ptr [rip + 0x9357e3], rcx ; 0x100cb3710
0x10037df2d: mov qword ptr [rip + 0x9357e8], 0x40 ; 0x100cb3720
0x10037df38: mov rcx, qword ptr [rip + 0x889199] ; 0x100c070d8 -> 0x10037c8c0 __Z17GetMetaTypeByTypeIP14SystemCommerceERK8MetaTypev
0x10037df3f: mov qword ptr [rip + 0x9357e2], rcx ; 0x100cb3728
0x10037df46: mov qword ptr [rip + 0x9357e3], rax ; 0x100cb3730
0x10037df4d: mov qword ptr [rip + 0x9357e0], 0xffffffffffffffff ; 0x100cb3738
0x10037df58: mov qword ptr [rip + 0x9357e1], rbx ; 0x100cb3740
0x10037df5f: mov qword ptr [rip + 0x9357de], 0 ; 0x100cb3748
0x10037df6a: lea rcx, [rip + 0x804fe1] ; 0x100b82f52 systemIO
0x10037df71: mov qword ptr [rip + 0x9357d8], rcx ; 0x100cb3750
0x10037df78: lea rcx, [rip + 0x9357d1] ; 0x100cb3750
0x10037df7f: mov qword ptr [rip + 0x9357ce], 0 ; 0x100cb3758
0x10037df8a: mov qword ptr [rip + 0x9357cf], rdx ; 0x100cb3760
0x10037df91: mov qword ptr [rip + 0x9357d4], 0x48 ; 0x100cb3770
0x10037df9c: mov rdx, qword ptr [rip + 0x88945d] ; 0x100c07400 -> 0x10037c8d0 __Z17GetMetaTypeByTypeIP8SystemIOERK8MetaTypev
0x10037dfa3: mov qword ptr [rip + 0x9357ce], rdx ; 0x100cb3778
0x10037dfaa: mov qword ptr [rip + 0x9357cf], rax ; 0x100cb3780
0x10037dfb1: mov qword ptr [rip + 0x9357cc], 0xffffffffffffffff ; 0x100cb3788
0x10037dfbc: mov qword ptr [rip + 0x9357cd], rbx ; 0x100cb3790
0x10037dfc3: mov qword ptr [rip + 0x9357ca], 0 ; 0x100cb3798
0x10037dfce: lea rdx, [rip + 0x804f86] ; 0x100b82f5b systemSupport
0x10037dfd5: mov qword ptr [rip + 0x9357c4], rdx ; 0x100cb37a0
0x10037dfdc: lea rdx, [rip + 0x9357bd] ; 0x100cb37a0
0x10037dfe3: mov qword ptr [rip + 0x9357ba], 0 ; 0x100cb37a8
0x10037dfee: mov qword ptr [rip + 0x9357bb], rcx ; 0x100cb37b0
0x10037dff5: mov qword ptr [rip + 0x9357c0], 0x50 ; 0x100cb37c0
0x10037e000: mov rcx, qword ptr [rip + 0x889049] ; 0x100c07050 -> 0x10037c8e0 __Z17GetMetaTypeByTypeIP13SystemSupportERK8MetaTypev
0x10037e007: mov qword ptr [rip + 0x9357ba], rcx ; 0x100cb37c8
0x10037e00e: mov qword ptr [rip + 0x9357bb], rax ; 0x100cb37d0
0x10037e015: mov qword ptr [rip + 0x9357b8], 0xffffffffffffffff ; 0x100cb37d8
0x10037e020: mov qword ptr [rip + 0x9357b9], rbx ; 0x100cb37e0
0x10037e027: mov qword ptr [rip + 0x9357b6], 0 ; 0x100cb37e8
0x10037e032: lea rcx, [rip + 0x804f30] ; 0x100b82f69 systemUI
0x10037e039: mov qword ptr [rip + 0x9357b0], rcx ; 0x100cb37f0
0x10037e040: lea rcx, [rip + 0x9357a9] ; 0x100cb37f0
0x10037e047: mov qword ptr [rip + 0x9357a6], 0 ; 0x100cb37f8
0x10037e052: mov qword ptr [rip + 0x9357a7], rdx ; 0x100cb3800
0x10037e059: mov qword ptr [rip + 0x9357ac], 0x58 ; 0x100cb3810
0x10037e064: mov rdx, qword ptr [rip + 0x88939d] ; 0x100c07408 -> 0x10037c8f0 __Z17GetMetaTypeByTypeIP8SystemUIERK8MetaTypev
0x10037e06b: mov qword ptr [rip + 0x9357a6], rdx ; 0x100cb3818
0x10037e072: mov qword ptr [rip + 0x9357a7], rax ; 0x100cb3820
0x10037e079: mov qword ptr [rip + 0x9357a4], 0xffffffffffffffff ; 0x100cb3828
0x10037e084: mov qword ptr [rip + 0x9357a5], rbx ; 0x100cb3830
0x10037e08b: mov qword ptr [rip + 0x9357a2], 0 ; 0x100cb3838
0x10037e096: lea rdx, [rip + 0x804ed5] ; 0x100b82f72 config
0x10037e09d: mov qword ptr [rip + 0x93579c], rdx ; 0x100cb3840
0x10037e0a4: lea rdx, [rip + 0x935795] ; 0x100cb3840
0x10037e0ab: mov qword ptr [rip + 0x935792], 0 ; 0x100cb3848
0x10037e0b6: mov qword ptr [rip + 0x935793], rcx ; 0x100cb3850
0x10037e0bd: mov qword ptr [rip + 0x935798], 0x68 ; 0x100cb3860
0x10037e0c8: mov rcx, qword ptr [rip + 0x889249] ; 0x100c07318 -> 0x10037c900 __Z17GetMetaTypeByTypeIP6ConfigERK8MetaTypev
0x10037e0cf: mov qword ptr [rip + 0x935792], rcx ; 0x100cb3868
0x10037e0d6: mov qword ptr [rip + 0x935793], rax ; 0x100cb3870
0x10037e0dd: mov qword ptr [rip + 0x935790], 0xffffffffffffffff ; 0x100cb3878
0x10037e0e8: mov qword ptr [rip + 0x935791], rbx ; 0x100cb3880
0x10037e0ef: mov qword ptr [rip + 0x93578e], 0 ; 0x100cb3888
0x10037e0fa: lea rcx, [rip + 0x7fb214] ; 0x100b79315 camera
0x10037e101: mov qword ptr [rip + 0x935788], rcx ; 0x100cb3890
0x10037e108: lea rcx, [rip + 0x935781] ; 0x100cb3890
0x10037e10f: mov qword ptr [rip + 0x93577e], 0 ; 0x100cb3898
0x10037e11a: mov qword ptr [rip + 0x93577f], rdx ; 0x100cb38a0
0x10037e121: mov qword ptr [rip + 0x935784], 0x70 ; 0x100cb38b0
0x10037e12c: mov rdx, qword ptr [rip + 0x8891dd] ; 0x100c07310 -> 0x10037c910 __Z17GetMetaTypeByTypeIP6CameraERK8MetaTypev
0x10037e133: mov qword ptr [rip + 0x93577e], rdx ; 0x100cb38b8
0x10037e13a: mov qword ptr [rip + 0x93577f], rax ; 0x100cb38c0
0x10037e141: mov qword ptr [rip + 0x93577c], 0xffffffffffffffff ; 0x100cb38c8
0x10037e14c: mov qword ptr [rip + 0x93577d], rbx ; 0x100cb38d0
0x10037e153: mov qword ptr [rip + 0x93577a], 0 ; 0x100cb38d8
0x10037e15e: lea rdx, [rip + 0x804e14] ; 0x100b82f79 metaSystem
0x10037e165: mov qword ptr [rip + 0x935774], rdx ; 0x100cb38e0
0x10037e16c: lea rdx, [rip + 0x93576d] ; 0x100cb38e0
0x10037e173: mov qword ptr [rip + 0x93576a], 0 ; 0x100cb38e8
0x10037e17e: mov qword ptr [rip + 0x93576b], rcx ; 0x100cb38f0
0x10037e185: mov qword ptr [rip + 0x935770], 0x98 ; 0x100cb3900
0x10037e190: mov rcx, qword ptr [rip + 0x888cf9] ; 0x100c06e90 -> 0x10037c920 __Z17GetMetaTypeByTypeIP10MetaSystemERK8MetaTypev
0x10037e197: mov qword ptr [rip + 0x93576a], rcx ; 0x100cb3908
0x10037e19e: mov qword ptr [rip + 0x93576b], rax ; 0x100cb3910
0x10037e1a5: mov qword ptr [rip + 0x935768], 0xffffffffffffffff ; 0x100cb3918
0x10037e1b0: mov qword ptr [rip + 0x935769], rbx ; 0x100cb3920
0x10037e1b7: mov qword ptr [rip + 0x935766], 0 ; 0x100cb3928
0x10037e1c2: lea rcx, [rip + 0x804dbb] ; 0x100b82f84 jobBarn
0x10037e1c9: mov qword ptr [rip + 0x935760], rcx ; 0x100cb3930
0x10037e1d0: lea rcx, [rip + 0x935759] ; 0x100cb3930
0x10037e1d7: mov qword ptr [rip + 0x935756], 0 ; 0x100cb3938
0x10037e1e2: mov qword ptr [rip + 0x935757], rdx ; 0x100cb3940
0x10037e1e9: mov qword ptr [rip + 0x93575c], 0x118 ; 0x100cb3950
0x10037e1f4: mov rdx, qword ptr [rip + 0x88915d] ; 0x100c07358 -> 0x10037c930 __Z17GetMetaTypeByTypeIP7JobBarnERK8MetaTypev
0x10037e1fb: mov qword ptr [rip + 0x935756], rdx ; 0x100cb3958
0x10037e202: mov qword ptr [rip + 0x935757], rax ; 0x100cb3960
0x10037e209: mov qword ptr [rip + 0x935754], 0xffffffffffffffff ; 0x100cb3968
0x10037e214: mov qword ptr [rip + 0x935755], rbx ; 0x100cb3970
0x10037e21b: mov qword ptr [rip + 0x935752], 0 ; 0x100cb3978
0x10037e226: lea rdx, [rip + 0x800653] ; 0x100b7e880 gameResourceArgs
0x10037e22d: mov qword ptr [rip + 0x93574c], rdx ; 0x100cb3980
0x10037e234: lea rdx, [rip + 0x935745] ; 0x100cb3980
0x10037e23b: mov qword ptr [rip + 0x935742], 0 ; 0x100cb3988
0x10037e246: mov qword ptr [rip + 0x935743], rcx ; 0x100cb3990
0x10037e24d: mov qword ptr [rip + 0x935748], 0x128 ; 0x100cb39a0
0x10037e258: mov rcx, qword ptr [rip + 0x888f29] ; 0x100c07188 -> 0x10037c940 __Z17GetMetaTypeByTypeIP16GameResourceArgsERK8MetaTypev
0x10037e25f: mov qword ptr [rip + 0x935742], rcx ; 0x100cb39a8
0x10037e266: mov qword ptr [rip + 0x935743], rax ; 0x100cb39b0
0x10037e26d: mov qword ptr [rip + 0x935740], 0xffffffffffffffff ; 0x100cb39b8
0x10037e278: mov qword ptr [rip + 0x935741], rbx ; 0x100cb39c0
0x10037e27f: mov qword ptr [rip + 0x93573e], 0 ; 0x100cb39c8
0x10037e28a: lea rcx, [rip + 0x7de6b1] ; 0x100b5c942 systemHeap
0x10037e291: mov qword ptr [rip + 0x935738], rcx ; 0x100cb39d0
0x10037e298: lea rsi, [rip + 0x935731] ; 0x100cb39d0
0x10037e29f: mov qword ptr [rip + 0x93572e], 0 ; 0x100cb39d8
0x10037e2aa: mov qword ptr [rip + 0x93572f], rdx ; 0x100cb39e0
0x10037e2b1: mov qword ptr [rip + 0x935734], 0xd0 ; 0x100cb39f0
0x10037e2bc: mov rcx, qword ptr [rip + 0x888fd5] ; 0x100c07298 -> 0x10037c950 __Z17GetMetaTypeByTypeIP4HeapERK8MetaTypev
0x10037e2c3: mov qword ptr [rip + 0x93572e], rcx ; 0x100cb39f8
0x10037e2ca: mov qword ptr [rip + 0x93572f], rax ; 0x100cb3a00
0x10037e2d1: mov qword ptr [rip + 0x93572c], 0xffffffffffffffff ; 0x100cb3a08
0x10037e2dc: mov qword ptr [rip + 0x93572d], rbx ; 0x100cb3a10
0x10037e2e3: mov qword ptr [rip + 0x93572a], 0 ; 0x100cb3a18
0x10037e2ee: lea rdx, [rip + 0x7fc331] ; 0x100b7a626 levelHeap
0x10037e2f5: mov qword ptr [rip + 0x935724], rdx ; 0x100cb3a20
0x10037e2fc: lea rdx, [rip + 0x93571d] ; 0x100cb3a20
0x10037e303: mov qword ptr [rip + 0x93571a], 0 ; 0x100cb3a28
0x10037e30e: mov qword ptr [rip + 0x93571b], rsi ; 0x100cb3a30
0x10037e315: mov qword ptr [rip + 0x935720], 0xe8 ; 0x100cb3a40
0x10037e320: mov qword ptr [rip + 0x935721], rcx ; 0x100cb3a48
0x10037e327: mov qword ptr [rip + 0x935722], rax ; 0x100cb3a50
0x10037e32e: mov qword ptr [rip + 0x93571f], 0xffffffffffffffff ; 0x100cb3a58
0x10037e339: mov qword ptr [rip + 0x935720], rbx ; 0x100cb3a60
0x10037e340: mov qword ptr [rip + 0x93571d], 0 ; 0x100cb3a68
0x10037e34b: lea rsi, [rip + 0x804c3a] ; 0x100b82f8c streamingHeap
0x10037e352: mov qword ptr [rip + 0x935717], rsi ; 0x100cb3a70
0x10037e359: lea rsi, [rip + 0x935710] ; 0x100cb3a70
0x10037e360: mov qword ptr [rip + 0x93570d], 0 ; 0x100cb3a78
0x10037e36b: mov qword ptr [rip + 0x93570e], rdx ; 0x100cb3a80
0x10037e372: mov qword ptr [rip + 0x935713], 0xf0 ; 0x100cb3a90
0x10037e37d: mov qword ptr [rip + 0x935714], rcx ; 0x100cb3a98
0x10037e384: mov qword ptr [rip + 0x935715], rax ; 0x100cb3aa0
0x10037e38b: mov qword ptr [rip + 0x935712], 0xffffffffffffffff ; 0x100cb3aa8
0x10037e396: mov qword ptr [rip + 0x935713], rbx ; 0x100cb3ab0
0x10037e39d: mov qword ptr [rip + 0x935710], 0 ; 0x100cb3ab8
0x10037e3a8: lea rdx, [rip + 0x7e7d15] ; 0x100b660c4 resourceHeap
0x10037e3af: mov qword ptr [rip + 0x93570a], rdx ; 0x100cb3ac0
0x10037e3b6: lea rdx, [rip + 0x935703] ; 0x100cb3ac0
0x10037e3bd: mov qword ptr [rip + 0x935700], 0 ; 0x100cb3ac8
0x10037e3c8: mov qword ptr [rip + 0x935701], rsi ; 0x100cb3ad0
0x10037e3cf: mov qword ptr [rip + 0x935706], 0xf8 ; 0x100cb3ae0
0x10037e3da: mov qword ptr [rip + 0x935707], rcx ; 0x100cb3ae8
0x10037e3e1: mov qword ptr [rip + 0x935708], rax ; 0x100cb3af0
0x10037e3e8: mov qword ptr [rip + 0x935705], 0xffffffffffffffff ; 0x100cb3af8
0x10037e3f3: mov qword ptr [rip + 0x935706], rbx ; 0x100cb3b00
0x10037e3fa: mov qword ptr [rip + 0x935703], 0 ; 0x100cb3b08
0x10037e405: lea rsi, [rip + 0x804b8e] ; 0x100b82f9a soundHeap
0x10037e40c: mov qword ptr [rip + 0x9356fd], rsi ; 0x100cb3b10
0x10037e413: lea rsi, [rip + 0x9356f6] ; 0x100cb3b10
0x10037e41a: mov qword ptr [rip + 0x9356f3], 0 ; 0x100cb3b18
0x10037e425: mov qword ptr [rip + 0x9356f4], rdx ; 0x100cb3b20
0x10037e42c: mov qword ptr [rip + 0x9356f9], 0x100 ; 0x100cb3b30
0x10037e437: mov qword ptr [rip + 0x9356fa], rcx ; 0x100cb3b38
0x10037e43e: mov qword ptr [rip + 0x9356fb], rax ; 0x100cb3b40
0x10037e445: mov qword ptr [rip + 0x9356f8], 0xffffffffffffffff ; 0x100cb3b48
0x10037e450: mov qword ptr [rip + 0x9356f9], rbx ; 0x100cb3b50
0x10037e457: mov qword ptr [rip + 0x9356f6], 0 ; 0x100cb3b58
0x10037e462: lea rdx, [rip + 0x804b3b] ; 0x100b82fa4 scratchHeapHeap
0x10037e469: mov qword ptr [rip + 0x9356f0], rdx ; 0x100cb3b60
0x10037e470: lea rdx, [rip + 0x9356e9] ; 0x100cb3b60
0x10037e477: mov qword ptr [rip + 0x9356e6], 0 ; 0x100cb3b68
0x10037e482: mov qword ptr [rip + 0x9356e7], rsi ; 0x100cb3b70
0x10037e489: mov qword ptr [rip + 0x9356ec], 0x108 ; 0x100cb3b80
0x10037e494: mov qword ptr [rip + 0x9356ed], rcx ; 0x100cb3b88
0x10037e49b: mov qword ptr [rip + 0x9356ee], rax ; 0x100cb3b90
0x10037e4a2: mov qword ptr [rip + 0x9356eb], 0xffffffffffffffff ; 0x100cb3b98
0x10037e4ad: mov qword ptr [rip + 0x9356ec], rbx ; 0x100cb3ba0
0x10037e4b4: mov qword ptr [rip + 0x9356e9], 0 ; 0x100cb3ba8
0x10037e4bf: lea rsi, [rip + 0x804aee] ; 0x100b82fb4 moduleHeap
0x10037e4c6: mov qword ptr [rip + 0x9356e3], rsi ; 0x100cb3bb0
0x10037e4cd: lea rsi, [rip + 0x9356dc] ; 0x100cb3bb0
0x10037e4d4: mov qword ptr [rip + 0x9356d9], 0 ; 0x100cb3bb8
0x10037e4df: mov qword ptr [rip + 0x9356da], rdx ; 0x100cb3bc0
0x10037e4e6: mov qword ptr [rip + 0x9356df], 0x110 ; 0x100cb3bd0
0x10037e4f1: mov qword ptr [rip + 0x9356e0], rcx ; 0x100cb3bd8
0x10037e4f8: mov qword ptr [rip + 0x9356e1], rax ; 0x100cb3be0
0x10037e4ff: mov qword ptr [rip + 0x9356de], 0xffffffffffffffff ; 0x100cb3be8
0x10037e50a: mov qword ptr [rip + 0x9356df], rbx ; 0x100cb3bf0
0x10037e511: mov qword ptr [rip + 0x9356dc], 0 ; 0x100cb3bf8
0x10037e51c: lea rcx, [rip + 0x804a9c] ; 0x100b82fbf resourceArgs
0x10037e523: mov qword ptr [rip + 0x9356d6], rcx ; 0x100cb3c00
0x10037e52a: lea rcx, [rip + 0x9356cf] ; 0x100cb3c00
0x10037e531: mov qword ptr [rip + 0x9356cc], 0 ; 0x100cb3c08
0x10037e53c: mov qword ptr [rip + 0x9356cd], rsi ; 0x100cb3c10
0x10037e543: mov qword ptr [rip + 0x9356d2], 0x120 ; 0x100cb3c20
0x10037e54e: mov rdx, qword ptr [rip + 0x888a43] ; 0x100c06f98 -> 0x10037c960 __Z17GetMetaTypeByTypeIP12ResourceArgsERK8MetaTypev
0x10037e555: mov qword ptr [rip + 0x9356cc], rdx ; 0x100cb3c28
0x10037e55c: mov qword ptr [rip + 0x9356cd], rax ; 0x100cb3c30
0x10037e563: mov qword ptr [rip + 0x9356ca], 0xffffffffffffffff ; 0x100cb3c38
0x10037e56e: mov qword ptr [rip + 0x9356cb], rbx ; 0x100cb3c40
0x10037e575: mov qword ptr [rip + 0x9356c8], 0 ; 0x100cb3c48
0x10037e580: lea rdx, [rip + 0x7e24ca] ; 0x100b60a51 levelName
0x10037e587: mov qword ptr [rip + 0x9356c2], rdx ; 0x100cb3c50
0x10037e58e: lea rdx, [rip + 0x9356bb] ; 0x100cb3c50
0x10037e595: mov qword ptr [rip + 0x9356b8], 0 ; 0x100cb3c58
0x10037e5a0: mov qword ptr [rip + 0x9356b9], rcx ; 0x100cb3c60
0x10037e5a7: mov qword ptr [rip + 0x9356be], 0x610 ; 0x100cb3c70
0x10037e5b2: mov rcx, qword ptr [rip + 0x888f97] ; 0x100c07550 -> 0x10037c970 __Z17GetMetaTypeByTypeIPKcERK8MetaTypev
0x10037e5b9: mov qword ptr [rip + 0x9356b8], rcx ; 0x100cb3c78
0x10037e5c0: mov qword ptr [rip + 0x9356b9], rax ; 0x100cb3c80
0x10037e5c7: mov qword ptr [rip + 0x9356b6], 0xffffffffffffffff ; 0x100cb3c88
0x10037e5d2: mov qword ptr [rip + 0x9356b7], rbx ; 0x100cb3c90
0x10037e5d9: mov qword ptr [rip + 0x9356b4], 0 ; 0x100cb3c98
0x10037e5e4: lea rsi, [rip + 0x8049e1] ; 0x100b82fcc gameMode
0x10037e5eb: mov qword ptr [rip + 0x9356ae], rsi ; 0x100cb3ca0
0x10037e5f2: lea rsi, [rip + 0x9356a7] ; 0x100cb3ca0
0x10037e5f9: mov qword ptr [rip + 0x9356a4], 0 ; 0x100cb3ca8
0x10037e604: mov qword ptr [rip + 0x9356a5], rdx ; 0x100cb3cb0
0x10037e60b: mov qword ptr [rip + 0x9356aa], 0x608 ; 0x100cb3cc0
0x10037e616: mov rdx, qword ptr [rip + 0x888d83] ; 0x100c073a0 -> 0x10037c990 __Z17GetMetaTypeByTypeIP8GameModeERK8MetaTypev
0x10037e61d: mov qword ptr [rip + 0x9356a4], rdx ; 0x100cb3cc8
0x10037e624: mov qword ptr [rip + 0x9356a5], rax ; 0x100cb3cd0
0x10037e62b: mov qword ptr [rip + 0x9356a2], 0xffffffffffffffff ; 0x100cb3cd8
0x10037e636: mov qword ptr [rip + 0x9356a3], rbx ; 0x100cb3ce0
0x10037e63d: mov qword ptr [rip + 0x9356a0], 0 ; 0x100cb3ce8
0x10037e648: lea rdx, [rip + 0x804986] ; 0x100b82fd5 serverHostname
0x10037e64f: mov qword ptr [rip + 0x93569a], rdx ; 0x100cb3cf0
0x10037e656: lea rdx, [rip + 0x935693] ; 0x100cb3cf0
0x10037e65d: mov qword ptr [rip + 0x935690], 0 ; 0x100cb3cf8
0x10037e668: mov qword ptr [rip + 0x935691], rsi ; 0x100cb3d00
0x10037e66f: mov qword ptr [rip + 0x935696], 0x1020 ; 0x100cb3d10
0x10037e67a: mov qword ptr [rip + 0x935697], rcx ; 0x100cb3d18
0x10037e681: mov qword ptr [rip + 0x935698], rax ; 0x100cb3d20
0x10037e688: mov qword ptr [rip + 0x935695], 0xffffffffffffffff ; 0x100cb3d28
0x10037e693: mov qword ptr [rip + 0x935696], rbx ; 0x100cb3d30
0x10037e69a: mov qword ptr [rip + 0x935693], 0 ; 0x100cb3d38
0x10037e6a5: lea rcx, [rip + 0x804938] ; 0x100b82fe4 deviceInfo
0x10037e6ac: mov qword ptr [rip + 0x93568d], rcx ; 0x100cb3d40
0x10037e6b3: lea rcx, [rip + 0x935686] ; 0x100cb3d40
0x10037e6ba: mov qword ptr [rip + 0x93568f], rdx ; 0x100cb3d50
0x10037e6c1: mov qword ptr [rip + 0x935694], 0x60 ; 0x100cb3d60
0x10037e6cc: mov rdx, qword ptr [rip + 0x888775] ; 0x100c06e48 -> 0x10037c9a0 __Z17GetMetaTypeByTypeIP10DeviceInfoERK8MetaTypev
0x10037e6d3: mov qword ptr [rip + 0x93568e], rdx ; 0x100cb3d68
0x10037e6da: mov qword ptr [rip + 0x93568f], rax ; 0x100cb3d70
0x10037e6e1: mov qword ptr [rip + 0x93568c], 0xffffffffffffffff ; 0x100cb3d78
0x10037e6ec: mov qword ptr [rip + 0x93568d], rbx ; 0x100cb3d80
0x10037e6f3: mov qword ptr [rip + 0x93568a], 0 ; 0x100cb3d88
0x10037e6fe: lea rdx, [rip + 0x80473f] ; 0x100b82e44 Core
0x10037e705: vmovq xmm1, rdx
0x10037e70a: lea rdx, [rip + 0x8048de] ; 0x100b82fef ModuleGroup
0x10037e711: vmovq xmm0, rdx
0x10037e716: vpunpcklqdq xmm1, xmm0, xmm1
0x10037e71a: vmovdqa xmmword ptr [rip + 0x1c7ad6e], xmm1 ; 0x101ff9490
0x10037e722: lea rdx, [rip + 0x1c7ad67] ; 0x101ff9490
0x10037e729: mov qword ptr [rip + 0x1c7ad6c], 0 ; 0x101ff94a0
0x10037e734: mov qword ptr [rip + 0x93560d], rdx ; 0x100cb3d48
0x10037e73b: lea rdx, [rip + 0x8048b9] ; 0x100b82ffb globalPatcher
0x10037e742: mov qword ptr [rip + 0x935647], rdx ; 0x100cb3d90
0x10037e749: lea rdx, [rip + 0x935640] ; 0x100cb3d90
0x10037e750: mov qword ptr [rip + 0x935649], rcx ; 0x100cb3da0
0x10037e757: mov qword ptr [rip + 0x93564e], 0x78 ; 0x100cb3db0
0x10037e762: mov rcx, qword ptr [rip + 0x8888a7] ; 0x100c07010 -> 0x10037c9b0 __Z17GetMetaTypeByTypeIP13GlobalPatcherERK8MetaTypev
0x10037e769: mov qword ptr [rip + 0x935648], rcx ; 0x100cb3db8
0x10037e770: mov qword ptr [rip + 0x935649], rax ; 0x100cb3dc0
0x10037e777: mov qword ptr [rip + 0x935646], 0xffffffffffffffff ; 0x100cb3dc8
0x10037e782: mov qword ptr [rip + 0x935647], rbx ; 0x100cb3dd0
0x10037e789: mov qword ptr [rip + 0x935644], 0 ; 0x100cb3dd8
0x10037e794: vmovdqa xmmword ptr [rip + 0x1c7ad14], xmm1 ; 0x101ff94b0
0x10037e79c: lea rcx, [rip + 0x1c7ad0d] ; 0x101ff94b0
0x10037e7a3: mov qword ptr [rip + 0x1c7ad12], 0 ; 0x101ff94c0
0x10037e7ae: mov qword ptr [rip + 0x9355e3], rcx ; 0x100cb3d98
0x10037e7b5: lea rcx, [rip + 0x7fce05] ; 0x100b7b5c1 appVfs
0x10037e7bc: mov qword ptr [rip + 0x93561d], rcx ; 0x100cb3de0
0x10037e7c3: lea rcx, [rip + 0x935616] ; 0x100cb3de0
0x10037e7ca: mov qword ptr [rip + 0x93561f], rdx ; 0x100cb3df0
0x10037e7d1: mov qword ptr [rip + 0x935624], 0xa8 ; 0x100cb3e00
0x10037e7dc: mov rdx, qword ptr [rip + 0x888a95] ; 0x100c07278 -> 0x10037c9c0 __Z17GetMetaTypeByTypeIP3VfsERK8MetaTypev
0x10037e7e3: mov qword ptr [rip + 0x93561e], rdx ; 0x100cb3e08
0x10037e7ea: mov qword ptr [rip + 0x93561f], rax ; 0x100cb3e10
0x10037e7f1: mov qword ptr [rip + 0x93561c], 0xffffffffffffffff ; 0x100cb3e18
0x10037e7fc: mov qword ptr [rip + 0x93561d], rbx ; 0x100cb3e20
0x10037e803: mov qword ptr [rip + 0x93561a], 0 ; 0x100cb3e28
0x10037e80e: vmovdqa xmmword ptr [rip + 0x1c7acba], xmm1 ; 0x101ff94d0
0x10037e816: lea rsi, [rip + 0x1c7acb3] ; 0x101ff94d0
0x10037e81d: mov qword ptr [rip + 0x1c7acb8], 0 ; 0x101ff94e0
0x10037e828: mov qword ptr [rip + 0x9355b9], rsi ; 0x100cb3de8
0x10037e82f: lea rsi, [rip + 0x7de11e] ; 0x100b5c954 storageVfs
0x10037e836: mov qword ptr [rip + 0x9355f3], rsi ; 0x100cb3e30
0x10037e83d: lea rsi, [rip + 0x9355ec] ; 0x100cb3e30
0x10037e844: mov qword ptr [rip + 0x9355f5], rcx ; 0x100cb3e40
0x10037e84b: mov qword ptr [rip + 0x9355fa], 0xb0 ; 0x100cb3e50
0x10037e856: mov qword ptr [rip + 0x9355fb], rdx ; 0x100cb3e58
0x10037e85d: mov qword ptr [rip + 0x9355fc], rax ; 0x100cb3e60
0x10037e864: mov qword ptr [rip + 0x9355f9], 0xffffffffffffffff ; 0x100cb3e68
0x10037e86f: mov qword ptr [rip + 0x9355fa], rbx ; 0x100cb3e70
0x10037e876: mov qword ptr [rip + 0x9355f7], 0 ; 0x100cb3e78
0x10037e881: vmovdqa xmmword ptr [rip + 0x1c7ac67], xmm1 ; 0x101ff94f0
0x10037e889: lea rcx, [rip + 0x1c7ac60] ; 0x101ff94f0
0x10037e890: mov qword ptr [rip + 0x1c7ac65], 0 ; 0x101ff9500
0x10037e89b: mov qword ptr [rip + 0x935596], rcx ; 0x100cb3e38
0x10037e8a2: lea rcx, [rip + 0x804760] ; 0x100b83009 streamingVfs
0x10037e8a9: mov qword ptr [rip + 0x9355d0], rcx ; 0x100cb3e80
0x10037e8b0: lea rcx, [rip + 0x9355c9] ; 0x100cb3e80
0x10037e8b7: mov qword ptr [rip + 0x9355d2], rsi ; 0x100cb3e90
0x10037e8be: mov qword ptr [rip + 0x9355d7], 0xb8 ; 0x100cb3ea0
0x10037e8c9: mov qword ptr [rip + 0x9355d8], rdx ; 0x100cb3ea8
0x10037e8d0: mov qword ptr [rip + 0x9355d9], rax ; 0x100cb3eb0
0x10037e8d7: mov qword ptr [rip + 0x9355d6], 0xffffffffffffffff ; 0x100cb3eb8
0x10037e8e2: mov qword ptr [rip + 0x9355d7], rbx ; 0x100cb3ec0
0x10037e8e9: mov qword ptr [rip + 0x9355d4], 0 ; 0x100cb3ec8
0x10037e8f4: vmovdqa xmmword ptr [rip + 0x1c7ac14], xmm1 ; 0x101ff9510
0x10037e8fc: lea rdx, [rip + 0x1c7ac0d] ; 0x101ff9510
0x10037e903: mov qword ptr [rip + 0x1c7ac12], 0 ; 0x101ff9520
0x10037e90e: mov qword ptr [rip + 0x935573], rdx ; 0x100cb3e88
0x10037e915: lea rdx, [rip + 0x8046fa] ; 0x100b83016 scene
0x10037e91c: mov qword ptr [rip + 0x9355ad], rdx ; 0x100cb3ed0
0x10037e923: lea rdx, [rip + 0x9355a6] ; 0x100cb3ed0
0x10037e92a: mov qword ptr [rip + 0x9355af], rcx ; 0x100cb3ee0
0x10037e931: mov qword ptr [rip + 0x9355b4], 0x148 ; 0x100cb3ef0
0x10037e93c: mov rcx, qword ptr [rip + 0x8889b5] ; 0x100c072f8 -> 0x10037c9d0 __Z17GetMetaTypeByTypeIP5SceneERK8MetaTypev
0x10037e943: mov qword ptr [rip + 0x9355ae], rcx ; 0x100cb3ef8
0x10037e94a: mov qword ptr [rip + 0x9355af], rax ; 0x100cb3f00
0x10037e951: mov qword ptr [rip + 0x9355ac], 0xffffffffffffffff ; 0x100cb3f08
0x10037e95c: mov qword ptr [rip + 0x9355ad], rbx ; 0x100cb3f10
0x10037e963: mov qword ptr [rip + 0x9355aa], 0 ; 0x100cb3f18
0x10037e96e: vmovdqa xmmword ptr [rip + 0x1c7abba], xmm1 ; 0x101ff9530
0x10037e976: lea rcx, [rip + 0x1c7abb3] ; 0x101ff9530
0x10037e97d: mov qword ptr [rip + 0x1c7abb8], 0 ; 0x101ff9540
0x10037e988: mov qword ptr [rip + 0x935549], rcx ; 0x100cb3ed8
0x10037e98f: lea rcx, [rip + 0x804686] ; 0x100b8301c compositor
0x10037e996: mov qword ptr [rip + 0x935583], rcx ; 0x100cb3f20
0x10037e99d: lea rcx, [rip + 0x93557c] ; 0x100cb3f20
0x10037e9a4: mov qword ptr [rip + 0x935585], rdx ; 0x100cb3f30
0x10037e9ab: mov qword ptr [rip + 0x93558a], 0x158 ; 0x100cb3f40
0x10037e9b6: mov rdx, qword ptr [rip + 0x88845b] ; 0x100c06e18 -> 0x10037c9e0 __Z17GetMetaTypeByTypeIP10CompositorERK8MetaTypev
0x10037e9bd: mov qword ptr [rip + 0x935584], rdx ; 0x100cb3f48
0x10037e9c4: mov qword ptr [rip + 0x935585], rax ; 0x100cb3f50
0x10037e9cb: mov qword ptr [rip + 0x935582], 0xffffffffffffffff ; 0x100cb3f58
0x10037e9d6: mov qword ptr [rip + 0x935583], rbx ; 0x100cb3f60
0x10037e9dd: mov qword ptr [rip + 0x935580], 0 ; 0x100cb3f68
0x10037e9e8: vmovdqa xmmword ptr [rip + 0x1c7ab60], xmm1 ; 0x101ff9550
0x10037e9f0: lea rdx, [rip + 0x1c7ab59] ; 0x101ff9550
0x10037e9f7: mov qword ptr [rip + 0x1c7ab5e], 0 ; 0x101ff9560
0x10037ea02: mov qword ptr [rip + 0x93551f], rdx ; 0x100cb3f28
0x10037ea09: lea rdx, [rip + 0x804617] ; 0x100b83027 shaderData
0x10037ea10: mov qword ptr [rip + 0x935559], rdx ; 0x100cb3f70
0x10037ea17: lea rdx, [rip + 0x935552] ; 0x100cb3f70
0x10037ea1e: mov qword ptr [rip + 0x93555b], rcx ; 0x100cb3f80
0x10037ea25: mov qword ptr [rip + 0x935560], 0x150 ; 0x100cb3f90
0x10037ea30: mov rcx, qword ptr [rip + 0x888499] ; 0x100c06ed0 -> 0x10037c9f0 __Z17GetMetaTypeByTypeIP10ShaderDataERK8MetaTypev
0x10037ea37: mov qword ptr [rip + 0x93555a], rcx ; 0x100cb3f98
0x10037ea3e: mov qword ptr [rip + 0x93555b], rax ; 0x100cb3fa0
0x10037ea45: mov qword ptr [rip + 0x935558], 0xffffffffffffffff ; 0x100cb3fa8
0x10037ea50: mov qword ptr [rip + 0x935559], rbx ; 0x100cb3fb0
0x10037ea57: mov qword ptr [rip + 0x935556], 0 ; 0x100cb3fb8
0x10037ea62: vmovdqa xmmword ptr [rip + 0x1c7ab06], xmm1 ; 0x101ff9570
0x10037ea6a: lea rcx, [rip + 0x1c7aaff] ; 0x101ff9570
0x10037ea71: mov qword ptr [rip + 0x1c7ab04], 0 ; 0x101ff9580
0x10037ea7c: mov qword ptr [rip + 0x9354f5], rcx ; 0x100cb3f78
0x10037ea83: lea rcx, [rip + 0x8045a8] ; 0x100b83032 input
0x10037ea8a: mov qword ptr [rip + 0x93552f], rcx ; 0x100cb3fc0
0x10037ea91: lea rcx, [rip + 0x935528] ; 0x100cb3fc0
0x10037ea98: mov qword ptr [rip + 0x935531], rdx ; 0x100cb3fd0
0x10037ea9f: mov qword ptr [rip + 0x935536], 0x1b8 ; 0x100cb3fe0
0x10037eaaa: mov rdx, qword ptr [rip + 0x88882f] ; 0x100c072e0 -> 0x10037ca00 __Z17GetMetaTypeByTypeIP5InputERK8MetaTypev
0x10037eab1: mov qword ptr [rip + 0x935530], rdx ; 0x100cb3fe8
0x10037eab8: mov qword ptr [rip + 0x935531], rax ; 0x100cb3ff0
0x10037eabf: mov qword ptr [rip + 0x93552e], 0xffffffffffffffff ; 0x100cb3ff8
0x10037eaca: mov qword ptr [rip + 0x93552f], rbx ; 0x100cb4000
0x10037ead1: mov qword ptr [rip + 0x93552c], 0 ; 0x100cb4008
0x10037eadc: vmovdqa xmmword ptr [rip + 0x1c7aaac], xmm1 ; 0x101ff9590
0x10037eae4: lea rdx, [rip + 0x1c7aaa5] ; 0x101ff9590
0x10037eaeb: mov qword ptr [rip + 0x1c7aaaa], 0 ; 0x101ff95a0
0x10037eaf6: mov qword ptr [rip + 0x9354cb], rdx ; 0x100cb3fc8
0x10037eafd: lea rdx, [rip + 0x804534] ; 0x100b83038 resources
0x10037eb04: mov qword ptr [rip + 0x935505], rdx ; 0x100cb4010
0x10037eb0b: lea rdx, [rip + 0x9354fe] ; 0x100cb4010
0x10037eb12: mov qword ptr [rip + 0x935507], rcx ; 0x100cb4020
0x10037eb19: mov qword ptr [rip + 0x93550c], 0x140 ; 0x100cb4030
0x10037eb24: mov rcx, qword ptr [rip + 0x8885fd] ; 0x100c07128 -> 0x10037ca10 __Z17GetMetaTypeByTypeIP15ResourceManagerERK8MetaTypev
0x10037eb2b: mov qword ptr [rip + 0x935506], rcx ; 0x100cb4038
0x10037eb32: mov qword ptr [rip + 0x935507], rax ; 0x100cb4040
0x10037eb39: mov qword ptr [rip + 0x935504], 0xffffffffffffffff ; 0x100cb4048
0x10037eb44: mov qword ptr [rip + 0x935505], rbx ; 0x100cb4050
0x10037eb4b: mov qword ptr [rip + 0x935502], 0 ; 0x100cb4058
0x10037eb56: vmovdqa xmmword ptr [rip + 0x1c7aa52], xmm1 ; 0x101ff95b0
0x10037eb5e: lea rcx, [rip + 0x1c7aa4b] ; 0x101ff95b0
0x10037eb65: mov qword ptr [rip + 0x1c7aa50], 0 ; 0x101ff95c0
0x10037eb70: mov qword ptr [rip + 0x9354a1], rcx ; 0x100cb4018
0x10037eb77: lea rcx, [rip + 0x8044c4] ; 0x100b83042 globalMessageBarn
0x10037eb7e: mov qword ptr [rip + 0x9354db], rcx ; 0x100cb4060
0x10037eb85: lea rcx, [rip + 0x9354d4] ; 0x100cb4060
0x10037eb8c: mov qword ptr [rip + 0x9354dd], rdx ; 0x100cb4070
0x10037eb93: mov qword ptr [rip + 0x9354e2], 0xc0 ; 0x100cb4080
0x10037eb9e: mov rdx, qword ptr [rip + 0x88863b] ; 0x100c071e0 -> 0x10037ca20 __Z17GetMetaTypeByTypeIP17GlobalMessageBarnERK8MetaTypev
0x10037eba5: mov qword ptr [rip + 0x9354dc], rdx ; 0x100cb4088
0x10037ebac: mov qword ptr [rip + 0x9354dd], rax ; 0x100cb4090
0x10037ebb3: mov qword ptr [rip + 0x9354da], 0xffffffffffffffff ; 0x100cb4098
0x10037ebbe: mov qword ptr [rip + 0x9354db], rbx ; 0x100cb40a0
0x10037ebc5: mov qword ptr [rip + 0x9354d8], 0 ; 0x100cb40a8
0x10037ebd0: vmovdqa xmmword ptr [rip + 0x1c7a9f8], xmm1 ; 0x101ff95d0
0x10037ebd8: lea rdx, [rip + 0x1c7a9f1] ; 0x101ff95d0
0x10037ebdf: mov qword ptr [rip + 0x1c7a9f6], 0 ; 0x101ff95e0
0x10037ebea: mov qword ptr [rip + 0x935477], rdx ; 0x100cb4068
0x10037ebf1: lea rdx, [rip + 0x80445c] ; 0x100b83054 logBarn
0x10037ebf8: mov qword ptr [rip + 0x9354b1], rdx ; 0x100cb40b0
0x10037ebff: lea rdx, [rip + 0x9354aa] ; 0x100cb40b0
0x10037ec06: mov qword ptr [rip + 0x9354b3], rcx ; 0x100cb40c0
0x10037ec0d: mov qword ptr [rip + 0x9354b8], 0x4e8 ; 0x100cb40d0
0x10037ec18: mov rcx, qword ptr [rip + 0x888741] ; 0x100c07360 -> 0x10037ca30 __Z17GetMetaTypeByTypeIP7LogBarnERK8MetaTypev
0x10037ec1f: mov qword ptr [rip + 0x9354b2], rcx ; 0x100cb40d8
0x10037ec26: mov qword ptr [rip + 0x9354b3], rax ; 0x100cb40e0
0x10037ec2d: mov qword ptr [rip + 0x9354b0], 0xffffffffffffffff ; 0x100cb40e8
0x10037ec38: mov qword ptr [rip + 0x9354b1], rbx ; 0x100cb40f0
0x10037ec3f: mov qword ptr [rip + 0x9354ae], 0 ; 0x100cb40f8
0x10037ec4a: vmovdqa xmmword ptr [rip + 0x1c7a99e], xmm1 ; 0x101ff95f0
0x10037ec52: lea rcx, [rip + 0x1c7a997] ; 0x101ff95f0
0x10037ec59: mov qword ptr [rip + 0x1c7a99c], 0 ; 0x101ff9600
0x10037ec64: mov qword ptr [rip + 0x93544d], rcx ; 0x100cb40b8
0x10037ec6b: lea rcx, [rip + 0x8043ea] ; 0x100b8305c gameTime
0x10037ec72: mov qword ptr [rip + 0x935487], rcx ; 0x100cb4100
0x10037ec79: lea rcx, [rip + 0x935480] ; 0x100cb4100
0x10037ec80: mov qword ptr [rip + 0x935489], rdx ; 0x100cb4110
0x10037ec87: mov qword ptr [rip + 0x93548e], 0x160 ; 0x100cb4120
0x10037ec92: mov rdx, qword ptr [rip + 0x88870f] ; 0x100c073a8 -> 0x10037ca40 __Z17GetMetaTypeByTypeIP8GameTimeERK8MetaTypev
0x10037ec99: mov qword ptr [rip + 0x935488], rdx ; 0x100cb4128
0x10037eca0: mov qword ptr [rip + 0x935489], rax ; 0x100cb4130
0x10037eca7: mov qword ptr [rip + 0x935486], 0xffffffffffffffff ; 0x100cb4138
0x10037ecb2: mov qword ptr [rip + 0x935487], rbx ; 0x100cb4140
0x10037ecb9: mov qword ptr [rip + 0x935484], 0 ; 0x100cb4148
0x10037ecc4: vmovdqa xmmword ptr [rip + 0x1c7a944], xmm1 ; 0x101ff9610
0x10037eccc: lea rdx, [rip + 0x1c7a93d] ; 0x101ff9610
0x10037ecd3: mov qword ptr [rip + 0x1c7a942], 0 ; 0x101ff9620
0x10037ecde: mov qword ptr [rip + 0x935423], rdx ; 0x100cb4108
0x10037ece5: lea rdx, [rip + 0x804379] ; 0x100b83065 profiler
0x10037ecec: mov qword ptr [rip + 0x93545d], rdx ; 0x100cb4150
0x10037ecf3: lea rdx, [rip + 0x935456] ; 0x100cb4150
0x10037ecfa: mov qword ptr [rip + 0x93545f], rcx ; 0x100cb4160
0x10037ed01: mov qword ptr [rip + 0x935464], 0x558 ; 0x100cb4170
0x10037ed0c: mov rcx, qword ptr [rip + 0x8886c5] ; 0x100c073d8 -> 0x10037ca50 __Z17GetMetaTypeByTypeIP8ProfilerERK8MetaTypev
0x10037ed13: mov qword ptr [rip + 0x93545e], rcx ; 0x100cb4178
0x10037ed1a: mov qword ptr [rip + 0x93545f], rax ; 0x100cb4180
0x10037ed21: mov qword ptr [rip + 0x93545c], 0xffffffffffffffff ; 0x100cb4188
0x10037ed2c: mov qword ptr [rip + 0x93545d], rbx ; 0x100cb4190
0x10037ed33: mov qword ptr [rip + 0x93545a], 0 ; 0x100cb4198
0x10037ed3e: vmovdqa xmmword ptr [rip + 0x1c7a8ea], xmm1 ; 0x101ff9630
0x10037ed46: lea rcx, [rip + 0x1c7a8e3] ; 0x101ff9630
0x10037ed4d: mov qword ptr [rip + 0x1c7a8e8], 0 ; 0x101ff9640
0x10037ed58: mov qword ptr [rip + 0x9353f9], rcx ; 0x100cb4158
0x10037ed5f: lea rcx, [rip + 0x804308] ; 0x100b8306e globalShaderUniforms
0x10037ed66: mov qword ptr [rip + 0x935433], rcx ; 0x100cb41a0
0x10037ed6d: lea rcx, [rip + 0x93542c] ; 0x100cb41a0
0x10037ed74: mov qword ptr [rip + 0x935435], rdx ; 0x100cb41b0
0x10037ed7b: mov qword ptr [rip + 0x93543a], 0x1d0 ; 0x100cb41c0
0x10037ed86: mov rdx, qword ptr [rip + 0x8884bb] ; 0x100c07248 -> 0x10037ca60 __Z17GetMetaTypeByTypeIP20GlobalShaderUniformsERK8MetaTypev
0x10037ed8d: mov qword ptr [rip + 0x935434], rdx ; 0x100cb41c8
0x10037ed94: mov qword ptr [rip + 0x935435], rax ; 0x100cb41d0
0x10037ed9b: mov qword ptr [rip + 0x935432], 0xffffffffffffffff ; 0x100cb41d8
0x10037eda6: mov qword ptr [rip + 0x935433], rbx ; 0x100cb41e0
0x10037edad: mov qword ptr [rip + 0x935430], 0 ; 0x100cb41e8
0x10037edb8: vmovdqa xmmword ptr [rip + 0x1c7a890], xmm1 ; 0x101ff9650
0x10037edc0: lea rdx, [rip + 0x1c7a889] ; 0x101ff9650
0x10037edc7: mov qword ptr [rip + 0x1c7a88e], 0 ; 0x101ff9660
0x10037edd2: mov qword ptr [rip + 0x9353cf], rdx ; 0x100cb41a8
0x10037edd9: lea rdx, [rip + 0x8042a3] ; 0x100b83083 levelAllocatedData
0x10037ede0: mov qword ptr [rip + 0x935409], rdx ; 0x100cb41f0
0x10037ede7: lea rdx, [rip + 0x935402] ; 0x100cb41f0
0x10037edee: mov qword ptr [rip + 0x93540b], rcx ; 0x100cb4200
0x10037edf5: mov qword ptr [rip + 0x935410], 0x208 ; 0x100cb4210
0x10037ee00: mov rcx, qword ptr [rip + 0x888451] ; 0x100c07258 -> 0x10037ca70 __Z17GetMetaTypeByTypeIP22LevelAllocatedDataBarnERK8MetaTypev
0x10037ee07: mov qword ptr [rip + 0x93540a], rcx ; 0x100cb4218
0x10037ee0e: mov qword ptr [rip + 0x93540b], rax ; 0x100cb4220
0x10037ee15: mov qword ptr [rip + 0x935408], 0xffffffffffffffff ; 0x100cb4228
0x10037ee20: mov qword ptr [rip + 0x935409], rbx ; 0x100cb4230
0x10037ee27: mov qword ptr [rip + 0x935406], 0 ; 0x100cb4238
0x10037ee32: vmovdqa xmmword ptr [rip + 0x1c7a836], xmm1 ; 0x101ff9670
0x10037ee3a: lea rcx, [rip + 0x1c7a82f] ; 0x101ff9670
0x10037ee41: mov qword ptr [rip + 0x1c7a834], 0 ; 0x101ff9680
0x10037ee4c: mov qword ptr [rip + 0x9353a5], rcx ; 0x100cb41f8
0x10037ee53: lea rcx, [rip + 0x80423c] ; 0x100b83096 debugTweak
0x10037ee5a: mov qword ptr [rip + 0x9353df], rcx ; 0x100cb4240
0x10037ee61: lea rcx, [rip + 0x9353d8] ; 0x100cb4240
0x10037ee68: mov qword ptr [rip + 0x9353e1], rdx ; 0x100cb4250
0x10037ee6f: mov qword ptr [rip + 0x9353e6], 0x5e8 ; 0x100cb4260
0x10037ee7a: mov rdx, qword ptr [rip + 0x887fbf] ; 0x100c06e40 -> 0x10037ca80 __Z17GetMetaTypeByTypeIP10DebugTweakERK8MetaTypev
0x10037ee81: mov qword ptr [rip + 0x9353e0], rdx ; 0x100cb4268
0x10037ee88: mov qword ptr [rip + 0x9353e1], rax ; 0x100cb4270
0x10037ee8f: mov qword ptr [rip + 0x9353de], 0xffffffffffffffff ; 0x100cb4278
0x10037ee9a: mov qword ptr [rip + 0x9353df], rbx ; 0x100cb4280
0x10037eea1: mov qword ptr [rip + 0x9353dc], 0 ; 0x100cb4288
0x10037eeac: vmovdqa xmmword ptr [rip + 0x1c7a7dc], xmm1 ; 0x101ff9690
0x10037eeb4: lea rdx, [rip + 0x1c7a7d5] ; 0x101ff9690
0x10037eebb: mov qword ptr [rip + 0x1c7a7da], 0 ; 0x101ff96a0
0x10037eec6: mov qword ptr [rip + 0x93537b], rdx ; 0x100cb4248
0x10037eecd: lea rdx, [rip + 0x8041cd] ; 0x100b830a1 dnsResolver
0x10037eed4: mov qword ptr [rip + 0x9353b5], rdx ; 0x100cb4290
0x10037eedb: lea rdx, [rip + 0x9353ae] ; 0x100cb4290
0x10037eee2: mov qword ptr [rip + 0x9353b7], rcx ; 0x100cb42a0
0x10037eee9: mov qword ptr [rip + 0x9353bc], 0x170 ; 0x100cb42b0
0x10037eef4: mov rcx, qword ptr [rip + 0x888025] ; 0x100c06f20 -> 0x10037ca90 __Z17GetMetaTypeByTypeIP11DnsResolverERK8MetaTypev
0x10037eefb: mov qword ptr [rip + 0x9353b6], rcx ; 0x100cb42b8
0x10037ef02: mov qword ptr [rip + 0x9353b7], rax ; 0x100cb42c0
0x10037ef09: mov qword ptr [rip + 0x9353b4], 0xffffffffffffffff ; 0x100cb42c8
0x10037ef14: mov qword ptr [rip + 0x9353b5], rbx ; 0x100cb42d0
0x10037ef1b: mov qword ptr [rip + 0x9353b2], 0 ; 0x100cb42d8
0x10037ef26: vmovdqa xmmword ptr [rip + 0x1c7a782], xmm1 ; 0x101ff96b0
0x10037ef2e: lea rcx, [rip + 0x1c7a77b] ; 0x101ff96b0
0x10037ef35: mov qword ptr [rip + 0x1c7a780], 0 ; 0x101ff96c0
0x10037ef40: mov qword ptr [rip + 0x935351], rcx ; 0x100cb4298
0x10037ef47: lea rcx, [rip + 0x80415f] ; 0x100b830ad eventBarn
0x10037ef4e: mov qword ptr [rip + 0x93538b], rcx ; 0x100cb42e0
0x10037ef55: lea rcx, [rip + 0x935384] ; 0x100cb42e0
0x10037ef5c: mov qword ptr [rip + 0x93538d], rdx ; 0x100cb42f0
0x10037ef63: mov qword ptr [rip + 0x935392], 0x488 ; 0x100cb4300
0x10037ef6e: mov rdx, qword ptr [rip + 0x888513] ; 0x100c07488 -> 0x10037caa0 __Z17GetMetaTypeByTypeIP9EventBarnERK8MetaTypev
0x10037ef75: mov qword ptr [rip + 0x93538c], rdx ; 0x100cb4308
0x10037ef7c: mov qword ptr [rip + 0x93538d], rax ; 0x100cb4310
0x10037ef83: mov qword ptr [rip + 0x93538a], 0xffffffffffffffff ; 0x100cb4318
0x10037ef8e: mov qword ptr [rip + 0x93538b], rbx ; 0x100cb4320
0x10037ef95: mov qword ptr [rip + 0x935388], 0 ; 0x100cb4328
0x10037efa0: vmovdqa xmmword ptr [rip + 0x1c7a728], xmm1 ; 0x101ff96d0
0x10037efa8: lea rdx, [rip + 0x1c7a721] ; 0x101ff96d0
0x10037efaf: mov qword ptr [rip + 0x1c7a726], 0 ; 0x101ff96e0
0x10037efba: mov qword ptr [rip + 0x935327], rdx ; 0x100cb42e8
0x10037efc1: lea rdx, [rip + 0x8040ef] ; 0x100b830b7 collisionGeoBarn
0x10037efc8: mov qword ptr [rip + 0x935361], rdx ; 0x100cb4330
0x10037efcf: lea rdx, [rip + 0x93535a] ; 0x100cb4330
0x10037efd6: mov qword ptr [rip + 0x935363], rcx ; 0x100cb4340
0x10037efdd: mov qword ptr [rip + 0x935368], 0x138 ; 0x100cb4350
0x10037efe8: mov rcx, qword ptr [rip + 0x888189] ; 0x100c07178 -> 0x10037cab0 __Z17GetMetaTypeByTypeIP16CollisionGeoBarnERK8MetaTypev
0x10037efef: mov qword ptr [rip + 0x935362], rcx ; 0x100cb4358
0x10037eff6: mov qword ptr [rip + 0x935363], rax ; 0x100cb4360
0x10037effd: mov qword ptr [rip + 0x935360], 0xffffffffffffffff ; 0x100cb4368
0x10037f008: mov qword ptr [rip + 0x935361], rbx ; 0x100cb4370
0x10037f00f: mov qword ptr [rip + 0x93535e], 0 ; 0x100cb4378
0x10037f01a: vmovdqa xmmword ptr [rip + 0x1c7a6ce], xmm1 ; 0x101ff96f0
0x10037f022: lea rcx, [rip + 0x1c7a6c7] ; 0x101ff96f0
0x10037f029: mov qword ptr [rip + 0x1c7a6cc], 0 ; 0x101ff9700
0x10037f034: mov qword ptr [rip + 0x9352fd], rcx ; 0x100cb4338
0x10037f03b: lea rcx, [rip + 0x804086] ; 0x100b830c8 cameraSystem
0x10037f042: mov qword ptr [rip + 0x935337], rcx ; 0x100cb4380
0x10037f049: lea rcx, [rip + 0x935330] ; 0x100cb4380
0x10037f050: mov qword ptr [rip + 0x935339], rdx ; 0x100cb4390
0x10037f057: mov qword ptr [rip + 0x93533e], 0x298 ; 0x100cb43a0
0x10037f062: mov rdx, qword ptr [rip + 0x887f17] ; 0x100c06f80 -> 0x10037cac0 __Z17GetMetaTypeByTypeIP12CameraSystemERK8MetaTypev
0x10037f069: mov qword ptr [rip + 0x935338], rdx ; 0x100cb43a8
0x10037f070: mov qword ptr [rip + 0x935339], rax ; 0x100cb43b0
0x10037f077: mov qword ptr [rip + 0x935336], 0xffffffffffffffff ; 0x100cb43b8
0x10037f082: mov qword ptr [rip + 0x935337], rbx ; 0x100cb43c0
0x10037f089: mov qword ptr [rip + 0x935334], 0 ; 0x100cb43c8
0x10037f094: vmovdqa xmmword ptr [rip + 0x1c7a674], xmm1 ; 0x101ff9710
0x10037f09c: lea rdx, [rip + 0x1c7a66d] ; 0x101ff9710
0x10037f0a3: mov qword ptr [rip + 0x1c7a672], 0 ; 0x101ff9720
0x10037f0ae: mov qword ptr [rip + 0x9352d3], rdx ; 0x100cb4388
0x10037f0b5: lea rdx, [rip + 0x804019] ; 0x100b830d5 httpClient
0x10037f0bc: mov qword ptr [rip + 0x93530d], rdx ; 0x100cb43d0
0x10037f0c3: lea rdx, [rip + 0x935306] ; 0x100cb43d0
0x10037f0ca: mov qword ptr [rip + 0x93530f], rcx ; 0x100cb43e0
0x10037f0d1: mov qword ptr [rip + 0x935314], 0x2d0 ; 0x100cb43f0
0x10037f0dc: mov rcx, qword ptr [rip + 0x887d8d] ; 0x100c06e70 -> 0x10037cad0 __Z17GetMetaTypeByTypeIP10HttpClientERK8MetaTypev
0x10037f0e3: mov qword ptr [rip + 0x93530e], rcx ; 0x100cb43f8
0x10037f0ea: mov qword ptr [rip + 0x93530f], rax ; 0x100cb4400
0x10037f0f1: mov qword ptr [rip + 0x93530c], 0xffffffffffffffff ; 0x100cb4408
0x10037f0fc: mov qword ptr [rip + 0x93530d], rbx ; 0x100cb4410
0x10037f103: mov qword ptr [rip + 0x93530a], 0 ; 0x100cb4418
0x10037f10e: vmovdqa xmmword ptr [rip + 0x1c7a61a], xmm1 ; 0x101ff9730
0x10037f116: lea rcx, [rip + 0x1c7a613] ; 0x101ff9730
0x10037f11d: mov qword ptr [rip + 0x1c7a618], 0 ; 0x101ff9740
0x10037f128: mov qword ptr [rip + 0x9352a9], rcx ; 0x100cb43d8
0x10037f12f: lea rcx, [rip + 0x803faa] ; 0x100b830e0 invites
0x10037f136: mov qword ptr [rip + 0x9352e3], rcx ; 0x100cb4420
0x10037f13d: lea rcx, [rip + 0x9352dc] ; 0x100cb4420
0x10037f144: mov qword ptr [rip + 0x9352e5], rdx ; 0x100cb4430
0x10037f14b: mov qword ptr [rip + 0x9352ea], 0x268 ; 0x100cb4440
0x10037f156: mov rdx, qword ptr [rip + 0x8881f3] ; 0x100c07350 -> 0x10037cae0 __Z17GetMetaTypeByTypeIP7InvitesERK8MetaTypev
0x10037f15d: mov qword ptr [rip + 0x9352e4], rdx ; 0x100cb4448
0x10037f164: mov qword ptr [rip + 0x9352e5], rax ; 0x100cb4450
0x10037f16b: mov qword ptr [rip + 0x9352e2], 0xffffffffffffffff ; 0x100cb4458
0x10037f176: mov qword ptr [rip + 0x9352e3], rbx ; 0x100cb4460
0x10037f17d: mov qword ptr [rip + 0x9352e0], 0 ; 0x100cb4468
0x10037f188: vmovdqa xmmword ptr [rip + 0x1c7a5c0], xmm1 ; 0x101ff9750
0x10037f190: lea rdx, [rip + 0x1c7a5b9] ; 0x101ff9750
0x10037f197: mov qword ptr [rip + 0x1c7a5be], 0 ; 0x101ff9760
0x10037f1a2: mov qword ptr [rip + 0x93527f], rdx ; 0x100cb4428
0x10037f1a9: lea rdx, [rip + 0x803f38] ; 0x100b830e8 objectFactory
0x10037f1b0: mov qword ptr [rip + 0x9352b9], rdx ; 0x100cb4470
0x10037f1b7: lea rdx, [rip + 0x9352b2] ; 0x100cb4470
0x10037f1be: mov qword ptr [rip + 0x9352bb], rcx ; 0x100cb4480
0x10037f1c5: mov qword ptr [rip + 0x9352c0], 0x1f0 ; 0x100cb4490
0x10037f1d0: mov rcx, qword ptr [rip + 0x887e69] ; 0x100c07040 -> 0x10037caf0 __Z17GetMetaTypeByTypeIP13ObjectFactoryERK8MetaTypev
0x10037f1d7: mov qword ptr [rip + 0x9352ba], rcx ; 0x100cb4498
0x10037f1de: mov qword ptr [rip + 0x9352bb], rax ; 0x100cb44a0
0x10037f1e5: mov qword ptr [rip + 0x9352b8], 0xffffffffffffffff ; 0x100cb44a8
0x10037f1f0: mov qword ptr [rip + 0x9352b9], rbx ; 0x100cb44b0
0x10037f1f7: mov qword ptr [rip + 0x9352b6], 0 ; 0x100cb44b8
0x10037f202: lea rcx, [rip + 0x803c40] ; 0x100b82e49 Intro
0x10037f209: vmovq xmm1, rcx
0x10037f20e: vpunpcklqdq xmm1, xmm0, xmm1
0x10037f212: vmovdqa xmmword ptr [rip + 0x1c7a556], xmm1 ; 0x101ff9770
0x10037f21a: lea rcx, [rip + 0x1c7a54f] ; 0x101ff9770
0x10037f221: mov qword ptr [rip + 0x1c7a554], 0 ; 0x101ff9780
0x10037f22c: mov qword ptr [rip + 0x935245], rcx ; 0x100cb4478
0x10037f233: lea rcx, [rip + 0x803ebc] ; 0x100b830f6 prefabBarn
0x10037f23a: mov qword ptr [rip + 0x93527f], rcx ; 0x100cb44c0
0x10037f241: lea rcx, [rip + 0x935278] ; 0x100cb44c0
0x10037f248: mov qword ptr [rip + 0x935281], rdx ; 0x100cb44d0
0x10037f24f: mov qword ptr [rip + 0x935286], 0x1f8 ; 0x100cb44e0
0x10037f25a: mov rdx, qword ptr [rip + 0x887c5f] ; 0x100c06ec0 -> 0x10037cb00 __Z17GetMetaTypeByTypeIP10PrefabBarnERK8MetaTypev
0x10037f261: mov qword ptr [rip + 0x935280], rdx ; 0x100cb44e8
0x10037f268: mov qword ptr [rip + 0x935281], rax ; 0x100cb44f0
0x10037f26f: mov qword ptr [rip + 0x93527e], 0xffffffffffffffff ; 0x100cb44f8
0x10037f27a: mov qword ptr [rip + 0x93527f], rbx ; 0x100cb4500
0x10037f281: mov qword ptr [rip + 0x93527c], 0 ; 0x100cb4508
0x10037f28c: vmovdqa xmmword ptr [rip + 0x1c7a4fc], xmm1 ; 0x101ff9790
0x10037f294: lea rdx, [rip + 0x1c7a4f5] ; 0x101ff9790
0x10037f29b: mov qword ptr [rip + 0x1c7a4fa], 0 ; 0x101ff97a0
0x10037f2a6: mov qword ptr [rip + 0x93521b], rdx ; 0x100cb44c8
0x10037f2ad: lea rdx, [rip + 0x803e4d] ; 0x100b83101 parentBarn
0x10037f2b4: mov qword ptr [rip + 0x935255], rdx ; 0x100cb4510
0x10037f2bb: lea rdx, [rip + 0x93524e] ; 0x100cb4510
0x10037f2c2: mov qword ptr [rip + 0x935257], rcx ; 0x100cb4520
0x10037f2c9: mov qword ptr [rip + 0x93525c], 0x288 ; 0x100cb4530
0x10037f2d4: mov rcx, qword ptr [rip + 0x887bcd] ; 0x100c06ea8 -> 0x10037cb10 __Z17GetMetaTypeByTypeIP10ParentBarnERK8MetaTypev
0x10037f2db: mov qword ptr [rip + 0x935256], rcx ; 0x100cb4538
0x10037f2e2: mov qword ptr [rip + 0x935257], rax ; 0x100cb4540
0x10037f2e9: mov qword ptr [rip + 0x935254], 0xffffffffffffffff ; 0x100cb4548
0x10037f2f4: mov qword ptr [rip + 0x935255], rbx ; 0x100cb4550
0x10037f2fb: mov qword ptr [rip + 0x935252], 0 ; 0x100cb4558
0x10037f306: vmovdqa xmmword ptr [rip + 0x1c7a4a2], xmm1 ; 0x101ff97b0
0x10037f30e: lea rcx, [rip + 0x1c7a49b] ; 0x101ff97b0
0x10037f315: mov qword ptr [rip + 0x1c7a4a0], 0 ; 0x101ff97c0
0x10037f320: mov qword ptr [rip + 0x9351f1], rcx ; 0x100cb4518
0x10037f327: lea rcx, [rip + 0x803dde] ; 0x100b8310c terrainBarn
0x10037f32e: mov qword ptr [rip + 0x93522b], rcx ; 0x100cb4560
0x10037f335: lea rcx, [rip + 0x935224] ; 0x100cb4560
0x10037f33c: mov qword ptr [rip + 0x93522d], rdx ; 0x100cb4570
0x10037f343: mov qword ptr [rip + 0x935232], 0x328 ; 0x100cb4580
0x10037f34e: mov rdx, qword ptr [rip + 0x887c03] ; 0x100c06f58 -> 0x10037cb20 __Z17GetMetaTypeByTypeIP11TerrainBarnERK8MetaTypev
0x10037f355: mov qword ptr [rip + 0x93522c], rdx ; 0x100cb4588
0x10037f35c: mov qword ptr [rip + 0x93522d], rax ; 0x100cb4590
0x10037f363: mov qword ptr [rip + 0x93522a], 0xffffffffffffffff ; 0x100cb4598
0x10037f36e: mov qword ptr [rip + 0x93522b], rbx ; 0x100cb45a0
0x10037f375: mov qword ptr [rip + 0x935228], 0 ; 0x100cb45a8
0x10037f380: vmovdqa xmmword ptr [rip + 0x1c7a448], xmm1 ; 0x101ff97d0
0x10037f388: lea rdx, [rip + 0x1c7a441] ; 0x101ff97d0
0x10037f38f: mov qword ptr [rip + 0x1c7a446], 0 ; 0x101ff97e0
0x10037f39a: mov qword ptr [rip + 0x9351c7], rdx ; 0x100cb4568
0x10037f3a1: lea rdx, [rip + 0x803d70] ; 0x100b83118 terrainBlobBarn
0x10037f3a8: mov qword ptr [rip + 0x935201], rdx ; 0x100cb45b0
0x10037f3af: lea rdx, [rip + 0x9351fa] ; 0x100cb45b0
0x10037f3b6: mov qword ptr [rip + 0x935203], rcx ; 0x100cb45c0
0x10037f3bd: mov qword ptr [rip + 0x935208], 0x320 ; 0x100cb45d0
0x10037f3c8: mov rcx, qword ptr [rip + 0x887d71] ; 0x100c07140 -> 0x10037cb30 __Z17GetMetaTypeByTypeIP15TerrainBlobBarnERK8MetaTypev
0x10037f3cf: mov qword ptr [rip + 0x935202], rcx ; 0x100cb45d8
0x10037f3d6: mov qword ptr [rip + 0x935203], rax ; 0x100cb45e0
0x10037f3dd: mov qword ptr [rip + 0x935200], 0xffffffffffffffff ; 0x100cb45e8
0x10037f3e8: mov qword ptr [rip + 0x935201], rbx ; 0x100cb45f0
0x10037f3ef: mov qword ptr [rip + 0x9351fe], 0 ; 0x100cb45f8
0x10037f3fa: vmovdqa xmmword ptr [rip + 0x1c7a3ee], xmm1 ; 0x101ff97f0
0x10037f402: lea rcx, [rip + 0x1c7a3e7] ; 0x101ff97f0
0x10037f409: mov qword ptr [rip + 0x1c7a3ec], 0 ; 0x101ff9800
0x10037f414: mov qword ptr [rip + 0x93519d], rcx ; 0x100cb45b8
0x10037f41b: lea rcx, [rip + 0x803d06] ; 0x100b83128 clumpBarn
0x10037f422: mov qword ptr [rip + 0x9351d7], rcx ; 0x100cb4600
0x10037f429: lea rcx, [rip + 0x9351d0] ; 0x100cb4600
0x10037f430: mov qword ptr [rip + 0x9351d9], rdx ; 0x100cb4610
0x10037f437: mov qword ptr [rip + 0x9351de], 0x200 ; 0x100cb4620
0x10037f442: mov rdx, qword ptr [rip + 0x888027] ; 0x100c07470 -> 0x10037cb40 __Z17GetMetaTypeByTypeIP9ClumpBarnERK8MetaTypev
0x10037f449: mov qword ptr [rip + 0x9351d8], rdx ; 0x100cb4628
0x10037f450: mov qword ptr [rip + 0x9351d9], rax ; 0x100cb4630
0x10037f457: mov qword ptr [rip + 0x9351d6], 0xffffffffffffffff ; 0x100cb4638
0x10037f462: mov qword ptr [rip + 0x9351d7], rbx ; 0x100cb4640
0x10037f469: mov qword ptr [rip + 0x9351d4], 0 ; 0x100cb4648
0x10037f474: vmovdqa xmmword ptr [rip + 0x1c7a394], xmm1 ; 0x101ff9810
0x10037f47c: lea rdx, [rip + 0x1c7a38d] ; 0x101ff9810
0x10037f483: mov qword ptr [rip + 0x1c7a392], 0 ; 0x101ff9820
0x10037f48e: mov qword ptr [rip + 0x935173], rdx ; 0x100cb4608
0x10037f495: lea rdx, [rip + 0x803c96] ; 0x100b83132 levelDataBarn
0x10037f49c: mov qword ptr [rip + 0x9351ad], rdx ; 0x100cb4650
0x10037f4a3: lea rdx, [rip + 0x9351a6] ; 0x100cb4650
0x10037f4aa: mov qword ptr [rip + 0x9351af], rcx ; 0x100cb4660
0x10037f4b1: mov qword ptr [rip + 0x9351b4], 0x330 ; 0x100cb4670
0x10037f4bc: mov rcx, qword ptr [rip + 0x887b5d] ; 0x100c07020 -> 0x10037cb50 __Z17GetMetaTypeByTypeIP13LevelDataBarnERK8MetaTypev
0x10037f4c3: mov qword ptr [rip + 0x9351ae], rcx ; 0x100cb4678
0x10037f4ca: mov qword ptr [rip + 0x9351af], rax ; 0x100cb4680
0x10037f4d1: mov qword ptr [rip + 0x9351ac], 0xffffffffffffffff ; 0x100cb4688
0x10037f4dc: mov qword ptr [rip + 0x9351ad], rbx ; 0x100cb4690
0x10037f4e3: mov qword ptr [rip + 0x9351aa], 0 ; 0x100cb4698
0x10037f4ee: vmovdqa xmmword ptr [rip + 0x1c7a33a], xmm1 ; 0x101ff9830
0x10037f4f6: lea rcx, [rip + 0x1c7a333] ; 0x101ff9830
0x10037f4fd: mov qword ptr [rip + 0x1c7a338], 0 ; 0x101ff9840
0x10037f508: mov qword ptr [rip + 0x935149], rcx ; 0x100cb4658
0x10037f50f: lea rcx, [rip + 0x803c2a] ; 0x100b83140 ambience
0x10037f516: mov qword ptr [rip + 0x935183], rcx ; 0x100cb46a0
0x10037f51d: lea rcx, [rip + 0x93517c] ; 0x100cb46a0
0x10037f524: mov qword ptr [rip + 0x935185], rdx ; 0x100cb46b0
0x10037f52b: mov qword ptr [rip + 0x93518a], 0x2b0 ; 0x100cb46c0
0x10037f536: mov rdx, qword ptr [rip + 0x887e43] ; 0x100c07380 -> 0x10037cb60 __Z17GetMetaTypeByTypeIP8AmbienceERK8MetaTypev
0x10037f53d: mov qword ptr [rip + 0x935184], rdx ; 0x100cb46c8
0x10037f544: mov qword ptr [rip + 0x935185], rax ; 0x100cb46d0
0x10037f54b: mov qword ptr [rip + 0x935182], 0xffffffffffffffff ; 0x100cb46d8
0x10037f556: mov qword ptr [rip + 0x935183], rbx ; 0x100cb46e0
0x10037f55d: mov qword ptr [rip + 0x935180], 0 ; 0x100cb46e8
0x10037f568: vmovdqa xmmword ptr [rip + 0x1c7a2e0], xmm1 ; 0x101ff9850
0x10037f570: lea rdx, [rip + 0x1c7a2d9] ; 0x101ff9850
0x10037f577: mov qword ptr [rip + 0x1c7a2de], 0 ; 0x101ff9860
0x10037f582: mov qword ptr [rip + 0x93511f], rdx ; 0x100cb46a8
0x10037f589: lea rdx, [rip + 0x803bb9] ; 0x100b83149 environment
0x10037f590: mov qword ptr [rip + 0x935159], rdx ; 0x100cb46f0
0x10037f597: lea rdx, [rip + 0x935152] ; 0x100cb46f0
0x10037f59e: mov qword ptr [rip + 0x93515b], rcx ; 0x100cb4700
0x10037f5a5: mov qword ptr [rip + 0x935160], 0x2a8 ; 0x100cb4710
0x10037f5b0: mov rcx, qword ptr [rip + 0x887979] ; 0x100c06f30 -> 0x10037cb70 __Z17GetMetaTypeByTypeIP11EnvironmentERK8MetaTypev
0x10037f5b7: mov qword ptr [rip + 0x93515a], rcx ; 0x100cb4718
0x10037f5be: mov qword ptr [rip + 0x93515b], rax ; 0x100cb4720
0x10037f5c5: mov qword ptr [rip + 0x935158], 0xffffffffffffffff ; 0x100cb4728
0x10037f5d0: mov qword ptr [rip + 0x935159], rbx ; 0x100cb4730
0x10037f5d7: mov qword ptr [rip + 0x935156], 0 ; 0x100cb4738
0x10037f5e2: vmovdqa xmmword ptr [rip + 0x1c7a286], xmm1 ; 0x101ff9870
0x10037f5ea: lea rcx, [rip + 0x1c7a27f] ; 0x101ff9870
0x10037f5f1: mov qword ptr [rip + 0x1c7a284], 0 ; 0x101ff9880
0x10037f5fc: mov qword ptr [rip + 0x9350f5], rcx ; 0x100cb46f8
0x10037f603: lea rcx, [rip + 0x803b4b] ; 0x100b83155 beamoBarn
0x10037f60a: mov qword ptr [rip + 0x93512f], rcx ; 0x100cb4740
0x10037f611: lea rcx, [rip + 0x935128] ; 0x100cb4740
0x10037f618: mov qword ptr [rip + 0x935131], rdx ; 0x100cb4750
0x10037f61f: mov qword ptr [rip + 0x935136], 0x348 ; 0x100cb4760
0x10037f62a: mov rdx, qword ptr [rip + 0x887e07] ; 0x100c07438 -> 0x10037cb80 __Z17GetMetaTypeByTypeIP9BeamoBarnERK8MetaTypev
0x10037f631: mov qword ptr [rip + 0x935130], rdx ; 0x100cb4768
0x10037f638: mov qword ptr [rip + 0x935131], rax ; 0x100cb4770
0x10037f63f: mov qword ptr [rip + 0x93512e], 0xffffffffffffffff ; 0x100cb4778
0x10037f64a: mov qword ptr [rip + 0x93512f], rbx ; 0x100cb4780
0x10037f651: mov qword ptr [rip + 0x93512c], 0 ; 0x100cb4788
0x10037f65c: vmovdqa xmmword ptr [rip + 0x1c7a22c], xmm1 ; 0x101ff9890
0x10037f664: lea rdx, [rip + 0x1c7a225] ; 0x101ff9890
0x10037f66b: mov qword ptr [rip + 0x1c7a22a], 0 ; 0x101ff98a0
0x10037f676: mov qword ptr [rip + 0x9350cb], rdx ; 0x100cb4748
0x10037f67d: lea rdx, [rip + 0x803adb] ; 0x100b8315f materialDefBarn
0x10037f684: mov qword ptr [rip + 0x935105], rdx ; 0x100cb4790
0x10037f68b: lea rdx, [rip + 0x9350fe] ; 0x100cb4790
0x10037f692: mov qword ptr [rip + 0x935107], rcx ; 0x100cb47a0
0x10037f699: mov qword ptr [rip + 0x93510c], 0x130 ; 0x100cb47b0
0x10037f6a4: mov rcx, qword ptr [rip + 0x887a65] ; 0x100c07110 -> 0x10037cb90 __Z17GetMetaTypeByTypeIP15MaterialDefBarnERK8MetaTypev
0x10037f6ab: mov qword ptr [rip + 0x935106], rcx ; 0x100cb47b8
0x10037f6b2: mov qword ptr [rip + 0x935107], rax ; 0x100cb47c0
0x10037f6b9: mov qword ptr [rip + 0x935104], 0xffffffffffffffff ; 0x100cb47c8
0x10037f6c4: mov qword ptr [rip + 0x935105], rbx ; 0x100cb47d0
0x10037f6cb: mov qword ptr [rip + 0x935102], 0 ; 0x100cb47d8
0x10037f6d6: vmovdqa xmmword ptr [rip + 0x1c7a1d2], xmm1 ; 0x101ff98b0
0x10037f6de: lea rcx, [rip + 0x1c7a1cb] ; 0x101ff98b0
0x10037f6e5: mov qword ptr [rip + 0x1c7a1d0], 0 ; 0x101ff98c0
0x10037f6f0: mov qword ptr [rip + 0x9350a1], rcx ; 0x100cb4798
0x10037f6f7: lea rcx, [rip + 0x803a71] ; 0x100b8316f levelModelBarn
0x10037f6fe: mov qword ptr [rip + 0x9350db], rcx ; 0x100cb47e0
0x10037f705: lea rcx, [rip + 0x9350d4] ; 0x100cb47e0
0x10037f70c: mov qword ptr [rip + 0x9350dd], rdx ; 0x100cb47f0
0x10037f713: mov qword ptr [rip + 0x9350e2], 0x338 ; 0x100cb4800
0x10037f71e: mov rdx, qword ptr [rip + 0x88796b] ; 0x100c07090 -> 0x10037cba0 __Z17GetMetaTypeByTypeIP14LevelModelBarnERK8MetaTypev
0x10037f725: mov qword ptr [rip + 0x9350dc], rdx ; 0x100cb4808
0x10037f72c: mov qword ptr [rip + 0x9350dd], rax ; 0x100cb4810
0x10037f733: mov qword ptr [rip + 0x9350da], 0xffffffffffffffff ; 0x100cb4818
0x10037f73e: mov qword ptr [rip + 0x9350db], rbx ; 0x100cb4820
0x10037f745: mov qword ptr [rip + 0x9350d8], 0 ; 0x100cb4828
0x10037f750: vmovdqa xmmword ptr [rip + 0x1c7a178], xmm1 ; 0x101ff98d0
0x10037f758: lea rdx, [rip + 0x1c7a171] ; 0x101ff98d0
0x10037f75f: mov qword ptr [rip + 0x1c7a176], 0 ; 0x101ff98e0
0x10037f76a: mov qword ptr [rip + 0x935077], rdx ; 0x100cb47e8
0x10037f771: lea rdx, [rip + 0x803a06] ; 0x100b8317e levelMeshBarn
0x10037f778: mov qword ptr [rip + 0x9350b1], rdx ; 0x100cb4830
0x10037f77f: lea rdx, [rip + 0x9350aa] ; 0x100cb4830
0x10037f786: mov qword ptr [rip + 0x9350b3], rcx ; 0x100cb4840
0x10037f78d: mov qword ptr [rip + 0x9350b8], 0x340 ; 0x100cb4850
0x10037f798: mov rcx, qword ptr [rip + 0x887891] ; 0x100c07030 -> 0x10037cbb0 __Z17GetMetaTypeByTypeIP13LevelMeshBarnERK8MetaTypev
0x10037f79f: mov qword ptr [rip + 0x9350b2], rcx ; 0x100cb4858
0x10037f7a6: mov qword ptr [rip + 0x9350b3], rax ; 0x100cb4860
0x10037f7ad: mov qword ptr [rip + 0x9350b0], 0xffffffffffffffff ; 0x100cb4868
0x10037f7b8: mov qword ptr [rip + 0x9350b1], rbx ; 0x100cb4870
0x10037f7bf: mov qword ptr [rip + 0x9350ae], 0 ; 0x100cb4878
0x10037f7ca: vmovdqa xmmword ptr [rip + 0x1c7a11e], xmm1 ; 0x101ff98f0
0x10037f7d2: lea rcx, [rip + 0x1c7a117] ; 0x101ff98f0
0x10037f7d9: mov qword ptr [rip + 0x1c7a11c], 0 ; 0x101ff9900
0x10037f7e4: mov qword ptr [rip + 0x93504d], rcx ; 0x100cb4838
0x10037f7eb: lea rcx, [rip + 0x80399a] ; 0x100b8318c markerBarn
0x10037f7f2: mov qword ptr [rip + 0x935087], rcx ; 0x100cb4880
0x10037f7f9: lea rcx, [rip + 0x935080] ; 0x100cb4880
0x10037f800: mov qword ptr [rip + 0x935089], rdx ; 0x100cb4890
0x10037f807: mov qword ptr [rip + 0x93508e], 0x300 ; 0x100cb48a0
0x10037f812: mov rdx, qword ptr [rip + 0x88766f] ; 0x100c06e88 -> 0x10037cbc0 __Z17GetMetaTypeByTypeIP10MarkerBarnERK8MetaTypev
0x10037f819: mov qword ptr [rip + 0x935088], rdx ; 0x100cb48a8
0x10037f820: mov qword ptr [rip + 0x935089], rax ; 0x100cb48b0
0x10037f827: mov qword ptr [rip + 0x935086], 0xffffffffffffffff ; 0x100cb48b8
0x10037f832: mov qword ptr [rip + 0x935087], rbx ; 0x100cb48c0
0x10037f839: mov qword ptr [rip + 0x935084], 0 ; 0x100cb48c8
0x10037f844: vmovdqa xmmword ptr [rip + 0x1c7a0c4], xmm1 ; 0x101ff9910
0x10037f84c: lea rdx, [rip + 0x1c7a0bd] ; 0x101ff9910
0x10037f853: mov qword ptr [rip + 0x1c7a0c2], 0 ; 0x101ff9920
0x10037f85e: mov qword ptr [rip + 0x935023], rdx ; 0x100cb4888
0x10037f865: lea rdx, [rip + 0x80392b] ; 0x100b83197 timelineBarn
0x10037f86c: mov qword ptr [rip + 0x93505d], rdx ; 0x100cb48d0
0x10037f873: lea rdx, [rip + 0x935056] ; 0x100cb48d0
0x10037f87a: mov qword ptr [rip + 0x93505f], rcx ; 0x100cb48e0
0x10037f881: mov qword ptr [rip + 0x935064], 0x480 ; 0x100cb48f0
0x10037f88c: mov rcx, qword ptr [rip + 0x88772d] ; 0x100c06fc0 -> 0x10037cbd0 __Z17GetMetaTypeByTypeIP12TimelineBarnERK8MetaTypev
0x10037f893: mov qword ptr [rip + 0x93505e], rcx ; 0x100cb48f8
0x10037f89a: mov qword ptr [rip + 0x93505f], rax ; 0x100cb4900
0x10037f8a1: mov qword ptr [rip + 0x93505c], 0xffffffffffffffff ; 0x100cb4908
0x10037f8ac: mov qword ptr [rip + 0x93505d], rbx ; 0x100cb4910
0x10037f8b3: mov qword ptr [rip + 0x93505a], 0 ; 0x100cb4918
0x10037f8be: vmovdqa xmmword ptr [rip + 0x1c7a06a], xmm1 ; 0x101ff9930
0x10037f8c6: lea rcx, [rip + 0x1c7a063] ; 0x101ff9930
0x10037f8cd: mov qword ptr [rip + 0x1c7a068], 0 ; 0x101ff9940
0x10037f8d8: mov qword ptr [rip + 0x934ff9], rcx ; 0x100cb48d8
0x10037f8df: lea rcx, [rip + 0x8038be] ; 0x100b831a4 emitterDefTown
0x10037f8e6: mov qword ptr [rip + 0x935033], rcx ; 0x100cb4920
0x10037f8ed: lea rcx, [rip + 0x93502c] ; 0x100cb4920
0x10037f8f4: mov qword ptr [rip + 0x935035], rdx ; 0x100cb4930
0x10037f8fb: mov qword ptr [rip + 0x93503a], 0x430 ; 0x100cb4940
0x10037f906: mov rdx, qword ptr [rip + 0x88777b] ; 0x100c07088 -> 0x10037cbe0 __Z17GetMetaTypeByTypeIP14EmitterDefTownERK8MetaTypev
0x10037f90d: mov qword ptr [rip + 0x935034], rdx ; 0x100cb4948
0x10037f914: mov qword ptr [rip + 0x935035], rax ; 0x100cb4950
0x10037f91b: mov qword ptr [rip + 0x935032], 0xffffffffffffffff ; 0x100cb4958
0x10037f926: mov qword ptr [rip + 0x935033], rbx ; 0x100cb4960
0x10037f92d: mov qword ptr [rip + 0x935030], 0 ; 0x100cb4968
0x10037f938: vmovdqa xmmword ptr [rip + 0x1c7a010], xmm1 ; 0x101ff9950
0x10037f940: lea rdx, [rip + 0x1c7a009] ; 0x101ff9950
0x10037f947: mov qword ptr [rip + 0x1c7a00e], 0 ; 0x101ff9960
0x10037f952: mov qword ptr [rip + 0x934fcf], rdx ; 0x100cb4928
0x10037f959: lea rdx, [rip + 0x803853] ; 0x100b831b3 emitterBarn
0x10037f960: mov qword ptr [rip + 0x935009], rdx ; 0x100cb4970
0x10037f967: lea rdx, [rip + 0x935002] ; 0x100cb4970
0x10037f96e: mov qword ptr [rip + 0x93500b], rcx ; 0x100cb4980
0x10037f975: mov qword ptr [rip + 0x935010], 0x438 ; 0x100cb4990
0x10037f980: mov rcx, qword ptr [rip + 0x8875a1] ; 0x100c06f28 -> 0x10037cbf0 __Z17GetMetaTypeByTypeIP11EmitterBarnERK8MetaTypev
0x10037f987: mov qword ptr [rip + 0x93500a], rcx ; 0x100cb4998
0x10037f98e: mov qword ptr [rip + 0x93500b], rax ; 0x100cb49a0
0x10037f995: mov qword ptr [rip + 0x935008], 0xffffffffffffffff ; 0x100cb49a8
0x10037f9a0: mov qword ptr [rip + 0x935009], rbx ; 0x100cb49b0
0x10037f9a7: mov qword ptr [rip + 0x935006], 0 ; 0x100cb49b8
0x10037f9b2: vmovdqa xmmword ptr [rip + 0x1c79fb6], xmm1 ; 0x101ff9970
0x10037f9ba: lea rcx, [rip + 0x1c79faf] ; 0x101ff9970
0x10037f9c1: mov qword ptr [rip + 0x1c79fb4], 0 ; 0x101ff9980
0x10037f9cc: mov qword ptr [rip + 0x934fa5], rcx ; 0x100cb4978
0x10037f9d3: lea rcx, [rip + 0x8037e5] ; 0x100b831bf pointLightBarn
0x10037f9da: mov qword ptr [rip + 0x934fdf], rcx ; 0x100cb49c0
0x10037f9e1: lea rcx, [rip + 0x934fd8] ; 0x100cb49c0
0x10037f9e8: mov qword ptr [rip + 0x934fe1], rdx ; 0x100cb49d0
0x10037f9ef: mov qword ptr [rip + 0x934fe6], 0x4f8 ; 0x100cb49e0
0x10037f9fa: mov rdx, qword ptr [rip + 0x8876bf] ; 0x100c070c0 -> 0x10037cc00 __Z17GetMetaTypeByTypeIP14PointLightBarnERK8MetaTypev
0x10037fa01: mov qword ptr [rip + 0x934fe0], rdx ; 0x100cb49e8
0x10037fa08: mov qword ptr [rip + 0x934fe1], rax ; 0x100cb49f0
0x10037fa0f: mov qword ptr [rip + 0x934fde], 0xffffffffffffffff ; 0x100cb49f8
0x10037fa1a: mov qword ptr [rip + 0x934fdf], rbx ; 0x100cb4a00
0x10037fa21: mov qword ptr [rip + 0x934fdc], 0 ; 0x100cb4a08
0x10037fa2c: vmovdqa xmmword ptr [rip + 0x1c79f5c], xmm1 ; 0x101ff9990
0x10037fa34: lea rdx, [rip + 0x1c79f55] ; 0x101ff9990
0x10037fa3b: mov qword ptr [rip + 0x1c79f5a], 0 ; 0x101ff99a0
0x10037fa46: mov qword ptr [rip + 0x934f7b], rdx ; 0x100cb49c8
0x10037fa4d: lea rdx, [rip + 0x80377a] ; 0x100b831ce railBarn
0x10037fa54: mov qword ptr [rip + 0x934fb5], rdx ; 0x100cb4a10
0x10037fa5b: lea rdx, [rip + 0x934fae] ; 0x100cb4a10
0x10037fa62: mov qword ptr [rip + 0x934fb7], rcx ; 0x100cb4a20
0x10037fa69: mov qword ptr [rip + 0x934fbc], 0x2f8 ; 0x100cb4a30
0x10037fa74: mov rcx, qword ptr [rip + 0x887965] ; 0x100c073e0 -> 0x10037cc10 __Z17GetMetaTypeByTypeIP8RailBarnERK8MetaTypev
0x10037fa7b: mov qword ptr [rip + 0x934fb6], rcx ; 0x100cb4a38
0x10037fa82: mov qword ptr [rip + 0x934fb7], rax ; 0x100cb4a40
0x10037fa89: mov qword ptr [rip + 0x934fb4], 0xffffffffffffffff ; 0x100cb4a48
0x10037fa94: mov qword ptr [rip + 0x934fb5], rbx ; 0x100cb4a50
0x10037fa9b: mov qword ptr [rip + 0x934fb2], 0 ; 0x100cb4a58
0x10037faa6: vmovdqa xmmword ptr [rip + 0x1c79f02], xmm1 ; 0x101ff99b0
0x10037faae: lea rcx, [rip + 0x1c79efb] ; 0x101ff99b0
0x10037fab5: mov qword ptr [rip + 0x1c79f00], 0 ; 0x101ff99c0
0x10037fac0: mov qword ptr [rip + 0x934f51], rcx ; 0x100cb4a18
0x10037fac7: lea rcx, [rip + 0x803709] ; 0x100b831d7 modelBarn
0x10037face: mov qword ptr [rip + 0x934f8b], rcx ; 0x100cb4a60
0x10037fad5: lea rcx, [rip + 0x934f84] ; 0x100cb4a60
0x10037fadc: mov qword ptr [rip + 0x934f8d], rdx ; 0x100cb4a70
0x10037fae3: mov qword ptr [rip + 0x934f92], 0x5a8 ; 0x100cb4a80
0x10037faee: mov rdx, qword ptr [rip + 0x8879d3] ; 0x100c074c8 -> 0x10037cc20 __Z17GetMetaTypeByTypeIP9ModelBarnERK8MetaTypev
0x10037faf5: mov qword ptr [rip + 0x934f8c], rdx ; 0x100cb4a88
0x10037fafc: mov qword ptr [rip + 0x934f8d], rax ; 0x100cb4a90
0x10037fb03: mov qword ptr [rip + 0x934f8a], 0xffffffffffffffff ; 0x100cb4a98
0x10037fb0e: mov qword ptr [rip + 0x934f8b], rbx ; 0x100cb4aa0
0x10037fb15: mov qword ptr [rip + 0x934f88], 0 ; 0x100cb4aa8
0x10037fb20: vmovdqa xmmword ptr [rip + 0x1c79ea8], xmm1 ; 0x101ff99d0
0x10037fb28: lea rdx, [rip + 0x1c79ea1] ; 0x101ff99d0
0x10037fb2f: mov qword ptr [rip + 0x1c79ea6], 0 ; 0x101ff99e0
0x10037fb3a: mov qword ptr [rip + 0x934f27], rdx ; 0x100cb4a68
0x10037fb41: lea rdx, [rip + 0x803699] ; 0x100b831e1 instancer
0x10037fb48: mov qword ptr [rip + 0x934f61], rdx ; 0x100cb4ab0
0x10037fb4f: lea rdx, [rip + 0x934f5a] ; 0x100cb4ab0
0x10037fb56: mov qword ptr [rip + 0x934f63], rcx ; 0x100cb4ac0
0x10037fb5d: mov qword ptr [rip + 0x934f68], 0x5b0 ; 0x100cb4ad0
0x10037fb68: mov rcx, qword ptr [rip + 0x887541] ; 0x100c070b0 -> 0x10037cc30 __Z17GetMetaTypeByTypeIP14ModelInstancerERK8MetaTypev
0x10037fb6f: mov qword ptr [rip + 0x934f62], rcx ; 0x100cb4ad8
0x10037fb76: mov qword ptr [rip + 0x934f63], rax ; 0x100cb4ae0
0x10037fb7d: mov qword ptr [rip + 0x934f60], 0xffffffffffffffff ; 0x100cb4ae8
0x10037fb88: mov qword ptr [rip + 0x934f61], rbx ; 0x100cb4af0
0x10037fb8f: mov qword ptr [rip + 0x934f5e], 0 ; 0x100cb4af8
0x10037fb9a: vmovdqa xmmword ptr [rip + 0x1c79e4e], xmm1 ; 0x101ff99f0
0x10037fba2: lea rcx, [rip + 0x1c79e47] ; 0x101ff99f0
0x10037fba9: mov qword ptr [rip + 0x1c79e4c], 0 ; 0x101ff9a00
0x10037fbb4: mov qword ptr [rip + 0x934efd], rcx ; 0x100cb4ab8
0x10037fbbb: lea rcx, [rip + 0x803629] ; 0x100b831eb objectDb
0x10037fbc2: mov qword ptr [rip + 0x934f37], rcx ; 0x100cb4b00
0x10037fbc9: lea rcx, [rip + 0x934f30] ; 0x100cb4b00
0x10037fbd0: mov qword ptr [rip + 0x934f39], rdx ; 0x100cb4b10
0x10037fbd7: mov qword ptr [rip + 0x934f3e], 0x220 ; 0x100cb4b20
0x10037fbe2: mov rdx, qword ptr [rip + 0x8877e7] ; 0x100c073d0 -> 0x10037cc40 __Z17GetMetaTypeByTypeIP8ObjectDbERK8MetaTypev
0x10037fbe9: mov qword ptr [rip + 0x934f38], rdx ; 0x100cb4b28
0x10037fbf0: mov qword ptr [rip + 0x934f39], rax ; 0x100cb4b30
0x10037fbf7: mov qword ptr [rip + 0x934f36], 0xffffffffffffffff ; 0x100cb4b38
0x10037fc02: mov qword ptr [rip + 0x934f37], rbx ; 0x100cb4b40
0x10037fc09: mov qword ptr [rip + 0x934f34], 0 ; 0x100cb4b48
0x10037fc14: vmovdqa xmmword ptr [rip + 0x1c79df4], xmm1 ; 0x101ff9a10
0x10037fc1c: lea rdx, [rip + 0x1c79ded] ; 0x101ff9a10
0x10037fc23: mov qword ptr [rip + 0x1c79df2], 0 ; 0x101ff9a20
0x10037fc2e: mov qword ptr [rip + 0x934ed3], rdx ; 0x100cb4b08
0x10037fc35: lea rdx, [rip + 0x8035b8] ; 0x100b831f4 touchInput
0x10037fc3c: mov qword ptr [rip + 0x934f0d], rdx ; 0x100cb4b50
0x10037fc43: lea rdx, [rip + 0x934f06] ; 0x100cb4b50
0x10037fc4a: mov qword ptr [rip + 0x934f0f], rcx ; 0x100cb4b60
0x10037fc51: mov qword ptr [rip + 0x934f14], 0x1c0 ; 0x100cb4b70
0x10037fc5c: mov rcx, qword ptr [rip + 0x887275] ; 0x100c06ed8 -> 0x10037cc50 __Z17GetMetaTypeByTypeIP10TouchInputERK8MetaTypev
0x10037fc63: mov qword ptr [rip + 0x934f0e], rcx ; 0x100cb4b78
0x10037fc6a: mov qword ptr [rip + 0x934f0f], rax ; 0x100cb4b80
0x10037fc71: mov qword ptr [rip + 0x934f0c], 0xffffffffffffffff ; 0x100cb4b88
0x10037fc7c: mov qword ptr [rip + 0x934f0d], rbx ; 0x100cb4b90
0x10037fc83: mov qword ptr [rip + 0x934f0a], 0 ; 0x100cb4b98
0x10037fc8e: vmovdqa xmmword ptr [rip + 0x1c79d9a], xmm1 ; 0x101ff9a30
0x10037fc96: lea rcx, [rip + 0x1c79d93] ; 0x101ff9a30
0x10037fc9d: mov qword ptr [rip + 0x1c79d98], 0 ; 0x101ff9a40
0x10037fca8: mov qword ptr [rip + 0x934ea9], rcx ; 0x100cb4b58
0x10037fcaf: lea rcx, [rip + 0x803549] ; 0x100b831ff animationManager
0x10037fcb6: mov qword ptr [rip + 0x934ee3], rcx ; 0x100cb4ba0
0x10037fcbd: lea rcx, [rip + 0x934edc] ; 0x100cb4ba0
0x10037fcc4: mov qword ptr [rip + 0x934ee5], rdx ; 0x100cb4bb0
0x10037fccb: mov qword ptr [rip + 0x934eea], 0x1d8 ; 0x100cb4bc0
0x10037fcd6: mov rdx, qword ptr [rip + 0x887493] ; 0x100c07170 -> 0x10037cc60 __Z17GetMetaTypeByTypeIP16AnimationManagerERK8MetaTypev
0x10037fcdd: mov qword ptr [rip + 0x934ee4], rdx ; 0x100cb4bc8
0x10037fce4: mov qword ptr [rip + 0x934ee5], rax ; 0x100cb4bd0
0x10037fceb: mov qword ptr [rip + 0x934ee2], 0xffffffffffffffff ; 0x100cb4bd8
0x10037fcf6: mov qword ptr [rip + 0x934ee3], rbx ; 0x100cb4be0
0x10037fcfd: mov qword ptr [rip + 0x934ee0], 0 ; 0x100cb4be8
0x10037fd08: vmovdqa xmmword ptr [rip + 0x1c79d40], xmm1 ; 0x101ff9a50
0x10037fd10: lea rdx, [rip + 0x1c79d39] ; 0x101ff9a50
0x10037fd17: mov qword ptr [rip + 0x1c79d3e], 0 ; 0x101ff9a60
0x10037fd22: mov qword ptr [rip + 0x934e7f], rdx ; 0x100cb4ba8
0x10037fd29: lea rdx, [rip + 0x8034e0] ; 0x100b83210 soundManager
0x10037fd30: mov qword ptr [rip + 0x934eb9], rdx ; 0x100cb4bf0
0x10037fd37: lea rdx, [rip + 0x934eb2] ; 0x100cb4bf0
0x10037fd3e: mov qword ptr [rip + 0x934ebb], rcx ; 0x100cb4c00
0x10037fd45: mov qword ptr [rip + 0x934ec0], 0x5c8 ; 0x100cb4c10
0x10037fd50: mov rcx, qword ptr [rip + 0x887261] ; 0x100c06fb8 -> 0x10037cc70 __Z17GetMetaTypeByTypeIP12SoundManagerERK8MetaTypev
0x10037fd57: mov qword ptr [rip + 0x934eba], rcx ; 0x100cb4c18
0x10037fd5e: mov qword ptr [rip + 0x934ebb], rax ; 0x100cb4c20
0x10037fd65: mov qword ptr [rip + 0x934eb8], 0xffffffffffffffff ; 0x100cb4c28
0x10037fd70: mov qword ptr [rip + 0x934eb9], rbx ; 0x100cb4c30
0x10037fd77: mov qword ptr [rip + 0x934eb6], 0 ; 0x100cb4c38
0x10037fd82: vmovdqa xmmword ptr [rip + 0x1c79ce6], xmm1 ; 0x101ff9a70
0x10037fd8a: lea rcx, [rip + 0x1c79cdf] ; 0x101ff9a70
0x10037fd91: mov qword ptr [rip + 0x1c79ce4], 0 ; 0x101ff9a80
0x10037fd9c: mov qword ptr [rip + 0x934e55], rcx ; 0x100cb4bf8
0x10037fda3: lea rcx, [rip + 0x803473] ; 0x100b8321d occlusionSphereBarn
0x10037fdaa: mov qword ptr [rip + 0x934e8f], rcx ; 0x100cb4c40
0x10037fdb1: lea rcx, [rip + 0x934e88] ; 0x100cb4c40
0x10037fdb8: mov qword ptr [rip + 0x934e91], rdx ; 0x100cb4c50
0x10037fdbf: mov qword ptr [rip + 0x934e96], 0x500 ; 0x100cb4c60
0x10037fdca: mov rdx, qword ptr [rip + 0x88745f] ; 0x100c07230 -> 0x10037cc80 __Z17GetMetaTypeByTypeIP19OcclusionSphereBarnERK8MetaTypev
0x10037fdd1: mov qword ptr [rip + 0x934e90], rdx ; 0x100cb4c68
0x10037fdd8: mov qword ptr [rip + 0x934e91], rax ; 0x100cb4c70
0x10037fddf: mov qword ptr [rip + 0x934e8e], 0xffffffffffffffff ; 0x100cb4c78
0x10037fdea: mov qword ptr [rip + 0x934e8f], rbx ; 0x100cb4c80
0x10037fdf1: mov qword ptr [rip + 0x934e8c], 0 ; 0x100cb4c88
0x10037fdfc: vmovdqa xmmword ptr [rip + 0x1c79c8c], xmm1 ; 0x101ff9a90
0x10037fe04: lea rdx, [rip + 0x1c79c85] ; 0x101ff9a90
0x10037fe0b: mov qword ptr [rip + 0x1c79c8a], 0 ; 0x101ff9aa0
0x10037fe16: mov qword ptr [rip + 0x934e2b], rdx ; 0x100cb4c48
0x10037fe1d: lea rdx, [rip + 0x80340d] ; 0x100b83231 noise
0x10037fe24: mov qword ptr [rip + 0x934e65], rdx ; 0x100cb4c90
0x10037fe2b: lea rdx, [rip + 0x934e5e] ; 0x100cb4c90
0x10037fe32: mov qword ptr [rip + 0x934e67], rcx ; 0x100cb4ca0
0x10037fe39: mov qword ptr [rip + 0x934e6c], 0x1e0 ; 0x100cb4cb0
0x10037fe44: mov rcx, qword ptr [rip + 0x88749d] ; 0x100c072e8 -> 0x10037cc90 __Z17GetMetaTypeByTypeIP5NoiseERK8MetaTypev
0x10037fe4b: mov qword ptr [rip + 0x934e66], rcx ; 0x100cb4cb8
0x10037fe52: mov qword ptr [rip + 0x934e67], rax ; 0x100cb4cc0
0x10037fe59: mov qword ptr [rip + 0x934e64], 0xffffffffffffffff ; 0x100cb4cc8
0x10037fe64: mov qword ptr [rip + 0x934e65], rbx ; 0x100cb4cd0
0x10037fe6b: mov qword ptr [rip + 0x934e62], 0 ; 0x100cb4cd8
0x10037fe76: vmovdqa xmmword ptr [rip + 0x1c79c32], xmm1 ; 0x101ff9ab0
0x10037fe7e: lea rcx, [rip + 0x1c79c2b] ; 0x101ff9ab0
0x10037fe85: mov qword ptr [rip + 0x1c79c30], 0 ; 0x101ff9ac0
0x10037fe90: mov qword ptr [rip + 0x934e01], rcx ; 0x100cb4c98
0x10037fe97: lea rcx, [rip + 0x803399] ; 0x100b83237 cloudBarn
0x10037fe9e: mov qword ptr [rip + 0x934e3b], rcx ; 0x100cb4ce0
0x10037fea5: lea rcx, [rip + 0x934e34] ; 0x100cb4ce0
0x10037feac: mov qword ptr [rip + 0x934e3d], rdx ; 0x100cb4cf0
0x10037feb3: mov qword ptr [rip + 0x934e42], 0x3b8 ; 0x100cb4d00
0x10037febe: mov rdx, qword ptr [rip + 0x8875a3] ; 0x100c07468 -> 0x10037cca0 __Z17GetMetaTypeByTypeIP9CloudBarnERK8MetaTypev
0x10037fec5: mov qword ptr [rip + 0x934e3c], rdx ; 0x100cb4d08
0x10037fecc: mov qword ptr [rip + 0x934e3d], rax ; 0x100cb4d10
0x10037fed3: mov qword ptr [rip + 0x934e3a], 0xffffffffffffffff ; 0x100cb4d18
0x10037fede: mov qword ptr [rip + 0x934e3b], rbx ; 0x100cb4d20
0x10037fee5: mov qword ptr [rip + 0x934e38], 0 ; 0x100cb4d28
0x10037fef0: vmovdqa xmmword ptr [rip + 0x1c79bd8], xmm1 ; 0x101ff9ad0
0x10037fef8: lea rdx, [rip + 0x1c79bd1] ; 0x101ff9ad0
0x10037feff: mov qword ptr [rip + 0x1c79bd6], 0 ; 0x101ff9ae0
0x10037ff0a: mov qword ptr [rip + 0x934dd7], rdx ; 0x100cb4ce8
0x10037ff11: lea rdx, [rip + 0x803329] ; 0x100b83241 flowerBarn
0x10037ff18: mov qword ptr [rip + 0x934e11], rdx ; 0x100cb4d30
0x10037ff1f: lea rdx, [rip + 0x934e0a] ; 0x100cb4d30
0x10037ff26: mov qword ptr [rip + 0x934e13], rcx ; 0x100cb4d40
0x10037ff2d: mov qword ptr [rip + 0x934e18], 0x3b0 ; 0x100cb4d50
0x10037ff38: mov rcx, qword ptr [rip + 0x886f21] ; 0x100c06e60 -> 0x10037ccb0 __Z17GetMetaTypeByTypeIP10FlowerBarnERK8MetaTypev
0x10037ff3f: mov qword ptr [rip + 0x934e12], rcx ; 0x100cb4d58
0x10037ff46: mov qword ptr [rip + 0x934e13], rax ; 0x100cb4d60
0x10037ff4d: mov qword ptr [rip + 0x934e10], 0xffffffffffffffff ; 0x100cb4d68
0x10037ff58: mov qword ptr [rip + 0x934e11], rbx ; 0x100cb4d70
0x10037ff5f: mov qword ptr [rip + 0x934e0e], 0 ; 0x100cb4d78
0x10037ff6a: vmovdqa xmmword ptr [rip + 0x1c79b7e], xmm1 ; 0x101ff9af0
0x10037ff72: lea rcx, [rip + 0x1c79b77] ; 0x101ff9af0
0x10037ff79: mov qword ptr [rip + 0x1c79b7c], 0 ; 0x101ff9b00
0x10037ff84: mov qword ptr [rip + 0x934dad], rcx ; 0x100cb4d38
0x10037ff8b: lea rcx, [rip + 0x8032ba] ; 0x100b8324c environmentForces
0x10037ff92: mov qword ptr [rip + 0x934de7], rcx ; 0x100cb4d80
0x10037ff99: lea rcx, [rip + 0x934de0] ; 0x100cb4d80
0x10037ffa0: mov qword ptr [rip + 0x934de9], rdx ; 0x100cb4d90
0x10037ffa7: mov qword ptr [rip + 0x934dee], 0x2c8 ; 0x100cb4da0
0x10037ffb2: mov rdx, qword ptr [rip + 0x887217] ; 0x100c071d0 -> 0x10037ccc0 __Z17GetMetaTypeByTypeIP17EnvironmentForcesERK8MetaTypev
0x10037ffb9: mov qword ptr [rip + 0x934de8], rdx ; 0x100cb4da8
0x10037ffc0: mov qword ptr [rip + 0x934de9], rax ; 0x100cb4db0
0x10037ffc7: mov qword ptr [rip + 0x934de6], 0xffffffffffffffff ; 0x100cb4db8
0x10037ffd2: mov qword ptr [rip + 0x934de7], rbx ; 0x100cb4dc0
0x10037ffd9: mov qword ptr [rip + 0x934de4], 0 ; 0x100cb4dc8
0x10037ffe4: vmovdqa xmmword ptr [rip + 0x1c79b24], xmm1 ; 0x101ff9b10
0x10037ffec: lea rdx, [rip + 0x1c79b1d] ; 0x101ff9b10
0x10037fff3: mov qword ptr [rip + 0x1c79b22], 0 ; 0x101ff9b20
0x10037fffe: mov qword ptr [rip + 0x934d83], rdx ; 0x100cb4d88
0x100380005: lea rdx, [rip + 0x803252] ; 0x100b8325e camGuideBarn
0x10038000c: mov qword ptr [rip + 0x934dbd], rdx ; 0x100cb4dd0
0x100380013: lea rdx, [rip + 0x934db6] ; 0x100cb4dd0
0x10038001a: mov qword ptr [rip + 0x934dbf], rcx ; 0x100cb4de0
0x100380021: mov qword ptr [rip + 0x934dc4], 0x2a0 ; 0x100cb4df0
0x10038002c: mov rcx, qword ptr [rip + 0x8870bd] ; 0x100c070f0 -> 0x10037ccd0 __Z17GetMetaTypeByTypeIP15CameraGuideBarnERK8MetaTypev
0x100380033: mov qword ptr [rip + 0x934dbe], rcx ; 0x100cb4df8
0x10038003a: mov qword ptr [rip + 0x934dbf], rax ; 0x100cb4e00
0x100380041: mov qword ptr [rip + 0x934dbc], 0xffffffffffffffff ; 0x100cb4e08
0x10038004c: mov qword ptr [rip + 0x934dbd], rbx ; 0x100cb4e10
0x100380053: mov qword ptr [rip + 0x934dba], 0 ; 0x100cb4e18
0x10038005e: vmovdqa xmmword ptr [rip + 0x1c79aca], xmm1 ; 0x101ff9b30
0x100380066: lea rcx, [rip + 0x1c79ac3] ; 0x101ff9b30
0x10038006d: mov qword ptr [rip + 0x1c79ac8], 0 ; 0x101ff9b40
0x100380078: mov qword ptr [rip + 0x934d59], rcx ; 0x100cb4dd8
0x10038007f: lea rcx, [rip + 0x8031e5] ; 0x100b8326b valueBarn
0x100380086: mov qword ptr [rip + 0x934d93], rcx ; 0x100cb4e20
0x10038008d: lea rcx, [rip + 0x934d8c] ; 0x100cb4e20
0x100380094: mov qword ptr [rip + 0x934d95], rdx ; 0x100cb4e30
0x10038009b: mov qword ptr [rip + 0x934d9a], 0x508 ; 0x100cb4e40
0x1003800a6: mov rdx, qword ptr [rip + 0x887463] ; 0x100c07510 -> 0x10037cce0 __Z17GetMetaTypeByTypeIP9ValueBarnERK8MetaTypev
0x1003800ad: mov qword ptr [rip + 0x934d94], rdx ; 0x100cb4e48
0x1003800b4: mov qword ptr [rip + 0x934d95], rax ; 0x100cb4e50
0x1003800bb: mov qword ptr [rip + 0x934d92], 0xffffffffffffffff ; 0x100cb4e58
0x1003800c6: mov qword ptr [rip + 0x934d93], rbx ; 0x100cb4e60
0x1003800cd: mov qword ptr [rip + 0x934d90], 0 ; 0x100cb4e68
0x1003800d8: vmovdqa xmmword ptr [rip + 0x1c79a70], xmm1 ; 0x101ff9b50
0x1003800e0: lea rdx, [rip + 0x1c79a69] ; 0x101ff9b50
0x1003800e7: mov qword ptr [rip + 0x1c79a6e], 0 ; 0x101ff9b60
0x1003800f2: mov qword ptr [rip + 0x934d2f], rdx ; 0x100cb4e28
0x1003800f9: lea rdx, [rip + 0x803175] ; 0x100b83275 ocean
0x100380100: mov qword ptr [rip + 0x934d69], rdx ; 0x100cb4e70
0x100380107: lea rdx, [rip + 0x934d62] ; 0x100cb4e70
0x10038010e: mov qword ptr [rip + 0x934d6b], rcx ; 0x100cb4e80
0x100380115: mov qword ptr [rip + 0x934d70], 0x3d8 ; 0x100cb4e90
0x100380120: mov rcx, qword ptr [rip + 0x8871c9] ; 0x100c072f0 -> 0x10037ccf0 __Z17GetMetaTypeByTypeIP5OceanERK8MetaTypev
0x100380127: mov qword ptr [rip + 0x934d6a], rcx ; 0x100cb4e98
0x10038012e: mov qword ptr [rip + 0x934d6b], rax ; 0x100cb4ea0
0x100380135: mov qword ptr [rip + 0x934d68], 0xffffffffffffffff ; 0x100cb4ea8
0x100380140: mov qword ptr [rip + 0x934d69], rbx ; 0x100cb4eb0
0x100380147: mov qword ptr [rip + 0x934d66], 0 ; 0x100cb4eb8
0x100380152: vmovdqa xmmword ptr [rip + 0x1c79a16], xmm1 ; 0x101ff9b70
0x10038015a: lea rcx, [rip + 0x1c79a0f] ; 0x101ff9b70
0x100380161: mov qword ptr [rip + 0x1c79a14], 0 ; 0x101ff9b80
0x10038016c: mov qword ptr [rip + 0x934d05], rcx ; 0x100cb4e78
0x100380173: lea rcx, [rip + 0x803101] ; 0x100b8327b hud
0x10038017a: mov qword ptr [rip + 0x934d3f], rcx ; 0x100cb4ec0
0x100380181: lea rcx, [rip + 0x934d38] ; 0x100cb4ec0
0x100380188: mov qword ptr [rip + 0x934d41], rdx ; 0x100cb4ed0
0x10038018f: mov qword ptr [rip + 0x934d46], 0x498 ; 0x100cb4ee0
0x10038019a: mov rdx, qword ptr [rip + 0x8870c7] ; 0x100c07268 -> 0x10037cd00 __Z17GetMetaTypeByTypeIP3HudERK8MetaTypev
0x1003801a1: mov qword ptr [rip + 0x934d40], rdx ; 0x100cb4ee8
0x1003801a8: mov qword ptr [rip + 0x934d41], rax ; 0x100cb4ef0
0x1003801af: mov qword ptr [rip + 0x934d3e], 0xffffffffffffffff ; 0x100cb4ef8
0x1003801ba: mov qword ptr [rip + 0x934d3f], rbx ; 0x100cb4f00
0x1003801c1: mov qword ptr [rip + 0x934d3c], 0 ; 0x100cb4f08
0x1003801cc: vmovq xmm1, r15
0x1003801d1: vpunpcklqdq xmm1, xmm0, xmm1
0x1003801d5: vmovdqa xmmword ptr [rip + 0x1c799b3], xmm1 ; 0x101ff9b90
0x1003801dd: lea rdx, [rip + 0x1c799ac] ; 0x101ff9b90
0x1003801e4: mov qword ptr [rip + 0x1c799b1], 0 ; 0x101ff9ba0
0x1003801ef: mov qword ptr [rip + 0x934cd2], rdx ; 0x100cb4ec8
0x1003801f6: lea rdx, [rip + 0x803082] ; 0x100b8327f netModule
0x1003801fd: mov qword ptr [rip + 0x934d0c], rdx ; 0x100cb4f10
0x100380204: lea rdx, [rip + 0x934d05] ; 0x100cb4f10
0x10038020b: mov qword ptr [rip + 0x934d0e], rcx ; 0x100cb4f20
0x100380212: mov qword ptr [rip + 0x934d13], 0x178 ; 0x100cb4f30
0x10038021d: mov rcx, qword ptr [rip + 0x8872b4] ; 0x100c074d8 -> 0x10037cd10 __Z17GetMetaTypeByTypeIP9NetModuleERK8MetaTypev
0x100380224: mov qword ptr [rip + 0x934d0d], rcx ; 0x100cb4f38
0x10038022b: mov qword ptr [rip + 0x934d0e], rax ; 0x100cb4f40
0x100380232: mov qword ptr [rip + 0x934d0b], 0xffffffffffffffff ; 0x100cb4f48
0x10038023d: mov qword ptr [rip + 0x934d0c], rbx ; 0x100cb4f50
0x100380244: mov qword ptr [rip + 0x934d09], 0 ; 0x100cb4f58
0x10038024f: vmovdqa xmmword ptr [rip + 0x1c79959], xmm1 ; 0x101ff9bb0
0x100380257: lea rcx, [rip + 0x1c79952] ; 0x101ff9bb0
0x10038025e: mov qword ptr [rip + 0x1c79957], 0 ; 0x101ff9bc0
0x100380269: mov qword ptr [rip + 0x934ca8], rcx ; 0x100cb4f18
0x100380270: lea rcx, [rip + 0x803012] ; 0x100b83289 netReachability
0x100380277: mov qword ptr [rip + 0x934ce2], rcx ; 0x100cb4f60
0x10038027e: lea rcx, [rip + 0x934cdb] ; 0x100cb4f60
0x100380285: mov qword ptr [rip + 0x934ce4], rdx ; 0x100cb4f70
0x10038028c: mov qword ptr [rip + 0x934ce9], 0x190 ; 0x100cb4f80
0x100380297: mov rdx, qword ptr [rip + 0x886e7a] ; 0x100c07118 -> 0x10037cd20 __Z17GetMetaTypeByTypeIP15NetReachabilityERK8MetaTypev
0x10038029e: mov qword ptr [rip + 0x934ce3], rdx ; 0x100cb4f88
0x1003802a5: mov qword ptr [rip + 0x934ce4], rax ; 0x100cb4f90
0x1003802ac: mov qword ptr [rip + 0x934ce1], 0xffffffffffffffff ; 0x100cb4f98
0x1003802b7: mov qword ptr [rip + 0x934ce2], rbx ; 0x100cb4fa0
0x1003802be: mov qword ptr [rip + 0x934cdf], 0 ; 0x100cb4fa8
0x1003802c9: vmovdqa xmmword ptr [rip + 0x1c798ff], xmm1 ; 0x101ff9bd0
0x1003802d1: lea rdx, [rip + 0x1c798f8] ; 0x101ff9bd0
0x1003802d8: mov qword ptr [rip + 0x1c798fd], 0 ; 0x101ff9be0
0x1003802e3: mov qword ptr [rip + 0x934c7e], rdx ; 0x100cb4f68
0x1003802ea: lea rdx, [rip + 0x802fa8] ; 0x100b83299 netReachabilityHud
0x1003802f1: mov qword ptr [rip + 0x934cb8], rdx ; 0x100cb4fb0
0x1003802f8: lea rdx, [rip + 0x934cb1] ; 0x100cb4fb0
0x1003802ff: mov qword ptr [rip + 0x934cba], rcx ; 0x100cb4fc0
0x100380306: mov qword ptr [rip + 0x934cbf], 0x198 ; 0x100cb4fd0
0x100380311: mov rcx, qword ptr [rip + 0x886ee8] ; 0x100c07200 -> 0x10037cd30 __Z17GetMetaTypeByTypeIP18NetReachabilityHudERK8MetaTypev
0x100380318: mov qword ptr [rip + 0x934cb9], rcx ; 0x100cb4fd8
0x10038031f: mov qword ptr [rip + 0x934cba], rax ; 0x100cb4fe0
0x100380326: mov qword ptr [rip + 0x934cb7], 0xffffffffffffffff ; 0x100cb4fe8
0x100380331: mov qword ptr [rip + 0x934cb8], rbx ; 0x100cb4ff0
0x100380338: mov qword ptr [rip + 0x934cb5], 0 ; 0x100cb4ff8
0x100380343: vmovdqa xmmword ptr [rip + 0x1c798a5], xmm1 ; 0x101ff9bf0
0x10038034b: lea rcx, [rip + 0x1c7989e] ; 0x101ff9bf0
0x100380352: mov qword ptr [rip + 0x1c798a3], 0 ; 0x101ff9c00
0x10038035d: mov qword ptr [rip + 0x934c54], rcx ; 0x100cb4fb8
0x100380364: lea rcx, [rip + 0x802f41] ; 0x100b832ac analytics
0x10038036b: mov qword ptr [rip + 0x934c8e], rcx ; 0x100cb5000
0x100380372: lea rcx, [rip + 0x934c87] ; 0x100cb5000
0x100380379: mov qword ptr [rip + 0x934c90], rdx ; 0x100cb5010
0x100380380: mov qword ptr [rip + 0x934c95], 0x38 ; 0x100cb5020
0x10038038b: mov rdx, qword ptr [rip + 0x88709e] ; 0x100c07430 -> 0x10037cd40 __Z17GetMetaTypeByTypeIP9AnalyticsERK8MetaTypev
0x100380392: mov qword ptr [rip + 0x934c8f], rdx ; 0x100cb5028
0x100380399: mov qword ptr [rip + 0x934c90], rax ; 0x100cb5030
0x1003803a0: mov qword ptr [rip + 0x934c8d], 0xffffffffffffffff ; 0x100cb5038
0x1003803ab: mov qword ptr [rip + 0x934c8e], rbx ; 0x100cb5040
0x1003803b2: mov qword ptr [rip + 0x934c8b], 0 ; 0x100cb5048
0x1003803bd: vmovdqa xmmword ptr [rip + 0x1c7984b], xmm1 ; 0x101ff9c10
0x1003803c5: lea rdx, [rip + 0x1c79844] ; 0x101ff9c10
0x1003803cc: mov qword ptr [rip + 0x1c79849], 0 ; 0x101ff9c20
0x1003803d7: mov qword ptr [rip + 0x934c2a], rdx ; 0x100cb5008
0x1003803de: lea rdx, [rip + 0x7df8e4] ; 0x100b5fcc9 accountServerClient
0x1003803e5: mov qword ptr [rip + 0x934c64], rdx ; 0x100cb5050
0x1003803ec: lea rdx, [rip + 0x934c5d] ; 0x100cb5050
0x1003803f3: mov qword ptr [rip + 0x934c66], rcx ; 0x100cb5060
0x1003803fa: mov qword ptr [rip + 0x934c6b], 0x180 ; 0x100cb5070
0x100380405: mov rcx, qword ptr [rip + 0x886e0c] ; 0x100c07218 -> 0x10037cd50 __Z17GetMetaTypeByTypeIP19AccountServerClientERK8MetaTypev
0x10038040c: mov qword ptr [rip + 0x934c65], rcx ; 0x100cb5078
0x100380413: mov qword ptr [rip + 0x934c66], rax ; 0x100cb5080
0x10038041a: mov qword ptr [rip + 0x934c63], 0xffffffffffffffff ; 0x100cb5088
0x100380425: mov qword ptr [rip + 0x934c64], rbx ; 0x100cb5090
0x10038042c: mov qword ptr [rip + 0x934c61], 0 ; 0x100cb5098
0x100380437: vmovdqa xmmword ptr [rip + 0x1c797f1], xmm1 ; 0x101ff9c30
0x10038043f: lea rcx, [rip + 0x1c797ea] ; 0x101ff9c30
0x100380446: mov qword ptr [rip + 0x1c797ef], 0 ; 0x101ff9c40
0x100380451: mov qword ptr [rip + 0x934c00], rcx ; 0x100cb5058
0x100380458: lea rcx, [rip + 0x802e57] ; 0x100b832b6 accountBarn
0x10038045f: mov qword ptr [rip + 0x934c3a], rcx ; 0x100cb50a0
0x100380466: lea rcx, [rip + 0x934c33] ; 0x100cb50a0
0x10038046d: mov qword ptr [rip + 0x934c3c], rdx ; 0x100cb50b0
0x100380474: mov qword ptr [rip + 0x934c41], 0x188 ; 0x100cb50c0
0x10038047f: mov rdx, qword ptr [rip + 0x886a6a] ; 0x100c06ef0 -> 0x10037cd60 __Z17GetMetaTypeByTypeIP11AccountBarnERK8MetaTypev
0x100380486: mov qword ptr [rip + 0x934c3b], rdx ; 0x100cb50c8
0x10038048d: mov qword ptr [rip + 0x934c3c], rax ; 0x100cb50d0
0x100380494: mov qword ptr [rip + 0x934c39], 0xffffffffffffffff ; 0x100cb50d8
0x10038049f: mov qword ptr [rip + 0x934c3a], rbx ; 0x100cb50e0
0x1003804a6: mov qword ptr [rip + 0x934c37], 0 ; 0x100cb50e8
0x1003804b1: vmovdqa xmmword ptr [rip + 0x1c79797], xmm1 ; 0x101ff9c50
0x1003804b9: lea rdx, [rip + 0x1c79790] ; 0x101ff9c50
0x1003804c0: mov qword ptr [rip + 0x1c79795], 0 ; 0x101ff9c60
0x1003804cb: mov qword ptr [rip + 0x934bd6], rdx ; 0x100cb50a8
0x1003804d2: lea rdx, [rip + 0x802de9] ; 0x100b832c2 cloudCardBarn
0x1003804d9: mov qword ptr [rip + 0x934c10], rdx ; 0x100cb50f0
0x1003804e0: lea rdx, [rip + 0x934c09] ; 0x100cb50f0
0x1003804e7: mov qword ptr [rip + 0x934c12], rcx ; 0x100cb5100
0x1003804ee: mov qword ptr [rip + 0x934c17], 0x350 ; 0x100cb5110
0x1003804f9: mov rcx, qword ptr [rip + 0x886af8] ; 0x100c06ff8 -> 0x10037cd70 __Z17GetMetaTypeByTypeIP13CloudCardBarnERK8MetaTypev
0x100380500: mov qword ptr [rip + 0x934c11], rcx ; 0x100cb5118
0x100380507: mov qword ptr [rip + 0x934c12], rax ; 0x100cb5120
0x10038050e: mov qword ptr [rip + 0x934c0f], 0xffffffffffffffff ; 0x100cb5128
0x100380519: mov qword ptr [rip + 0x934c10], rbx ; 0x100cb5130
0x100380520: mov qword ptr [rip + 0x934c0d], 0 ; 0x100cb5138
0x10038052b: vmovdqa xmmword ptr [rip + 0x1c7973d], xmm1 ; 0x101ff9c70
0x100380533: lea rcx, [rip + 0x1c79736] ; 0x101ff9c70
0x10038053a: mov qword ptr [rip + 0x1c7973b], 0 ; 0x101ff9c80
0x100380545: mov qword ptr [rip + 0x934bac], rcx ; 0x100cb50f8
0x10038054c: lea rcx, [rip + 0x802d7d] ; 0x100b832d0 fogVolume
0x100380553: mov qword ptr [rip + 0x934be6], rcx ; 0x100cb5140
0x10038055a: lea rcx, [rip + 0x934bdf] ; 0x100cb5140
0x100380561: mov qword ptr [rip + 0x934be8], rdx ; 0x100cb5150
0x100380568: mov qword ptr [rip + 0x934bed], 0x2c0 ; 0x100cb5160
0x100380573: mov rdx, qword ptr [rip + 0x886f1e] ; 0x100c07498 -> 0x10037cd80 __Z17GetMetaTypeByTypeIP9FogVolumeERK8MetaTypev
0x10038057a: mov qword ptr [rip + 0x934be7], rdx ; 0x100cb5168
0x100380581: mov qword ptr [rip + 0x934be8], rax ; 0x100cb5170
0x100380588: mov qword ptr [rip + 0x934be5], 0xffffffffffffffff ; 0x100cb5178
0x100380593: mov qword ptr [rip + 0x934be6], rbx ; 0x100cb5180
0x10038059a: mov qword ptr [rip + 0x934be3], 0 ; 0x100cb5188
0x1003805a5: vmovdqa xmmword ptr [rip + 0x1c796e3], xmm1 ; 0x101ff9c90
0x1003805ad: lea rdx, [rip + 0x1c796dc] ; 0x101ff9c90
0x1003805b4: mov qword ptr [rip + 0x1c796e1], 0 ; 0x101ff9ca0
0x1003805bf: mov qword ptr [rip + 0x934b82], rdx ; 0x100cb5148
0x1003805c6: lea rdx, [rip + 0x802d0d] ; 0x100b832da touchVisualizer
0x1003805cd: mov qword ptr [rip + 0x934bbc], rdx ; 0x100cb5190
0x1003805d4: lea rdx, [rip + 0x934bb5] ; 0x100cb5190
0x1003805db: mov qword ptr [rip + 0x934bbe], rcx ; 0x100cb51a0
0x1003805e2: mov qword ptr [rip + 0x934bc3], 0x1c8 ; 0x100cb51b0
0x1003805ed: mov rcx, qword ptr [rip + 0x886b54] ; 0x100c07148 -> 0x10037cd90 __Z17GetMetaTypeByTypeIP15TouchVisualizerERK8MetaTypev
0x1003805f4: mov qword ptr [rip + 0x934bbd], rcx ; 0x100cb51b8
0x1003805fb: mov qword ptr [rip + 0x934bbe], rax ; 0x100cb51c0
0x100380602: mov qword ptr [rip + 0x934bbb], 0xffffffffffffffff ; 0x100cb51c8
0x10038060d: mov qword ptr [rip + 0x934bbc], rbx ; 0x100cb51d0
0x100380614: mov qword ptr [rip + 0x934bb9], 0 ; 0x100cb51d8
0x10038061f: vmovdqa xmmword ptr [rip + 0x1c79689], xmm1 ; 0x101ff9cb0
0x100380627: lea rcx, [rip + 0x1c79682] ; 0x101ff9cb0
0x10038062e: mov qword ptr [rip + 0x1c79687], 0 ; 0x101ff9cc0
0x100380639: mov qword ptr [rip + 0x934b58], rcx ; 0x100cb5198
0x100380640: lea rcx, [rip + 0x802ca3] ; 0x100b832ea musicBarn
0x100380647: mov qword ptr [rip + 0x934b92], rcx ; 0x100cb51e0
0x10038064e: lea rcx, [rip + 0x934b8b] ; 0x100cb51e0
0x100380655: mov qword ptr [rip + 0x934b94], rdx ; 0x100cb51f0
0x10038065c: mov qword ptr [rip + 0x934b99], 0x5c0 ; 0x100cb5200
0x100380667: mov rdx, qword ptr [rip + 0x886e62] ; 0x100c074d0 -> 0x10037cda0 __Z17GetMetaTypeByTypeIP9MusicBarnERK8MetaTypev
0x10038066e: mov qword ptr [rip + 0x934b93], rdx ; 0x100cb5208
0x100380675: mov qword ptr [rip + 0x934b94], rax ; 0x100cb5210
0x10038067c: mov qword ptr [rip + 0x934b91], 0xffffffffffffffff ; 0x100cb5218
0x100380687: mov qword ptr [rip + 0x934b92], rbx ; 0x100cb5220
0x10038068e: mov qword ptr [rip + 0x934b8f], 0 ; 0x100cb5228
0x100380699: vmovdqa xmmword ptr [rip + 0x1c7962f], xmm1 ; 0x101ff9cd0
0x1003806a1: lea rdx, [rip + 0x1c79628] ; 0x101ff9cd0
0x1003806a8: mov qword ptr [rip + 0x1c7962d], 0 ; 0x101ff9ce0
0x1003806b3: mov qword ptr [rip + 0x934b2e], rdx ; 0x100cb51e8
0x1003806ba: lea rdx, [rip + 0x802c33] ; 0x100b832f4 soundEmitterBarn
0x1003806c1: mov qword ptr [rip + 0x934b68], rdx ; 0x100cb5230
0x1003806c8: lea rdx, [rip + 0x934b61] ; 0x100cb5230
0x1003806cf: mov qword ptr [rip + 0x934b6a], rcx ; 0x100cb5240
0x1003806d6: mov qword ptr [rip + 0x934b6f], 0x210 ; 0x100cb5250
0x1003806e1: mov rcx, qword ptr [rip + 0x886ac0] ; 0x100c071a8 -> 0x10037cdb0 __Z17GetMetaTypeByTypeIP16SoundEmitterBarnERK8MetaTypev
0x1003806e8: mov qword ptr [rip + 0x934b69], rcx ; 0x100cb5258
0x1003806ef: mov qword ptr [rip + 0x934b6a], rax ; 0x100cb5260
0x1003806f6: mov qword ptr [rip + 0x934b67], 0xffffffffffffffff ; 0x100cb5268
0x100380701: mov qword ptr [rip + 0x934b68], rbx ; 0x100cb5270
0x100380708: mov qword ptr [rip + 0x934b65], 0 ; 0x100cb5278
0x100380713: vmovdqa xmmword ptr [rip + 0x1c795d5], xmm1 ; 0x101ff9cf0
0x10038071b: lea rcx, [rip + 0x1c795ce] ; 0x101ff9cf0
0x100380722: mov qword ptr [rip + 0x1c795d3], 0 ; 0x101ff9d00
0x10038072d: mov qword ptr [rip + 0x934b04], rcx ; 0x100cb5238
0x100380734: lea rcx, [rip + 0x802bca] ; 0x100b83305 cloudTexGen
0x10038073b: mov qword ptr [rip + 0x934b3e], rcx ; 0x100cb5280
0x100380742: lea rcx, [rip + 0x934b37] ; 0x100cb5280
0x100380749: mov qword ptr [rip + 0x934b40], rdx ; 0x100cb5290
0x100380750: mov qword ptr [rip + 0x934b45], 0x228 ; 0x100cb52a0
0x10038075b: mov rdx, qword ptr [rip + 0x8867a6] ; 0x100c06f08 -> 0x10037cdc0 __Z17GetMetaTypeByTypeIP11CloudTexGenERK8MetaTypev
0x100380762: mov qword ptr [rip + 0x934b3f], rdx ; 0x100cb52a8
0x100380769: mov qword ptr [rip + 0x934b40], rax ; 0x100cb52b0
0x100380770: mov qword ptr [rip + 0x934b3d], 0xffffffffffffffff ; 0x100cb52b8
0x10038077b: mov qword ptr [rip + 0x934b3e], rbx ; 0x100cb52c0
0x100380782: mov qword ptr [rip + 0x934b3b], 0 ; 0x100cb52c8
0x10038078d: vmovdqa xmmword ptr [rip + 0x1c7957b], xmm1 ; 0x101ff9d10
0x100380795: lea rdx, [rip + 0x1c79574] ; 0x101ff9d10
0x10038079c: mov qword ptr [rip + 0x1c79579], 0 ; 0x101ff9d20
0x1003807a7: mov qword ptr [rip + 0x934ada], rdx ; 0x100cb5288
0x1003807ae: lea rdx, [rip + 0x802b5c] ; 0x100b83311 tubeBarn
0x1003807b5: mov qword ptr [rip + 0x934b14], rdx ; 0x100cb52d0
0x1003807bc: lea rdx, [rip + 0x934b0d] ; 0x100cb52d0
0x1003807c3: mov qword ptr [rip + 0x934b16], rcx ; 0x100cb52e0
0x1003807ca: mov qword ptr [rip + 0x934b1b], 0x5b8 ; 0x100cb52f0
0x1003807d5: mov rcx, qword ptr [rip + 0x886c44] ; 0x100c07420 -> 0x10037cdd0 __Z17GetMetaTypeByTypeIP8TubeBarnERK8MetaTypev
0x1003807dc: mov qword ptr [rip + 0x934b15], rcx ; 0x100cb52f8
0x1003807e3: mov qword ptr [rip + 0x934b16], rax ; 0x100cb5300
0x1003807ea: mov qword ptr [rip + 0x934b13], 0xffffffffffffffff ; 0x100cb5308
0x1003807f5: mov qword ptr [rip + 0x934b14], rbx ; 0x100cb5310
0x1003807fc: mov qword ptr [rip + 0x934b11], 0 ; 0x100cb5318
0x100380807: vmovdqa xmmword ptr [rip + 0x1c79521], xmm1 ; 0x101ff9d30
0x10038080f: lea rcx, [rip + 0x1c7951a] ; 0x101ff9d30
0x100380816: mov qword ptr [rip + 0x1c7951f], 0 ; 0x101ff9d40
0x100380821: mov qword ptr [rip + 0x934ab0], rcx ; 0x100cb52d8
0x100380828: lea rcx, [rip + 0x802aeb] ; 0x100b8331a relationshipAbilityDefs
0x10038082f: mov qword ptr [rip + 0x934aea], rcx ; 0x100cb5320
0x100380836: lea rcx, [rip + 0x934ae3] ; 0x100cb5320
0x10038083d: mov qword ptr [rip + 0x934aec], rdx ; 0x100cb5330
0x100380844: mov qword ptr [rip + 0x934af1], 0x230 ; 0x100cb5340
0x10038084f: mov rdx, qword ptr [rip + 0x886a0a] ; 0x100c07260 -> 0x10037cde0 __Z17GetMetaTypeByTypeIP23RelationshipAbilityDefsERK8MetaTypev
0x100380856: mov qword ptr [rip + 0x934aeb], rdx ; 0x100cb5348
0x10038085d: mov qword ptr [rip + 0x934aec], rax ; 0x100cb5350
0x100380864: mov qword ptr [rip + 0x934ae9], 0xffffffffffffffff ; 0x100cb5358
0x10038086f: mov qword ptr [rip + 0x934aea], rbx ; 0x100cb5360
0x100380876: mov qword ptr [rip + 0x934ae7], 0 ; 0x100cb5368
0x100380881: vmovdqa xmmword ptr [rip + 0x1c794c7], xmm1 ; 0x101ff9d50
0x100380889: lea rdx, [rip + 0x1c794c0] ; 0x101ff9d50
0x100380890: mov qword ptr [rip + 0x1c794c5], 0 ; 0x101ff9d60
0x10038089b: mov qword ptr [rip + 0x934a86], rdx ; 0x100cb5328
0x1003808a2: lea rdx, [rip + 0x7dd749] ; 0x100b5dff2 achievements
0x1003808a9: mov qword ptr [rip + 0x934ac0], rdx ; 0x100cb5370
0x1003808b0: lea rdx, [rip + 0x934ab9] ; 0x100cb5370
0x1003808b7: mov qword ptr [rip + 0x934ac2], rcx ; 0x100cb5380
0x1003808be: mov qword ptr [rip + 0x934ac7], 0x240 ; 0x100cb5390
0x1003808c9: mov rcx, qword ptr [rip + 0x886818] ; 0x100c070e8 -> 0x10037cdf0 __Z17GetMetaTypeByTypeIP15AchievementBarnERK8MetaTypev
0x1003808d0: mov qword ptr [rip + 0x934ac1], rcx ; 0x100cb5398
0x1003808d7: mov qword ptr [rip + 0x934ac2], rax ; 0x100cb53a0
0x1003808de: mov qword ptr [rip + 0x934abf], 0xffffffffffffffff ; 0x100cb53a8
0x1003808e9: mov qword ptr [rip + 0x934ac0], rbx ; 0x100cb53b0
0x1003808f0: mov qword ptr [rip + 0x934abd], 0 ; 0x100cb53b8
0x1003808fb: vmovdqa xmmword ptr [rip + 0x1c7946d], xmm1 ; 0x101ff9d70
0x100380903: lea rcx, [rip + 0x1c79466] ; 0x101ff9d70
0x10038090a: mov qword ptr [rip + 0x1c7946b], 0 ; 0x101ff9d80
0x100380915: mov qword ptr [rip + 0x934a5c], rcx ; 0x100cb5378
0x10038091c: lea rcx, [rip + 0x802a0f] ; 0x100b83332 scheduledEventBarn
0x100380923: mov qword ptr [rip + 0x934a96], rcx ; 0x100cb53c0
0x10038092a: lea rcx, [rip + 0x934a8f] ; 0x100cb53c0
0x100380931: mov qword ptr [rip + 0x934a98], rdx ; 0x100cb53d0
0x100380938: mov qword ptr [rip + 0x934a9d], 0x248 ; 0x100cb53e0
0x100380943: mov rdx, qword ptr [rip + 0x8868be] ; 0x100c07208 -> 0x10037ce00 __Z17GetMetaTypeByTypeIP18ScheduledEventBarnERK8MetaTypev
0x10038094a: mov qword ptr [rip + 0x934a97], rdx ; 0x100cb53e8
0x100380951: mov qword ptr [rip + 0x934a98], rax ; 0x100cb53f0
0x100380958: mov qword ptr [rip + 0x934a95], 0xffffffffffffffff ; 0x100cb53f8
0x100380963: mov qword ptr [rip + 0x934a96], rbx ; 0x100cb5400
0x10038096a: mov qword ptr [rip + 0x934a93], 0 ; 0x100cb5408
0x100380975: vmovdqa xmmword ptr [rip + 0x1c79413], xmm1 ; 0x101ff9d90
0x10038097d: lea rdx, [rip + 0x1c7940c] ; 0x101ff9d90
0x100380984: mov qword ptr [rip + 0x1c79411], 0 ; 0x101ff9da0
0x10038098f: mov qword ptr [rip + 0x934a32], rdx ; 0x100cb53c8
0x100380996: lea rdx, [rip + 0x8029a8] ; 0x100b83345 collectibleBarn
0x10038099d: mov qword ptr [rip + 0x934a6c], rdx ; 0x100cb5410
0x1003809a4: lea rdx, [rip + 0x934a65] ; 0x100cb5410
0x1003809ab: mov qword ptr [rip + 0x934a6e], rcx ; 0x100cb5420
0x1003809b2: mov qword ptr [rip + 0x934a73], 0x238 ; 0x100cb5430
0x1003809bd: mov rcx, qword ptr [rip + 0x886734] ; 0x100c070f8 -> 0x10037ce10 __Z17GetMetaTypeByTypeIP15CollectibleBarnERK8MetaTypev
0x1003809c4: mov qword ptr [rip + 0x934a6d], rcx ; 0x100cb5438
0x1003809cb: mov qword ptr [rip + 0x934a6e], rax ; 0x100cb5440
0x1003809d2: mov qword ptr [rip + 0x934a6b], 0xffffffffffffffff ; 0x100cb5448
0x1003809dd: mov qword ptr [rip + 0x934a6c], rbx ; 0x100cb5450
0x1003809e4: mov qword ptr [rip + 0x934a69], 0 ; 0x100cb5458
0x1003809ef: vmovdqa xmmword ptr [rip + 0x1c793b9], xmm1 ; 0x101ff9db0
0x1003809f7: lea rcx, [rip + 0x1c793b2] ; 0x101ff9db0
0x1003809fe: mov qword ptr [rip + 0x1c793b7], 0 ; 0x101ff9dc0
0x100380a09: mov qword ptr [rip + 0x934a08], rcx ; 0x100cb5418
0x100380a10: lea rcx, [rip + 0x80293e] ; 0x100b83355 outfitDefs
0x100380a17: mov qword ptr [rip + 0x934a42], rcx ; 0x100cb5460
0x100380a1e: lea rcx, [rip + 0x934a3b] ; 0x100cb5460
0x100380a25: mov qword ptr [rip + 0x934a44], rdx ; 0x100cb5470
0x100380a2c: mov qword ptr [rip + 0x934a49], 0x250 ; 0x100cb5480
0x100380a37: mov rdx, qword ptr [rip + 0x886462] ; 0x100c06ea0 -> 0x10037ce20 __Z17GetMetaTypeByTypeIP10OutfitDefsERK8MetaTypev
0x100380a3e: mov qword ptr [rip + 0x934a43], rdx ; 0x100cb5488
0x100380a45: mov qword ptr [rip + 0x934a44], rax ; 0x100cb5490
0x100380a4c: mov qword ptr [rip + 0x934a41], 0xffffffffffffffff ; 0x100cb5498
0x100380a57: mov qword ptr [rip + 0x934a42], rbx ; 0x100cb54a0
0x100380a5e: mov qword ptr [rip + 0x934a3f], 0 ; 0x100cb54a8
0x100380a69: vmovdqa xmmword ptr [rip + 0x1c7935f], xmm1 ; 0x101ff9dd0
0x100380a71: lea rdx, [rip + 0x1c79358] ; 0x101ff9dd0
0x100380a78: mov qword ptr [rip + 0x1c7935d], 0 ; 0x101ff9de0
0x100380a83: mov qword ptr [rip + 0x9349de], rdx ; 0x100cb5468
0x100380a8a: lea rdx, [rip + 0x8028cf] ; 0x100b83360 constellations
0x100380a91: mov qword ptr [rip + 0x934a18], rdx ; 0x100cb54b0
0x100380a98: lea rdx, [rip + 0x934a11] ; 0x100cb54b0
0x100380a9f: mov qword ptr [rip + 0x934a1a], rcx ; 0x100cb54c0
0x100380aa6: mov qword ptr [rip + 0x934a1f], 0x258 ; 0x100cb54d0
0x100380ab1: mov rcx, qword ptr [rip + 0x8865c0] ; 0x100c07078 -> 0x10037ce30 __Z17GetMetaTypeByTypeIP14ConstellationsERK8MetaTypev
0x100380ab8: mov qword ptr [rip + 0x934a19], rcx ; 0x100cb54d8
0x100380abf: mov qword ptr [rip + 0x934a1a], rax ; 0x100cb54e0
0x100380ac6: mov qword ptr [rip + 0x934a17], 0xffffffffffffffff ; 0x100cb54e8
0x100380ad1: mov qword ptr [rip + 0x934a18], rbx ; 0x100cb54f0
0x100380ad8: mov qword ptr [rip + 0x934a15], 0 ; 0x100cb54f8
0x100380ae3: vmovdqa xmmword ptr [rip + 0x1c79305], xmm1 ; 0x101ff9df0
0x100380aeb: lea rcx, [rip + 0x1c792fe] ; 0x101ff9df0
0x100380af2: mov qword ptr [rip + 0x1c79303], 0 ; 0x101ff9e00
0x100380afd: mov qword ptr [rip + 0x9349b4], rcx ; 0x100cb54b8
0x100380b04: lea rcx, [rip + 0x802864] ; 0x100b8336f socialGameBarn
0x100380b0b: mov qword ptr [rip + 0x9349ee], rcx ; 0x100cb5500
0x100380b12: lea rcx, [rip + 0x9349e7] ; 0x100cb5500
0x100380b19: mov qword ptr [rip + 0x9349f0], rdx ; 0x100cb5510
0x100380b20: mov qword ptr [rip + 0x9349f5], 0x278 ; 0x100cb5520
0x100380b2b: mov rdx, qword ptr [rip + 0x886596] ; 0x100c070c8 -> 0x10037ce40 __Z17GetMetaTypeByTypeIP14SocialGameBarnERK8MetaTypev
0x100380b32: mov qword ptr [rip + 0x9349ef], rdx ; 0x100cb5528
0x100380b39: mov qword ptr [rip + 0x9349f0], rax ; 0x100cb5530
0x100380b40: mov qword ptr [rip + 0x9349ed], 0xffffffffffffffff ; 0x100cb5538
0x100380b4b: mov qword ptr [rip + 0x9349ee], rbx ; 0x100cb5540
0x100380b52: mov qword ptr [rip + 0x9349eb], 0 ; 0x100cb5548
0x100380b5d: vmovdqa xmmword ptr [rip + 0x1c792ab], xmm1 ; 0x101ff9e10
0x100380b65: lea rdx, [rip + 0x1c792a4] ; 0x101ff9e10
0x100380b6c: mov qword ptr [rip + 0x1c792a9], 0 ; 0x101ff9e20
0x100380b77: mov qword ptr [rip + 0x93498a], rdx ; 0x100cb5508
0x100380b7e: lea rdx, [rip + 0x8027f9] ; 0x100b8337e avatarBarn
0x100380b85: mov qword ptr [rip + 0x9349c4], rdx ; 0x100cb5550
0x100380b8c: lea rdx, [rip + 0x9349bd] ; 0x100cb5550
0x100380b93: mov qword ptr [rip + 0x9349c6], rcx ; 0x100cb5560
0x100380b9a: mov qword ptr [rip + 0x9349cb], 0x280 ; 0x100cb5570
0x100380ba5: mov rcx, qword ptr [rip + 0x886244] ; 0x100c06df0 -> 0x10037ce50 __Z17GetMetaTypeByTypeIP10AvatarBarnERK8MetaTypev
0x100380bac: mov qword ptr [rip + 0x9349c5], rcx ; 0x100cb5578
0x100380bb3: mov qword ptr [rip + 0x9349c6], rax ; 0x100cb5580
0x100380bba: mov qword ptr [rip + 0x9349c3], 0xffffffffffffffff ; 0x100cb5588
0x100380bc5: mov qword ptr [rip + 0x9349c4], rbx ; 0x100cb5590
0x100380bcc: mov qword ptr [rip + 0x9349c1], 0 ; 0x100cb5598
0x100380bd7: vmovdqa xmmword ptr [rip + 0x1c79251], xmm1 ; 0x101ff9e30
0x100380bdf: lea rcx, [rip + 0x1c7924a] ; 0x101ff9e30
0x100380be6: mov qword ptr [rip + 0x1c7924f], 0 ; 0x101ff9e40
0x100380bf1: mov qword ptr [rip + 0x934960], rcx ; 0x100cb5558
0x100380bf8: lea rcx, [rip + 0x8012a5] ; 0x100b81ea4 visibility
0x100380bff: mov qword ptr [rip + 0x93499a], rcx ; 0x100cb55a0
0x100380c06: lea rcx, [rip + 0x934993] ; 0x100cb55a0
0x100380c0d: mov qword ptr [rip + 0x93499c], rdx ; 0x100cb55b0
0x100380c14: mov qword ptr [rip + 0x9349a1], 0x2b8 ; 0x100cb55c0
0x100380c1f: mov rdx, qword ptr [rip + 0x8862ba] ; 0x100c06ee0 -> 0x10037ce60 __Z17GetMetaTypeByTypeIP10VisibilityERK8MetaTypev
0x100380c26: mov qword ptr [rip + 0x93499b], rdx ; 0x100cb55c8
0x100380c2d: mov qword ptr [rip + 0x93499c], rax ; 0x100cb55d0
0x100380c34: mov qword ptr [rip + 0x934999], 0xffffffffffffffff ; 0x100cb55d8
0x100380c3f: mov qword ptr [rip + 0x93499a], rbx ; 0x100cb55e0
0x100380c46: mov qword ptr [rip + 0x934997], 0 ; 0x100cb55e8
0x100380c51: vmovdqa xmmword ptr [rip + 0x1c791f7], xmm1 ; 0x101ff9e50
0x100380c59: lea rdx, [rip + 0x1c791f0] ; 0x101ff9e50
0x100380c60: mov qword ptr [rip + 0x1c791f5], 0 ; 0x101ff9e60
0x100380c6b: mov qword ptr [rip + 0x934936], rdx ; 0x100cb55a8
0x100380c72: lea rdx, [rip + 0x802710] ; 0x100b83389 rainBarn
0x100380c79: mov qword ptr [rip + 0x934970], rdx ; 0x100cb55f0
0x100380c80: lea rdx, [rip + 0x934969] ; 0x100cb55f0
0x100380c87: mov qword ptr [rip + 0x934972], rcx ; 0x100cb5600
0x100380c8e: mov qword ptr [rip + 0x934977], 0x3e0 ; 0x100cb5610
0x100380c99: mov rcx, qword ptr [rip + 0x886748] ; 0x100c073e8 -> 0x10037ce70 __Z17GetMetaTypeByTypeIP8RainBarnERK8MetaTypev
0x100380ca0: mov qword ptr [rip + 0x934971], rcx ; 0x100cb5618
0x100380ca7: mov qword ptr [rip + 0x934972], rax ; 0x100cb5620
0x100380cae: mov qword ptr [rip + 0x93496f], 0xffffffffffffffff ; 0x100cb5628
0x100380cb9: mov qword ptr [rip + 0x934970], rbx ; 0x100cb5630
0x100380cc0: mov qword ptr [rip + 0x93496d], 0 ; 0x100cb5638
0x100380ccb: vmovdqa xmmword ptr [rip + 0x1c7919d], xmm1 ; 0x101ff9e70
0x100380cd3: lea rcx, [rip + 0x1c79196] ; 0x101ff9e70
0x100380cda: mov qword ptr [rip + 0x1c7919b], 0 ; 0x101ff9e80
0x100380ce5: mov qword ptr [rip + 0x93490c], rcx ; 0x100cb55f8
0x100380cec: lea rcx, [rip + 0x80269f] ; 0x100b83392 lensFlareBarn
0x100380cf3: mov qword ptr [rip + 0x934946], rcx ; 0x100cb5640
0x100380cfa: lea rcx, [rip + 0x93493f] ; 0x100cb5640
0x100380d01: mov qword ptr [rip + 0x934948], rdx ; 0x100cb5650
0x100380d08: mov qword ptr [rip + 0x93494d], 0x3e8 ; 0x100cb5660
0x100380d13: mov rdx, qword ptr [rip + 0x8862fe] ; 0x100c07018 -> 0x10037ce80 __Z17GetMetaTypeByTypeIP13LensFlareBarnERK8MetaTypev
0x100380d1a: mov qword ptr [rip + 0x934947], rdx ; 0x100cb5668
0x100380d21: mov qword ptr [rip + 0x934948], rax ; 0x100cb5670
0x100380d28: mov qword ptr [rip + 0x934945], 0xffffffffffffffff ; 0x100cb5678
0x100380d33: mov qword ptr [rip + 0x934946], rbx ; 0x100cb5680
0x100380d3a: mov qword ptr [rip + 0x934943], 0 ; 0x100cb5688
0x100380d45: vmovdqa xmmword ptr [rip + 0x1c79143], xmm1 ; 0x101ff9e90
0x100380d4d: lea rdx, [rip + 0x1c7913c] ; 0x101ff9e90
0x100380d54: mov qword ptr [rip + 0x1c79141], 0 ; 0x101ff9ea0
0x100380d5f: mov qword ptr [rip + 0x9348e2], rdx ; 0x100cb5648
0x100380d66: lea rdx, [rip + 0x802633] ; 0x100b833a0 itemV2Barn
0x100380d6d: mov qword ptr [rip + 0x93491c], rdx ; 0x100cb5690
0x100380d74: lea rdx, [rip + 0x934915] ; 0x100cb5690
0x100380d7b: mov qword ptr [rip + 0x93491e], rcx ; 0x100cb56a0
0x100380d82: mov qword ptr [rip + 0x934923], 0x458 ; 0x100cb56b0
0x100380d8d: mov rcx, qword ptr [rip + 0x8860e4] ; 0x100c06e78 -> 0x10037ce90 __Z17GetMetaTypeByTypeIP10ItemV2BarnERK8MetaTypev
0x100380d94: mov qword ptr [rip + 0x93491d], rcx ; 0x100cb56b8
0x100380d9b: mov qword ptr [rip + 0x93491e], rax ; 0x100cb56c0
0x100380da2: mov qword ptr [rip + 0x93491b], 0xffffffffffffffff ; 0x100cb56c8
0x100380dad: mov qword ptr [rip + 0x93491c], rbx ; 0x100cb56d0
0x100380db4: mov qword ptr [rip + 0x934919], 0 ; 0x100cb56d8
0x100380dbf: vmovdqa xmmword ptr [rip + 0x1c790e9], xmm1 ; 0x101ff9eb0
0x100380dc7: lea rcx, [rip + 0x1c790e2] ; 0x101ff9eb0
0x100380dce: mov qword ptr [rip + 0x1c790e7], 0 ; 0x101ff9ec0
0x100380dd9: mov qword ptr [rip + 0x9348b8], rcx ; 0x100cb5698
0x100380de0: lea rcx, [rip + 0x8025c4] ; 0x100b833ab candleBarn
0x100380de7: mov qword ptr [rip + 0x9348f2], rcx ; 0x100cb56e0
0x100380dee: lea rcx, [rip + 0x9348eb] ; 0x100cb56e0
0x100380df5: mov qword ptr [rip + 0x9348f4], rdx ; 0x100cb56f0
0x100380dfc: mov qword ptr [rip + 0x9348f9], 0x460 ; 0x100cb5700
0x100380e07: mov rdx, qword ptr [rip + 0x886002] ; 0x100c06e10 -> 0x10037cea0 __Z17GetMetaTypeByTypeIP10CandleBarnERK8MetaTypev
0x100380e0e: mov qword ptr [rip + 0x9348f3], rdx ; 0x100cb5708
0x100380e15: mov qword ptr [rip + 0x9348f4], rax ; 0x100cb5710
0x100380e1c: mov qword ptr [rip + 0x9348f1], 0xffffffffffffffff ; 0x100cb5718
0x100380e27: mov qword ptr [rip + 0x9348f2], rbx ; 0x100cb5720
0x100380e2e: mov qword ptr [rip + 0x9348ef], 0 ; 0x100cb5728
0x100380e39: vmovdqa xmmword ptr [rip + 0x1c7908f], xmm1 ; 0x101ff9ed0
0x100380e41: lea rdx, [rip + 0x1c79088] ; 0x101ff9ed0
0x100380e48: mov qword ptr [rip + 0x1c7908d], 0 ; 0x101ff9ee0
0x100380e53: mov qword ptr [rip + 0x93488e], rdx ; 0x100cb56e8
0x100380e5a: lea rdx, [rip + 0x802555] ; 0x100b833b6 particleBarn
0x100380e61: mov qword ptr [rip + 0x9348c8], rdx ; 0x100cb5730
0x100380e68: lea rdx, [rip + 0x9348c1] ; 0x100cb5730
0x100380e6f: mov qword ptr [rip + 0x9348ca], rcx ; 0x100cb5740
0x100380e76: mov qword ptr [rip + 0x9348cf], 0x440 ; 0x100cb5750
0x100380e81: mov rcx, qword ptr [rip + 0x886108] ; 0x100c06f90 -> 0x10037ceb0 __Z17GetMetaTypeByTypeIP12ParticleBarnERK8MetaTypev
0x100380e88: mov qword ptr [rip + 0x9348c9], rcx ; 0x100cb5758
0x100380e8f: mov qword ptr [rip + 0x9348ca], rax ; 0x100cb5760
0x100380e96: mov qword ptr [rip + 0x9348c7], 0xffffffffffffffff ; 0x100cb5768
0x100380ea1: mov qword ptr [rip + 0x9348c8], rbx ; 0x100cb5770
0x100380ea8: mov qword ptr [rip + 0x9348c5], 0 ; 0x100cb5778
0x100380eb3: vmovdqa xmmword ptr [rip + 0x1c79035], xmm1 ; 0x101ff9ef0
0x100380ebb: lea rcx, [rip + 0x1c7902e] ; 0x101ff9ef0
0x100380ec2: mov qword ptr [rip + 0x1c79033], 0 ; 0x101ff9f00
0x100380ecd: mov qword ptr [rip + 0x934864], rcx ; 0x100cb5738
0x100380ed4: lea rcx, [rip + 0x8024e8] ; 0x100b833c3 birdFlocks
0x100380edb: mov qword ptr [rip + 0x93489e], rcx ; 0x100cb5780
0x100380ee2: lea rcx, [rip + 0x934897] ; 0x100cb5780
0x100380ee9: mov qword ptr [rip + 0x9348a0], rdx ; 0x100cb5790
0x100380ef0: mov qword ptr [rip + 0x9348a5], 0x448 ; 0x100cb57a0
0x100380efb: mov rdx, qword ptr [rip + 0x885efe] ; 0x100c06e00 -> 0x10037cec0 __Z17GetMetaTypeByTypeIP10BirdFlocksERK8MetaTypev
0x100380f02: mov qword ptr [rip + 0x93489f], rdx ; 0x100cb57a8
0x100380f09: mov qword ptr [rip + 0x9348a0], rax ; 0x100cb57b0
0x100380f10: mov qword ptr [rip + 0x93489d], 0xffffffffffffffff ; 0x100cb57b8
0x100380f1b: mov qword ptr [rip + 0x93489e], rbx ; 0x100cb57c0
0x100380f22: mov qword ptr [rip + 0x93489b], 0 ; 0x100cb57c8
0x100380f2d: vmovdqa xmmword ptr [rip + 0x1c78fdb], xmm1 ; 0x101ff9f10
0x100380f35: lea rdx, [rip + 0x1c78fd4] ; 0x101ff9f10
0x100380f3c: mov qword ptr [rip + 0x1c78fd9], 0 ; 0x101ff9f20
0x100380f47: mov qword ptr [rip + 0x93483a], rdx ; 0x100cb5788
0x100380f4e: lea rdx, [rip + 0x802479] ; 0x100b833ce cloudParticleBarn
0x100380f55: mov qword ptr [rip + 0x934874], rdx ; 0x100cb57d0
0x100380f5c: lea rdx, [rip + 0x93486d] ; 0x100cb57d0
0x100380f63: mov qword ptr [rip + 0x934876], rcx ; 0x100cb57e0
0x100380f6a: mov qword ptr [rip + 0x93487b], 0x450 ; 0x100cb57f0
0x100380f75: mov rcx, qword ptr [rip + 0x886244] ; 0x100c071c0 -> 0x10037ced0 __Z17GetMetaTypeByTypeIP17CloudParticleBarnERK8MetaTypev
0x100380f7c: mov qword ptr [rip + 0x934875], rcx ; 0x100cb57f8
0x100380f83: mov qword ptr [rip + 0x934876], rax ; 0x100cb5800
0x100380f8a: mov qword ptr [rip + 0x934873], 0xffffffffffffffff ; 0x100cb5808
0x100380f95: mov qword ptr [rip + 0x934874], rbx ; 0x100cb5810
0x100380f9c: mov qword ptr [rip + 0x934871], 0 ; 0x100cb5818
0x100380fa7: vmovdqa xmmword ptr [rip + 0x1c78f81], xmm1 ; 0x101ff9f30
0x100380faf: lea rcx, [rip + 0x1c78f7a] ; 0x101ff9f30
0x100380fb6: mov qword ptr [rip + 0x1c78f7f], 0 ; 0x101ff9f40
0x100380fc1: mov qword ptr [rip + 0x934810], rcx ; 0x100cb57d8
0x100380fc8: lea rcx, [rip + 0x802411] ; 0x100b833e0 bubBarn
0x100380fcf: mov qword ptr [rip + 0x93484a], rcx ; 0x100cb5820
0x100380fd6: lea rcx, [rip + 0x934843] ; 0x100cb5820
0x100380fdd: mov qword ptr [rip + 0x93484c], rdx ; 0x100cb5830
0x100380fe4: mov qword ptr [rip + 0x934851], 0x2e0 ; 0x100cb5840
0x100380fef: mov rdx, qword ptr [rip + 0x886342] ; 0x100c07338 -> 0x10037cee0 __Z17GetMetaTypeByTypeIP7BubBarnERK8MetaTypev
0x100380ff6: mov qword ptr [rip + 0x93484b], rdx ; 0x100cb5848
0x100380ffd: mov qword ptr [rip + 0x93484c], rax ; 0x100cb5850
0x100381004: mov qword ptr [rip + 0x934849], 0xffffffffffffffff ; 0x100cb5858
0x10038100f: mov qword ptr [rip + 0x93484a], rbx ; 0x100cb5860
0x100381016: mov qword ptr [rip + 0x934847], 0 ; 0x100cb5868
0x100381021: vmovdqa xmmword ptr [rip + 0x1c78f27], xmm1 ; 0x101ff9f50
0x100381029: lea rdx, [rip + 0x1c78f20] ; 0x101ff9f50
0x100381030: mov qword ptr [rip + 0x1c78f25], 0 ; 0x101ff9f60
0x10038103b: mov qword ptr [rip + 0x9347e6], rdx ; 0x100cb5828
0x100381042: lea rdx, [rip + 0x80239f] ; 0x100b833e8 trailBarn
0x100381049: mov qword ptr [rip + 0x934820], rdx ; 0x100cb5870
0x100381050: lea rdx, [rip + 0x934819] ; 0x100cb5870
0x100381057: mov qword ptr [rip + 0x934822], rcx ; 0x100cb5880
0x10038105e: mov qword ptr [rip + 0x934827], 0x2e8 ; 0x100cb5890
0x100381069: mov rcx, qword ptr [rip + 0x886498] ; 0x100c07508 -> 0x10037cef0 __Z17GetMetaTypeByTypeIP9TrailBarnERK8MetaTypev
0x100381070: mov qword ptr [rip + 0x934821], rcx ; 0x100cb5898
0x100381077: mov qword ptr [rip + 0x934822], rax ; 0x100cb58a0
0x10038107e: mov qword ptr [rip + 0x93481f], 0xffffffffffffffff ; 0x100cb58a8
0x100381089: mov qword ptr [rip + 0x934820], rbx ; 0x100cb58b0
0x100381090: mov qword ptr [rip + 0x93481d], 0 ; 0x100cb58b8
0x10038109b: vmovdqa xmmword ptr [rip + 0x1c78ecd], xmm1 ; 0x101ff9f70
0x1003810a3: lea rcx, [rip + 0x1c78ec6] ; 0x101ff9f70
0x1003810aa: mov qword ptr [rip + 0x1c78ecb], 0 ; 0x101ff9f80
0x1003810b5: mov qword ptr [rip + 0x9347bc], rcx ; 0x100cb5878
0x1003810bc: lea rcx, [rip + 0x80232f] ; 0x100b833f2 tailBarn
0x1003810c3: mov qword ptr [rip + 0x9347f6], rcx ; 0x100cb58c0
0x1003810ca: lea rcx, [rip + 0x9347ef] ; 0x100cb58c0
0x1003810d1: mov qword ptr [rip + 0x9347f8], rdx ; 0x100cb58d0
0x1003810d8: mov qword ptr [rip + 0x9347fd], 0x2f0 ; 0x100cb58e0
0x1003810e3: mov rdx, qword ptr [rip + 0x886326] ; 0x100c07410 -> 0x10037cf00 __Z17GetMetaTypeByTypeIP8TailBarnERK8MetaTypev
0x1003810ea: mov qword ptr [rip + 0x9347f7], rdx ; 0x100cb58e8
0x1003810f1: mov qword ptr [rip + 0x9347f8], rax ; 0x100cb58f0
0x1003810f8: mov qword ptr [rip + 0x9347f5], 0xffffffffffffffff ; 0x100cb58f8
0x100381103: mov qword ptr [rip + 0x9347f6], rbx ; 0x100cb5900
0x10038110a: mov qword ptr [rip + 0x9347f3], 0 ; 0x100cb5908
0x100381115: vmovdqa xmmword ptr [rip + 0x1c78e73], xmm1 ; 0x101ff9f90
0x10038111d: lea rdx, [rip + 0x1c78e6c] ; 0x101ff9f90
0x100381124: mov qword ptr [rip + 0x1c78e71], 0 ; 0x101ff9fa0
0x10038112f: mov qword ptr [rip + 0x934792], rdx ; 0x100cb58c8
0x100381136: lea rdx, [rip + 0x8022be] ; 0x100b833fb checkpointBarn
0x10038113d: mov qword ptr [rip + 0x9347cc], rdx ; 0x100cb5910
0x100381144: lea rdx, [rip + 0x9347c5] ; 0x100cb5910
0x10038114b: mov qword ptr [rip + 0x9347ce], rcx ; 0x100cb5920
0x100381152: mov qword ptr [rip + 0x9347d3], 0x478 ; 0x100cb5930
0x10038115d: mov rcx, qword ptr [rip + 0x885f0c] ; 0x100c07070 -> 0x10037cf10 __Z17GetMetaTypeByTypeIP14CheckpointBarnERK8MetaTypev
0x100381164: mov qword ptr [rip + 0x9347cd], rcx ; 0x100cb5938
0x10038116b: mov qword ptr [rip + 0x9347ce], rax ; 0x100cb5940
0x100381172: mov qword ptr [rip + 0x9347cb], 0xffffffffffffffff ; 0x100cb5948
0x10038117d: mov qword ptr [rip + 0x9347cc], rbx ; 0x100cb5950
0x100381184: mov qword ptr [rip + 0x9347c9], 0 ; 0x100cb5958
0x10038118f: vmovdqa xmmword ptr [rip + 0x1c78e19], xmm1 ; 0x101ff9fb0
0x100381197: lea rcx, [rip + 0x1c78e12] ; 0x101ff9fb0
0x10038119e: mov qword ptr [rip + 0x1c78e17], 0 ; 0x101ff9fc0
0x1003811a9: mov qword ptr [rip + 0x934768], rcx ; 0x100cb5918
0x1003811b0: lea rcx, [rip + 0x802253] ; 0x100b8340a guideBarn
0x1003811b7: mov qword ptr [rip + 0x9347a2], rcx ; 0x100cb5960
0x1003811be: lea rcx, [rip + 0x93479b] ; 0x100cb5960
0x1003811c5: mov qword ptr [rip + 0x9347a4], rdx ; 0x100cb5970
0x1003811cc: mov qword ptr [rip + 0x9347a9], 0x3f0 ; 0x100cb5980
0x1003811d7: mov rdx, qword ptr [rip + 0x8862c2] ; 0x100c074a0 -> 0x10037cf20 __Z17GetMetaTypeByTypeIP9GuideBarnERK8MetaTypev
0x1003811de: mov qword ptr [rip + 0x9347a3], rdx ; 0x100cb5988
0x1003811e5: mov qword ptr [rip + 0x9347a4], rax ; 0x100cb5990
0x1003811ec: mov qword ptr [rip + 0x9347a1], 0xffffffffffffffff ; 0x100cb5998
0x1003811f7: mov qword ptr [rip + 0x9347a2], rbx ; 0x100cb59a0
0x1003811fe: mov qword ptr [rip + 0x93479f], 0 ; 0x100cb59a8
0x100381209: vmovdqa xmmword ptr [rip + 0x1c78dbf], xmm1 ; 0x101ff9fd0
0x100381211: lea rdx, [rip + 0x1c78db8] ; 0x101ff9fd0
0x100381218: mov qword ptr [rip + 0x1c78dbd], 0 ; 0x101ff9fe0
0x100381223: mov qword ptr [rip + 0x93473e], rdx ; 0x100cb5968
0x10038122a: lea rdx, [rip + 0x8021e3] ; 0x100b83414 levelLinkBarn
0x100381231: mov qword ptr [rip + 0x934778], rdx ; 0x100cb59b0
0x100381238: lea rdx, [rip + 0x934771] ; 0x100cb59b0
0x10038123f: mov qword ptr [rip + 0x93477a], rcx ; 0x100cb59c0
0x100381246: mov qword ptr [rip + 0x93477f], 0x400 ; 0x100cb59d0
0x100381251: mov rcx, qword ptr [rip + 0x885dd0] ; 0x100c07028 -> 0x10037cf30 __Z17GetMetaTypeByTypeIP13LevelLinkBarnERK8MetaTypev
0x100381258: mov qword ptr [rip + 0x934779], rcx ; 0x100cb59d8
0x10038125f: mov qword ptr [rip + 0x93477a], rax ; 0x100cb59e0
0x100381266: mov qword ptr [rip + 0x934777], 0xffffffffffffffff ; 0x100cb59e8
0x100381271: mov qword ptr [rip + 0x934778], rbx ; 0x100cb59f0
0x100381278: mov qword ptr [rip + 0x934775], 0 ; 0x100cb59f8
0x100381283: vmovdqa xmmword ptr [rip + 0x1c78d65], xmm1 ; 0x101ff9ff0
0x10038128b: lea rcx, [rip + 0x1c78d5e] ; 0x101ff9ff0
0x100381292: mov qword ptr [rip + 0x1c78d63], 0 ; 0x101ffa000
0x10038129d: mov qword ptr [rip + 0x934714], rcx ; 0x100cb59b8
0x1003812a4: lea rcx, [rip + 0x802177] ; 0x100b83422 streamLevelLinkBarn
0x1003812ab: mov qword ptr [rip + 0x93474e], rcx ; 0x100cb5a00
0x1003812b2: lea rcx, [rip + 0x934747] ; 0x100cb5a00
0x1003812b9: mov qword ptr [rip + 0x934750], rdx ; 0x100cb5a10
0x1003812c0: mov qword ptr [rip + 0x934755], 0x408 ; 0x100cb5a20
0x1003812cb: mov rdx, qword ptr [rip + 0x885f66] ; 0x100c07238 -> 0x10037cf40 __Z17GetMetaTypeByTypeIP19StreamLevelLinkBarnERK8MetaTypev
0x1003812d2: mov qword ptr [rip + 0x93474f], rdx ; 0x100cb5a28
0x1003812d9: mov qword ptr [rip + 0x934750], rax ; 0x100cb5a30
0x1003812e0: mov qword ptr [rip + 0x93474d], 0xffffffffffffffff ; 0x100cb5a38
0x1003812eb: mov qword ptr [rip + 0x93474e], rbx ; 0x100cb5a40
0x1003812f2: mov qword ptr [rip + 0x93474b], 0 ; 0x100cb5a48
0x1003812fd: vmovdqa xmmword ptr [rip + 0x1c78d0b], xmm1 ; 0x101ffa010
0x100381305: lea rdx, [rip + 0x1c78d04] ; 0x101ffa010
0x10038130c: mov qword ptr [rip + 0x1c78d09], 0 ; 0x101ffa020
0x100381317: mov qword ptr [rip + 0x9346ea], rdx ; 0x100cb5a08
0x10038131e: lea rdx, [rip + 0x802111] ; 0x100b83436 sharedEventBarn
0x100381325: mov qword ptr [rip + 0x934724], rdx ; 0x100cb5a50
0x10038132c: lea rdx, [rip + 0x93471d] ; 0x100cb5a50
0x100381333: mov qword ptr [rip + 0x934726], rcx ; 0x100cb5a60
0x10038133a: mov qword ptr [rip + 0x93472b], 0x490 ; 0x100cb5a70
0x100381345: mov rcx, qword ptr [rip + 0x885e9c] ; 0x100c071e8 -> 0x10037cf50 __Z17GetMetaTypeByTypeIP17SharedEventClientERK8MetaTypev
0x10038134c: mov qword ptr [rip + 0x934725], rcx ; 0x100cb5a78
0x100381353: mov qword ptr [rip + 0x934726], rax ; 0x100cb5a80
0x10038135a: mov qword ptr [rip + 0x934723], 0xffffffffffffffff ; 0x100cb5a88
0x100381365: mov qword ptr [rip + 0x934724], rbx ; 0x100cb5a90
0x10038136c: mov qword ptr [rip + 0x934721], 0 ; 0x100cb5a98
0x100381377: vmovdqa xmmword ptr [rip + 0x1c78cb1], xmm1 ; 0x101ffa030
0x10038137f: lea rcx, [rip + 0x1c78caa] ; 0x101ffa030
0x100381386: mov qword ptr [rip + 0x1c78caf], 0 ; 0x101ffa040
0x100381391: mov qword ptr [rip + 0x9346c0], rcx ; 0x100cb5a58
0x100381398: lea rcx, [rip + 0x8020a7] ; 0x100b83446 controller
0x10038139f: mov qword ptr [rip + 0x9346fa], rcx ; 0x100cb5aa0
0x1003813a6: lea rcx, [rip + 0x9346f3] ; 0x100cb5aa0
0x1003813ad: mov qword ptr [rip + 0x9346fc], rdx ; 0x100cb5ab0
0x1003813b4: mov qword ptr [rip + 0x934701], 0x270 ; 0x100cb5ac0
0x1003813bf: mov rdx, qword ptr [rip + 0x885a5a] ; 0x100c06e20 -> 0x10037cf60 __Z17GetMetaTypeByTypeIP10ControllerERK8MetaTypev
0x1003813c6: mov qword ptr [rip + 0x9346fb], rdx ; 0x100cb5ac8
0x1003813cd: mov qword ptr [rip + 0x9346fc], rax ; 0x100cb5ad0
0x1003813d4: mov qword ptr [rip + 0x9346f9], 0xffffffffffffffff ; 0x100cb5ad8
0x1003813df: mov qword ptr [rip + 0x9346fa], rbx ; 0x100cb5ae0
0x1003813e6: mov qword ptr [rip + 0x9346f7], 0 ; 0x100cb5ae8
0x1003813f1: vmovdqa xmmword ptr [rip + 0x1c78c57], xmm1 ; 0x101ffa050
0x1003813f9: lea rdx, [rip + 0x1c78c50] ; 0x101ffa050
0x100381400: mov qword ptr [rip + 0x1c78c55], 0 ; 0x101ffa060
0x10038140b: mov qword ptr [rip + 0x934696], rdx ; 0x100cb5aa8
0x100381412: lea rdx, [rip + 0x802038] ; 0x100b83451 shop
0x100381419: mov qword ptr [rip + 0x9346d0], rdx ; 0x100cb5af0
0x100381420: lea rdx, [rip + 0x9346c9] ; 0x100cb5af0
0x100381427: mov qword ptr [rip + 0x9346d2], rcx ; 0x100cb5b00
0x10038142e: mov qword ptr [rip + 0x9346d7], 0x260 ; 0x100cb5b10
0x100381439: mov rcx, qword ptr [rip + 0x885e70] ; 0x100c072b0 -> 0x10037cf70 __Z17GetMetaTypeByTypeIP4ShopERK8MetaTypev
0x100381440: mov qword ptr [rip + 0x9346d1], rcx ; 0x100cb5b18
0x100381447: mov qword ptr [rip + 0x9346d2], rax ; 0x100cb5b20
0x10038144e: mov qword ptr [rip + 0x9346cf], 0xffffffffffffffff ; 0x100cb5b28
0x100381459: mov qword ptr [rip + 0x9346d0], rbx ; 0x100cb5b30
0x100381460: mov qword ptr [rip + 0x9346cd], 0 ; 0x100cb5b38
0x10038146b: vmovdqa xmmword ptr [rip + 0x1c78bfd], xmm1 ; 0x101ffa070
0x100381473: lea rcx, [rip + 0x1c78bf6] ; 0x101ffa070
0x10038147a: mov qword ptr [rip + 0x1c78bfb], 0 ; 0x101ffa080
0x100381485: mov qword ptr [rip + 0x93466c], rcx ; 0x100cb5af8
0x10038148c: lea rcx, [rip + 0x801fc3] ; 0x100b83456 traversalDataBarn
0x100381493: mov qword ptr [rip + 0x9346a6], rcx ; 0x100cb5b40
0x10038149a: lea rcx, [rip + 0x93469f] ; 0x100cb5b40
0x1003814a1: mov qword ptr [rip + 0x9346a8], rdx ; 0x100cb5b50
0x1003814a8: mov qword ptr [rip + 0x9346ad], 0x318 ; 0x100cb5b60
0x1003814b3: mov rdx, qword ptr [rip + 0x885d3e] ; 0x100c071f8 -> 0x10037cf80 __Z17GetMetaTypeByTypeIP17TraversalDataBarnERK8MetaTypev
0x1003814ba: mov qword ptr [rip + 0x9346a7], rdx ; 0x100cb5b68
0x1003814c1: mov qword ptr [rip + 0x9346a8], rax ; 0x100cb5b70
0x1003814c8: mov qword ptr [rip + 0x9346a5], 0xffffffffffffffff ; 0x100cb5b78
0x1003814d3: mov qword ptr [rip + 0x9346a6], rbx ; 0x100cb5b80
0x1003814da: mov qword ptr [rip + 0x9346a3], 0 ; 0x100cb5b88
0x1003814e5: vmovdqa xmmword ptr [rip + 0x1c78ba3], xmm1 ; 0x101ffa090
0x1003814ed: lea rdx, [rip + 0x1c78b9c] ; 0x101ffa090
0x1003814f4: mov qword ptr [rip + 0x1c78ba1], 0 ; 0x101ffa0a0
0x1003814ff: mov qword ptr [rip + 0x934642], rdx ; 0x100cb5b48
0x100381506: lea rdx, [rip + 0x801f5b] ; 0x100b83468 skirtBarn
0x10038150d: mov qword ptr [rip + 0x93467c], rdx ; 0x100cb5b90
0x100381514: lea rdx, [rip + 0x934675] ; 0x100cb5b90
0x10038151b: mov qword ptr [rip + 0x93467e], rcx ; 0x100cb5ba0
0x100381522: mov qword ptr [rip + 0x934683], 0x358 ; 0x100cb5bb0
0x10038152d: mov rcx, qword ptr [rip + 0x885fbc] ; 0x100c074f0 -> 0x10037cf90 __Z17GetMetaTypeByTypeIP9SkirtBarnERK8MetaTypev
0x100381534: mov qword ptr [rip + 0x93467d], rcx ; 0x100cb5bb8
0x10038153b: mov qword ptr [rip + 0x93467e], rax ; 0x100cb5bc0
0x100381542: mov qword ptr [rip + 0x93467b], 0xffffffffffffffff ; 0x100cb5bc8
0x10038154d: mov qword ptr [rip + 0x93467c], rbx ; 0x100cb5bd0
0x100381554: mov qword ptr [rip + 0x934679], 0 ; 0x100cb5bd8
0x10038155f: vmovdqa xmmword ptr [rip + 0x1c78b49], xmm1 ; 0x101ffa0b0
0x100381567: lea rcx, [rip + 0x1c78b42] ; 0x101ffa0b0
0x10038156e: mov qword ptr [rip + 0x1c78b47], 0 ; 0x101ffa0c0
0x100381579: mov qword ptr [rip + 0x934618], rcx ; 0x100cb5b98
0x100381580: lea rcx, [rip + 0x801eeb] ; 0x100b83472 shoutBarn
0x100381587: mov qword ptr [rip + 0x934652], rcx ; 0x100cb5be0
0x10038158e: lea rcx, [rip + 0x93464b] ; 0x100cb5be0
0x100381595: mov qword ptr [rip + 0x934654], rdx ; 0x100cb5bf0
0x10038159c: mov qword ptr [rip + 0x934659], 0x3c8 ; 0x100cb5c00
0x1003815a7: mov rdx, qword ptr [rip + 0x885f3a] ; 0x100c074e8 -> 0x10037cfa0 __Z17GetMetaTypeByTypeIP9ShoutBarnERK8MetaTypev
0x1003815ae: mov qword ptr [rip + 0x934653], rdx ; 0x100cb5c08
0x1003815b5: mov qword ptr [rip + 0x934654], rax ; 0x100cb5c10
0x1003815bc: mov qword ptr [rip + 0x934651], 0xffffffffffffffff ; 0x100cb5c18
0x1003815c7: mov qword ptr [rip + 0x934652], rbx ; 0x100cb5c20
0x1003815ce: mov qword ptr [rip + 0x93464f], 0 ; 0x100cb5c28
0x1003815d9: vmovdqa xmmword ptr [rip + 0x1c78aef], xmm1 ; 0x101ffa0d0
0x1003815e1: lea rdx, [rip + 0x1c78ae8] ; 0x101ffa0d0
0x1003815e8: mov qword ptr [rip + 0x1c78aed], 0 ; 0x101ffa0e0
0x1003815f3: mov qword ptr [rip + 0x9345ee], rdx ; 0x100cb5be8
0x1003815fa: lea rdx, [rip + 0x801e7b] ; 0x100b8347c crabBarn
0x100381601: mov qword ptr [rip + 0x934628], rdx ; 0x100cb5c30
0x100381608: lea rdx, [rip + 0x934621] ; 0x100cb5c30
0x10038160f: mov qword ptr [rip + 0x93462a], rcx ; 0x100cb5c40
0x100381616: mov qword ptr [rip + 0x93462f], 0x370 ; 0x100cb5c50
0x100381621: mov rcx, qword ptr [rip + 0x885d68] ; 0x100c07390 -> 0x10037cfb0 __Z17GetMetaTypeByTypeIP8CrabBarnERK8MetaTypev
0x100381628: mov qword ptr [rip + 0x934629], rcx ; 0x100cb5c58
0x10038162f: mov qword ptr [rip + 0x93462a], rax ; 0x100cb5c60
0x100381636: mov qword ptr [rip + 0x934627], 0xffffffffffffffff ; 0x100cb5c68
0x100381641: mov qword ptr [rip + 0x934628], rbx ; 0x100cb5c70
0x100381648: mov qword ptr [rip + 0x934625], 0 ; 0x100cb5c78
0x100381653: vmovdqa xmmword ptr [rip + 0x1c78a95], xmm1 ; 0x101ffa0f0
0x10038165b: lea rcx, [rip + 0x1c78a8e] ; 0x101ffa0f0
0x100381662: mov qword ptr [rip + 0x1c78a93], 0 ; 0x101ffa100
0x10038166d: mov qword ptr [rip + 0x9345c4], rcx ; 0x100cb5c38
0x100381674: lea rcx, [rip + 0x801e0a] ; 0x100b83485 moteBarn
0x10038167b: mov qword ptr [rip + 0x9345fe], rcx ; 0x100cb5c80
0x100381682: lea rcx, [rip + 0x9345f7] ; 0x100cb5c80
0x100381689: mov qword ptr [rip + 0x934600], rdx ; 0x100cb5c90
0x100381690: mov qword ptr [rip + 0x934605], 0x378 ; 0x100cb5ca0
0x10038169b: mov rdx, qword ptr [rip + 0x885d1e] ; 0x100c073c0 -> 0x10037cfc0 __Z17GetMetaTypeByTypeIP8MoteBarnERK8MetaTypev
0x1003816a2: mov qword ptr [rip + 0x9345ff], rdx ; 0x100cb5ca8
0x1003816a9: mov qword ptr [rip + 0x934600], rax ; 0x100cb5cb0
0x1003816b0: mov qword ptr [rip + 0x9345fd], 0xffffffffffffffff ; 0x100cb5cb8
0x1003816bb: mov qword ptr [rip + 0x9345fe], rbx ; 0x100cb5cc0
0x1003816c2: mov qword ptr [rip + 0x9345fb], 0 ; 0x100cb5cc8
0x1003816cd: vmovdqa xmmword ptr [rip + 0x1c78a3b], xmm1 ; 0x101ffa110
0x1003816d5: lea rdx, [rip + 0x1c78a34] ; 0x101ffa110
0x1003816dc: mov qword ptr [rip + 0x1c78a39], 0 ; 0x101ffa120
0x1003816e7: mov qword ptr [rip + 0x93459a], rdx ; 0x100cb5c88
0x1003816ee: lea rdx, [rip + 0x801d99] ; 0x100b8348e birdV2Barn
0x1003816f5: mov qword ptr [rip + 0x9345d4], rdx ; 0x100cb5cd0
0x1003816fc: lea rdx, [rip + 0x9345cd] ; 0x100cb5cd0
0x100381703: mov qword ptr [rip + 0x9345d6], rcx ; 0x100cb5ce0
0x10038170a: mov qword ptr [rip + 0x9345db], 0x380 ; 0x100cb5cf0
0x100381715: mov rcx, qword ptr [rip + 0x8856ec] ; 0x100c06e08 -> 0x10037cfd0 __Z17GetMetaTypeByTypeIP10BirdV2BarnERK8MetaTypev
0x10038171c: mov qword ptr [rip + 0x9345d5], rcx ; 0x100cb5cf8
0x100381723: mov qword ptr [rip + 0x9345d6], rax ; 0x100cb5d00
0x10038172a: mov qword ptr [rip + 0x9345d3], 0xffffffffffffffff ; 0x100cb5d08
0x100381735: mov qword ptr [rip + 0x9345d4], rbx ; 0x100cb5d10
0x10038173c: mov qword ptr [rip + 0x9345d1], 0 ; 0x100cb5d18
0x100381747: vmovdqa xmmword ptr [rip + 0x1c789e1], xmm1 ; 0x101ffa130
0x10038174f: lea rcx, [rip + 0x1c789da] ; 0x101ffa130
0x100381756: mov qword ptr [rip + 0x1c789df], 0 ; 0x101ffa140
0x100381761: mov qword ptr [rip + 0x934570], rcx ; 0x100cb5cd8
0x100381768: lea rcx, [rip + 0x801d2a] ; 0x100b83499 critterV2Barn
0x10038176f: mov qword ptr [rip + 0x9345aa], rcx ; 0x100cb5d20
0x100381776: lea rcx, [rip + 0x9345a3] ; 0x100cb5d20
0x10038177d: mov qword ptr [rip + 0x9345ac], rdx ; 0x100cb5d30
0x100381784: mov qword ptr [rip + 0x9345b1], 0x398 ; 0x100cb5d40
0x10038178f: mov rdx, qword ptr [rip + 0x88586a] ; 0x100c07000 -> 0x10037cfe0 __Z17GetMetaTypeByTypeIP13CritterV2BarnERK8MetaTypev
0x100381796: mov qword ptr [rip + 0x9345ab], rdx ; 0x100cb5d48
0x10038179d: mov qword ptr [rip + 0x9345ac], rax ; 0x100cb5d50
0x1003817a4: mov qword ptr [rip + 0x9345a9], 0xffffffffffffffff ; 0x100cb5d58
0x1003817af: mov qword ptr [rip + 0x9345aa], rbx ; 0x100cb5d60
0x1003817b6: mov qword ptr [rip + 0x9345a7], 0 ; 0x100cb5d68
0x1003817c1: vmovdqa xmmword ptr [rip + 0x1c78987], xmm1 ; 0x101ffa150
0x1003817c9: lea rdx, [rip + 0x1c78980] ; 0x101ffa150
0x1003817d0: mov qword ptr [rip + 0x1c78985], 0 ; 0x101ffa160
0x1003817db: mov qword ptr [rip + 0x934546], rdx ; 0x100cb5d28
0x1003817e2: lea rdx, [rip + 0x801cbe] ; 0x100b834a7 simpleCritterBarn
0x1003817e9: mov qword ptr [rip + 0x934580], rdx ; 0x100cb5d70
0x1003817f0: lea rdx, [rip + 0x934579] ; 0x100cb5d70
0x1003817f7: mov qword ptr [rip + 0x934582], rcx ; 0x100cb5d80
0x1003817fe: mov qword ptr [rip + 0x934587], 0x3a0 ; 0x100cb5d90
0x100381809: mov rcx, qword ptr [rip + 0x8859e0] ; 0x100c071f0 -> 0x10037cff0 __Z17GetMetaTypeByTypeIP17SimpleCritterBarnERK8MetaTypev
0x100381810: mov qword ptr [rip + 0x934581], rcx ; 0x100cb5d98
0x100381817: mov qword ptr [rip + 0x934582], rax ; 0x100cb5da0
0x10038181e: mov qword ptr [rip + 0x93457f], 0xffffffffffffffff ; 0x100cb5da8
0x100381829: mov qword ptr [rip + 0x934580], rbx ; 0x100cb5db0
0x100381830: mov qword ptr [rip + 0x93457d], 0 ; 0x100cb5db8
0x10038183b: vmovdqa xmmword ptr [rip + 0x1c7892d], xmm1 ; 0x101ffa170
0x100381843: lea rcx, [rip + 0x1c78926] ; 0x101ffa170
0x10038184a: mov qword ptr [rip + 0x1c7892b], 0 ; 0x101ffa180
0x100381855: mov qword ptr [rip + 0x93451c], rcx ; 0x100cb5d78
0x10038185c: lea rcx, [rip + 0x801c56] ; 0x100b834b9 darkCreatureBarn
0x100381863: mov qword ptr [rip + 0x934556], rcx ; 0x100cb5dc0
0x10038186a: lea rcx, [rip + 0x93454f] ; 0x100cb5dc0
0x100381871: mov qword ptr [rip + 0x934558], rdx ; 0x100cb5dd0
0x100381878: mov qword ptr [rip + 0x93455d], 0x368 ; 0x100cb5de0
0x100381883: mov rdx, qword ptr [rip + 0x8858f6] ; 0x100c07180 -> 0x10037d000 __Z17GetMetaTypeByTypeIP16DarkCreatureBarnERK8MetaTypev
0x10038188a: mov qword ptr [rip + 0x934557], rdx ; 0x100cb5de8
0x100381891: mov qword ptr [rip + 0x934558], rax ; 0x100cb5df0
0x100381898: mov qword ptr [rip + 0x934555], 0xffffffffffffffff ; 0x100cb5df8
0x1003818a3: mov qword ptr [rip + 0x934556], rbx ; 0x100cb5e00
0x1003818aa: mov qword ptr [rip + 0x934553], 0 ; 0x100cb5e08
0x1003818b5: vmovdqa xmmword ptr [rip + 0x1c788d3], xmm1 ; 0x101ffa190
0x1003818bd: lea rdx, [rip + 0x1c788cc] ; 0x101ffa190
0x1003818c4: mov qword ptr [rip + 0x1c788d1], 0 ; 0x101ffa1a0
0x1003818cf: mov qword ptr [rip + 0x9344f2], rdx ; 0x100cb5dc8
0x1003818d6: lea rdx, [rip + 0x801bed] ; 0x100b834ca darkstoneRainBarn
0x1003818dd: mov qword ptr [rip + 0x93452c], rdx ; 0x100cb5e10
0x1003818e4: lea rdx, [rip + 0x934525] ; 0x100cb5e10
0x1003818eb: mov qword ptr [rip + 0x93452e], rcx ; 0x100cb5e20
0x1003818f2: mov qword ptr [rip + 0x934533], 0x4c0 ; 0x100cb5e30
0x1003818fd: mov rcx, qword ptr [rip + 0x8858c4] ; 0x100c071c8 -> 0x10037d010 __Z17GetMetaTypeByTypeIP17DarkstoneRainBarnERK8MetaTypev
0x100381904: mov qword ptr [rip + 0x93452d], rcx ; 0x100cb5e38
0x10038190b: mov qword ptr [rip + 0x93452e], rax ; 0x100cb5e40
0x100381912: mov qword ptr [rip + 0x93452b], 0xffffffffffffffff ; 0x100cb5e48
0x10038191d: mov qword ptr [rip + 0x93452c], rbx ; 0x100cb5e50
0x100381924: mov qword ptr [rip + 0x934529], 0 ; 0x100cb5e58
0x10038192f: vmovdqa xmmword ptr [rip + 0x1c78879], xmm1 ; 0x101ffa1b0
0x100381937: lea rcx, [rip + 0x1c78872] ; 0x101ffa1b0
0x10038193e: mov qword ptr [rip + 0x1c78877], 0 ; 0x101ffa1c0
0x100381949: mov qword ptr [rip + 0x9344c8], rcx ; 0x100cb5e18
0x100381950: lea rcx, [rip + 0x801b85] ; 0x100b834dc flameBarn
0x100381957: mov qword ptr [rip + 0x934502], rcx ; 0x100cb5e60
0x10038195e: lea rcx, [rip + 0x9344fb] ; 0x100cb5e60
0x100381965: mov qword ptr [rip + 0x934504], rdx ; 0x100cb5e70
0x10038196c: mov qword ptr [rip + 0x934509], 0x418 ; 0x100cb5e80
0x100381977: mov rdx, qword ptr [rip + 0x885b12] ; 0x100c07490 -> 0x10037d020 __Z17GetMetaTypeByTypeIP9FlameBarnERK8MetaTypev
0x10038197e: mov qword ptr [rip + 0x934503], rdx ; 0x100cb5e88
0x100381985: mov qword ptr [rip + 0x934504], rax ; 0x100cb5e90
0x10038198c: mov qword ptr [rip + 0x934501], 0xffffffffffffffff ; 0x100cb5e98
0x100381997: mov qword ptr [rip + 0x934502], rbx ; 0x100cb5ea0
0x10038199e: mov qword ptr [rip + 0x9344ff], 0 ; 0x100cb5ea8
0x1003819a9: vmovdqa xmmword ptr [rip + 0x1c7881f], xmm1 ; 0x101ffa1d0
0x1003819b1: lea rdx, [rip + 0x1c78818] ; 0x101ffa1d0
0x1003819b8: mov qword ptr [rip + 0x1c7881d], 0 ; 0x101ffa1e0
0x1003819c3: mov qword ptr [rip + 0x93449e], rdx ; 0x100cb5e68
0x1003819ca: lea rdx, [rip + 0x801b15] ; 0x100b834e6 itemBarn
0x1003819d1: mov qword ptr [rip + 0x9344d8], rdx ; 0x100cb5eb0
0x1003819d8: lea rdx, [rip + 0x9344d1] ; 0x100cb5eb0
0x1003819df: mov qword ptr [rip + 0x9344da], rcx ; 0x100cb5ec0
0x1003819e6: mov qword ptr [rip + 0x9344df], 0x470 ; 0x100cb5ed0
0x1003819f1: mov rcx, qword ptr [rip + 0x8859b8] ; 0x100c073b0 -> 0x10037d030 __Z17GetMetaTypeByTypeIP8ItemBarnERK8MetaTypev
0x1003819f8: mov qword ptr [rip + 0x9344d9], rcx ; 0x100cb5ed8
0x1003819ff: mov qword ptr [rip + 0x9344da], rax ; 0x100cb5ee0
0x100381a06: mov qword ptr [rip + 0x9344d7], 0xffffffffffffffff ; 0x100cb5ee8
0x100381a11: mov qword ptr [rip + 0x9344d8], rbx ; 0x100cb5ef0
0x100381a18: mov qword ptr [rip + 0x9344d5], 0 ; 0x100cb5ef8
0x100381a23: vmovdqa xmmword ptr [rip + 0x1c787c5], xmm1 ; 0x101ffa1f0
0x100381a2b: lea rcx, [rip + 0x1c787be] ; 0x101ffa1f0
0x100381a32: mov qword ptr [rip + 0x1c787c3], 0 ; 0x101ffa200
0x100381a3d: mov qword ptr [rip + 0x934474], rcx ; 0x100cb5eb8
0x100381a44: lea rcx, [rip + 0x801aa4] ; 0x100b834ef blazeBarn
0x100381a4b: mov qword ptr [rip + 0x9344ae], rcx ; 0x100cb5f00
0x100381a52: lea rcx, [rip + 0x9344a7] ; 0x100cb5f00
0x100381a59: mov qword ptr [rip + 0x9344b0], rdx ; 0x100cb5f10
0x100381a60: mov qword ptr [rip + 0x9344b5], 0x420 ; 0x100cb5f20
0x100381a6b: mov rdx, qword ptr [rip + 0x8859d6] ; 0x100c07448 -> 0x10037d040 __Z17GetMetaTypeByTypeIP9BlazeBarnERK8MetaTypev
0x100381a72: mov qword ptr [rip + 0x9344af], rdx ; 0x100cb5f28
0x100381a79: mov qword ptr [rip + 0x9344b0], rax ; 0x100cb5f30
0x100381a80: mov qword ptr [rip + 0x9344ad], 0xffffffffffffffff ; 0x100cb5f38
0x100381a8b: mov qword ptr [rip + 0x9344ae], rbx ; 0x100cb5f40
0x100381a92: mov qword ptr [rip + 0x9344ab], 0 ; 0x100cb5f48
0x100381a9d: vmovdqa xmmword ptr [rip + 0x1c7876b], xmm1 ; 0x101ffa210
0x100381aa5: lea rdx, [rip + 0x1c78764] ; 0x101ffa210
0x100381aac: mov qword ptr [rip + 0x1c78769], 0 ; 0x101ffa220
0x100381ab7: mov qword ptr [rip + 0x93444a], rdx ; 0x100cb5f08
0x100381abe: lea rdx, [rip + 0x801a34] ; 0x100b834f9 emberBarn
0x100381ac5: mov qword ptr [rip + 0x934484], rdx ; 0x100cb5f50
0x100381acc: lea rdx, [rip + 0x93447d] ; 0x100cb5f50
0x100381ad3: mov qword ptr [rip + 0x934486], rcx ; 0x100cb5f60
0x100381ada: mov qword ptr [rip + 0x93448b], 0x428 ; 0x100cb5f70
0x100381ae5: mov rcx, qword ptr [rip + 0x885994] ; 0x100c07480 -> 0x10037d050 __Z17GetMetaTypeByTypeIP9EmberBarnERK8MetaTypev
0x100381aec: mov qword ptr [rip + 0x934485], rcx ; 0x100cb5f78
0x100381af3: mov qword ptr [rip + 0x934486], rax ; 0x100cb5f80
0x100381afa: mov qword ptr [rip + 0x934483], 0xffffffffffffffff ; 0x100cb5f88
0x100381b05: mov qword ptr [rip + 0x934484], rbx ; 0x100cb5f90
0x100381b0c: mov qword ptr [rip + 0x934481], 0 ; 0x100cb5f98
0x100381b17: vmovdqa xmmword ptr [rip + 0x1c78711], xmm1 ; 0x101ffa230
0x100381b1f: lea rcx, [rip + 0x1c7870a] ; 0x101ffa230
0x100381b26: mov qword ptr [rip + 0x1c7870f], 0 ; 0x101ffa240
0x100381b31: mov qword ptr [rip + 0x934420], rcx ; 0x100cb5f58
0x100381b38: lea rcx, [rip + 0x8019c4] ; 0x100b83503 meditationBarn
0x100381b3f: mov qword ptr [rip + 0x93445a], rcx ; 0x100cb5fa0
0x100381b46: lea rcx, [rip + 0x934453] ; 0x100cb5fa0
0x100381b4d: mov qword ptr [rip + 0x93445c], rdx ; 0x100cb5fb0
0x100381b54: mov qword ptr [rip + 0x934461], 0x3c0 ; 0x100cb5fc0
0x100381b5f: mov rdx, qword ptr [rip + 0x885542] ; 0x100c070a8 -> 0x10037d060 __Z17GetMetaTypeByTypeIP14MeditationBarnERK8MetaTypev
0x100381b66: mov qword ptr [rip + 0x93445b], rdx ; 0x100cb5fc8
0x100381b6d: mov qword ptr [rip + 0x93445c], rax ; 0x100cb5fd0
0x100381b74: mov qword ptr [rip + 0x934459], 0xffffffffffffffff ; 0x100cb5fd8
0x100381b7f: mov qword ptr [rip + 0x93445a], rbx ; 0x100cb5fe0
0x100381b86: mov qword ptr [rip + 0x934457], 0 ; 0x100cb5fe8
0x100381b91: vmovdqa xmmword ptr [rip + 0x1c786b7], xmm1 ; 0x101ffa250
0x100381b99: lea rdx, [rip + 0x1c786b0] ; 0x101ffa250
0x100381ba0: mov qword ptr [rip + 0x1c786b5], 0 ; 0x101ffa260
0x100381bab: mov qword ptr [rip + 0x9343f6], rdx ; 0x100cb5fa8
0x100381bb2: lea rdx, [rip + 0x801959] ; 0x100b83512 questInfoBarn
0x100381bb9: mov qword ptr [rip + 0x934430], rdx ; 0x100cb5ff0
0x100381bc0: lea rdx, [rip + 0x934429] ; 0x100cb5ff0
0x100381bc7: mov qword ptr [rip + 0x934432], rcx ; 0x100cb6000
0x100381bce: mov qword ptr [rip + 0x934437], 0x4a0 ; 0x100cb6010
0x100381bd9: mov rcx, qword ptr [rip + 0x885468] ; 0x100c07048 -> 0x10037d070 __Z17GetMetaTypeByTypeIP13QuestInfoBarnERK8MetaTypev
0x100381be0: mov qword ptr [rip + 0x934431], rcx ; 0x100cb6018
0x100381be7: mov qword ptr [rip + 0x934432], rax ; 0x100cb6020
0x100381bee: mov qword ptr [rip + 0x93442f], 0xffffffffffffffff ; 0x100cb6028
0x100381bf9: mov qword ptr [rip + 0x934430], rbx ; 0x100cb6030
0x100381c00: mov qword ptr [rip + 0x93442d], 0 ; 0x100cb6038
0x100381c0b: vmovdqa xmmword ptr [rip + 0x1c7865d], xmm1 ; 0x101ffa270
0x100381c13: lea rcx, [rip + 0x1c78656] ; 0x101ffa270
0x100381c1a: mov qword ptr [rip + 0x1c7865b], 0 ; 0x101ffa280
0x100381c25: mov qword ptr [rip + 0x9343cc], rcx ; 0x100cb5ff8
0x100381c2c: lea rcx, [rip + 0x8018ed] ; 0x100b83520 questBarn
0x100381c33: mov qword ptr [rip + 0x934406], rcx ; 0x100cb6040
0x100381c3a: lea rcx, [rip + 0x9343ff] ; 0x100cb6040
0x100381c41: mov qword ptr [rip + 0x934408], rdx ; 0x100cb6050
0x100381c48: mov qword ptr [rip + 0x93440d], 0x4a8 ; 0x100cb6060
0x100381c53: mov rdx, qword ptr [rip + 0x885886] ; 0x100c074e0 -> 0x10037d080 __Z17GetMetaTypeByTypeIP9QuestBarnERK8MetaTypev
0x100381c5a: mov qword ptr [rip + 0x934407], rdx ; 0x100cb6068
0x100381c61: mov qword ptr [rip + 0x934408], rax ; 0x100cb6070
0x100381c68: mov qword ptr [rip + 0x934405], 0xffffffffffffffff ; 0x100cb6078
0x100381c73: mov qword ptr [rip + 0x934406], rbx ; 0x100cb6080
0x100381c7a: mov qword ptr [rip + 0x934403], 0 ; 0x100cb6088
0x100381c85: vmovdqa xmmword ptr [rip + 0x1c78603], xmm1 ; 0x101ffa290
0x100381c8d: lea rdx, [rip + 0x1c785fc] ; 0x101ffa290
0x100381c94: mov qword ptr [rip + 0x1c78601], 0 ; 0x101ffa2a0
0x100381c9f: mov qword ptr [rip + 0x9343a2], rdx ; 0x100cb6048
0x100381ca6: lea rdx, [rip + 0x80187d] ; 0x100b8352a beaconBarn
0x100381cad: mov qword ptr [rip + 0x9343dc], rdx ; 0x100cb6090
0x100381cb4: lea rdx, [rip + 0x9343d5] ; 0x100cb6090
0x100381cbb: mov qword ptr [rip + 0x9343de], rcx ; 0x100cb60a0
0x100381cc2: mov qword ptr [rip + 0x9343e3], 0x4b0 ; 0x100cb60b0
0x100381ccd: mov rcx, qword ptr [rip + 0x885124] ; 0x100c06df8 -> 0x10037d090 __Z17GetMetaTypeByTypeIP10BeaconBarnERK8MetaTypev
0x100381cd4: mov qword ptr [rip + 0x9343dd], rcx ; 0x100cb60b8
0x100381cdb: mov qword ptr [rip + 0x9343de], rax ; 0x100cb60c0
0x100381ce2: mov qword ptr [rip + 0x9343db], 0xffffffffffffffff ; 0x100cb60c8
0x100381ced: mov qword ptr [rip + 0x9343dc], rbx ; 0x100cb60d0
0x100381cf4: mov qword ptr [rip + 0x9343d9], 0 ; 0x100cb60d8
0x100381cff: vmovdqa xmmword ptr [rip + 0x1c785a9], xmm1 ; 0x101ffa2b0
0x100381d07: lea rcx, [rip + 0x1c785a2] ; 0x101ffa2b0
0x100381d0e: mov qword ptr [rip + 0x1c785a7], 0 ; 0x101ffa2c0
0x100381d19: mov qword ptr [rip + 0x934378], rcx ; 0x100cb6098
0x100381d20: lea rcx, [rip + 0x80180e] ; 0x100b83535 darkstoneBarn
0x100381d27: mov qword ptr [rip + 0x9343b2], rcx ; 0x100cb60e0
0x100381d2e: lea rcx, [rip + 0x9343ab] ; 0x100cb60e0
0x100381d35: mov qword ptr [rip + 0x9343b4], rdx ; 0x100cb60f0
0x100381d3c: mov qword ptr [rip + 0x9343b9], 0x4b8 ; 0x100cb6100
0x100381d47: mov rdx, qword ptr [rip + 0x8852ba] ; 0x100c07008 -> 0x10037d0a0 __Z17GetMetaTypeByTypeIP13DarkstoneBarnERK8MetaTypev
0x100381d4e: mov qword ptr [rip + 0x9343b3], rdx ; 0x100cb6108
0x100381d55: mov qword ptr [rip + 0x9343b4], rax ; 0x100cb6110
0x100381d5c: mov qword ptr [rip + 0x9343b1], 0xffffffffffffffff ; 0x100cb6118
0x100381d67: mov qword ptr [rip + 0x9343b2], rbx ; 0x100cb6120
0x100381d6e: mov qword ptr [rip + 0x9343af], 0 ; 0x100cb6128
0x100381d79: vmovdqa xmmword ptr [rip + 0x1c7854f], xmm1 ; 0x101ffa2d0
0x100381d81: lea rdx, [rip + 0x1c78548] ; 0x101ffa2d0
0x100381d88: mov qword ptr [rip + 0x1c7854d], 0 ; 0x101ffa2e0
0x100381d93: mov qword ptr [rip + 0x93434e], rdx ; 0x100cb60e8
0x100381d9a: lea rdx, [rip + 0x8017a2] ; 0x100b83543 starFragmentBarn
0x100381da1: mov qword ptr [rip + 0x934388], rdx ; 0x100cb6130
0x100381da8: lea rdx, [rip + 0x934381] ; 0x100cb6130
0x100381daf: mov qword ptr [rip + 0x93438a], rcx ; 0x100cb6140
0x100381db6: mov qword ptr [rip + 0x93438f], 0x4c8 ; 0x100cb6150
0x100381dc1: mov rcx, qword ptr [rip + 0x8853e8] ; 0x100c071b0 -> 0x10037d0b0 __Z17GetMetaTypeByTypeIP16StarFragmentBarnERK8MetaTypev
0x100381dc8: mov qword ptr [rip + 0x934389], rcx ; 0x100cb6158
0x100381dcf: mov qword ptr [rip + 0x93438a], rax ; 0x100cb6160
0x100381dd6: mov qword ptr [rip + 0x934387], 0xffffffffffffffff ; 0x100cb6168
0x100381de1: mov qword ptr [rip + 0x934388], rbx ; 0x100cb6170
0x100381de8: mov qword ptr [rip + 0x934385], 0 ; 0x100cb6178
0x100381df3: vmovdqa xmmword ptr [rip + 0x1c784f5], xmm1 ; 0x101ffa2f0
0x100381dfb: lea rcx, [rip + 0x1c784ee] ; 0x101ffa2f0
0x100381e02: mov qword ptr [rip + 0x1c784f3], 0 ; 0x101ffa300
0x100381e0d: mov qword ptr [rip + 0x934324], rcx ; 0x100cb6138
0x100381e14: lea rcx, [rip + 0x801739] ; 0x100b83554 lightHouse
0x100381e1b: mov qword ptr [rip + 0x93435e], rcx ; 0x100cb6180
0x100381e22: lea rcx, [rip + 0x934357] ; 0x100cb6180
0x100381e29: mov qword ptr [rip + 0x934360], rdx ; 0x100cb6190
0x100381e30: mov qword ptr [rip + 0x934365], 0x4d0 ; 0x100cb61a0
0x100381e3b: mov rdx, qword ptr [rip + 0x88503e] ; 0x100c06e80 -> 0x10037d0c0 __Z17GetMetaTypeByTypeIP10LightHouseERK8MetaTypev
0x100381e42: mov qword ptr [rip + 0x93435f], rdx ; 0x100cb61a8
0x100381e49: mov qword ptr [rip + 0x934360], rax ; 0x100cb61b0
0x100381e50: mov qword ptr [rip + 0x93435d], 0xffffffffffffffff ; 0x100cb61b8
0x100381e5b: mov qword ptr [rip + 0x93435e], rbx ; 0x100cb61c0
0x100381e62: mov qword ptr [rip + 0x93435b], 0 ; 0x100cb61c8
0x100381e6d: vmovdqa xmmword ptr [rip + 0x1c7849b], xmm1 ; 0x101ffa310
0x100381e75: lea rdx, [rip + 0x1c78494] ; 0x101ffa310
0x100381e7c: mov qword ptr [rip + 0x1c78499], 0 ; 0x101ffa320
0x100381e87: mov qword ptr [rip + 0x9342fa], rdx ; 0x100cb6188
0x100381e8e: lea rdx, [rip + 0x7deb90] ; 0x100b60a25 chat
0x100381e95: mov qword ptr [rip + 0x934334], rdx ; 0x100cb61d0
0x100381e9c: lea rdx, [rip + 0x93432d] ; 0x100cb61d0
0x100381ea3: mov qword ptr [rip + 0x934336], rcx ; 0x100cb61e0
0x100381eaa: mov qword ptr [rip + 0x93433b], 0x518 ; 0x100cb61f0
0x100381eb5: mov rcx, qword ptr [rip + 0x8853cc] ; 0x100c07288 -> 0x10037d0d0 __Z17GetMetaTypeByTypeIP4ChatERK8MetaTypev
0x100381ebc: mov qword ptr [rip + 0x934335], rcx ; 0x100cb61f8
0x100381ec3: mov qword ptr [rip + 0x934336], rax ; 0x100cb6200
0x100381eca: mov qword ptr [rip + 0x934333], 0xffffffffffffffff ; 0x100cb6208
0x100381ed5: mov qword ptr [rip + 0x934334], rbx ; 0x100cb6210
0x100381edc: mov qword ptr [rip + 0x934331], 0 ; 0x100cb6218
0x100381ee7: vmovdqa xmmword ptr [rip + 0x1c78441], xmm1 ; 0x101ffa330
0x100381eef: lea rcx, [rip + 0x1c7843a] ; 0x101ffa330
0x100381ef6: mov qword ptr [rip + 0x1c7843f], 0 ; 0x101ffa340
0x100381f01: mov qword ptr [rip + 0x9342d0], rcx ; 0x100cb61d8
0x100381f08: lea rcx, [rip + 0x801650] ; 0x100b8355f dialogHintBarn
0x100381f0f: mov qword ptr [rip + 0x93430a], rcx ; 0x100cb6220
0x100381f16: lea rcx, [rip + 0x934303] ; 0x100cb6220
0x100381f1d: mov qword ptr [rip + 0x93430c], rdx ; 0x100cb6230
0x100381f24: mov qword ptr [rip + 0x934311], 0x520 ; 0x100cb6240
0x100381f2f: mov rdx, qword ptr [rip + 0x88514a] ; 0x100c07080 -> 0x10037d0e0 __Z17GetMetaTypeByTypeIP14DialogHintBarnERK8MetaTypev
0x100381f36: mov qword ptr [rip + 0x93430b], rdx ; 0x100cb6248
0x100381f3d: mov qword ptr [rip + 0x93430c], rax ; 0x100cb6250
0x100381f44: mov qword ptr [rip + 0x934309], 0xffffffffffffffff ; 0x100cb6258
0x100381f4f: mov qword ptr [rip + 0x93430a], rbx ; 0x100cb6260
0x100381f56: mov qword ptr [rip + 0x934307], 0 ; 0x100cb6268
0x100381f61: vmovdqa xmmword ptr [rip + 0x1c783e7], xmm1 ; 0x101ffa350
0x100381f69: lea rdx, [rip + 0x1c783e0] ; 0x101ffa350
0x100381f70: mov qword ptr [rip + 0x1c783e5], 0 ; 0x101ffa360
0x100381f7b: mov qword ptr [rip + 0x9342a6], rdx ; 0x100cb6228
0x100381f82: lea rdx, [rip + 0x8015e5] ; 0x100b8356e menuBarn
0x100381f89: mov qword ptr [rip + 0x9342e0], rdx ; 0x100cb6270
0x100381f90: lea rdx, [rip + 0x9342d9] ; 0x100cb6270
0x100381f97: mov qword ptr [rip + 0x9342e2], rcx ; 0x100cb6280
0x100381f9e: mov qword ptr [rip + 0x9342e7], 0x528 ; 0x100cb6290
0x100381fa9: mov rcx, qword ptr [rip + 0x885408] ; 0x100c073b8 -> 0x10037d0f0 __Z17GetMetaTypeByTypeIP8MenuBarnERK8MetaTypev
0x100381fb0: mov qword ptr [rip + 0x9342e1], rcx ; 0x100cb6298
0x100381fb7: mov qword ptr [rip + 0x9342e2], rax ; 0x100cb62a0
0x100381fbe: mov qword ptr [rip + 0x9342df], 0xffffffffffffffff ; 0x100cb62a8
0x100381fc9: mov qword ptr [rip + 0x9342e0], rbx ; 0x100cb62b0
0x100381fd0: mov qword ptr [rip + 0x9342dd], 0 ; 0x100cb62b8
0x100381fdb: vmovdqa xmmword ptr [rip + 0x1c7838d], xmm1 ; 0x101ffa370
0x100381fe3: lea rcx, [rip + 0x1c78386] ; 0x101ffa370
0x100381fea: mov qword ptr [rip + 0x1c7838b], 0 ; 0x101ffa380
0x100381ff5: mov qword ptr [rip + 0x93427c], rcx ; 0x100cb6278
0x100381ffc: lea rcx, [rip + 0x801574] ; 0x100b83577 tutorialBarn
0x100382003: mov qword ptr [rip + 0x9342b6], rcx ; 0x100cb62c0
0x10038200a: lea rcx, [rip + 0x9342af] ; 0x100cb62c0
0x100382011: mov qword ptr [rip + 0x9342b8], rdx ; 0x100cb62d0
0x100382018: mov qword ptr [rip + 0x9342bd], 0x530 ; 0x100cb62e0
0x100382023: mov rdx, qword ptr [rip + 0x884fa6] ; 0x100c06fd0 -> 0x10037d100 __Z17GetMetaTypeByTypeIP12TutorialBarnERK8MetaTypev
0x10038202a: mov qword ptr [rip + 0x9342b7], rdx ; 0x100cb62e8
0x100382031: mov qword ptr [rip + 0x9342b8], rax ; 0x100cb62f0
0x100382038: mov qword ptr [rip + 0x9342b5], 0xffffffffffffffff ; 0x100cb62f8
0x100382043: mov qword ptr [rip + 0x9342b6], rbx ; 0x100cb6300
0x10038204a: mov qword ptr [rip + 0x9342b3], 0 ; 0x100cb6308
0x100382055: vmovdqa xmmword ptr [rip + 0x1c78333], xmm1 ; 0x101ffa390
0x10038205d: lea rdx, [rip + 0x1c7832c] ; 0x101ffa390
0x100382064: mov qword ptr [rip + 0x1c78331], 0 ; 0x101ffa3a0
0x10038206f: mov qword ptr [rip + 0x934252], rdx ; 0x100cb62c8
0x100382076: lea rdx, [rip + 0x801507] ; 0x100b83584 bubbleMenuBarn
0x10038207d: mov qword ptr [rip + 0x93428c], rdx ; 0x100cb6310
0x100382084: lea rdx, [rip + 0x934285] ; 0x100cb6310
0x10038208b: mov qword ptr [rip + 0x93428e], rcx ; 0x100cb6320
0x100382092: mov qword ptr [rip + 0x934293], 0x538 ; 0x100cb6330
0x10038209d: mov rcx, qword ptr [rip + 0x884fbc] ; 0x100c07060 -> 0x10037d110 __Z17GetMetaTypeByTypeIP14BubbleMenuBarnERK8MetaTypev
0x1003820a4: mov qword ptr [rip + 0x93428d], rcx ; 0x100cb6338
0x1003820ab: mov qword ptr [rip + 0x93428e], rax ; 0x100cb6340
0x1003820b2: mov qword ptr [rip + 0x93428b], 0xffffffffffffffff ; 0x100cb6348
0x1003820bd: mov qword ptr [rip + 0x93428c], rbx ; 0x100cb6350
0x1003820c4: mov qword ptr [rip + 0x934289], 0 ; 0x100cb6358
0x1003820cf: vmovdqa xmmword ptr [rip + 0x1c782d9], xmm1 ; 0x101ffa3b0
0x1003820d7: lea rcx, [rip + 0x1c782d2] ; 0x101ffa3b0
0x1003820de: mov qword ptr [rip + 0x1c782d7], 0 ; 0x101ffa3c0
0x1003820e9: mov qword ptr [rip + 0x934228], rcx ; 0x100cb6318
0x1003820f0: lea rcx, [rip + 0x80149c] ; 0x100b83593 dazzleBarn
0x1003820f7: mov qword ptr [rip + 0x934262], rcx ; 0x100cb6360
0x1003820fe: lea rcx, [rip + 0x93425b] ; 0x100cb6360
0x100382105: mov qword ptr [rip + 0x934264], rdx ; 0x100cb6370
0x10038210c: mov qword ptr [rip + 0x934269], 0x548 ; 0x100cb6380
0x100382117: mov rdx, qword ptr [rip + 0x884d12] ; 0x100c06e30 -> 0x10037d120 __Z17GetMetaTypeByTypeIP10DazzleBarnERK8MetaTypev
0x10038211e: mov qword ptr [rip + 0x934263], rdx ; 0x100cb6388
0x100382125: mov qword ptr [rip + 0x934264], rax ; 0x100cb6390
0x10038212c: mov qword ptr [rip + 0x934261], 0xffffffffffffffff ; 0x100cb6398
0x100382137: mov qword ptr [rip + 0x934262], rbx ; 0x100cb63a0
0x10038213e: mov qword ptr [rip + 0x93425f], 0 ; 0x100cb63a8
0x100382149: vmovdqa xmmword ptr [rip + 0x1c7827f], xmm1 ; 0x101ffa3d0
0x100382151: lea rdx, [rip + 0x1c78278] ; 0x101ffa3d0
0x100382158: mov qword ptr [rip + 0x1c7827d], 0 ; 0x101ffa3e0
0x100382163: mov qword ptr [rip + 0x9341fe], rdx ; 0x100cb6368
0x10038216a: lea rdx, [rip + 0x80142d] ; 0x100b8359e netFlagBarn
0x100382171: mov qword ptr [rip + 0x934238], rdx ; 0x100cb63b0
0x100382178: lea rdx, [rip + 0x934231] ; 0x100cb63b0
0x10038217f: mov qword ptr [rip + 0x93423a], rcx ; 0x100cb63c0
0x100382186: mov qword ptr [rip + 0x93423f], 0x550 ; 0x100cb63d0
0x100382191: mov rcx, qword ptr [rip + 0x884db0] ; 0x100c06f48 -> 0x10037d130 __Z17GetMetaTypeByTypeIP11NetFlagBarnERK8MetaTypev
0x100382198: mov qword ptr [rip + 0x934239], rcx ; 0x100cb63d8
0x10038219f: mov qword ptr [rip + 0x93423a], rax ; 0x100cb63e0
0x1003821a6: mov qword ptr [rip + 0x934237], 0xffffffffffffffff ; 0x100cb63e8
0x1003821b1: mov qword ptr [rip + 0x934238], rbx ; 0x100cb63f0
0x1003821b8: mov qword ptr [rip + 0x934235], 0 ; 0x100cb63f8
0x1003821c3: vmovdqa xmmword ptr [rip + 0x1c78225], xmm1 ; 0x101ffa3f0
0x1003821cb: lea rcx, [rip + 0x1c7821e] ; 0x101ffa3f0
0x1003821d2: mov qword ptr [rip + 0x1c78223], 0 ; 0x101ffa400
0x1003821dd: mov qword ptr [rip + 0x9341d4], rcx ; 0x100cb63b8
0x1003821e4: lea rcx, [rip + 0x8013bf] ; 0x100b835aa dazzleTouchBarn
0x1003821eb: mov qword ptr [rip + 0x93420e], rcx ; 0x100cb6400
0x1003821f2: lea rcx, [rip + 0x934207] ; 0x100cb6400
0x1003821f9: mov qword ptr [rip + 0x934210], rdx ; 0x100cb6410
0x100382200: mov qword ptr [rip + 0x934215], 0x360 ; 0x100cb6420
0x10038220b: mov rdx, qword ptr [rip + 0x884eee] ; 0x100c07100 -> 0x10037d140 __Z17GetMetaTypeByTypeIP15DazzleTouchBarnERK8MetaTypev
0x100382212: mov qword ptr [rip + 0x93420f], rdx ; 0x100cb6428
0x100382219: mov qword ptr [rip + 0x934210], rax ; 0x100cb6430
0x100382220: mov qword ptr [rip + 0x93420d], 0xffffffffffffffff ; 0x100cb6438
0x10038222b: mov qword ptr [rip + 0x93420e], rbx ; 0x100cb6440
0x100382232: mov qword ptr [rip + 0x93420b], 0 ; 0x100cb6448
0x10038223d: vmovdqa xmmword ptr [rip + 0x1c781cb], xmm1 ; 0x101ffa410
0x100382245: lea rdx, [rip + 0x1c781c4] ; 0x101ffa410
0x10038224c: mov qword ptr [rip + 0x1c781c9], 0 ; 0x101ffa420
0x100382257: mov qword ptr [rip + 0x9341aa], rdx ; 0x100cb6408
0x10038225e: lea rdx, [rip + 0x801355] ; 0x100b835ba pickUpAbleBarn
0x100382265: mov qword ptr [rip + 0x9341e4], rdx ; 0x100cb6450
0x10038226c: lea rdx, [rip + 0x9341dd] ; 0x100cb6450
0x100382273: mov qword ptr [rip + 0x9341e6], rcx ; 0x100cb6460
0x10038227a: mov qword ptr [rip + 0x9341eb], 0x468 ; 0x100cb6470
0x100382285: mov rcx, qword ptr [rip + 0x884e2c] ; 0x100c070b8 -> 0x10037d150 __Z17GetMetaTypeByTypeIP14PickUpAbleBarnERK8MetaTypev
0x10038228c: mov qword ptr [rip + 0x9341e5], rcx ; 0x100cb6478
0x100382293: mov qword ptr [rip + 0x9341e6], rax ; 0x100cb6480
0x10038229a: mov qword ptr [rip + 0x9341e3], 0xffffffffffffffff ; 0x100cb6488
0x1003822a5: mov qword ptr [rip + 0x9341e4], rbx ; 0x100cb6490
0x1003822ac: mov qword ptr [rip + 0x9341e1], 0 ; 0x100cb6498
0x1003822b7: vmovdqa xmmword ptr [rip + 0x1c78171], xmm1 ; 0x101ffa430
0x1003822bf: lea rcx, [rip + 0x1c7816a] ; 0x101ffa430
0x1003822c6: mov qword ptr [rip + 0x1c7816f], 0 ; 0x101ffa440
0x1003822d1: mov qword ptr [rip + 0x934180], rcx ; 0x100cb6458
0x1003822d8: lea rcx, [rip + 0x8012ea] ; 0x100b835c9 friendBarn
0x1003822df: mov qword ptr [rip + 0x9341ba], rcx ; 0x100cb64a0
0x1003822e6: lea rcx, [rip + 0x9341b3] ; 0x100cb64a0
0x1003822ed: mov qword ptr [rip + 0x9341bc], rdx ; 0x100cb64b0
0x1003822f4: mov qword ptr [rip + 0x9341c1], 0x560 ; 0x100cb64c0
0x1003822ff: mov rdx, qword ptr [rip + 0x884b62] ; 0x100c06e68 -> 0x10037d160 __Z17GetMetaTypeByTypeIP10FriendBarnERK8MetaTypev
0x100382306: mov qword ptr [rip + 0x9341bb], rdx ; 0x100cb64c8
0x10038230d: mov qword ptr [rip + 0x9341bc], rax ; 0x100cb64d0
0x100382314: mov qword ptr [rip + 0x9341b9], 0xffffffffffffffff ; 0x100cb64d8
0x10038231f: mov qword ptr [rip + 0x9341ba], rbx ; 0x100cb64e0
0x100382326: mov qword ptr [rip + 0x9341b7], 0 ; 0x100cb64e8
0x100382331: vmovdqa xmmword ptr [rip + 0x1c78117], xmm1 ; 0x101ffa450
0x100382339: lea rdx, [rip + 0x1c78110] ; 0x101ffa450
0x100382340: mov qword ptr [rip + 0x1c78115], 0 ; 0x101ffa460
0x10038234b: mov qword ptr [rip + 0x934156], rdx ; 0x100cb64a8
0x100382352: lea rdx, [rip + 0x80127b] ; 0x100b835d4 affinityBarn
0x100382359: mov qword ptr [rip + 0x934190], rdx ; 0x100cb64f0
0x100382360: lea rdx, [rip + 0x934189] ; 0x100cb64f0
0x100382367: mov qword ptr [rip + 0x934192], rcx ; 0x100cb6500
0x10038236e: mov qword ptr [rip + 0x934197], 0x568 ; 0x100cb6510
0x100382379: mov rcx, qword ptr [rip + 0x884bf0] ; 0x100c06f70 -> 0x10037d170 __Z17GetMetaTypeByTypeIP12AffinityBarnERK8MetaTypev
0x100382380: mov qword ptr [rip + 0x934191], rcx ; 0x100cb6518
0x100382387: mov qword ptr [rip + 0x934192], rax ; 0x100cb6520
0x10038238e: mov qword ptr [rip + 0x93418f], 0xffffffffffffffff ; 0x100cb6528
0x100382399: mov qword ptr [rip + 0x934190], rbx ; 0x100cb6530
0x1003823a0: mov qword ptr [rip + 0x93418d], 0 ; 0x100cb6538
0x1003823ab: vmovdqa xmmword ptr [rip + 0x1c780bd], xmm1 ; 0x101ffa470
0x1003823b3: lea rcx, [rip + 0x1c780b6] ; 0x101ffa470
0x1003823ba: mov qword ptr [rip + 0x1c780bb], 0 ; 0x101ffa480
0x1003823c5: mov qword ptr [rip + 0x93412c], rcx ; 0x100cb64f8
0x1003823cc: lea rcx, [rip + 0x80120e] ; 0x100b835e1 playerBeaconBarn
0x1003823d3: mov qword ptr [rip + 0x934166], rcx ; 0x100cb6540
0x1003823da: lea rcx, [rip + 0x93415f] ; 0x100cb6540
0x1003823e1: mov qword ptr [rip + 0x934168], rdx ; 0x100cb6550
0x1003823e8: mov qword ptr [rip + 0x93416d], 0x570 ; 0x100cb6560
0x1003823f3: mov rdx, qword ptr [rip + 0x884da6] ; 0x100c071a0 -> 0x10037d180 __Z17GetMetaTypeByTypeIP16PlayerBeaconBarnERK8MetaTypev
0x1003823fa: mov qword ptr [rip + 0x934167], rdx ; 0x100cb6568
0x100382401: mov qword ptr [rip + 0x934168], rax ; 0x100cb6570
0x100382408: mov qword ptr [rip + 0x934165], 0xffffffffffffffff ; 0x100cb6578
0x100382413: mov qword ptr [rip + 0x934166], rbx ; 0x100cb6580
0x10038241a: mov qword ptr [rip + 0x934163], 0 ; 0x100cb6588
0x100382425: vmovdqa xmmword ptr [rip + 0x1c78063], xmm1 ; 0x101ffa490
0x10038242d: lea rdx, [rip + 0x1c7805c] ; 0x101ffa490
0x100382434: mov qword ptr [rip + 0x1c78061], 0 ; 0x101ffa4a0
0x10038243f: mov qword ptr [rip + 0x934102], rdx ; 0x100cb6548
0x100382446: lea rdx, [rip + 0x8011a5] ; 0x100b835f2 geoNoteBarn
0x10038244d: mov qword ptr [rip + 0x93413c], rdx ; 0x100cb6590
0x100382454: lea rdx, [rip + 0x934135] ; 0x100cb6590
0x10038245b: mov qword ptr [rip + 0x93413e], rcx ; 0x100cb65a0
0x100382462: mov qword ptr [rip + 0x934143], 0x578 ; 0x100cb65b0
0x10038246d: mov rcx, qword ptr [rip + 0x884ac4] ; 0x100c06f38 -> 0x10037d190 __Z17GetMetaTypeByTypeIP11GeoNoteBarnERK8MetaTypev
0x100382474: mov qword ptr [rip + 0x93413d], rcx ; 0x100cb65b8
0x10038247b: mov qword ptr [rip + 0x93413e], rax ; 0x100cb65c0
0x100382482: mov qword ptr [rip + 0x93413b], 0xffffffffffffffff ; 0x100cb65c8
0x10038248d: mov qword ptr [rip + 0x93413c], rbx ; 0x100cb65d0
0x100382494: mov qword ptr [rip + 0x934139], 0 ; 0x100cb65d8
0x10038249f: vmovdqa xmmword ptr [rip + 0x1c78009], xmm1 ; 0x101ffa4b0
0x1003824a7: lea rcx, [rip + 0x1c78002] ; 0x101ffa4b0
0x1003824ae: mov qword ptr [rip + 0x1c78007], 0 ; 0x101ffa4c0
0x1003824b9: mov qword ptr [rip + 0x9340d8], rcx ; 0x100cb6598
0x1003824c0: lea rcx, [rip + 0x801137] ; 0x100b835fe levelStateBarn
0x1003824c7: mov qword ptr [rip + 0x934112], rcx ; 0x100cb65e0
0x1003824ce: lea rcx, [rip + 0x93410b] ; 0x100cb65e0
0x1003824d5: mov qword ptr [rip + 0x934114], rdx ; 0x100cb65f0
0x1003824dc: mov qword ptr [rip + 0x934119], 0x5d0 ; 0x100cb6600
0x1003824e7: mov rdx, qword ptr [rip + 0x884baa] ; 0x100c07098 -> 0x10037d1a0 __Z17GetMetaTypeByTypeIP14LevelStateBarnERK8MetaTypev
0x1003824ee: mov qword ptr [rip + 0x934113], rdx ; 0x100cb6608
0x1003824f5: mov qword ptr [rip + 0x934114], rax ; 0x100cb6610
0x1003824fc: mov qword ptr [rip + 0x934111], 0xffffffffffffffff ; 0x100cb6618
0x100382507: mov qword ptr [rip + 0x934112], rbx ; 0x100cb6620
0x10038250e: mov qword ptr [rip + 0x93410f], 0 ; 0x100cb6628
0x100382519: vmovdqa xmmword ptr [rip + 0x1c77faf], xmm1 ; 0x101ffa4d0
0x100382521: lea rdx, [rip + 0x1c77fa8] ; 0x101ffa4d0
0x100382528: mov qword ptr [rip + 0x1c77fad], 0 ; 0x101ffa4e0
0x100382533: mov qword ptr [rip + 0x9340ae], rdx ; 0x100cb65e8
0x10038253a: lea rdx, [rip + 0x8010cc] ; 0x100b8360d ancestorRaceBarn
0x100382541: mov qword ptr [rip + 0x9340e8], rdx ; 0x100cb6630
0x100382548: lea rdx, [rip + 0x9340e1] ; 0x100cb6630
0x10038254f: mov qword ptr [rip + 0x9340ea], rcx ; 0x100cb6640
0x100382556: mov qword ptr [rip + 0x9340ef], 0x598 ; 0x100cb6650
0x100382561: mov rcx, qword ptr [rip + 0x884bf8] ; 0x100c07160 -> 0x10037d1b0 __Z17GetMetaTypeByTypeIP16AncestorRaceBarnERK8MetaTypev
0x100382568: mov qword ptr [rip + 0x9340e9], rcx ; 0x100cb6658
0x10038256f: mov qword ptr [rip + 0x9340ea], rax ; 0x100cb6660
0x100382576: mov qword ptr [rip + 0x9340e7], 0xffffffffffffffff ; 0x100cb6668
0x100382581: mov qword ptr [rip + 0x9340e8], rbx ; 0x100cb6670
0x100382588: mov qword ptr [rip + 0x9340e5], 0 ; 0x100cb6678
0x100382593: vmovdqa xmmword ptr [rip + 0x1c77f55], xmm1 ; 0x101ffa4f0
0x10038259b: lea rcx, [rip + 0x1c77f4e] ; 0x101ffa4f0
0x1003825a2: mov qword ptr [rip + 0x1c77f53], 0 ; 0x101ffa500
0x1003825ad: mov qword ptr [rip + 0x934084], rcx ; 0x100cb6638
0x1003825b4: lea rcx, [rip + 0x801063] ; 0x100b8361e notifier
0x1003825bb: mov qword ptr [rip + 0x9340be], rcx ; 0x100cb6680
0x1003825c2: lea rcx, [rip + 0x9340b7] ; 0x100cb6680
0x1003825c9: mov qword ptr [rip + 0x9340c0], rdx ; 0x100cb6690
0x1003825d0: mov qword ptr [rip + 0x9340c5], 0x5d8 ; 0x100cb66a0
0x1003825db: mov rdx, qword ptr [rip + 0x884de6] ; 0x100c073c8 -> 0x10037d1c0 __Z17GetMetaTypeByTypeIP8NotifierERK8MetaTypev
0x1003825e2: mov qword ptr [rip + 0x9340bf], rdx ; 0x100cb66a8
0x1003825e9: mov qword ptr [rip + 0x9340c0], rax ; 0x100cb66b0
0x1003825f0: mov qword ptr [rip + 0x9340bd], 0xffffffffffffffff ; 0x100cb66b8
0x1003825fb: mov qword ptr [rip + 0x9340be], rbx ; 0x100cb66c0
0x100382602: mov qword ptr [rip + 0x9340bb], 0 ; 0x100cb66c8
0x10038260d: vmovdqa xmmword ptr [rip + 0x1c77efb], xmm1 ; 0x101ffa510
0x100382615: lea rdx, [rip + 0x1c77ef4] ; 0x101ffa510
0x10038261c: mov qword ptr [rip + 0x1c77ef9], 0 ; 0x101ffa520
0x100382627: mov qword ptr [rip + 0x93405a], rdx ; 0x100cb6688
0x10038262e: lea rdx, [rip + 0x800ff2] ; 0x100b83627 debugLines
0x100382635: mov qword ptr [rip + 0x934094], rdx ; 0x100cb66d0
0x10038263c: lea rdx, [rip + 0x93408d] ; 0x100cb66d0
0x100382643: mov qword ptr [rip + 0x934096], rcx ; 0x100cb66e0
0x10038264a: mov qword ptr [rip + 0x93409b], 0x4d8 ; 0x100cb66f0
0x100382655: mov rcx, qword ptr [rip + 0x8847dc] ; 0x100c06e38 -> 0x10037d1d0 __Z17GetMetaTypeByTypeIP10DebugLinesERK8MetaTypev
0x10038265c: mov qword ptr [rip + 0x934095], rcx ; 0x100cb66f8
0x100382663: mov qword ptr [rip + 0x934096], rax ; 0x100cb6700
0x10038266a: mov qword ptr [rip + 0x934093], 0xffffffffffffffff ; 0x100cb6708
0x100382675: mov qword ptr [rip + 0x934094], rbx ; 0x100cb6710
0x10038267c: mov qword ptr [rip + 0x934091], 0 ; 0x100cb6718
0x100382687: vmovdqa xmmword ptr [rip + 0x1c77ea1], xmm1 ; 0x101ffa530
0x10038268f: lea rcx, [rip + 0x1c77e9a] ; 0x101ffa530
0x100382696: mov qword ptr [rip + 0x1c77e9f], 0 ; 0x101ffa540
0x1003826a1: mov qword ptr [rip + 0x934030], rcx ; 0x100cb66d8
0x1003826a8: lea rcx, [rip + 0x800f83] ; 0x100b83632 netProfiler
0x1003826af: mov qword ptr [rip + 0x93406a], rcx ; 0x100cb6720
0x1003826b6: lea rcx, [rip + 0x934063] ; 0x100cb6720
0x1003826bd: mov qword ptr [rip + 0x93406c], rdx ; 0x100cb6730
0x1003826c4: mov qword ptr [rip + 0x934071], 0x1a0 ; 0x100cb6740
0x1003826cf: mov rdx, qword ptr [rip + 0x88487a] ; 0x100c06f50 -> 0x10037d1e0 __Z17GetMetaTypeByTypeIP11NetProfilerERK8MetaTypev
0x1003826d6: mov qword ptr [rip + 0x93406b], rdx ; 0x100cb6748
0x1003826dd: mov qword ptr [rip + 0x93406c], rax ; 0x100cb6750
0x1003826e4: mov qword ptr [rip + 0x934069], 0xffffffffffffffff ; 0x100cb6758
0x1003826ef: mov qword ptr [rip + 0x93406a], rbx ; 0x100cb6760
0x1003826f6: mov qword ptr [rip + 0x934067], 0 ; 0x100cb6768
0x100382701: vmovdqa xmmword ptr [rip + 0x1c77e47], xmm1 ; 0x101ffa550
0x100382709: lea rdx, [rip + 0x1c77e40] ; 0x101ffa550
0x100382710: mov qword ptr [rip + 0x1c77e45], 0 ; 0x101ffa560
0x10038271b: mov qword ptr [rip + 0x934006], rdx ; 0x100cb6728
0x100382722: lea rdx, [rip + 0x800f15] ; 0x100b8363e netProfileHud
0x100382729: mov qword ptr [rip + 0x934040], rdx ; 0x100cb6770
0x100382730: lea rdx, [rip + 0x934039] ; 0x100cb6770
0x100382737: mov qword ptr [rip + 0x934042], rcx ; 0x100cb6780
0x10038273e: mov qword ptr [rip + 0x934047], 0x1a8 ; 0x100cb6790
0x100382749: mov rcx, qword ptr [rip + 0x8848e8] ; 0x100c07038 -> 0x10037d1f0 __Z17GetMetaTypeByTypeIP13NetProfileHudERK8MetaTypev
0x100382750: mov qword ptr [rip + 0x934041], rcx ; 0x100cb6798
0x100382757: mov qword ptr [rip + 0x934042], rax ; 0x100cb67a0
0x10038275e: mov qword ptr [rip + 0x93403f], 0xffffffffffffffff ; 0x100cb67a8
0x100382769: mov qword ptr [rip + 0x934040], rbx ; 0x100cb67b0
0x100382770: mov qword ptr [rip + 0x93403d], 0 ; 0x100cb67b8
0x10038277b: vmovdqa xmmword ptr [rip + 0x1c77ded], xmm1 ; 0x101ffa570
0x100382783: lea rcx, [rip + 0x1c77de6] ; 0x101ffa570
0x10038278a: mov qword ptr [rip + 0x1c77deb], 0 ; 0x101ffa580
0x100382795: mov qword ptr [rip + 0x933fdc], rcx ; 0x100cb6778
0x10038279c: lea rcx, [rip + 0x800ea9] ; 0x100b8364c debugModule
0x1003827a3: mov qword ptr [rip + 0x934016], rcx ; 0x100cb67c0
0x1003827aa: lea rcx, [rip + 0x93400f] ; 0x100cb67c0
0x1003827b1: mov qword ptr [rip + 0x934018], rdx ; 0x100cb67d0
0x1003827b8: mov qword ptr [rip + 0x93401d], 0x5e0 ; 0x100cb67e0
0x1003827c3: mov rdx, qword ptr [rip + 0x88474e] ; 0x100c06f18 -> 0x10037d200 __Z17GetMetaTypeByTypeIP11DebugModuleERK8MetaTypev
0x1003827ca: mov qword ptr [rip + 0x934017], rdx ; 0x100cb67e8
0x1003827d1: mov qword ptr [rip + 0x934018], rax ; 0x100cb67f0
0x1003827d8: mov qword ptr [rip + 0x934015], 0xffffffffffffffff ; 0x100cb67f8
0x1003827e3: mov qword ptr [rip + 0x934016], rbx ; 0x100cb6800
0x1003827ea: mov qword ptr [rip + 0x934013], 0 ; 0x100cb6808
0x1003827f5: vmovdqa xmmword ptr [rip + 0x1c77d93], xmm1 ; 0x101ffa590
0x1003827fd: lea rdx, [rip + 0x1c77d8c] ; 0x101ffa590
0x100382804: mov qword ptr [rip + 0x1c77d91], 0 ; 0x101ffa5a0
0x10038280f: mov qword ptr [rip + 0x933fb2], rdx ; 0x100cb67c8
0x100382816: lea rdx, [rip + 0x800e3b] ; 0x100b83658 npcBarn
0x10038281d: mov qword ptr [rip + 0x933fec], rdx ; 0x100cb6810
0x100382824: lea rdx, [rip + 0x933fe5] ; 0x100cb6810
0x10038282b: mov qword ptr [rip + 0x933fee], rcx ; 0x100cb6820
0x100382832: mov qword ptr [rip + 0x933ff3], 0x290 ; 0x100cb6830
0x10038283d: mov rcx, qword ptr [rip + 0x884b24] ; 0x100c07368 -> 0x10037d210 __Z17GetMetaTypeByTypeIP7NpcBarnERK8MetaTypev
0x100382844: mov qword ptr [rip + 0x933fed], rcx ; 0x100cb6838
0x10038284b: mov qword ptr [rip + 0x933fee], rax ; 0x100cb6840
0x100382852: mov qword ptr [rip + 0x933feb], 0xffffffffffffffff ; 0x100cb6848
0x10038285d: mov qword ptr [rip + 0x933fec], rbx ; 0x100cb6850
0x100382864: mov qword ptr [rip + 0x933fe9], 0 ; 0x100cb6858
0x10038286f: vmovdqa xmmword ptr [rip + 0x1c77d39], xmm1 ; 0x101ffa5b0
0x100382877: lea rcx, [rip + 0x1c77d32] ; 0x101ffa5b0
0x10038287e: mov qword ptr [rip + 0x1c77d37], 0 ; 0x101ffa5c0
0x100382889: mov qword ptr [rip + 0x933f88], rcx ; 0x100cb6818
0x100382890: lea rcx, [rip + 0x800dc9] ; 0x100b83660 buddyBarn
0x100382897: mov qword ptr [rip + 0x933fc2], rcx ; 0x100cb6860
0x10038289e: lea rcx, [rip + 0x933fbb] ; 0x100cb6860
0x1003828a5: mov qword ptr [rip + 0x933fc4], rdx ; 0x100cb6870
0x1003828ac: mov qword ptr [rip + 0x933fc9], 0x388 ; 0x100cb6880
0x1003828b7: mov rdx, qword ptr [rip + 0x884b92] ; 0x100c07450 -> 0x10037d220 __Z17GetMetaTypeByTypeIP9BuddyBarnERK8MetaTypev
0x1003828be: mov qword ptr [rip + 0x933fc3], rdx ; 0x100cb6888
0x1003828c5: mov qword ptr [rip + 0x933fc4], rax ; 0x100cb6890
0x1003828cc: mov qword ptr [rip + 0x933fc1], 0xffffffffffffffff ; 0x100cb6898
0x1003828d7: mov qword ptr [rip + 0x933fc2], rbx ; 0x100cb68a0
0x1003828de: mov qword ptr [rip + 0x933fbf], 0 ; 0x100cb68a8
0x1003828e9: vmovdqa xmmword ptr [rip + 0x1c77cdf], xmm1 ; 0x101ffa5d0
0x1003828f1: lea rdx, [rip + 0x1c77cd8] ; 0x101ffa5d0
0x1003828f8: mov qword ptr [rip + 0x1c77cdd], 0 ; 0x101ffa5e0
0x100382903: mov qword ptr [rip + 0x933f5e], rdx ; 0x100cb6868
0x10038290a: lea rdx, [rip + 0x800d59] ; 0x100b8366a world
0x100382911: mov qword ptr [rip + 0x933f98], rdx ; 0x100cb68b0
0x100382918: lea rdx, [rip + 0x933f91] ; 0x100cb68b0
0x10038291f: mov qword ptr [rip + 0x933f9a], rcx ; 0x100cb68c0
0x100382926: mov qword ptr [rip + 0x933f9f], 0x310 ; 0x100cb68d0
0x100382931: mov rcx, qword ptr [rip + 0x8849c8] ; 0x100c07300 -> 0x10037d230 __Z17GetMetaTypeByTypeIP5WorldERK8MetaTypev
0x100382938: mov qword ptr [rip + 0x933f99], rcx ; 0x100cb68d8
0x10038293f: mov qword ptr [rip + 0x933f9a], rax ; 0x100cb68e0
0x100382946: mov qword ptr [rip + 0x933f97], 0xffffffffffffffff ; 0x100cb68e8
0x100382951: mov qword ptr [rip + 0x933f98], rbx ; 0x100cb68f0
0x100382958: mov qword ptr [rip + 0x933f95], 0 ; 0x100cb68f8
0x100382963: vmovdqa xmmword ptr [rip + 0x1c77c85], xmm1 ; 0x101ffa5f0
0x10038296b: lea rcx, [rip + 0x1c77c7e] ; 0x101ffa5f0
0x100382972: mov qword ptr [rip + 0x1c77c83], 0 ; 0x101ffa600
0x10038297d: mov qword ptr [rip + 0x933f34], rcx ; 0x100cb68b8
0x100382984: lea rcx, [rip + 0x800ce5] ; 0x100b83670 walkNodeBarn
0x10038298b: mov qword ptr [rip + 0x933f6e], rcx ; 0x100cb6900
0x100382992: lea rcx, [rip + 0x933f67] ; 0x100cb6900
0x100382999: mov qword ptr [rip + 0x933f70], rdx ; 0x100cb6910
0x1003829a0: mov qword ptr [rip + 0x933f75], 0x540 ; 0x100cb6920
0x1003829ab: mov rdx, qword ptr [rip + 0x884626] ; 0x100c06fd8 -> 0x10037d240 __Z17GetMetaTypeByTypeIP12WalkNodeBarnERK8MetaTypev
0x1003829b2: mov qword ptr [rip + 0x933f6f], rdx ; 0x100cb6928
0x1003829b9: mov qword ptr [rip + 0x933f70], rax ; 0x100cb6930
0x1003829c0: mov qword ptr [rip + 0x933f6d], 0xffffffffffffffff ; 0x100cb6938
0x1003829cb: mov qword ptr [rip + 0x933f6e], rbx ; 0x100cb6940
0x1003829d2: mov qword ptr [rip + 0x933f6b], 0 ; 0x100cb6948
0x1003829dd: vmovdqa xmmword ptr [rip + 0x1c77c2b], xmm1 ; 0x101ffa610
0x1003829e5: lea rdx, [rip + 0x1c77c24] ; 0x101ffa610
0x1003829ec: mov qword ptr [rip + 0x1c77c29], 0 ; 0x101ffa620
0x1003829f7: mov qword ptr [rip + 0x933f0a], rdx ; 0x100cb6908
0x1003829fe: lea rdx, [rip + 0x800c78] ; 0x100b8367d bondBarn
0x100382a05: mov qword ptr [rip + 0x933f44], rdx ; 0x100cb6950
0x100382a0c: lea rdx, [rip + 0x933f3d] ; 0x100cb6950
0x100382a13: mov qword ptr [rip + 0x933f46], rcx ; 0x100cb6960
0x100382a1a: mov qword ptr [rip + 0x933f4b], 0x2d8 ; 0x100cb6970
0x100382a25: mov rcx, qword ptr [rip + 0x88495c] ; 0x100c07388 -> 0x10037d250 __Z17GetMetaTypeByTypeIP8BondBarnERK8MetaTypev
0x100382a2c: mov qword ptr [rip + 0x933f45], rcx ; 0x100cb6978
0x100382a33: mov qword ptr [rip + 0x933f46], rax ; 0x100cb6980
0x100382a3a: mov qword ptr [rip + 0x933f43], 0xffffffffffffffff ; 0x100cb6988
0x100382a45: mov qword ptr [rip + 0x933f44], rbx ; 0x100cb6990
0x100382a4c: mov qword ptr [rip + 0x933f41], 0 ; 0x100cb6998
0x100382a57: vmovdqa xmmword ptr [rip + 0x1c77bd1], xmm1 ; 0x101ffa630
0x100382a5f: lea rcx, [rip + 0x1c77bca] ; 0x101ffa630
0x100382a66: mov qword ptr [rip + 0x1c77bcf], 0 ; 0x101ffa640
0x100382a71: mov qword ptr [rip + 0x933ee0], rcx ; 0x100cb6958
0x100382a78: lea rcx, [rip + 0x800c07] ; 0x100b83686 transporterBarn
0x100382a7f: mov qword ptr [rip + 0x933f1a], rcx ; 0x100cb69a0
0x100382a86: lea rcx, [rip + 0x933f13] ; 0x100cb69a0
0x100382a8d: mov qword ptr [rip + 0x933f1c], rdx ; 0x100cb69b0
0x100382a94: mov qword ptr [rip + 0x933f21], 0x3f8 ; 0x100cb69c0
0x100382a9f: mov rdx, qword ptr [rip + 0x8846aa] ; 0x100c07150 -> 0x10037d260 __Z17GetMetaTypeByTypeIP15TransporterBarnERK8MetaTypev
0x100382aa6: mov qword ptr [rip + 0x933f1b], rdx ; 0x100cb69c8
0x100382aad: mov qword ptr [rip + 0x933f1c], rax ; 0x100cb69d0
0x100382ab4: mov qword ptr [rip + 0x933f19], 0xffffffffffffffff ; 0x100cb69d8
0x100382abf: mov qword ptr [rip + 0x933f1a], rbx ; 0x100cb69e0
0x100382ac6: mov qword ptr [rip + 0x933f17], 0 ; 0x100cb69e8
0x100382ad1: vmovdqa xmmword ptr [rip + 0x1c77b77], xmm1 ; 0x101ffa650
0x100382ad9: lea rdx, [rip + 0x1c77b70] ; 0x101ffa650
0x100382ae0: mov qword ptr [rip + 0x1c77b75], 0 ; 0x101ffa660
0x100382aeb: mov qword ptr [rip + 0x933eb6], rdx ; 0x100cb69a8
0x100382af2: lea rdx, [rip + 0x800b9d] ; 0x100b83696 waypointBarn
0x100382af9: mov qword ptr [rip + 0x933ef0], rdx ; 0x100cb69f0
0x100382b00: lea rdx, [rip + 0x933ee9] ; 0x100cb69f0
0x100382b07: mov qword ptr [rip + 0x933ef2], rcx ; 0x100cb6a00
0x100382b0e: mov qword ptr [rip + 0x933ef7], 0x308 ; 0x100cb6a10
0x100382b19: mov rcx, qword ptr [rip + 0x8844c0] ; 0x100c06fe0 -> 0x10037d270 __Z17GetMetaTypeByTypeIP12WaypointBarnERK8MetaTypev
0x100382b20: mov qword ptr [rip + 0x933ef1], rcx ; 0x100cb6a18
0x100382b27: mov qword ptr [rip + 0x933ef2], rax ; 0x100cb6a20
0x100382b2e: mov qword ptr [rip + 0x933eef], 0xffffffffffffffff ; 0x100cb6a28
0x100382b39: mov qword ptr [rip + 0x933ef0], rbx ; 0x100cb6a30
0x100382b40: mov qword ptr [rip + 0x933eed], 0 ; 0x100cb6a38
0x100382b4b: vmovdqa xmmword ptr [rip + 0x1c77b1d], xmm1 ; 0x101ffa670
0x100382b53: lea rcx, [rip + 0x1c77b16] ; 0x101ffa670
0x100382b5a: mov qword ptr [rip + 0x1c77b1b], 0 ; 0x101ffa680
0x100382b65: mov qword ptr [rip + 0x933e8c], rcx ; 0x100cb69f8
0x100382b6c: lea rcx, [rip + 0x800b30] ; 0x100b836a3 whaleFairyBarn
0x100382b73: mov qword ptr [rip + 0x933ec6], rcx ; 0x100cb6a40
0x100382b7a: lea rcx, [rip + 0x933ebf] ; 0x100cb6a40
0x100382b81: mov qword ptr [rip + 0x933ec8], rdx ; 0x100cb6a50
0x100382b88: mov qword ptr [rip + 0x933ecd], 0x390 ; 0x100cb6a60
0x100382b93: mov rdx, qword ptr [rip + 0x884546] ; 0x100c070e0 -> 0x10037d280 __Z17GetMetaTypeByTypeIP14WhaleFairyBarnERK8MetaTypev
0x100382b9a: mov qword ptr [rip + 0x933ec7], rdx ; 0x100cb6a68
0x100382ba1: mov qword ptr [rip + 0x933ec8], rax ; 0x100cb6a70
0x100382ba8: mov qword ptr [rip + 0x933ec5], 0xffffffffffffffff ; 0x100cb6a78
0x100382bb3: mov qword ptr [rip + 0x933ec6], rbx ; 0x100cb6a80
0x100382bba: mov qword ptr [rip + 0x933ec3], 0 ; 0x100cb6a88
0x100382bc5: vmovdqa xmmword ptr [rip + 0x1c77ac3], xmm1 ; 0x101ffa690
0x100382bcd: lea rdx, [rip + 0x1c77abc] ; 0x101ffa690
0x100382bd4: mov qword ptr [rip + 0x1c77ac1], 0 ; 0x101ffa6a0
0x100382bdf: mov qword ptr [rip + 0x933e62], rdx ; 0x100cb6a48
0x100382be6: lea rdx, [rip + 0x800ac5] ; 0x100b836b2 chestBarn
0x100382bed: mov qword ptr [rip + 0x933e9c], rdx ; 0x100cb6a90
0x100382bf4: lea rdx, [rip + 0x933e95] ; 0x100cb6a90
0x100382bfb: mov qword ptr [rip + 0x933e9e], rcx ; 0x100cb6aa0
0x100382c02: mov qword ptr [rip + 0x933ea3], 0x410 ; 0x100cb6ab0
0x100382c0d: mov rcx, qword ptr [rip + 0x884844] ; 0x100c07458 -> 0x10037d290 __Z17GetMetaTypeByTypeIP9ChestBarnERK8MetaTypev
0x100382c14: mov qword ptr [rip + 0x933e9d], rcx ; 0x100cb6ab8
0x100382c1b: mov qword ptr [rip + 0x933e9e], rax ; 0x100cb6ac0
0x100382c22: mov qword ptr [rip + 0x933e9b], 0xffffffffffffffff ; 0x100cb6ac8
0x100382c2d: mov qword ptr [rip + 0x933e9c], rbx ; 0x100cb6ad0
0x100382c34: mov qword ptr [rip + 0x933e99], 0 ; 0x100cb6ad8
0x100382c3f: vmovdqa xmmword ptr [rip + 0x1c77a69], xmm1 ; 0x101ffa6b0
0x100382c47: lea rcx, [rip + 0x1c77a62] ; 0x101ffa6b0
0x100382c4e: mov qword ptr [rip + 0x1c77a67], 0 ; 0x101ffa6c0
0x100382c59: mov qword ptr [rip + 0x933e38], rcx ; 0x100cb6a98
0x100382c60: lea rcx, [rip + 0x800a55] ; 0x100b836bc dimpleBarn
0x100382c67: mov qword ptr [rip + 0x933e72], rcx ; 0x100cb6ae0
0x100382c6e: lea rcx, [rip + 0x933e6b] ; 0x100cb6ae0
0x100382c75: mov qword ptr [rip + 0x933e74], rdx ; 0x100cb6af0
0x100382c7c: mov qword ptr [rip + 0x933e79], 0x4f0 ; 0x100cb6b00
0x100382c87: mov rdx, qword ptr [rip + 0x8841ca] ; 0x100c06e58 -> 0x10037d2a0 __Z17GetMetaTypeByTypeIP10DimpleBarnERK8MetaTypev
0x100382c8e: mov qword ptr [rip + 0x933e73], rdx ; 0x100cb6b08
0x100382c95: mov qword ptr [rip + 0x933e74], rax ; 0x100cb6b10
0x100382c9c: mov qword ptr [rip + 0x933e71], 0xffffffffffffffff ; 0x100cb6b18
0x100382ca7: mov qword ptr [rip + 0x933e72], rbx ; 0x100cb6b20
0x100382cae: mov qword ptr [rip + 0x933e6f], 0 ; 0x100cb6b28
0x100382cb9: vmovdqa xmmword ptr [rip + 0x1c77a0f], xmm1 ; 0x101ffa6d0
0x100382cc1: lea rdx, [rip + 0x1c77a08] ; 0x101ffa6d0
0x100382cc8: mov qword ptr [rip + 0x1c77a0d], 0 ; 0x101ffa6e0
0x100382cd3: mov qword ptr [rip + 0x933e0e], rdx ; 0x100cb6ae8
0x100382cda: lea rdx, [rip + 0x8009e6] ; 0x100b836c7 tableBarn
0x100382ce1: mov qword ptr [rip + 0x933e48], rdx ; 0x100cb6b30
0x100382ce8: lea rdx, [rip + 0x933e41] ; 0x100cb6b30
0x100382cef: mov qword ptr [rip + 0x933e4a], rcx ; 0x100cb6b40
0x100382cf6: mov qword ptr [rip + 0x933e4f], 0x510 ; 0x100cb6b50
0x100382d01: mov rcx, qword ptr [rip + 0x8847f8] ; 0x100c07500 -> 0x10037d2b0 __Z17GetMetaTypeByTypeIP9TableBarnERK8MetaTypev
0x100382d08: mov qword ptr [rip + 0x933e49], rcx ; 0x100cb6b58
0x100382d0f: mov qword ptr [rip + 0x933e4a], rax ; 0x100cb6b60
0x100382d16: mov qword ptr [rip + 0x933e47], 0xffffffffffffffff ; 0x100cb6b68
0x100382d21: mov qword ptr [rip + 0x933e48], rbx ; 0x100cb6b70
0x100382d28: mov qword ptr [rip + 0x933e45], 0 ; 0x100cb6b78
0x100382d33: vmovdqa xmmword ptr [rip + 0x1c779b5], xmm1 ; 0x101ffa6f0
0x100382d3b: lea rcx, [rip + 0x1c779ae] ; 0x101ffa6f0
0x100382d42: mov qword ptr [rip + 0x1c779b3], 0 ; 0x101ffa700
0x100382d4d: mov qword ptr [rip + 0x933de4], rcx ; 0x100cb6b38
0x100382d54: lea rcx, [rip + 0x800976] ; 0x100b836d1 dazzleChamScrubBarn
0x100382d5b: mov qword ptr [rip + 0x933e1e], rcx ; 0x100cb6b80
0x100382d62: lea rcx, [rip + 0x933e17] ; 0x100cb6b80
0x100382d69: mov qword ptr [rip + 0x933e20], rdx ; 0x100cb6b90
0x100382d70: mov qword ptr [rip + 0x933e25], 0x218 ; 0x100cb6ba0
0x100382d7b: mov rdx, qword ptr [rip + 0x88449e] ; 0x100c07220 -> 0x10037d2c0 __Z17GetMetaTypeByTypeIP19DazzleChamScrubBarnERK8MetaTypev
0x100382d82: mov qword ptr [rip + 0x933e1f], rdx ; 0x100cb6ba8
0x100382d89: mov qword ptr [rip + 0x933e20], rax ; 0x100cb6bb0
0x100382d90: mov qword ptr [rip + 0x933e1d], 0xffffffffffffffff ; 0x100cb6bb8
0x100382d9b: mov qword ptr [rip + 0x933e1e], rbx ; 0x100cb6bc0
0x100382da2: mov qword ptr [rip + 0x933e1b], 0 ; 0x100cb6bc8
0x100382dad: vmovdqa xmmword ptr [rip + 0x1c7795b], xmm1 ; 0x101ffa710
0x100382db5: lea rdx, [rip + 0x1c77954] ; 0x101ffa710
0x100382dbc: mov qword ptr [rip + 0x1c77959], 0 ; 0x101ffa720
0x100382dc7: mov qword ptr [rip + 0x933dba], rdx ; 0x100cb6b88
0x100382dce: lea rdx, [rip + 0x800910] ; 0x100b836e5 replayBarn
0x100382dd5: mov qword ptr [rip + 0x933df4], rdx ; 0x100cb6bd0
0x100382ddc: lea rdx, [rip + 0x933ded] ; 0x100cb6bd0
0x100382de3: mov qword ptr [rip + 0x933df6], rcx ; 0x100cb6be0
0x100382dea: mov qword ptr [rip + 0x933dfb], 0x588 ; 0x100cb6bf0
0x100382df5: mov rcx, qword ptr [rip + 0x8840cc] ; 0x100c06ec8 -> 0x10037d2d0 __Z17GetMetaTypeByTypeIP10ReplayBarnERK8MetaTypev
0x100382dfc: mov qword ptr [rip + 0x933df5], rcx ; 0x100cb6bf8
0x100382e03: mov qword ptr [rip + 0x933df6], rax ; 0x100cb6c00
0x100382e0a: mov qword ptr [rip + 0x933df3], 0xffffffffffffffff ; 0x100cb6c08
0x100382e15: mov qword ptr [rip + 0x933df4], rbx ; 0x100cb6c10
0x100382e1c: mov qword ptr [rip + 0x933df1], 0 ; 0x100cb6c18
0x100382e27: vmovdqa xmmword ptr [rip + 0x1c77901], xmm1 ; 0x101ffa730
0x100382e2f: lea rcx, [rip + 0x1c778fa] ; 0x101ffa730
0x100382e36: mov qword ptr [rip + 0x1c778ff], 0 ; 0x101ffa740
0x100382e41: mov qword ptr [rip + 0x933d90], rcx ; 0x100cb6bd8
0x100382e48: lea rcx, [rip + 0x8008a1] ; 0x100b836f0 gameCaptureBarn
0x100382e4f: mov qword ptr [rip + 0x933dca], rcx ; 0x100cb6c20
0x100382e56: lea rcx, [rip + 0x933dc3] ; 0x100cb6c20
0x100382e5d: mov qword ptr [rip + 0x933dcc], rdx ; 0x100cb6c30
0x100382e64: mov qword ptr [rip + 0x933dd1], 0x580 ; 0x100cb6c40
0x100382e6f: mov rdx, qword ptr [rip + 0x884292] ; 0x100c07108 -> 0x10037d2e0 __Z17GetMetaTypeByTypeIP15GameCaptureBarnERK8MetaTypev
0x100382e76: mov qword ptr [rip + 0x933dcb], rdx ; 0x100cb6c48
0x100382e7d: mov qword ptr [rip + 0x933dcc], rax ; 0x100cb6c50
0x100382e84: mov qword ptr [rip + 0x933dc9], 0xffffffffffffffff ; 0x100cb6c58
0x100382e8f: mov qword ptr [rip + 0x933dca], rbx ; 0x100cb6c60
0x100382e96: mov qword ptr [rip + 0x933dc7], 0 ; 0x100cb6c68
0x100382ea1: vmovdqa xmmword ptr [rip + 0x1c778a7], xmm1 ; 0x101ffa750
0x100382ea9: lea rdx, [rip + 0x1c778a0] ; 0x101ffa750
0x100382eb0: mov qword ptr [rip + 0x1c778a5], 0 ; 0x101ffa760
0x100382ebb: mov qword ptr [rip + 0x933d66], rdx ; 0x100cb6c28
0x100382ec2: lea rdx, [rip + 0x800837] ; 0x100b83700 metricsBarn
0x100382ec9: mov qword ptr [rip + 0x933da0], rdx ; 0x100cb6c70
0x100382ed0: lea rdx, [rip + 0x933d99] ; 0x100cb6c70
0x100382ed7: mov qword ptr [rip + 0x933da2], rcx ; 0x100cb6c80
0x100382ede: mov qword ptr [rip + 0x933da7], 0x590 ; 0x100cb6c90
0x100382ee9: mov rcx, qword ptr [rip + 0x884050] ; 0x100c06f40 -> 0x10037d2f0 __Z17GetMetaTypeByTypeIP11MetricsBarnERK8MetaTypev
0x100382ef0: mov qword ptr [rip + 0x933da1], rcx ; 0x100cb6c98
0x100382ef7: mov qword ptr [rip + 0x933da2], rax ; 0x100cb6ca0
0x100382efe: mov qword ptr [rip + 0x933d9f], 0xffffffffffffffff ; 0x100cb6ca8
0x100382f09: mov qword ptr [rip + 0x933da0], rbx ; 0x100cb6cb0
0x100382f10: mov qword ptr [rip + 0x933d9d], 0 ; 0x100cb6cb8
0x100382f1b: vmovdqa xmmword ptr [rip + 0x1c7784d], xmm1 ; 0x101ffa770
0x100382f23: lea rcx, [rip + 0x1c77846] ; 0x101ffa770
0x100382f2a: mov qword ptr [rip + 0x1c7784b], 0 ; 0x101ffa780
0x100382f35: mov qword ptr [rip + 0x933d3c], rcx ; 0x100cb6c78
0x100382f3c: lea rcx, [rip + 0x8007c9] ; 0x100b8370c simpleUi
0x100382f43: mov qword ptr [rip + 0x933d76], rcx ; 0x100cb6cc0
0x100382f4a: lea rcx, [rip + 0x933d6f] ; 0x100cb6cc0
0x100382f51: mov qword ptr [rip + 0x933d78], rdx ; 0x100cb6cd0
0x100382f58: mov qword ptr [rip + 0x933d7d], 0x5a0 ; 0x100cb6ce0
0x100382f63: mov rdx, qword ptr [rip + 0x884486] ; 0x100c073f0 -> 0x10037d300 __Z17GetMetaTypeByTypeIP8SimpleUiERK8MetaTypev
0x100382f6a: mov qword ptr [rip + 0x933d77], rdx ; 0x100cb6ce8
0x100382f71: mov qword ptr [rip + 0x933d78], rax ; 0x100cb6cf0
0x100382f78: mov qword ptr [rip + 0x933d75], 0xffffffffffffffff ; 0x100cb6cf8
0x100382f83: mov qword ptr [rip + 0x933d76], rbx ; 0x100cb6d00
0x100382f8a: mov qword ptr [rip + 0x933d73], 0 ; 0x100cb6d08
0x100382f95: vmovdqa xmmword ptr [rip + 0x1c777f3], xmm1 ; 0x101ffa790
0x100382f9d: lea rdx, [rip + 0x1c777ec] ; 0x101ffa790
0x100382fa4: mov qword ptr [rip + 0x1c777f1], 0 ; 0x101ffa7a0
0x100382faf: mov qword ptr [rip + 0x933d12], rdx ; 0x100cb6cc8
0x100382fb6: lea rdx, [rip + 0x800758] ; 0x100b83715 skyNetClient
0x100382fbd: mov qword ptr [rip + 0x933d4c], rdx ; 0x100cb6d10
0x100382fc4: lea rdx, [rip + 0x933d45] ; 0x100cb6d10
0x100382fcb: mov qword ptr [rip + 0x933d4e], rcx ; 0x100cb6d20
0x100382fd2: mov qword ptr [rip + 0x933d53], 0x168 ; 0x100cb6d30
0x100382fdd: mov rcx, qword ptr [rip + 0x883fc4] ; 0x100c06fa8 -> 0x10037d310 __Z17GetMetaTypeByTypeIP12SkyNetClientERK8MetaTypev
0x100382fe4: mov qword ptr [rip + 0x933d4d], rcx ; 0x100cb6d38
0x100382feb: mov qword ptr [rip + 0x933d4e], rax ; 0x100cb6d40
0x100382ff2: mov qword ptr [rip + 0x933d4b], 0xffffffffffffffff ; 0x100cb6d48
0x100382ffd: mov qword ptr [rip + 0x933d4c], rbx ; 0x100cb6d50
0x100383004: mov qword ptr [rip + 0x933d49], 0 ; 0x100cb6d58
0x10038300f: lea rcx, [rip + 0x7ffe42] ; 0x100b82e58 Disabled
0x100383016: vmovq xmm1, rcx
0x10038301b: vpunpcklqdq xmm1, xmm0, xmm1
0x10038301f: vmovdqa xmmword ptr [rip + 0x1c77789], xmm1 ; 0x101ffa7b0
0x100383027: lea rcx, [rip + 0x1c77782] ; 0x101ffa7b0
0x10038302e: mov qword ptr [rip + 0x1c77787], 0 ; 0x101ffa7c0
0x100383039: mov qword ptr [rip + 0x933cd8], rcx ; 0x100cb6d18
0x100383040: lea rcx, [rip + 0x8006db] ; 0x100b83722 debugHud
0x100383047: mov qword ptr [rip + 0x933d12], rcx ; 0x100cb6d60
0x10038304e: lea rcx, [rip + 0x933d0b] ; 0x100cb6d60
0x100383055: mov qword ptr [rip + 0x933d14], rdx ; 0x100cb6d70
0x10038305c: mov qword ptr [rip + 0x933d19], 0x5f0 ; 0x100cb6d80
0x100383067: mov rdx, qword ptr [rip + 0x88432a] ; 0x100c07398 -> 0x10037d320 __Z17GetMetaTypeByTypeIP8DebugHudERK8MetaTypev
0x10038306e: mov qword ptr [rip + 0x933d13], rdx ; 0x100cb6d88
0x100383075: mov qword ptr [rip + 0x933d14], rax ; 0x100cb6d90
0x10038307c: mov qword ptr [rip + 0x933d11], 0xffffffffffffffff ; 0x100cb6d98
0x100383087: mov qword ptr [rip + 0x933d12], rbx ; 0x100cb6da0
0x10038308e: mov qword ptr [rip + 0x933d0f], 0 ; 0x100cb6da8
0x100383099: lea rdx, [rip + 0x7ffdb4] ; 0x100b82e54 Dev
0x1003830a0: vmovq xmm1, rdx
0x1003830a5: vpunpcklqdq xmm0, xmm0, xmm1
0x1003830a9: vmovdqa xmmword ptr [rip + 0x1c7771f], xmm0 ; 0x101ffa7d0
0x1003830b1: lea rdx, [rip + 0x1c77718] ; 0x101ffa7d0
0x1003830b8: mov qword ptr [rip + 0x1c7771d], 0 ; 0x101ffa7e0
0x1003830c3: mov qword ptr [rip + 0x933c9e], rdx ; 0x100cb6d68
0x1003830ca: lea rdx, [rip + 0x80065a] ; 0x100b8372b persistentLines
0x1003830d1: mov qword ptr [rip + 0x933cd8], rdx ; 0x100cb6db0
0x1003830d8: lea rdx, [rip + 0x933cd1] ; 0x100cb6db0
0x1003830df: mov qword ptr [rip + 0x933cda], rcx ; 0x100cb6dc0
0x1003830e6: mov qword ptr [rip + 0x8f4b73], rdx ; 0x100c77c60
0x1003830ed: mov qword ptr [rip + 0x933cd8], 0x4e0 ; 0x100cb6dd0
0x1003830f8: mov rcx, qword ptr [rip + 0x884021] ; 0x100c07120 -> 0x10037d330 __Z17GetMetaTypeByTypeIP15PersistentLinesERK8MetaTypev
0x1003830ff: mov qword ptr [rip + 0x933cd2], rcx ; 0x100cb6dd8
0x100383106: mov qword ptr [rip + 0x933cd3], rax ; 0x100cb6de0
0x10038310d: mov qword ptr [rip + 0x933cd0], 0xffffffffffffffff ; 0x100cb6de8
0x100383118: mov qword ptr [rip + 0x933cd1], rbx ; 0x100cb6df0
0x10038311f: mov qword ptr [rip + 0x933cce], 0 ; 0x100cb6df8
0x10038312a: vmovdqa xmmword ptr [rip + 0x1c776be], xmm0 ; 0x101ffa7f0
0x100383132: lea rcx, [rip + 0x1c776b7] ; 0x101ffa7f0
0x100383139: mov qword ptr [rip + 0x1c776bc], 0 ; 0x101ffa800
0x100383144: mov qword ptr [rip + 0x933c6d], rcx ; 0x100cb6db8
0x10038314b: lea rcx, [rip + 0x8005e9] ; 0x100b8373b StartHotLoadProfiling
0x100383152: mov qword ptr [rip + 0x1c776af], rcx ; 0x101ffa808
0x100383159: lea rcx, [rip + 0x1c776a8] ; 0x101ffa808
0x100383160: mov qword ptr [rip + 0x1c776a5], 0 ; 0x101ffa810
0x10038316b: mov rdx, qword ptr [rip + 0x8ecdee] ; 0x100c6ff60
0x100383172: mov qword ptr [rip + 0x1c7769f], rdx ; 0x101ffa818
0x100383179: lea rdx, [rip - 0xd550] ; 0x100375c30
0x100383180: vmovq xmm0, rdx
0x100383185: vmovdqu xmmword ptr [rip + 0x1c776b3], xmm0 ; 0x101ffa840
0x10038318d: mov rdx, qword ptr [rip + 0x882f3c] ; 0x100c060d0 -> 0x10037d340 __Z12ApplyWrapperI4GameMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x100383194: mov qword ptr [rip + 0x1c776b5], rdx ; 0x101ffa850
0x10038319b: mov rsi, qword ptr [rip + 0x8867be] ; 0x100c09960 -> 0x10037d3a0 __Z21InitFunctionSignatureIM4GameFvvEEvP17FunctionSignature
0x1003831a2: mov qword ptr [rip + 0x1c776af], rsi ; 0x101ffa858
0x1003831a9: mov qword ptr [rip + 0x1c776b0], rax ; 0x101ffa860
0x1003831b0: lea rdi, [rip + 0x80059a] ; 0x100b83751 RequestHotLoad
0x1003831b7: mov qword ptr [rip + 0x1c776aa], rdi ; 0x101ffa868
0x1003831be: lea rdi, [rip + 0x1c776a3] ; 0x101ffa868
0x1003831c5: mov qword ptr [rip + 0x1c776a0], 0 ; 0x101ffa870
0x1003831d0: mov qword ptr [rip + 0x1c776a1], rcx ; 0x101ffa878
0x1003831d7: lea rcx, [rip - 0xd58e] ; 0x100375c50
0x1003831de: vmovq xmm0, rcx
0x1003831e3: vmovdqu xmmword ptr [rip + 0x1c776b5], xmm0 ; 0x101ffa8a0
0x1003831eb: mov qword ptr [rip + 0x1c776be], rdx ; 0x101ffa8b0
0x1003831f2: mov qword ptr [rip + 0x1c776bf], rsi ; 0x101ffa8b8
0x1003831f9: mov qword ptr [rip + 0x1c776c0], rax ; 0x101ffa8c0
0x100383200: lea rcx, [rip + 0x800559] ; 0x100b83760 RequestResourceReload
0x100383207: mov qword ptr [rip + 0x1c776ba], rcx ; 0x101ffa8c8
0x10038320e: lea rcx, [rip + 0x1c776b3] ; 0x101ffa8c8
0x100383215: mov qword ptr [rip + 0x1c776b0], 0 ; 0x101ffa8d0
0x100383220: mov qword ptr [rip + 0x1c776b1], rdi ; 0x101ffa8d8
0x100383227: mov qword ptr [rip + 0x8ecd32], rcx ; 0x100c6ff60
0x10038322e: mov ecx, 0x121
0x100383233: vmovq xmm0, rcx
0x100383238: vmovdqu xmmword ptr [rip + 0x1c776c0], xmm0 ; 0x101ffa900
0x100383240: mov qword ptr [rip + 0x1c776c9], rdx ; 0x101ffa910
0x100383247: mov qword ptr [rip + 0x1c776ca], rsi ; 0x101ffa918
0x10038324e: mov qword ptr [rip + 0x1c776cb], rax ; 0x101ffa920
0x100383255: lea rax, [rip + 0x80051a] ; 0x100b83776 GameMode
0x10038325c: mov qword ptr [rip + 0x1c776cd], rax ; 0x101ffa930
0x100383263: lea rax, [rip + 0x1c776be] ; 0x101ffa928
0x10038326a: mov qword ptr [rip + 0x1c776c3], 0 ; 0x101ffa938
0x100383275: mov rcx, qword ptr [rip + 0x8eccdc] ; 0x100c6ff58
0x10038327c: mov qword ptr [rip + 0x1c776bd], rcx ; 0x101ffa940
0x100383283: mov qword ptr [rip + 0x8eccce], rax ; 0x100c6ff58
0x10038328a: mov qword ptr [rip + 0x1c776bf], rax ; 0x101ffa950
0x100383291: mov qword ptr [rip + 0x1c776c0], r14 ; 0x101ffa958
0x100383298: mov dword ptr [rip + 0x1c776be], 0xffffffff ; 0x101ffa960
0x1003832a2: mov dword ptr [rip + 0x1c776b8], 0xffffffff ; 0x101ffa964
0x1003832ac: mov qword ptr [rip + 0x1c776c9], 0 ; 0x101ffa980
0x1003832b7: mov rax, qword ptr [rip + 0x88941a] ; 0x100c0c6d8
0x1003832be: add rax, 0x10
0x1003832c2: mov qword ptr [rip + 0x1c7765f], rax ; 0x101ffa928
0x1003832c9: xor eax, eax
0x1003832cb: call 0x100011c10 ; 0x100011c10
0x1003832d0: lea rax, [rip + 0x8004a8] ; 0x100b8377f LuaLog
0x1003832d7: mov qword ptr [rip + 0x1c776aa], rax ; 0x101ffa988
0x1003832de: lea rax, [rip + 0x1c776a3] ; 0x101ffa988
0x1003832e5: mov qword ptr [rip + 0x1c776a0], 0 ; 0x101ffa990
0x1003832f0: mov rcx, qword ptr [rip + 0x8ee4d9] ; 0x100c717d0
0x1003832f7: mov qword ptr [rip + 0x1c7769a], rcx ; 0x101ffa998
0x1003832fe: mov qword ptr [rip + 0x8ee4cb], rax ; 0x100c717d0
0x100383305: lea rax, [rip - 0xd62c] ; 0x100375ce0
0x10038330c: mov qword ptr [rip + 0x1c776ad], rax ; 0x101ffa9c0
0x100383313: mov rax, qword ptr [rip + 0x88384e] ; 0x100c06b68 -> 0x10037d620 __Z12ApplyWrapperIPFvPKcEEvPFvvE8VariablePS6_j
0x10038331a: mov qword ptr [rip + 0x1c776a7], rax ; 0x101ffa9c8
0x100383321: mov rax, qword ptr [rip + 0x8870d0] ; 0x100c0a3f8 -> 0x10037d6b0 __Z21InitFunctionSignatureIPFvPKcEEvP17FunctionSignature
0x100383328: mov qword ptr [rip + 0x1c776a1], rax ; 0x101ffa9d0
0x10038332f: add rsp, 8
0x100383333: pop rbx
0x100383334: pop r14
0x100383336: pop r15
0x100383338: pop rbp
0x100383339: ret 
0x10038333a: nop 
0x10038333b: nop 
0x10038333c: nop 
0x10038333d: nop 
0x10038333e: nop 
0x10038333f: nop 
