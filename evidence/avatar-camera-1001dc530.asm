0x1001dc530: push rbp
0x1001dc531: mov rbp, rsp
0x1001dc534: push r15
0x1001dc536: push r14
0x1001dc538: push r13
0x1001dc53a: push r12
0x1001dc53c: push rbx
0x1001dc53d: sub rsp, 0x28
0x1001dc541: mov dword ptr [rip + 0xb47aa1], 0 ; 0x100d23fec
0x1001dc54b: lea rax, [rip + 0x99c58e] ; 0x100b78ae0 kShowCameraGuide
0x1001dc552: mov qword ptr [rip + 0x1c00797], rax ; 0x101ddccf0
0x1001dc559: lea rax, [rip + 0x1c00790] ; 0x101ddccf0
0x1001dc560: mov rcx, qword ptr [rip + 0xab3739] ; 0x100c8fca0
0x1001dc567: mov qword ptr [rip + 0x1c00792], rcx ; 0x101ddcd00
0x1001dc56e: lea rcx, [rip + 0xab235b] ; 0x100c8e8d0
0x1001dc575: vmovq xmm1, rcx
0x1001dc57a: lea rcx, [rip + 0x99c570] ; 0x100b78af1 CameraGuide.cpp
0x1001dc581: vmovq xmm0, rcx
0x1001dc586: vpunpcklqdq xmm1, xmm0, xmm1
0x1001dc58a: vmovdqu xmmword ptr [rip + 0x1c0077e], xmm1 ; 0x101ddcd10
0x1001dc592: mov rcx, qword ptr [rip + 0xa2afbf] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1001dc599: mov qword ptr [rip + 0x1c00780], rcx ; 0x101ddcd20
0x1001dc5a0: mov rdx, rcx
0x1001dc5a3: mov qword ptr [rip + 0x1c0077a], 0 ; 0x101ddcd28
0x1001dc5ae: lea r14, [rip - 0x1c2b95] ; 0x100019a20
0x1001dc5b5: mov qword ptr [rip + 0x1c00774], r14 ; 0x101ddcd30
0x1001dc5bc: mov qword ptr [rip + 0x1c00771], 0 ; 0x101ddcd38
0x1001dc5c7: lea rcx, [rip + 0x99c533] ; 0x100b78b01 Camera
0x1001dc5ce: vmovq xmm1, rcx
0x1001dc5d3: lea rcx, [rip + 0x981a43] ; 0x100b5e01d TweakCategory
0x1001dc5da: vmovq xmm2, rcx
0x1001dc5df: vpunpcklqdq xmm1, xmm2, xmm1
0x1001dc5e3: vmovdqa xmmword ptr [rip + 0x1c00755], xmm1 ; 0x101ddcd40
0x1001dc5eb: lea rcx, [rip + 0x1c0074e] ; 0x101ddcd40
0x1001dc5f2: mov qword ptr [rip + 0x1c00753], 0 ; 0x101ddcd50
0x1001dc5fd: mov qword ptr [rip + 0x1c006f4], rcx ; 0x101ddccf8
0x1001dc604: lea rcx, [rip + 0x99c4fd] ; 0x100b78b08 kShowActiveGuides
0x1001dc60b: mov qword ptr [rip + 0x1c0074e], rcx ; 0x101ddcd60
0x1001dc612: lea rcx, [rip + 0x1c00747] ; 0x101ddcd60
0x1001dc619: mov qword ptr [rip + 0x1c00750], rax ; 0x101ddcd70
0x1001dc620: lea rax, [rip + 0x1c00731] ; 0x101ddcd58
0x1001dc627: vmovq xmm2, rax
0x1001dc62c: vpunpcklqdq xmm2, xmm0, xmm2
0x1001dc630: vmovdqu xmmword ptr [rip + 0x1c00748], xmm2 ; 0x101ddcd80
0x1001dc638: mov qword ptr [rip + 0x1c00751], rdx ; 0x101ddcd90
0x1001dc63f: mov qword ptr [rip + 0x1c0074e], 0 ; 0x101ddcd98
0x1001dc64a: mov qword ptr [rip + 0x1c0074f], r14 ; 0x101ddcda0
0x1001dc651: mov qword ptr [rip + 0x1c0074c], 0 ; 0x101ddcda8
0x1001dc65c: vmovdqa xmmword ptr [rip + 0x1c0074c], xmm1 ; 0x101ddcdb0
0x1001dc664: lea rax, [rip + 0x1c00745] ; 0x101ddcdb0
0x1001dc66b: mov qword ptr [rip + 0x1c0074a], 0 ; 0x101ddcdc0
0x1001dc676: mov qword ptr [rip + 0x1c006eb], rax ; 0x101ddcd68
0x1001dc67d: lea rax, [rip + 0x99c496] ; 0x100b78b1a kGuideWeightByAngle
0x1001dc684: mov qword ptr [rip + 0x1c0073d], rax ; 0x101ddcdc8
0x1001dc68b: lea rax, [rip + 0x1c00736] ; 0x101ddcdc8
0x1001dc692: mov qword ptr [rip + 0x1c0073f], rcx ; 0x101ddcdd8
0x1001dc699: mov qword ptr [rip + 0xab3600], rax ; 0x100c8fca0
0x1001dc6a0: lea rax, [rip + 0xab222a] ; 0x100c8e8d1
0x1001dc6a7: vmovq xmm2, rax
0x1001dc6ac: vpunpcklqdq xmm0, xmm0, xmm2
0x1001dc6b0: vmovdqu xmmword ptr [rip + 0x1c00730], xmm0 ; 0x101ddcde8
0x1001dc6b8: mov qword ptr [rip + 0x1c00739], rdx ; 0x101ddcdf8
0x1001dc6bf: mov qword ptr [rip + 0x1c00736], 0 ; 0x101ddce00
0x1001dc6ca: mov qword ptr [rip + 0x1c00737], r14 ; 0x101ddce08
0x1001dc6d1: mov qword ptr [rip + 0x1c00734], 0 ; 0x101ddce10
0x1001dc6dc: vmovdqa xmmword ptr [rip + 0x1c0073c], xmm1 ; 0x101ddce20
0x1001dc6e4: lea rax, [rip + 0x1c00735] ; 0x101ddce20
0x1001dc6eb: mov qword ptr [rip + 0x1c0073a], 0 ; 0x101ddce30
0x1001dc6f6: mov qword ptr [rip + 0x1c006d3], rax ; 0x101ddcdd0
0x1001dc6fd: lea rax, [rip + 0x99c42a] ; 0x100b78b2e CameraGuideZoom
0x1001dc704: mov qword ptr [rip + 0x1c00735], rax ; 0x101ddce40
0x1001dc70b: lea rdx, [rip + 0x1c00726] ; 0x101ddce38
0x1001dc712: mov rcx, qword ptr [rip + 0xa9383f] ; 0x100c6ff58
0x1001dc719: mov qword ptr [rip + 0x1c00730], rcx ; 0x101ddce50
0x1001dc720: mov qword ptr [rip + 0xa93831], rdx ; 0x100c6ff58
0x1001dc727: mov qword ptr [rip + 0x1c00732], rdx ; 0x101ddce60
0x1001dc72e: mov rcx, qword ptr [rip + 0xa304d3] ; 0x100c0cc08
0x1001dc735: add rcx, 0x10
0x1001dc739: mov qword ptr [rip + 0x1c006f8], rcx ; 0x101ddce38
0x1001dc740: vmovq xmm0, rax
0x1001dc745: lea rax, [rip + 0x980ef2] ; 0x100b5d63e Enum_Type
0x1001dc74c: vmovq xmm1, rax
0x1001dc751: vmovdqa xmmword ptr [rbp - 0x50], xmm1
0x1001dc756: vpunpcklqdq xmm0, xmm1, xmm0
0x1001dc75a: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x1001dc75f: vmovdqa xmmword ptr [rip + 0x1c00709], xmm0 ; 0x101ddce70
0x1001dc767: lea rax, [rip + 0x1c00702] ; 0x101ddce70
0x1001dc76e: mov qword ptr [rip + 0x1c00707], 0 ; 0x101ddce80
0x1001dc779: mov qword ptr [rip + 0x1c006c8], rax ; 0x101ddce48
0x1001dc780: lea rax, [rip + 0x99c3b7] ; 0x100b78b3e kCameraGuideZoom_UseFOV
0x1001dc787: mov qword ptr [rip + 0x1c006fa], rax ; 0x101ddce88
0x1001dc78e: lea r12, [rip + 0x1c006f3] ; 0x101ddce88
0x1001dc795: mov qword ptr [rip + 0x1c006f0], 0 ; 0x101ddce90
0x1001dc7a0: mov rax, qword ptr [rip + 0xb36939] ; 0x100d130e0
0x1001dc7a7: mov qword ptr [rip + 0x1c006ea], rax ; 0x101ddce98
0x1001dc7ae: mov qword ptr [rip + 0xb3692b], r12 ; 0x100d130e0
0x1001dc7b5: mov edi, 1
0x1001dc7ba: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001dc7bf: mov byte ptr [rax], 0
0x1001dc7c2: mov qword ptr [rip + 0x1c006df], rax ; 0x101ddcea8
0x1001dc7c9: mov rax, qword ptr [rip + 0xa2a480] ; 0x100c06c50 -> 0x1001daff0 __Z17GetMetaTypeByTypeI15CameraGuideZoomERK8MetaTypev
0x1001dc7d0: mov qword ptr [rip + 0x1c006d9], rax ; 0x101ddceb0
0x1001dc7d7: mov rbx, rax
0x1001dc7da: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001dc7df: vmovaps xmmword ptr [rip + 0x1c006d9], xmm0 ; 0x101ddcec0
0x1001dc7e7: lea rax, [rip + 0x1c006d2] ; 0x101ddcec0
0x1001dc7ee: mov qword ptr [rip + 0x1c006d7], 0 ; 0x101ddced0
0x1001dc7f9: mov qword ptr [rip + 0x1c00690], rax ; 0x101ddce90
0x1001dc800: lea rax, [rip + 0x99c34f] ; 0x100b78b56 kCameraGuideZoom_UseScreenSize
0x1001dc807: mov qword ptr [rip + 0x1c006ca], rax ; 0x101ddced8
0x1001dc80e: lea r13, [rip + 0x1c006c3] ; 0x101ddced8
0x1001dc815: mov qword ptr [rip + 0x1c006c0], 0 ; 0x101ddcee0
0x1001dc820: mov qword ptr [rip + 0x1c006c1], r12 ; 0x101ddcee8
0x1001dc827: mov qword ptr [rip + 0xb368b2], r13 ; 0x100d130e0
0x1001dc82e: mov edi, 1
0x1001dc833: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001dc838: mov byte ptr [rax], 1
0x1001dc83b: mov qword ptr [rip + 0x1c006b6], rax ; 0x101ddcef8
0x1001dc842: mov qword ptr [rip + 0x1c006b7], rbx ; 0x101ddcf00
0x1001dc849: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001dc84e: vmovaps xmmword ptr [rip + 0x1c006ba], xmm0 ; 0x101ddcf10
0x1001dc856: lea rax, [rip + 0x1c006b3] ; 0x101ddcf10
0x1001dc85d: mov qword ptr [rip + 0x1c006b8], 0 ; 0x101ddcf20
0x1001dc868: mov qword ptr [rip + 0x1c00671], rax ; 0x101ddcee0
0x1001dc86f: lea rax, [rip + 0x99c2ff] ; 0x100b78b75 kCameraGuideZoom_UseBoth
0x1001dc876: mov qword ptr [rip + 0x1c006ab], rax ; 0x101ddcf28
0x1001dc87d: lea r12, [rip + 0x1c006a4] ; 0x101ddcf28
0x1001dc884: mov qword ptr [rip + 0x1c006a1], 0 ; 0x101ddcf30
0x1001dc88f: mov qword ptr [rip + 0x1c006a2], r13 ; 0x101ddcf38
0x1001dc896: mov qword ptr [rip + 0xb36843], r12 ; 0x100d130e0
0x1001dc89d: mov edi, 1
0x1001dc8a2: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001dc8a7: mov byte ptr [rax], 2
0x1001dc8aa: mov qword ptr [rip + 0x1c00697], rax ; 0x101ddcf48
0x1001dc8b1: mov qword ptr [rip + 0x1c00698], rbx ; 0x101ddcf50
0x1001dc8b8: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001dc8bd: vmovaps xmmword ptr [rip + 0x1c0069b], xmm0 ; 0x101ddcf60
0x1001dc8c5: lea rax, [rip + 0x1c00694] ; 0x101ddcf60
0x1001dc8cc: mov qword ptr [rip + 0x1c00699], 0 ; 0x101ddcf70
0x1001dc8d7: mov qword ptr [rip + 0x1c00652], rax ; 0x101ddcf30
0x1001dc8de: lea rax, [rip + 0x99c2a9] ; 0x100b78b8e kCameraGuideZoom_UseStaticFOV
0x1001dc8e5: mov qword ptr [rip + 0x1c0068c], rax ; 0x101ddcf78
0x1001dc8ec: lea r15, [rip + 0x1c00685] ; 0x101ddcf78
0x1001dc8f3: mov qword ptr [rip + 0x1c00682], 0 ; 0x101ddcf80
0x1001dc8fe: mov qword ptr [rip + 0x1c00683], r12 ; 0x101ddcf88
0x1001dc905: mov qword ptr [rip + 0xb367d4], r15 ; 0x100d130e0
0x1001dc90c: mov edi, 1
0x1001dc911: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001dc916: mov byte ptr [rax], 3
0x1001dc919: mov qword ptr [rip + 0x1c00678], rax ; 0x101ddcf98
0x1001dc920: mov qword ptr [rip + 0x1c00679], rbx ; 0x101ddcfa0
0x1001dc927: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001dc92c: vmovaps xmmword ptr [rip + 0x1c0067c], xmm0 ; 0x101ddcfb0
0x1001dc934: lea rax, [rip + 0x1c00675] ; 0x101ddcfb0
0x1001dc93b: mov qword ptr [rip + 0x1c0067a], 0 ; 0x101ddcfc0
0x1001dc946: mov qword ptr [rip + 0x1c00633], rax ; 0x101ddcf80
0x1001dc94d: lea rax, [rip + 0x99c258] ; 0x100b78bac kCameraGuideZoom_None
0x1001dc954: mov qword ptr [rip + 0x1c0066d], rax ; 0x101ddcfc8
0x1001dc95b: lea r13, [rip + 0x1c00666] ; 0x101ddcfc8
0x1001dc962: mov qword ptr [rip + 0x1c00663], 0 ; 0x101ddcfd0
0x1001dc96d: mov qword ptr [rip + 0x1c00664], r15 ; 0x101ddcfd8
0x1001dc974: mov qword ptr [rip + 0xb36765], r13 ; 0x100d130e0
0x1001dc97b: mov edi, 1
0x1001dc980: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001dc985: mov byte ptr [rax], 4
0x1001dc988: mov qword ptr [rip + 0x1c00659], rax ; 0x101ddcfe8
0x1001dc98f: mov qword ptr [rip + 0x1c0065a], rbx ; 0x101ddcff0
0x1001dc996: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001dc99b: vmovaps xmmword ptr [rip + 0x1c0065d], xmm0 ; 0x101ddd000
0x1001dc9a3: lea rax, [rip + 0x1c00656] ; 0x101ddd000
0x1001dc9aa: mov qword ptr [rip + 0x1c0065b], 0 ; 0x101ddd010
0x1001dc9b5: mov qword ptr [rip + 0x1c00614], rax ; 0x101ddcfd0
0x1001dc9bc: lea rax, [rip + 0x99c1ff] ; 0x100b78bc2 CameraLensType
0x1001dc9c3: mov qword ptr [rip + 0x1c00656], rax ; 0x101ddd020
0x1001dc9ca: lea rcx, [rip + 0x1c00647] ; 0x101ddd018
0x1001dc9d1: lea rdx, [rip + 0x1c00460] ; 0x101ddce38
0x1001dc9d8: mov qword ptr [rip + 0x1c00651], rdx ; 0x101ddd030
0x1001dc9df: mov qword ptr [rip + 0xa93572], rcx ; 0x100c6ff58
0x1001dc9e6: mov qword ptr [rip + 0x1c00653], rcx ; 0x101ddd040
0x1001dc9ed: mov rcx, qword ptr [rip + 0xa301ec] ; 0x100c0cbe0
0x1001dc9f4: add rcx, 0x10
0x1001dc9f8: mov qword ptr [rip + 0x1c00619], rcx ; 0x101ddd018
0x1001dc9ff: vmovq xmm0, rax
0x1001dca04: vmovdqa xmm1, xmmword ptr [rbp - 0x50]
0x1001dca09: vpunpcklqdq xmm0, xmm1, xmm0
0x1001dca0d: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x1001dca12: vmovdqa xmmword ptr [rip + 0x1c00636], xmm0 ; 0x101ddd050
0x1001dca1a: lea rax, [rip + 0x1c0062f] ; 0x101ddd050
0x1001dca21: mov qword ptr [rip + 0x1c00634], 0 ; 0x101ddd060
0x1001dca2c: mov qword ptr [rip + 0x1c005f5], rax ; 0x101ddd028
0x1001dca33: lea rax, [rip + 0x99c197] ; 0x100b78bd1 kCameraLens_None
0x1001dca3a: mov qword ptr [rip + 0x1c00627], rax ; 0x101ddd068
0x1001dca41: lea r12, [rip + 0x1c00620] ; 0x101ddd068
0x1001dca48: mov qword ptr [rip + 0x1c0061d], 0 ; 0x101ddd070
0x1001dca53: mov qword ptr [rip + 0x1c0061e], r13 ; 0x101ddd078
0x1001dca5a: mov qword ptr [rip + 0xb3667f], r12 ; 0x100d130e0
0x1001dca61: mov edi, 4
0x1001dca66: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001dca6b: mov dword ptr [rax], 0
0x1001dca71: mov qword ptr [rip + 0x1c00610], rax ; 0x101ddd088
0x1001dca78: mov r15, qword ptr [rip + 0xa2a1a1] ; 0x100c06c20 -> 0x1001db1b0 __Z17GetMetaTypeByTypeI14CameraLensTypeERK8MetaTypev
0x1001dca7f: mov qword ptr [rip + 0x1c0060a], r15 ; 0x101ddd090
0x1001dca86: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001dca8b: vmovaps xmmword ptr [rip + 0x1c0060d], xmm0 ; 0x101ddd0a0
0x1001dca93: lea rax, [rip + 0x1c00606] ; 0x101ddd0a0
0x1001dca9a: mov qword ptr [rip + 0x1c0060b], 0 ; 0x101ddd0b0
0x1001dcaa5: mov qword ptr [rip + 0x1c005c4], rax ; 0x101ddd070
0x1001dcaac: lea rax, [rip + 0x99c12f] ; 0x100b78be2 kCameraLens_80mm_Tele
0x1001dcab3: mov qword ptr [rip + 0x1c005fe], rax ; 0x101ddd0b8
0x1001dcaba: lea rbx, [rip + 0x1c005f7] ; 0x101ddd0b8
0x1001dcac1: mov qword ptr [rip + 0x1c005f4], 0 ; 0x101ddd0c0
0x1001dcacc: mov qword ptr [rip + 0x1c005f5], r12 ; 0x101ddd0c8
0x1001dcad3: mov qword ptr [rip + 0xb36606], rbx ; 0x100d130e0
0x1001dcada: mov edi, 4
0x1001dcadf: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001dcae4: mov dword ptr [rax], 1
0x1001dcaea: mov qword ptr [rip + 0x1c005e7], rax ; 0x101ddd0d8
0x1001dcaf1: mov qword ptr [rip + 0x1c005e8], r15 ; 0x101ddd0e0
0x1001dcaf8: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001dcafd: vmovaps xmmword ptr [rip + 0x1c005eb], xmm0 ; 0x101ddd0f0
0x1001dcb05: lea rax, [rip + 0x1c005e4] ; 0x101ddd0f0
0x1001dcb0c: mov qword ptr [rip + 0x1c005e9], 0 ; 0x101ddd100
0x1001dcb17: mov qword ptr [rip + 0x1c005a2], rax ; 0x101ddd0c0
0x1001dcb1e: lea rax, [rip + 0x99c0d3] ; 0x100b78bf8 kCameraLens_50mm_Long
0x1001dcb25: mov qword ptr [rip + 0x1c005dc], rax ; 0x101ddd108
0x1001dcb2c: lea r12, [rip + 0x1c005d5] ; 0x101ddd108
0x1001dcb33: mov qword ptr [rip + 0x1c005d2], 0 ; 0x101ddd110
0x1001dcb3e: mov qword ptr [rip + 0x1c005d3], rbx ; 0x101ddd118
0x1001dcb45: mov qword ptr [rip + 0xb36594], r12 ; 0x100d130e0
0x1001dcb4c: mov edi, 4
0x1001dcb51: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001dcb56: mov dword ptr [rax], 2
0x1001dcb5c: mov qword ptr [rip + 0x1c005c5], rax ; 0x101ddd128
0x1001dcb63: mov qword ptr [rip + 0x1c005c6], r15 ; 0x101ddd130
0x1001dcb6a: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001dcb6f: vmovaps xmmword ptr [rip + 0x1c005c9], xmm0 ; 0x101ddd140
0x1001dcb77: lea rax, [rip + 0x1c005c2] ; 0x101ddd140
0x1001dcb7e: mov qword ptr [rip + 0x1c005c7], 0 ; 0x101ddd150
0x1001dcb89: mov qword ptr [rip + 0x1c00580], rax ; 0x101ddd110
0x1001dcb90: lea rax, [rip + 0x99c077] ; 0x100b78c0e kCameraLens_35mm_Normal
0x1001dcb97: mov qword ptr [rip + 0x1c005ba], rax ; 0x101ddd158
0x1001dcb9e: lea rbx, [rip + 0x1c005b3] ; 0x101ddd158
0x1001dcba5: mov qword ptr [rip + 0x1c005b0], 0 ; 0x101ddd160
0x1001dcbb0: mov qword ptr [rip + 0x1c005b1], r12 ; 0x101ddd168
0x1001dcbb7: mov qword ptr [rip + 0xb36522], rbx ; 0x100d130e0
0x1001dcbbe: mov edi, 4
0x1001dcbc3: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001dcbc8: mov dword ptr [rax], 3
0x1001dcbce: mov qword ptr [rip + 0x1c005a3], rax ; 0x101ddd178
0x1001dcbd5: mov qword ptr [rip + 0x1c005a4], r15 ; 0x101ddd180
0x1001dcbdc: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001dcbe1: vmovaps xmmword ptr [rip + 0x1c005a7], xmm0 ; 0x101ddd190
0x1001dcbe9: lea rax, [rip + 0x1c005a0] ; 0x101ddd190
0x1001dcbf0: mov qword ptr [rip + 0x1c005a5], 0 ; 0x101ddd1a0
0x1001dcbfb: mov qword ptr [rip + 0x1c0055e], rax ; 0x101ddd160
0x1001dcc02: lea r13, [rip + 0x99c01d] ; 0x100b78c26 kCameraLens_22mm_Wide
0x1001dcc09: mov qword ptr [rip + 0x1c00598], r13 ; 0x101ddd1a8
0x1001dcc10: lea r12, [rip + 0x1c00591] ; 0x101ddd1a8
0x1001dcc17: mov qword ptr [rip + 0x1c0058e], 0 ; 0x101ddd1b0
0x1001dcc22: mov qword ptr [rip + 0x1c0058f], rbx ; 0x101ddd1b8
0x1001dcc29: mov qword ptr [rip + 0xb364b0], r12 ; 0x100d130e0
0x1001dcc30: mov edi, 4
0x1001dcc35: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001dcc3a: mov dword ptr [rax], 4
0x1001dcc40: mov qword ptr [rip + 0x1c00581], rax ; 0x101ddd1c8
0x1001dcc47: mov qword ptr [rip + 0x1c00582], r15 ; 0x101ddd1d0
0x1001dcc4e: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001dcc53: vmovaps xmmword ptr [rip + 0x1c00585], xmm0 ; 0x101ddd1e0
0x1001dcc5b: lea rax, [rip + 0x1c0057e] ; 0x101ddd1e0
0x1001dcc62: mov qword ptr [rip + 0x1c00583], 0 ; 0x101ddd1f0
0x1001dcc6d: mov qword ptr [rip + 0x1c0053c], rax ; 0x101ddd1b0
0x1001dcc74: lea rax, [rip + 0x99bfc1] ; 0x100b78c3c kCameraLens_16mm_UltraWide
0x1001dcc7b: mov qword ptr [rip + 0x1c00576], rax ; 0x101ddd1f8
0x1001dcc82: lea rax, [rip + 0x1c0056f] ; 0x101ddd1f8
0x1001dcc89: mov qword ptr [rip + 0x1c0056c], 0 ; 0x101ddd200
0x1001dcc94: mov qword ptr [rip + 0x1c0056d], r12 ; 0x101ddd208
0x1001dcc9b: mov qword ptr [rip + 0xb3643e], rax ; 0x100d130e0
0x1001dcca2: mov edi, 4
0x1001dcca7: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001dccac: mov dword ptr [rax], 5
0x1001dccb2: mov qword ptr [rip + 0x1c0055f], rax ; 0x101ddd218
0x1001dccb9: mov qword ptr [rip + 0x1c00560], r15 ; 0x101ddd220
0x1001dccc0: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001dccc5: vmovaps xmmword ptr [rip + 0x1c00563], xmm0 ; 0x101ddd230
0x1001dcccd: lea rax, [rip + 0x1c0055c] ; 0x101ddd230
0x1001dccd4: mov qword ptr [rip + 0x1c00561], 0 ; 0x101ddd240
0x1001dccdf: mov qword ptr [rip + 0x1c0051a], rax ; 0x101ddd200
0x1001dcce6: lea r12, [rip + 0x99bf6a] ; 0x100b78c57 CameraGuide
0x1001dcced: mov qword ptr [rip + 0x1c0055c], r12 ; 0x101ddd250
0x1001dccf4: lea rax, [rip + 0x1c0054d] ; 0x101ddd248
0x1001dccfb: mov qword ptr [rip + 0x1c00552], 0 ; 0x101ddd258
0x1001dcd06: lea rcx, [rip + 0x1c0030b] ; 0x101ddd018
0x1001dcd0d: mov qword ptr [rip + 0x1c0054c], rcx ; 0x101ddd260
0x1001dcd14: mov qword ptr [rip + 0xa9323d], rax ; 0x100c6ff58
0x1001dcd1b: mov qword ptr [rip + 0x1c0054e], rax ; 0x101ddd270
0x1001dcd22: lea rax, [rip - 0x1a7469] ; 0x1000358c0
0x1001dcd29: mov qword ptr [rip + 0x1c00548], rax ; 0x101ddd278
0x1001dcd30: mov qword ptr [rip + 0x1c00545], 0xffffffffffffffff ; 0x101ddd280
0x1001dcd3b: mov qword ptr [rip + 0x1c0055a], 0 ; 0x101ddd2a0
0x1001dcd46: mov rax, qword ptr [rip + 0xa2decb] ; 0x100c0ac18
0x1001dcd4d: add rax, 0x10
0x1001dcd51: mov qword ptr [rip + 0x1c004f0], rax ; 0x101ddd248
0x1001dcd58: xor eax, eax
0x1001dcd5a: call 0x100011c10 ; 0x100011c10
0x1001dcd5f: lea rax, [rip + 0x982240] ; 0x100b5efa6 pos
0x1001dcd66: mov qword ptr [rip + 0xab1b6b], rax ; 0x100c8e8d8
0x1001dcd6d: lea rcx, [rip + 0xab1b64] ; 0x100c8e8d8
0x1001dcd74: mov qword ptr [rip + 0xab1b61], 0 ; 0x100c8e8e0
0x1001dcd7f: mov rax, qword ptr [rip + 0xa9aeda] ; 0x100c77c60
0x1001dcd86: mov qword ptr [rip + 0xab1b5b], rax ; 0x100c8e8e8
0x1001dcd8d: mov qword ptr [rip + 0xab1b60], 0x10 ; 0x100c8e8f8
0x1001dcd98: mov r8, qword ptr [rip + 0xa2a031] ; 0x100c06dd0 -> 0x100066ac0 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Vector3EERK8MetaTypev
0x1001dcd9f: mov qword ptr [rip + 0xab1b5a], r8 ; 0x100c8e900
0x1001dcda6: mov rax, qword ptr [rip + 0xa2aa2b] ; 0x100c077d8 -> 0x1001db410 __Z18GetMetaClassByTypeIP11CameraGuideERK9MetaClassv
0x1001dcdad: mov qword ptr [rip + 0xab1b54], rax ; 0x100c8e908
0x1001dcdb4: mov qword ptr [rip + 0xab1b51], 0xffffffffffffffff ; 0x100c8e910
0x1001dcdbf: mov qword ptr [rip + 0xab1b52], r14 ; 0x100c8e918
0x1001dcdc6: mov qword ptr [rip + 0xab1b4f], 0 ; 0x100c8e920
0x1001dcdd1: lea rsi, [rip + 0x99be8b] ; 0x100b78c63 quat
0x1001dcdd8: mov qword ptr [rip + 0xab1b49], rsi ; 0x100c8e928
0x1001dcddf: lea rsi, [rip + 0xab1b42] ; 0x100c8e928
0x1001dcde6: mov qword ptr [rip + 0xab1b3f], 0 ; 0x100c8e930
0x1001dcdf1: mov qword ptr [rip + 0xab1b40], rcx ; 0x100c8e938
0x1001dcdf8: mov qword ptr [rip + 0xab1b45], 0x20 ; 0x100c8e948
0x1001dce03: mov rcx, qword ptr [rip + 0xa29fb6] ; 0x100c06dc0 -> 0x1001db420 __Z17GetMetaTypeByTypeIN10Vectormath3Aos4QuatEERK8MetaTypev
0x1001dce0a: mov qword ptr [rip + 0xab1b3f], rcx ; 0x100c8e950
0x1001dce11: mov qword ptr [rip + 0xab1b40], rax ; 0x100c8e958
0x1001dce18: mov qword ptr [rip + 0xab1b3d], 0xffffffffffffffff ; 0x100c8e960
0x1001dce23: mov qword ptr [rip + 0xab1b3e], r14 ; 0x100c8e968
0x1001dce2a: mov qword ptr [rip + 0xab1b3b], 0 ; 0x100c8e970
0x1001dce35: lea rcx, [rip + 0x99be2c] ; 0x100b78c68 scale
0x1001dce3c: mov qword ptr [rip + 0xab1b35], rcx ; 0x100c8e978
0x1001dce43: lea rcx, [rip + 0xab1b2e] ; 0x100c8e978
0x1001dce4a: mov qword ptr [rip + 0xab1b2b], 0 ; 0x100c8e980
0x1001dce55: mov qword ptr [rip + 0xab1b2c], rsi ; 0x100c8e988
0x1001dce5c: mov qword ptr [rip + 0xab1b31], 0x30 ; 0x100c8e998
0x1001dce67: mov qword ptr [rip + 0xab1b32], r8 ; 0x100c8e9a0
0x1001dce6e: mov qword ptr [rip + 0xab1b33], rax ; 0x100c8e9a8
0x1001dce75: mov qword ptr [rip + 0xab1b30], 0xffffffffffffffff ; 0x100c8e9b0
0x1001dce80: mov qword ptr [rip + 0xab1b31], r14 ; 0x100c8e9b8
0x1001dce87: mov qword ptr [rip + 0xab1b2e], 0 ; 0x100c8e9c0
0x1001dce92: lea rsi, [rip + 0x99bdd5] ; 0x100b78c6e range
0x1001dce99: mov qword ptr [rip + 0xab1b28], rsi ; 0x100c8e9c8
0x1001dcea0: lea rsi, [rip + 0xab1b21] ; 0x100c8e9c8
0x1001dcea7: mov qword ptr [rip + 0xab1b2a], rcx ; 0x100c8e9d8
0x1001dceae: mov qword ptr [rip + 0xab1b2f], 0x44 ; 0x100c8e9e8
0x1001dceb9: mov rcx, qword ptr [rip + 0xa2a6a0] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1001dcec0: mov qword ptr [rip + 0xab1b29], rcx ; 0x100c8e9f0
0x1001dcec7: mov qword ptr [rip + 0xab1b2a], rax ; 0x100c8e9f8
0x1001dcece: mov qword ptr [rip + 0xab1b27], 0xffffffffffffffff ; 0x100c8ea00
0x1001dced9: mov qword ptr [rip + 0xab1b28], r14 ; 0x100c8ea08
0x1001dcee0: mov qword ptr [rip + 0xab1b25], 0 ; 0x100c8ea10
0x1001dceeb: lea rdi, [rip + 0x99bd82] ; 0x100b78c74 5.0
0x1001dcef2: vmovq xmm0, rdi
0x1001dcef7: lea rdi, [rip + 0x981b04] ; 0x100b5ea02 Tool_DefaultValue
0x1001dcefe: vmovq xmm1, rdi
0x1001dcf03: vpunpcklqdq xmm0, xmm1, xmm0
0x1001dcf07: vmovdqa xmmword ptr [rip + 0x1c003a1], xmm0 ; 0x101ddd2b0
0x1001dcf0f: lea rdi, [rip + 0x1c0039a] ; 0x101ddd2b0
0x1001dcf16: mov qword ptr [rip + 0x1c0039f], 0 ; 0x101ddd2c0
0x1001dcf21: lea rbx, [rip + 0x99bd62] ; 0x100b78c8a (0.0, 30.0)
0x1001dcf28: vmovq xmm0, rbx
0x1001dcf2d: lea rbx, [rip + 0x99bd44] ; 0x100b78c78 Tool_MinMaxValues
0x1001dcf34: vmovq xmm2, rbx
0x1001dcf39: vpunpcklqdq xmm0, xmm2, xmm0
0x1001dcf3d: vmovdqa xmmword ptr [rip + 0x1c0038b], xmm0 ; 0x101ddd2d0
0x1001dcf45: lea rbx, [rip + 0x1c00384] ; 0x101ddd2d0
0x1001dcf4c: mov qword ptr [rip + 0x1c0038d], rdi ; 0x101ddd2e0
0x1001dcf53: mov qword ptr [rip + 0xab1a76], rbx ; 0x100c8e9d0
0x1001dcf5a: lea rdi, [rip + 0x99bd35] ; 0x100b78c96 lensPreset
0x1001dcf61: mov qword ptr [rip + 0xab1ab0], rdi ; 0x100c8ea18
0x1001dcf68: lea rdi, [rip + 0xab1aa9] ; 0x100c8ea18
0x1001dcf6f: mov qword ptr [rip + 0xab1ab2], rsi ; 0x100c8ea28
0x1001dcf76: mov qword ptr [rip + 0xab1ab7], 0x48 ; 0x100c8ea38
0x1001dcf81: mov qword ptr [rip + 0xab1ab8], r15 ; 0x100c8ea40
0x1001dcf88: mov qword ptr [rip + 0xab1ab9], rax ; 0x100c8ea48
0x1001dcf8f: mov qword ptr [rip + 0xab1ab6], 0xffffffffffffffff ; 0x100c8ea50
0x1001dcf9a: mov qword ptr [rip + 0xab1ab7], r14 ; 0x100c8ea58
0x1001dcfa1: mov qword ptr [rip + 0xab1ab4], 0 ; 0x100c8ea60
0x1001dcfac: vmovq xmm0, r13
0x1001dcfb1: vpunpcklqdq xmm0, xmm1, xmm0
0x1001dcfb5: vmovdqa xmmword ptr [rip + 0x1c00333], xmm0 ; 0x101ddd2f0
0x1001dcfbd: lea rsi, [rip + 0x1c0032c] ; 0x101ddd2f0
0x1001dcfc4: mov qword ptr [rip + 0x1c00331], 0 ; 0x101ddd300
0x1001dcfcf: mov qword ptr [rip + 0xab1a4a], rsi ; 0x100c8ea20
0x1001dcfd6: lea rsi, [rip + 0x99bcc4] ; 0x100b78ca1 snappiness
0x1001dcfdd: mov qword ptr [rip + 0xab1a84], rsi ; 0x100c8ea68
0x1001dcfe4: lea rsi, [rip + 0xab1a7d] ; 0x100c8ea68
0x1001dcfeb: mov qword ptr [rip + 0xab1a86], rdi ; 0x100c8ea78
0x1001dcff2: mov qword ptr [rip + 0xab1a8b], 0x40 ; 0x100c8ea88
0x1001dcffd: mov qword ptr [rip + 0xab1a8c], rcx ; 0x100c8ea90
0x1001dd004: mov qword ptr [rip + 0xab1a8d], rax ; 0x100c8ea98
0x1001dd00b: mov qword ptr [rip + 0xab1a8a], 0xffffffffffffffff ; 0x100c8eaa0
0x1001dd016: mov qword ptr [rip + 0xab1a8b], r14 ; 0x100c8eaa8
0x1001dd01d: mov qword ptr [rip + 0xab1a88], 0 ; 0x100c8eab0
0x1001dd028: lea rdi, [rip + 0x99711f] ; 0x100b7414e 1.0
0x1001dd02f: vmovq xmm0, rdi
0x1001dd034: vpunpcklqdq xmm8, xmm1, xmm0
0x1001dd038: vmovdqa xmmword ptr [rip + 0x1c002d0], xmm8 ; 0x101ddd310
0x1001dd040: lea rdi, [rip + 0x1c002c9] ; 0x101ddd310
0x1001dd047: mov qword ptr [rip + 0x1c002ce], 0 ; 0x101ddd320
0x1001dd052: mov qword ptr [rip + 0xab1a17], rdi ; 0x100c8ea70
0x1001dd059: lea rdi, [rip + 0x99bc4c] ; 0x100b78cac fov
0x1001dd060: mov qword ptr [rip + 0xab1a51], rdi ; 0x100c8eab8
0x1001dd067: lea rdi, [rip + 0xab1a4a] ; 0x100c8eab8
0x1001dd06e: mov qword ptr [rip + 0xab1a53], rsi ; 0x100c8eac8
0x1001dd075: mov qword ptr [rip + 0xab1a58], 0x4c ; 0x100c8ead8
0x1001dd080: mov qword ptr [rip + 0xab1a59], rcx ; 0x100c8eae0
0x1001dd087: mov qword ptr [rip + 0xab1a5a], rax ; 0x100c8eae8
0x1001dd08e: mov qword ptr [rip + 0xab1a57], 0xffffffffffffffff ; 0x100c8eaf0
0x1001dd099: mov qword ptr [rip + 0xab1a58], r14 ; 0x100c8eaf8
0x1001dd0a0: mov qword ptr [rip + 0xab1a55], 0 ; 0x100c8eb00
0x1001dd0ab: lea rsi, [rip + 0x99bbfe] ; 0x100b78cb0 60.0
0x1001dd0b2: vmovq xmm0, rsi
0x1001dd0b7: vpunpcklqdq xmm0, xmm1, xmm0
0x1001dd0bb: vmovdqa xmmword ptr [rip + 0x1c0026d], xmm0 ; 0x101ddd330
0x1001dd0c3: lea rsi, [rip + 0x1c00266] ; 0x101ddd330
0x1001dd0ca: mov qword ptr [rip + 0x1c0026b], 0 ; 0x101ddd340
0x1001dd0d5: lea rbx, [rip + 0x99bbd9] ; 0x100b78cb5 (30.0, 90.0)
0x1001dd0dc: vmovq xmm3, rbx
0x1001dd0e1: vpunpcklqdq xmm3, xmm2, xmm3
0x1001dd0e5: vmovdqa xmmword ptr [rip + 0x1c00263], xmm3 ; 0x101ddd350
0x1001dd0ed: lea rbx, [rip + 0x1c0025c] ; 0x101ddd350
0x1001dd0f4: mov qword ptr [rip + 0x1c00265], rsi ; 0x101ddd360
0x1001dd0fb: mov qword ptr [rip + 0xab19be], rbx ; 0x100c8eac0
0x1001dd102: lea rsi, [rip + 0x99bbb9] ; 0x100b78cc2 screenSize
0x1001dd109: mov qword ptr [rip + 0xab19f8], rsi ; 0x100c8eb08
0x1001dd110: lea rsi, [rip + 0xab19f1] ; 0x100c8eb08
0x1001dd117: mov qword ptr [rip + 0xab19fa], rdi ; 0x100c8eb18
0x1001dd11e: mov qword ptr [rip + 0xab19ff], 0x50 ; 0x100c8eb28
0x1001dd129: mov qword ptr [rip + 0xab1a00], rcx ; 0x100c8eb30
0x1001dd130: mov qword ptr [rip + 0xab1a01], rax ; 0x100c8eb38
0x1001dd137: mov qword ptr [rip + 0xab19fe], 0xffffffffffffffff ; 0x100c8eb40
0x1001dd142: mov qword ptr [rip + 0xab19ff], r14 ; 0x100c8eb48
0x1001dd149: mov qword ptr [rip + 0xab19fc], 0 ; 0x100c8eb50
0x1001dd154: lea rdi, [rip + 0x99bb72] ; 0x100b78ccd 0.35
0x1001dd15b: vmovq xmm3, rdi
0x1001dd160: vpunpcklqdq xmm3, xmm1, xmm3
0x1001dd164: vmovdqa xmmword ptr [rip + 0x1c00204], xmm3 ; 0x101ddd370
0x1001dd16c: lea rdi, [rip + 0x1c001fd] ; 0x101ddd370
0x1001dd173: mov qword ptr [rip + 0x1c00202], 0 ; 0x101ddd380
0x1001dd17e: lea rbx, [rip + 0x99bb4d] ; 0x100b78cd2 (0.05, 2.0)
0x1001dd185: vmovq xmm3, rbx
0x1001dd18a: vpunpcklqdq xmm3, xmm2, xmm3
0x1001dd18e: vmovdqa xmmword ptr [rip + 0x1c001fa], xmm3 ; 0x101ddd390
0x1001dd196: lea rbx, [rip + 0x1c001f3] ; 0x101ddd390
0x1001dd19d: mov qword ptr [rip + 0x1c001fc], rdi ; 0x101ddd3a0
0x1001dd1a4: mov qword ptr [rip + 0xab1965], rbx ; 0x100c8eb10
0x1001dd1ab: lea rdi, [rip + 0x999ea7] ; 0x100b77059 enabled
0x1001dd1b2: mov qword ptr [rip + 0xab199f], rdi ; 0x100c8eb58
0x1001dd1b9: lea rdi, [rip + 0xab1998] ; 0x100c8eb58
0x1001dd1c0: mov qword ptr [rip + 0xab19a1], rsi ; 0x100c8eb68
0x1001dd1c7: mov qword ptr [rip + 0xab19a6], 0x80 ; 0x100c8eb78
0x1001dd1d2: mov rdx, qword ptr [rip + 0xa2a37f] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1001dd1d9: mov qword ptr [rip + 0xab19a0], rdx ; 0x100c8eb80
0x1001dd1e0: mov qword ptr [rip + 0xab19a1], rax ; 0x100c8eb88
0x1001dd1e7: mov qword ptr [rip + 0xab199e], 0xffffffffffffffff ; 0x100c8eb90
0x1001dd1f2: mov qword ptr [rip + 0xab199f], r14 ; 0x100c8eb98
0x1001dd1f9: mov qword ptr [rip + 0xab199c], 0 ; 0x100c8eba0
0x1001dd204: lea rsi, [rip + 0x9817d4] ; 0x100b5e9df true
0x1001dd20b: vmovq xmm3, rsi
0x1001dd210: vpunpcklqdq xmm9, xmm1, xmm3
0x1001dd214: vmovdqa xmmword ptr [rip + 0x1c00194], xmm9 ; 0x101ddd3b0
0x1001dd21c: lea rsi, [rip + 0x1c0018d] ; 0x101ddd3b0
0x1001dd223: mov qword ptr [rip + 0x1c00192], 0 ; 0x101ddd3c0
0x1001dd22e: mov qword ptr [rip + 0xab192b], rsi ; 0x100c8eb60
0x1001dd235: lea rsi, [rip + 0x99baa2] ; 0x100b78cde lineOfSightNeeded
0x1001dd23c: mov qword ptr [rip + 0xab1965], rsi ; 0x100c8eba8
0x1001dd243: lea rsi, [rip + 0xab195e] ; 0x100c8eba8
0x1001dd24a: mov qword ptr [rip + 0xab1967], rdi ; 0x100c8ebb8
0x1001dd251: mov qword ptr [rip + 0xab196c], 0x81 ; 0x100c8ebc8
0x1001dd25c: mov qword ptr [rip + 0xab196d], rdx ; 0x100c8ebd0
0x1001dd263: mov qword ptr [rip + 0xab196e], rax ; 0x100c8ebd8
0x1001dd26a: mov qword ptr [rip + 0xab196b], 0xffffffffffffffff ; 0x100c8ebe0
0x1001dd275: mov qword ptr [rip + 0xab196c], r14 ; 0x100c8ebe8
0x1001dd27c: mov qword ptr [rip + 0xab1969], 0 ; 0x100c8ebf0
0x1001dd287: lea rdi, [rip + 0x9c5d9e] ; 0x100ba302c false
0x1001dd28e: vmovq xmm4, rdi
0x1001dd293: vpunpcklqdq xmm4, xmm1, xmm4
0x1001dd297: vmovdqa xmmword ptr [rip + 0x1c00131], xmm4 ; 0x101ddd3d0
0x1001dd29f: lea rdi, [rip + 0x1c0012a] ; 0x101ddd3d0
0x1001dd2a6: mov qword ptr [rip + 0x1c0012f], 0 ; 0x101ddd3e0
0x1001dd2b1: lea rbx, [rip + 0x99ba38] ; 0x100b78cf0 "check raycast from avatar to marker"
0x1001dd2b8: vmovq xmm6, rbx
0x1001dd2bd: lea rbx, [rip + 0x99aef5] ; 0x100b781b9 Tool_Description
0x1001dd2c4: vmovq xmm5, rbx
0x1001dd2c9: vpunpcklqdq xmm6, xmm5, xmm6
0x1001dd2cd: vmovdqa xmmword ptr [rip + 0x1c0011b], xmm6 ; 0x101ddd3f0
0x1001dd2d5: lea rbx, [rip + 0x1c00114] ; 0x101ddd3f0
0x1001dd2dc: mov qword ptr [rip + 0x1c0011d], rdi ; 0x101ddd400
0x1001dd2e3: mov qword ptr [rip + 0xab18c6], rbx ; 0x100c8ebb0
0x1001dd2ea: lea rdi, [rip + 0x99ba25] ; 0x100b78d16 overridePitchYaw
0x1001dd2f1: mov qword ptr [rip + 0xab1900], rdi ; 0x100c8ebf8
0x1001dd2f8: lea rdi, [rip + 0xab18f9] ; 0x100c8ebf8
0x1001dd2ff: mov qword ptr [rip + 0xab1902], rsi ; 0x100c8ec08
0x1001dd306: mov qword ptr [rip + 0xab1907], 0x82 ; 0x100c8ec18
0x1001dd311: mov qword ptr [rip + 0xab1908], rdx ; 0x100c8ec20
0x1001dd318: mov qword ptr [rip + 0xab1909], rax ; 0x100c8ec28
0x1001dd31f: mov qword ptr [rip + 0xab1906], 0xffffffffffffffff ; 0x100c8ec30
0x1001dd32a: mov qword ptr [rip + 0xab1907], r14 ; 0x100c8ec38
0x1001dd331: mov qword ptr [rip + 0xab1904], 0 ; 0x100c8ec40
0x1001dd33c: vmovdqa xmmword ptr [rip + 0x1c000cc], xmm4 ; 0x101ddd410
0x1001dd344: lea rsi, [rip + 0x1c000c5] ; 0x101ddd410
0x1001dd34b: mov qword ptr [rip + 0x1c000ca], 0 ; 0x101ddd420
0x1001dd356: lea rbx, [rip + 0x99b9ca] ; 0x100b78d27 "camera guide will override player input"
0x1001dd35d: vmovq xmm6, rbx
0x1001dd362: vpunpcklqdq xmm6, xmm5, xmm6
0x1001dd366: vmovdqa xmmword ptr [rip + 0x1c000c2], xmm6 ; 0x101ddd430
0x1001dd36e: lea rbx, [rip + 0x1c000bb] ; 0x101ddd430
0x1001dd375: mov qword ptr [rip + 0x1c000c4], rsi ; 0x101ddd440
0x1001dd37c: mov qword ptr [rip + 0xab187d], rbx ; 0x100c8ec00
0x1001dd383: lea rsi, [rip + 0x982cb2] ; 0x100b6003c Tool_Export
0x1001dd38a: vmovq xmm6, rsi
0x1001dd38f: vpunpcklqdq xmm6, xmm6, xmm3
0x1001dd393: vmovdqa xmmword ptr [rip + 0x1c000b5], xmm6 ; 0x101ddd450
0x1001dd39b: lea rsi, [rip + 0x1c000ae] ; 0x101ddd450
0x1001dd3a2: mov rbx, qword ptr [rip + 0x1bffeaf] ; 0x101ddd258
0x1001dd3a9: mov qword ptr [rip + 0x1c000b0], rbx ; 0x101ddd460
0x1001dd3b0: mov qword ptr [rip + 0x1bffea1], rsi ; 0x101ddd258
0x1001dd3b7: lea rsi, [rip + 0x99b993] ; 0x100b78d51 camPosition
0x1001dd3be: mov qword ptr [rip + 0xab1883], rsi ; 0x100c8ec48
0x1001dd3c5: lea rsi, [rip + 0xab187c] ; 0x100c8ec48
0x1001dd3cc: mov qword ptr [rip + 0xab1885], rdi ; 0x100c8ec58
0x1001dd3d3: mov qword ptr [rip + 0xab188a], 0x58 ; 0x100c8ec68
0x1001dd3de: mov rdi, qword ptr [rip + 0xa29ee3] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x1001dd3e5: mov qword ptr [rip + 0xab1884], rdi ; 0x100c8ec70
0x1001dd3ec: mov qword ptr [rip + 0xab1885], rax ; 0x100c8ec78
0x1001dd3f3: mov qword ptr [rip + 0xab1882], 0xffffffffffffffff ; 0x100c8ec80
0x1001dd3fe: mov qword ptr [rip + 0xab1883], r14 ; 0x100c8ec88
0x1001dd405: mov qword ptr [rip + 0xab1880], 0 ; 0x100c8ec90
0x1001dd410: lea rdi, [rip + 0x987222] ; 0x100b64639 Marker
0x1001dd417: vmovq xmm6, rdi
0x1001dd41c: lea rdi, [rip + 0x9815c9] ; 0x100b5e9ec Tool_ClumpType
0x1001dd423: vmovq xmm7, rdi
0x1001dd428: vpunpcklqdq xmm6, xmm7, xmm6
0x1001dd42c: vmovdqa xmmword ptr [rip + 0x1c0003c], xmm6 ; 0x101ddd470
0x1001dd434: lea rdi, [rip + 0x1c00035] ; 0x101ddd470
0x1001dd43b: mov qword ptr [rip + 0x1c0003a], 0 ; 0x101ddd480
0x1001dd446: lea rbx, [rip + 0x9815cc] ; 0x100b5ea19 Tool_Nullable
0x1001dd44d: vmovq xmm6, rbx
0x1001dd452: vpunpcklqdq xmm10, xmm6, xmm3
0x1001dd456: vmovdqa xmmword ptr [rip + 0x1c00032], xmm10 ; 0x101ddd490
0x1001dd45e: lea rbx, [rip + 0x1c0002b] ; 0x101ddd490
0x1001dd465: mov qword ptr [rip + 0x1c00034], rdi ; 0x101ddd4a0
0x1001dd46c: lea rdi, [rip + 0x981624] ; 0x100b5ea97 null
0x1001dd473: vmovq xmm6, rdi
0x1001dd478: vpunpcklqdq xmm6, xmm1, xmm6
0x1001dd47c: vmovdqa xmmword ptr [rip + 0x1c0002c], xmm6 ; 0x101ddd4b0
0x1001dd484: lea rdi, [rip + 0x1c00025] ; 0x101ddd4b0
0x1001dd48b: mov qword ptr [rip + 0x1c0002e], rbx ; 0x101ddd4c0
0x1001dd492: mov qword ptr [rip + 0xab17b7], rdi ; 0x100c8ec50
0x1001dd499: lea rdi, [rip + 0x99b8bd] ; 0x100b78d5d camPositionFlexibility
0x1001dd4a0: mov qword ptr [rip + 0xab17f1], rdi ; 0x100c8ec98
0x1001dd4a7: lea rdi, [rip + 0xab17ea] ; 0x100c8ec98
0x1001dd4ae: mov qword ptr [rip + 0xab17f3], rsi ; 0x100c8eca8
0x1001dd4b5: mov qword ptr [rip + 0xab17f8], 0x60 ; 0x100c8ecb8
0x1001dd4c0: mov qword ptr [rip + 0xab17f9], rcx ; 0x100c8ecc0
0x1001dd4c7: mov qword ptr [rip + 0xab17fa], rax ; 0x100c8ecc8
0x1001dd4ce: mov qword ptr [rip + 0xab17f7], 0xffffffffffffffff ; 0x100c8ecd0
0x1001dd4d9: mov qword ptr [rip + 0xab17f8], r14 ; 0x100c8ecd8
0x1001dd4e0: mov qword ptr [rip + 0xab17f5], 0 ; 0x100c8ece0
0x1001dd4eb: vmovdqa xmmword ptr [rip + 0x1bfffdd], xmm8 ; 0x101ddd4d0
0x1001dd4f3: lea rsi, [rip + 0x1bfffd6] ; 0x101ddd4d0
0x1001dd4fa: mov qword ptr [rip + 0x1bfffdb], 0 ; 0x101ddd4e0
0x1001dd505: lea rbx, [rip + 0x99b868] ; 0x100b78d74 (0.0, 1.0)
0x1001dd50c: vmovq xmm7, rbx
0x1001dd511: vpunpcklqdq xmm7, xmm2, xmm7
0x1001dd515: vmovdqa xmmword ptr [rip + 0x1bfffd3], xmm7 ; 0x101ddd4f0
0x1001dd51d: lea rbx, [rip + 0x1bfffcc] ; 0x101ddd4f0
0x1001dd524: mov qword ptr [rip + 0x1bfffd5], rsi ; 0x101ddd500
0x1001dd52b: mov qword ptr [rip + 0xab176e], rbx ; 0x100c8eca0
0x1001dd532: lea rsi, [rip + 0x99b846] ; 0x100b78d7f effectiveDegree
0x1001dd539: mov qword ptr [rip + 0xab17a8], rsi ; 0x100c8ece8
0x1001dd540: lea rsi, [rip + 0xab17a1] ; 0x100c8ece8
0x1001dd547: mov qword ptr [rip + 0xab17aa], rdi ; 0x100c8ecf8
0x1001dd54e: mov qword ptr [rip + 0xab17af], 0x64 ; 0x100c8ed08
0x1001dd559: mov qword ptr [rip + 0xab17b0], rcx ; 0x100c8ed10
0x1001dd560: mov qword ptr [rip + 0xab17b1], rax ; 0x100c8ed18
0x1001dd567: mov qword ptr [rip + 0xab17ae], 0xffffffffffffffff ; 0x100c8ed20
0x1001dd572: mov qword ptr [rip + 0xab17af], r14 ; 0x100c8ed28
0x1001dd579: mov qword ptr [rip + 0xab17ac], 0 ; 0x100c8ed30
0x1001dd584: vmovdqa xmmword ptr [rip + 0x1bfff84], xmm0 ; 0x101ddd510
0x1001dd58c: lea rdi, [rip + 0x1bfff7d] ; 0x101ddd510
0x1001dd593: mov qword ptr [rip + 0x1bfff82], 0 ; 0x101ddd520
0x1001dd59e: lea rbx, [rip + 0x99b7ea] ; 0x100b78d8f (0.0, 180.0)
0x1001dd5a5: vmovq xmm0, rbx
0x1001dd5aa: vpunpcklqdq xmm0, xmm2, xmm0
0x1001dd5ae: vmovdqa xmmword ptr [rip + 0x1bfff7a], xmm0 ; 0x101ddd530
0x1001dd5b6: lea rbx, [rip + 0x1bfff73] ; 0x101ddd530
0x1001dd5bd: mov qword ptr [rip + 0x1bfff7c], rdi ; 0x101ddd540
0x1001dd5c4: mov qword ptr [rip + 0xab1725], rbx ; 0x100c8ecf0
0x1001dd5cb: lea rdi, [rip + 0x99b7ca] ; 0x100b78d9c zoomType
0x1001dd5d2: mov qword ptr [rip + 0xab175f], rdi ; 0x100c8ed38
0x1001dd5d9: lea rdi, [rip + 0xab1758] ; 0x100c8ed38
0x1001dd5e0: mov qword ptr [rip + 0xab1761], rsi ; 0x100c8ed48
0x1001dd5e7: mov qword ptr [rip + 0xab1766], 0x68 ; 0x100c8ed58
0x1001dd5f2: mov rsi, qword ptr [rip + 0xa29657] ; 0x100c06c50 -> 0x1001daff0 __Z17GetMetaTypeByTypeI15CameraGuideZoomERK8MetaTypev
0x1001dd5f9: mov qword ptr [rip + 0xab1760], rsi ; 0x100c8ed60
0x1001dd600: mov qword ptr [rip + 0xab1761], rax ; 0x100c8ed68
0x1001dd607: mov qword ptr [rip + 0xab175e], 0xffffffffffffffff ; 0x100c8ed70
0x1001dd612: mov qword ptr [rip + 0xab175f], r14 ; 0x100c8ed78
0x1001dd619: mov qword ptr [rip + 0xab175c], 0 ; 0x100c8ed80
0x1001dd624: lea rsi, [rip + 0x99b581] ; 0x100b78bac kCameraGuideZoom_None
0x1001dd62b: vmovq xmm0, rsi
0x1001dd630: vpunpcklqdq xmm0, xmm1, xmm0
0x1001dd634: vmovdqa xmmword ptr [rip + 0x1bfff14], xmm0 ; 0x101ddd550
0x1001dd63c: lea rsi, [rip + 0x1bfff0d] ; 0x101ddd550
0x1001dd643: mov qword ptr [rip + 0x1bfff12], 0 ; 0x101ddd560
0x1001dd64e: mov qword ptr [rip + 0xab16eb], rsi ; 0x100c8ed40
0x1001dd655: lea rsi, [rip + 0x99b749] ; 0x100b78da5 lookAtMarkers
0x1001dd65c: mov qword ptr [rip + 0xab1725], rsi ; 0x100c8ed88
0x1001dd663: lea rsi, [rip + 0xab171e] ; 0x100c8ed88
0x1001dd66a: mov qword ptr [rip + 0xab1727], rdi ; 0x100c8ed98
0x1001dd671: mov qword ptr [rip + 0xab172c], 0x69 ; 0x100c8eda8
0x1001dd67c: mov qword ptr [rip + 0xab172d], rdx ; 0x100c8edb0
0x1001dd683: mov qword ptr [rip + 0xab172e], rax ; 0x100c8edb8
0x1001dd68a: mov qword ptr [rip + 0xab172b], 0xffffffffffffffff ; 0x100c8edc0
0x1001dd695: mov qword ptr [rip + 0xab172c], r14 ; 0x100c8edc8
0x1001dd69c: mov qword ptr [rip + 0xab1729], 0 ; 0x100c8edd0
0x1001dd6a7: vmovdqa xmmword ptr [rip + 0x1bffec1], xmm4 ; 0x101ddd570
0x1001dd6af: lea rdi, [rip + 0x1bffeba] ; 0x101ddd570
0x1001dd6b6: mov qword ptr [rip + 0x1bffebf], 0 ; 0x101ddd580
0x1001dd6c1: lea rbx, [rip + 0x99b6eb] ; 0x100b78db3 "camera will look at the markers (otherwise will use them as camera position)"
0x1001dd6c8: vmovq xmm0, rbx
0x1001dd6cd: vpunpcklqdq xmm0, xmm5, xmm0
0x1001dd6d1: vmovdqa xmmword ptr [rip + 0x1bffeb7], xmm0 ; 0x101ddd590
0x1001dd6d9: lea rbx, [rip + 0x1bffeb0] ; 0x101ddd590
0x1001dd6e0: mov qword ptr [rip + 0x1bffeb9], rdi ; 0x101ddd5a0
0x1001dd6e7: mov qword ptr [rip + 0xab16a2], rbx ; 0x100c8ed90
0x1001dd6ee: lea rdi, [rip + 0x99b70d] ; 0x100b78e02 canBlendMarkers
0x1001dd6f5: mov qword ptr [rip + 0xab16dc], rdi ; 0x100c8edd8
0x1001dd6fc: lea rdi, [rip + 0xab16d5] ; 0x100c8edd8
0x1001dd703: mov qword ptr [rip + 0xab16de], rsi ; 0x100c8ede8
0x1001dd70a: mov qword ptr [rip + 0xab16e3], 0x6a ; 0x100c8edf8
0x1001dd715: mov rbx, rdx
0x1001dd718: mov qword ptr [rip + 0xab16e1], rbx ; 0x100c8ee00
0x1001dd71f: mov qword ptr [rip + 0xab16e2], rax ; 0x100c8ee08
0x1001dd726: mov qword ptr [rip + 0xab16df], 0xffffffffffffffff ; 0x100c8ee10
0x1001dd731: mov qword ptr [rip + 0xab16e0], r14 ; 0x100c8ee18
0x1001dd738: mov qword ptr [rip + 0xab16dd], 0 ; 0x100c8ee20
0x1001dd743: vmovdqa xmmword ptr [rip + 0x1bffe65], xmm9 ; 0x101ddd5b0
0x1001dd74b: lea rsi, [rip + 0x1bffe5e] ; 0x101ddd5b0
0x1001dd752: mov qword ptr [rip + 0x1bffe63], 0 ; 0x101ddd5c0
0x1001dd75d: mov qword ptr [rip + 0xab167c], rsi ; 0x100c8ede0
0x1001dd764: lea rsi, [rip + 0x99b6a7] ; 0x100b78e12 avatarScreenPosEnabled
0x1001dd76b: mov qword ptr [rip + 0xab16b6], rsi ; 0x100c8ee28
0x1001dd772: lea rsi, [rip + 0xab16af] ; 0x100c8ee28
0x1001dd779: mov qword ptr [rip + 0xab16b8], rdi ; 0x100c8ee38
0x1001dd780: mov qword ptr [rip + 0xab16bd], 0x6b ; 0x100c8ee48
0x1001dd78b: mov qword ptr [rip + 0xab16be], rbx ; 0x100c8ee50
0x1001dd792: mov qword ptr [rip + 0xab16bf], rax ; 0x100c8ee58
0x1001dd799: mov qword ptr [rip + 0xab16bc], 0xffffffffffffffff ; 0x100c8ee60
0x1001dd7a4: mov qword ptr [rip + 0xab16bd], r14 ; 0x100c8ee68
0x1001dd7ab: mov qword ptr [rip + 0xab16ba], 0 ; 0x100c8ee70
0x1001dd7b6: vmovdqa xmmword ptr [rip + 0x1bffe12], xmm4 ; 0x101ddd5d0
0x1001dd7be: lea rdi, [rip + 0x1bffe0b] ; 0x101ddd5d0
0x1001dd7c5: mov qword ptr [rip + 0x1bffe10], 0 ; 0x101ddd5e0
0x1001dd7d0: mov qword ptr [rip + 0xab1659], rdi ; 0x100c8ee30
0x1001dd7d7: lea rdi, [rip + 0x99b64b] ; 0x100b78e29 avatarScreenPos
0x1001dd7de: mov qword ptr [rip + 0xab1693], rdi ; 0x100c8ee78
0x1001dd7e5: lea rdi, [rip + 0xab168c] ; 0x100c8ee78
0x1001dd7ec: mov qword ptr [rip + 0xab1695], rsi ; 0x100c8ee88
0x1001dd7f3: mov qword ptr [rip + 0xab169a], 0x70 ; 0x100c8ee98
0x1001dd7fe: mov qword ptr [rip + 0xab169b], r8 ; 0x100c8eea0
0x1001dd805: mov qword ptr [rip + 0xab169c], rax ; 0x100c8eea8
0x1001dd80c: mov qword ptr [rip + 0xab1699], 0xffffffffffffffff ; 0x100c8eeb0
0x1001dd817: mov qword ptr [rip + 0xab169a], r14 ; 0x100c8eeb8
0x1001dd81e: mov qword ptr [rip + 0xab1697], 0 ; 0x100c8eec0
0x1001dd829: lea rdx, [rip + 0x99b609] ; 0x100b78e39 (0.0, 0.0, 0.0)
0x1001dd830: vmovq xmm0, rdx
0x1001dd835: vpunpcklqdq xmm0, xmm1, xmm0
0x1001dd839: vmovdqa xmmword ptr [rip + 0x1bffdaf], xmm0 ; 0x101ddd5f0
0x1001dd841: lea rdx, [rip + 0x1bffda8] ; 0x101ddd5f0
0x1001dd848: mov qword ptr [rip + 0x1bffdad], 0 ; 0x101ddd600
0x1001dd853: lea rsi, [rip + 0x99b5ef] ; 0x100b78e49 Tool_IsVector2
0x1001dd85a: vmovq xmm0, rsi
0x1001dd85f: vpunpcklqdq xmm0, xmm0, xmm3
0x1001dd863: vmovdqa xmmword ptr [rip + 0x1bffda5], xmm0 ; 0x101ddd610
0x1001dd86b: lea rsi, [rip + 0x1bffd9e] ; 0x101ddd610
0x1001dd872: mov qword ptr [rip + 0x1bffda7], rdx ; 0x101ddd620
0x1001dd879: mov qword ptr [rip + 0xab1600], rsi ; 0x100c8ee80
0x1001dd880: lea rdx, [rip + 0x99b5d1] ; 0x100b78e58 overrideWhiskers
0x1001dd887: mov qword ptr [rip + 0xab163a], rdx ; 0x100c8eec8
0x1001dd88e: lea rdx, [rip + 0xab1633] ; 0x100c8eec8
0x1001dd895: mov qword ptr [rip + 0xab163c], rdi ; 0x100c8eed8
0x1001dd89c: mov qword ptr [rip + 0xab1641], 0x83 ; 0x100c8eee8
0x1001dd8a7: mov qword ptr [rip + 0xab1642], rbx ; 0x100c8eef0
0x1001dd8ae: mov qword ptr [rip + 0xab1643], rax ; 0x100c8eef8
0x1001dd8b5: mov qword ptr [rip + 0xab1640], 0xffffffffffffffff ; 0x100c8ef00
0x1001dd8c0: mov qword ptr [rip + 0xab1641], r14 ; 0x100c8ef08
0x1001dd8c7: mov qword ptr [rip + 0xab163e], 0 ; 0x100c8ef10
0x1001dd8d2: vmovdqa xmmword ptr [rip + 0x1bffd56], xmm4 ; 0x101ddd630
0x1001dd8da: lea rsi, [rip + 0x1bffd4f] ; 0x101ddd630
0x1001dd8e1: mov qword ptr [rip + 0x1bffd54], 0 ; 0x101ddd640
0x1001dd8ec: lea rdi, [rip + 0x99b576] ; 0x100b78e69 "camera guide turn won't get stopped by camera collision with level"
0x1001dd8f3: vmovq xmm0, rdi
0x1001dd8f8: vpunpcklqdq xmm0, xmm5, xmm0
0x1001dd8fc: vmovdqa xmmword ptr [rip + 0x1bffd4c], xmm0 ; 0x101ddd650
0x1001dd904: lea rdi, [rip + 0x1bffd45] ; 0x101ddd650
0x1001dd90b: mov qword ptr [rip + 0x1bffd4e], rsi ; 0x101ddd660
0x1001dd912: mov qword ptr [rip + 0xab15b7], rdi ; 0x100c8eed0
0x1001dd919: lea rsi, [rip + 0x999d0b] ; 0x100b7762b rail
0x1001dd920: mov qword ptr [rip + 0xab15f1], rsi ; 0x100c8ef18
0x1001dd927: lea rsi, [rip + 0xab15ea] ; 0x100c8ef18
0x1001dd92e: mov qword ptr [rip + 0xab15f3], rdx ; 0x100c8ef28
0x1001dd935: mov qword ptr [rip + 0xab15f8], 0x88 ; 0x100c8ef38
0x1001dd940: mov rdx, qword ptr [rip + 0xa29961] ; 0x100c072a8 -> 0x1000ec410 __Z17GetMetaTypeByTypeIP4RailERK8MetaTypev
0x1001dd947: mov qword ptr [rip + 0xab15f2], rdx ; 0x100c8ef40
0x1001dd94e: mov qword ptr [rip + 0xab15f3], rax ; 0x100c8ef48
0x1001dd955: mov qword ptr [rip + 0xab15f0], 0xffffffffffffffff ; 0x100c8ef50
0x1001dd960: mov qword ptr [rip + 0xab15f1], r14 ; 0x100c8ef58
0x1001dd967: mov qword ptr [rip + 0xab15ee], 0 ; 0x100c8ef60
0x1001dd972: vmovdqa xmmword ptr [rip + 0x1bffcf6], xmm10 ; 0x101ddd670
0x1001dd97a: lea rdx, [rip + 0x1bffcef] ; 0x101ddd670
0x1001dd981: mov qword ptr [rip + 0x1bffcf4], 0 ; 0x101ddd680
0x1001dd98c: vmovdqa xmmword ptr [rip + 0x1bffcfc], xmm6 ; 0x101ddd690
0x1001dd994: lea rdi, [rip + 0x1bffcf5] ; 0x101ddd690
0x1001dd99b: mov qword ptr [rip + 0x1bffcfe], rdx ; 0x101ddd6a0
0x1001dd9a2: mov qword ptr [rip + 0xab1577], rdi ; 0x100c8ef20
0x1001dd9a9: lea rdx, [rip + 0x99b4fe] ; 0x100b78eae railRadius
0x1001dd9b0: mov qword ptr [rip + 0xab15b1], rdx ; 0x100c8ef68
0x1001dd9b7: lea rdx, [rip + 0xab15aa] ; 0x100c8ef68
0x1001dd9be: mov qword ptr [rip + 0xab15b3], rsi ; 0x100c8ef78
0x1001dd9c5: mov qword ptr [rip + 0xab15b8], 0x90 ; 0x100c8ef88
0x1001dd9d0: mov qword ptr [rip + 0xab15b9], rcx ; 0x100c8ef90
0x1001dd9d7: mov qword ptr [rip + 0xab15ba], rax ; 0x100c8ef98
0x1001dd9de: mov qword ptr [rip + 0xab15b7], 0xffffffffffffffff ; 0x100c8efa0
0x1001dd9e9: mov qword ptr [rip + 0xab15b8], r14 ; 0x100c8efa8
0x1001dd9f0: mov qword ptr [rip + 0xab15b5], 0 ; 0x100c8efb0
0x1001dd9fb: vmovdqa xmmword ptr [rip + 0x1bffcad], xmm8 ; 0x101ddd6b0
0x1001dda03: lea rcx, [rip + 0x1bffca6] ; 0x101ddd6b0
0x1001dda0a: mov qword ptr [rip + 0x1bffcab], 0 ; 0x101ddd6c0
0x1001dda15: mov qword ptr [rip + 0xab1554], rcx ; 0x100c8ef70
0x1001dda1c: lea rcx, [rip + 0x999897] ; 0x100b772ba bstGuid
0x1001dda23: mov qword ptr [rip + 0xab158e], rcx ; 0x100c8efb8
0x1001dda2a: lea rcx, [rip + 0xab1587] ; 0x100c8efb8
0x1001dda31: mov qword ptr [rip + 0xab1584], 0 ; 0x100c8efc0
0x1001dda3c: mov qword ptr [rip + 0xab1585], rdx ; 0x100c8efc8
0x1001dda43: mov qword ptr [rip + 0xa9a216], rcx ; 0x100c77c60
0x1001dda4a: mov qword ptr [rip + 0xab1583], 0x84 ; 0x100c8efd8
0x1001dda55: mov rcx, qword ptr [rip + 0xa29b1c] ; 0x100c07578 -> 0x100021960 __Z17GetMetaTypeByTypeIjERK8MetaTypev
0x1001dda5c: mov qword ptr [rip + 0xab157d], rcx ; 0x100c8efe0
0x1001dda63: mov qword ptr [rip + 0xab157e], rax ; 0x100c8efe8
0x1001dda6a: mov qword ptr [rip + 0xab157b], 0xffffffffffffffff ; 0x100c8eff0
0x1001dda75: mov qword ptr [rip + 0xab157c], r14 ; 0x100c8eff8
0x1001dda7c: mov qword ptr [rip + 0xab1579], 0 ; 0x100c8f000
0x1001dda87: lea rcx, [rip + 0x9995b3] ; 0x100b77041 SetTransform
0x1001dda8e: mov qword ptr [rip + 0x1bffc33], rcx ; 0x101ddd6c8
0x1001dda95: lea rcx, [rip + 0x1bffc2c] ; 0x101ddd6c8
0x1001dda9c: mov qword ptr [rip + 0x1bffc29], 0 ; 0x101ddd6d0
0x1001ddaa7: mov rdx, qword ptr [rip + 0xa924b2] ; 0x100c6ff60
0x1001ddaae: mov qword ptr [rip + 0x1bffc23], rdx ; 0x101ddd6d8
0x1001ddab5: lea rdx, [rip - 0x600c] ; 0x1001d7ab0
0x1001ddabc: vmovq xmm0, rdx
0x1001ddac1: vmovdqu xmmword ptr [rip + 0x1bffc37], xmm0 ; 0x101ddd700
0x1001ddac9: mov rdx, qword ptr [rip + 0xa27a70] ; 0x100c05540 -> 0x1001db440 __Z12ApplyWrapperI11CameraGuideMS0_FvRKN10Vectormath3Aos7Matrix4EEEvM9VoidClassFvvEPv8VariablePSC_j
0x1001ddad0: mov qword ptr [rip + 0x1bffc39], rdx ; 0x101ddd710
0x1001ddad7: mov rdx, qword ptr [rip + 0xa2b2f2] ; 0x100c08dd0 -> 0x1001db4e0 __Z21InitFunctionSignatureIM11CameraGuideFvRKN10Vectormath3Aos7Matrix4EEEvP17FunctionSignature
0x1001ddade: mov qword ptr [rip + 0x1bffc33], rdx ; 0x101ddd718
0x1001ddae5: mov qword ptr [rip + 0x1bffc34], rax ; 0x101ddd720
0x1001ddaec: lea rdx, [rip + 0x99576c] ; 0x100b7325f GetTransform
0x1001ddaf3: mov qword ptr [rip + 0x1bffc2e], rdx ; 0x101ddd728
0x1001ddafa: lea rdx, [rip + 0x1bffc27] ; 0x101ddd728
0x1001ddb01: mov qword ptr [rip + 0x1bffc24], 0 ; 0x101ddd730
0x1001ddb0c: mov qword ptr [rip + 0x1bffc25], rcx ; 0x101ddd738
0x1001ddb13: lea rcx, [rip - 0x5e2a] ; 0x1001d7cf0
0x1001ddb1a: vmovq xmm0, rcx
0x1001ddb1f: vmovdqu xmmword ptr [rip + 0x1bffc39], xmm0 ; 0x101ddd760
0x1001ddb27: mov rcx, qword ptr [rip + 0xa27a22] ; 0x100c05550 -> 0x1001db560 __Z12ApplyWrapperI11CameraGuideMS0_KFN10Vectormath3Aos7Matrix4EvEEvM9VoidClassFvvEPv8VariablePSA_j
0x1001ddb2e: mov qword ptr [rip + 0x1bffc3b], rcx ; 0x101ddd770
0x1001ddb35: mov rcx, qword ptr [rip + 0xa2b2a4] ; 0x100c08de0 -> 0x1001db5f0 __Z21InitFunctionSignatureIM11CameraGuideKFN10Vectormath3Aos7Matrix4EvEEvP17FunctionSignature
0x1001ddb3c: mov qword ptr [rip + 0x1bffc35], rcx ; 0x101ddd778
0x1001ddb43: mov qword ptr [rip + 0x1bffc36], rax ; 0x101ddd780
0x1001ddb4a: lea rcx, [rip + 0x9994fd] ; 0x100b7704e SetEnabled
0x1001ddb51: mov qword ptr [rip + 0x1bffc30], rcx ; 0x101ddd788
0x1001ddb58: lea rcx, [rip + 0x1bffc29] ; 0x101ddd788
0x1001ddb5f: mov qword ptr [rip + 0x1bffc26], 0 ; 0x101ddd790
0x1001ddb6a: mov qword ptr [rip + 0x1bffc27], rdx ; 0x101ddd798
0x1001ddb71: lea rdx, [rip - 0x5d58] ; 0x1001d7e20
0x1001ddb78: vmovq xmm0, rdx
0x1001ddb7d: vmovdqu xmmword ptr [rip + 0x1bffc3b], xmm0 ; 0x101ddd7c0
0x1001ddb85: mov rdx, qword ptr [rip + 0xa279bc] ; 0x100c05548 -> 0x1001db620 __Z12ApplyWrapperI11CameraGuideMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x1001ddb8c: mov qword ptr [rip + 0x1bffc3d], rdx ; 0x101ddd7d0
0x1001ddb93: mov rdx, qword ptr [rip + 0xa2b23e] ; 0x100c08dd8 -> 0x1001db6c0 __Z21InitFunctionSignatureIM11CameraGuideFvbEEvP17FunctionSignature
0x1001ddb9a: mov qword ptr [rip + 0x1bffc37], rdx ; 0x101ddd7d8
0x1001ddba1: mov qword ptr [rip + 0x1bffc38], rax ; 0x101ddd7e0
0x1001ddba8: lea rdx, [rip + 0x9956c4] ; 0x100b73273 GetEnabled
0x1001ddbaf: mov qword ptr [rip + 0x1bffc32], rdx ; 0x101ddd7e8
0x1001ddbb6: lea rdx, [rip + 0x1bffc2b] ; 0x101ddd7e8
0x1001ddbbd: mov qword ptr [rip + 0x1bffc28], 0 ; 0x101ddd7f0
0x1001ddbc8: mov qword ptr [rip + 0x1bffc29], rcx ; 0x101ddd7f8
0x1001ddbcf: mov qword ptr [rip + 0xa9238a], rdx ; 0x100c6ff60
0x1001ddbd6: lea rcx, [rip - 0x5dad] ; 0x1001d7e30
0x1001ddbdd: vmovq xmm0, rcx
0x1001ddbe2: vmovdqu xmmword ptr [rip + 0x1bffc36], xmm0 ; 0x101ddd820
0x1001ddbea: mov rcx, qword ptr [rip + 0xa27947] ; 0x100c05538 -> 0x1001db740 __Z12ApplyWrapperI11CameraGuideMS0_FbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1001ddbf1: mov qword ptr [rip + 0x1bffc38], rcx ; 0x101ddd830
0x1001ddbf8: mov rcx, qword ptr [rip + 0xa2b1c9] ; 0x100c08dc8 -> 0x1001db7c0 __Z21InitFunctionSignatureIM11CameraGuideFbvEEvP17FunctionSignature
0x1001ddbff: mov qword ptr [rip + 0x1bffc32], rcx ; 0x101ddd838
0x1001ddc06: mov qword ptr [rip + 0x1bffc33], rax ; 0x101ddd840
0x1001ddc0d: lea rax, [rip + 0x99b2a5] ; 0x100b78eb9 CameraGuideBarn
0x1001ddc14: mov qword ptr [rip + 0x1bffc35], rax ; 0x101ddd850
0x1001ddc1b: lea rax, [rip + 0x1bffc26] ; 0x101ddd848
0x1001ddc22: mov qword ptr [rip + 0x1bffc2b], 0 ; 0x101ddd858
0x1001ddc2d: mov rcx, qword ptr [rip + 0xa92324] ; 0x100c6ff58
0x1001ddc34: mov qword ptr [rip + 0x1bffc25], rcx ; 0x101ddd860
0x1001ddc3b: mov qword ptr [rip + 0xa92316], rax ; 0x100c6ff58
0x1001ddc42: mov qword ptr [rip + 0x1bffc27], rax ; 0x101ddd870
0x1001ddc49: mov rax, qword ptr [rip + 0xa2aa60] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x1001ddc50: mov qword ptr [rip + 0x1bffc21], rax ; 0x101ddd878
0x1001ddc57: mov dword ptr [rip + 0x1bffc1f], 0xffffffff ; 0x101ddd880
0x1001ddc61: mov dword ptr [rip + 0x1bffc19], 0xffffffff ; 0x101ddd884
0x1001ddc6b: mov qword ptr [rip + 0x1bffc2a], 0 ; 0x101ddd8a0
0x1001ddc76: mov rax, qword ptr [rip + 0xa2d99b] ; 0x100c0b618
0x1001ddc7d: add rax, 0x10
0x1001ddc81: mov qword ptr [rip + 0x1bffbc0], rax ; 0x101ddd848
0x1001ddc88: xor eax, eax
0x1001ddc8a: call 0x100011c10 ; 0x100011c10
0x1001ddc8f: lea rax, [rip + 0x97ec76] ; 0x100b5c90c Initialize
0x1001ddc96: mov qword ptr [rip + 0x1bffc0b], rax ; 0x101ddd8a8
0x1001ddc9d: lea rcx, [rip + 0x1bffc04] ; 0x101ddd8a8
0x1001ddca4: mov qword ptr [rip + 0x1bffc01], 0 ; 0x101ddd8b0
0x1001ddcaf: mov rax, qword ptr [rip + 0xa922aa] ; 0x100c6ff60
0x1001ddcb6: mov qword ptr [rip + 0x1bffbfb], rax ; 0x101ddd8b8
0x1001ddcbd: lea rax, [rip - 0x5e64] ; 0x1001d7e60
0x1001ddcc4: vmovq xmm0, rax
0x1001ddcc9: vmovdqu xmmword ptr [rip + 0x1bffc0f], xmm0 ; 0x101ddd8e0
0x1001ddcd1: mov rdx, qword ptr [rip + 0xa27f38] ; 0x100c05c10 -> 0x1001dbfb0 __Z12ApplyWrapperI15CameraGuideBarnMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1001ddcd8: mov qword ptr [rip + 0x1bffc11], rdx ; 0x101ddd8f0
0x1001ddcdf: mov rsi, qword ptr [rip + 0xa2b7ba] ; 0x100c094a0 -> 0x1001dc010 __Z21InitFunctionSignatureIM15CameraGuideBarnFvvEEvP17FunctionSignature
0x1001ddce6: mov qword ptr [rip + 0x1bffc0b], rsi ; 0x101ddd8f8
0x1001ddced: mov rax, qword ptr [rip + 0xa2a144] ; 0x100c07e38 -> 0x1001dbfa0 __Z18GetMetaClassByTypeIP15CameraGuideBarnERK9MetaClassv
0x1001ddcf4: mov qword ptr [rip + 0x1bffc05], rax ; 0x101ddd900
0x1001ddcfb: lea rdi, [rip + 0x982d59] ; 0x100b60a5b OnLevelUnload
0x1001ddd02: mov qword ptr [rip + 0x1bffbff], rdi ; 0x101ddd908
0x1001ddd09: lea rdi, [rip + 0x1bffbf8] ; 0x101ddd908
0x1001ddd10: mov qword ptr [rip + 0x1bffbf5], 0 ; 0x101ddd910
0x1001ddd1b: mov qword ptr [rip + 0x1bffbf6], rcx ; 0x101ddd918
0x1001ddd22: lea rcx, [rip - 0x5639] ; 0x1001d86f0
0x1001ddd29: vmovq xmm0, rcx
0x1001ddd2e: vmovdqu xmmword ptr [rip + 0x1bffc0a], xmm0 ; 0x101ddd940
0x1001ddd36: mov qword ptr [rip + 0x1bffc13], rdx ; 0x101ddd950
0x1001ddd3d: mov qword ptr [rip + 0x1bffc14], rsi ; 0x101ddd958
0x1001ddd44: mov qword ptr [rip + 0x1bffc15], rax ; 0x101ddd960
0x1001ddd4b: lea rcx, [rip + 0x97ebfb] ; 0x100b5c94d Update
0x1001ddd52: mov qword ptr [rip + 0x1bffc0f], rcx ; 0x101ddd968
0x1001ddd59: lea rcx, [rip + 0x1bffc08] ; 0x101ddd968
0x1001ddd60: mov qword ptr [rip + 0x1bffc05], 0 ; 0x101ddd970
0x1001ddd6b: mov qword ptr [rip + 0x1bffc06], rdi ; 0x101ddd978
0x1001ddd72: lea rdx, [rip - 0x55f9] ; 0x1001d8780
0x1001ddd79: vmovq xmm0, rdx
0x1001ddd7e: vmovdqu xmmword ptr [rip + 0x1bffc1a], xmm0 ; 0x101ddd9a0
0x1001ddd86: mov rdx, qword ptr [rip + 0xa27e73] ; 0x100c05c00 -> 0x1001dc030 __Z12ApplyWrapperI15CameraGuideBarnMS0_FvP4GameEEvM9VoidClassFvvEPv8VariablePS9_j
0x1001ddd8d: mov qword ptr [rip + 0x1bffc1c], rdx ; 0x101ddd9b0
0x1001ddd94: mov rdx, qword ptr [rip + 0xa2b6f5] ; 0x100c09490 -> 0x1001dc0d0 __Z21InitFunctionSignatureIM15CameraGuideBarnFvP4GameEEvP17FunctionSignature
0x1001ddd9b: mov qword ptr [rip + 0x1bffc16], rdx ; 0x101ddd9b8
0x1001ddda2: mov qword ptr [rip + 0x1bffc17], rax ; 0x101ddd9c0
0x1001ddda9: lea rdx, [rip + 0x98405d] ; 0x100b61e0d BuildScene
0x1001dddb0: mov qword ptr [rip + 0x1bffc11], rdx ; 0x101ddd9c8
0x1001dddb7: lea rdx, [rip + 0x1bffc0a] ; 0x101ddd9c8
0x1001dddbe: mov qword ptr [rip + 0x1bffc07], 0 ; 0x101ddd9d0
0x1001dddc9: mov qword ptr [rip + 0x1bffc08], rcx ; 0x101ddd9d8
0x1001dddd0: lea rcx, [rip - 0x39a7] ; 0x1001da430
0x1001dddd7: vmovq xmm0, rcx
0x1001ddddc: vmovdqu xmmword ptr [rip + 0x1bffc1c], xmm0 ; 0x101ddda00
0x1001ddde4: mov rcx, qword ptr [rip + 0xa27e1d] ; 0x100c05c08 -> 0x1001dc150 __Z12ApplyWrapperI15CameraGuideBarnMS0_FvP6CameraP5SceneP6ConfigEEvM9VoidClassFvvEPv8VariablePSD_j
0x1001dddeb: mov qword ptr [rip + 0x1bffc1e], rcx ; 0x101ddda10
0x1001dddf2: mov rcx, qword ptr [rip + 0xa2b69f] ; 0x100c09498 -> 0x1001dc160 __Z21InitFunctionSignatureIM15CameraGuideBarnFvP6CameraP5SceneP6ConfigEEvP17FunctionSignature
0x1001dddf9: mov qword ptr [rip + 0x1bffc18], rcx ; 0x101ddda18
0x1001dde00: mov qword ptr [rip + 0x1bffc19], rax ; 0x101ddda20
0x1001dde07: lea rcx, [rip + 0x99b0bb] ; 0x100b78ec9 CreateGuide
0x1001dde0e: mov qword ptr [rip + 0x1bffc13], rcx ; 0x101ddda28
0x1001dde15: lea rcx, [rip + 0x1bffc0c] ; 0x101ddda28
0x1001dde1c: mov qword ptr [rip + 0x1bffc15], rdx ; 0x101ddda38
0x1001dde23: lea rdx, [rip - 0x399a] ; 0x1001da490
0x1001dde2a: vmovq xmm0, rdx
0x1001dde2f: vmovdqu xmmword ptr [rip + 0x1bffc29], xmm0 ; 0x101ddda60
0x1001dde37: mov rdx, qword ptr [rip + 0xa27db2] ; 0x100c05bf0 -> 0x1001dc300 __Z12ApplyWrapperI15CameraGuideBarnMS0_FP11CameraGuidePK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x1001dde3e: mov qword ptr [rip + 0x1bffc2b], rdx ; 0x101ddda70
0x1001dde45: mov rdx, qword ptr [rip + 0xa2b634] ; 0x100c09480 -> 0x1001dc3c0 __Z21InitFunctionSignatureIM15CameraGuideBarnFP11CameraGuidePK9MetaClassEEvP17FunctionSignature
0x1001dde4c: mov qword ptr [rip + 0x1bffc25], rdx ; 0x101ddda78
0x1001dde53: mov qword ptr [rip + 0x1bffc26], rax ; 0x101ddda80
0x1001dde5a: lea rdx, [rip + 0x999267] ; 0x100b770c8 ObjectFactory_CreatesType
0x1001dde61: vmovq xmm0, rdx
0x1001dde66: vmovq xmm1, r12
0x1001dde6b: vpunpcklqdq xmm0, xmm0, xmm1
0x1001dde6f: vmovdqa xmmword ptr [rip + 0x1bffc19], xmm0 ; 0x101ddda90
0x1001dde77: lea rdx, [rip + 0x1bffc12] ; 0x101ddda90
0x1001dde7e: mov qword ptr [rip + 0x1bffc17], 0 ; 0x101dddaa0
0x1001dde89: mov qword ptr [rip + 0x1bffba0], rdx ; 0x101ddda30
0x1001dde90: lea rdx, [rip + 0x99b03e] ; 0x100b78ed5 ReleaseGuide
0x1001dde97: mov qword ptr [rip + 0x1bffc0a], rdx ; 0x101dddaa8
0x1001dde9e: lea rdx, [rip + 0x1bffc03] ; 0x101dddaa8
0x1001ddea5: mov qword ptr [rip + 0x1bffc0c], rcx ; 0x101dddab8
0x1001ddeac: mov qword ptr [rip + 0xa920ad], rdx ; 0x100c6ff60
0x1001ddeb3: lea rcx, [rip - 0x39aa] ; 0x1001da510
0x1001ddeba: vmovq xmm0, rcx
0x1001ddebf: vmovdqu xmmword ptr [rip + 0x1bffc19], xmm0 ; 0x101dddae0
0x1001ddec7: mov rcx, qword ptr [rip + 0xa27d2a] ; 0x100c05bf8 -> 0x1001dc440 __Z12ApplyWrapperI15CameraGuideBarnMS0_FvP11CameraGuideEEvM9VoidClassFvvEPv8VariablePS9_j
0x1001ddece: mov qword ptr [rip + 0x1bffc1b], rcx ; 0x101dddaf0
0x1001dded5: mov rcx, qword ptr [rip + 0xa2b5ac] ; 0x100c09488 -> 0x1001dc4d0 __Z21InitFunctionSignatureIM15CameraGuideBarnFvP11CameraGuideEEvP17FunctionSignature
0x1001ddedc: mov qword ptr [rip + 0x1bffc15], rcx ; 0x101dddaf8
0x1001ddee3: mov qword ptr [rip + 0x1bffc16], rax ; 0x101dddb00
0x1001ddeea: lea rax, [rip + 0x999203] ; 0x100b770f4 ObjectFactory_ReleasesType
0x1001ddef1: vmovq xmm0, rax
0x1001ddef6: vpunpcklqdq xmm0, xmm0, xmm1
0x1001ddefa: vmovdqa xmmword ptr [rip + 0x1bffc0e], xmm0 ; 0x101dddb10
0x1001ddf02: lea rax, [rip + 0x1bffc07] ; 0x101dddb10
0x1001ddf09: mov qword ptr [rip + 0x1bffc0c], 0 ; 0x101dddb20
0x1001ddf14: mov qword ptr [rip + 0x1bffb95], rax ; 0x101dddab0
0x1001ddf1b: add rsp, 0x28
0x1001ddf1f: pop rbx
0x1001ddf20: pop r12
0x1001ddf22: pop r13
0x1001ddf24: pop r14
0x1001ddf26: pop r15
0x1001ddf28: pop rbp
0x1001ddf29: ret 
0x1001ddf2a: nop 
0x1001ddf2b: nop 
0x1001ddf2c: nop 
0x1001ddf2d: nop 
0x1001ddf2e: nop 
0x1001ddf2f: nop 
