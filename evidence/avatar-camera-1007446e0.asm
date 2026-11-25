0x1007446e0: push rbp
0x1007446e1: mov rbp, rsp
0x1007446e4: mov dword ptr [rip + 0x5ed766], 0 ; 0x100d31e54
0x1007446ee: lea rax, [rip + 0x458c69] ; 0x100b9d35e kElasticFraming
0x1007446f5: mov qword ptr [rip + 0x18f9d34], rax ; 0x10203e430
0x1007446fc: lea rdx, [rip + 0x18f9d2d] ; 0x10203e430
0x100744703: mov rax, qword ptr [rip + 0x54b596] ; 0x100c8fca0
0x10074470a: mov qword ptr [rip + 0x18f9d2f], rax ; 0x10203e440
0x100744711: lea rax, [rip + 0x5cb158] ; 0x100d0f870
0x100744718: vmovq xmm1, rax
0x10074471d: lea rax, [rip + 0x458c4a] ; 0x100b9d36e WhiskerCamera.cpp
0x100744724: vmovq xmm0, rax
0x100744729: vpunpcklqdq xmm1, xmm0, xmm1
0x10074472d: vmovdqu xmmword ptr [rip + 0x18f9d1b], xmm1 ; 0x10203e450
0x100744735: mov rax, qword ptr [rip + 0x4c2e1c] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x10074473c: mov qword ptr [rip + 0x18f9d1d], rax ; 0x10203e460
0x100744743: mov qword ptr [rip + 0x18f9d1a], 0 ; 0x10203e468
0x10074474e: lea rcx, [rip - 0x72ad35] ; 0x100019a20
0x100744755: mov qword ptr [rip + 0x18f9d14], rcx ; 0x10203e470
0x10074475c: mov qword ptr [rip + 0x18f9d11], 0 ; 0x10203e478
0x100744767: lea rsi, [rip + 0x434393] ; 0x100b78b01 Camera
0x10074476e: vmovq xmm1, rsi
0x100744773: lea rsi, [rip + 0x4198a3] ; 0x100b5e01d TweakCategory
0x10074477a: vmovq xmm2, rsi
0x10074477f: vpunpcklqdq xmm1, xmm2, xmm1
0x100744783: vmovdqa xmmword ptr [rip + 0x18f9cf5], xmm1 ; 0x10203e480
0x10074478b: lea rsi, [rip + 0x18f9cee] ; 0x10203e480
0x100744792: mov qword ptr [rip + 0x18f9cf3], 0 ; 0x10203e490
0x10074479d: mov qword ptr [rip + 0x18f9c94], rsi ; 0x10203e438
0x1007447a4: lea rsi, [rip + 0x458bd5] ; 0x100b9d380 kIsolateCameraInput
0x1007447ab: mov qword ptr [rip + 0x18f9ce6], rsi ; 0x10203e498
0x1007447b2: lea rsi, [rip + 0x18f9cdf] ; 0x10203e498
0x1007447b9: mov qword ptr [rip + 0x18f9ce8], rdx ; 0x10203e4a8
0x1007447c0: lea rdx, [rip + 0x5cb0aa] ; 0x100d0f871
0x1007447c7: vmovq xmm2, rdx
0x1007447cc: vpunpcklqdq xmm2, xmm0, xmm2
0x1007447d0: vmovdqu xmmword ptr [rip + 0x18f9ce0], xmm2 ; 0x10203e4b8
0x1007447d8: mov qword ptr [rip + 0x18f9ce9], rax ; 0x10203e4c8
0x1007447df: mov qword ptr [rip + 0x18f9ce6], 0 ; 0x10203e4d0
0x1007447ea: mov qword ptr [rip + 0x18f9ce7], rcx ; 0x10203e4d8
0x1007447f1: mov qword ptr [rip + 0x18f9ce4], 0 ; 0x10203e4e0
0x1007447fc: vmovdqa xmmword ptr [rip + 0x18f9cec], xmm1 ; 0x10203e4f0
0x100744804: lea rdx, [rip + 0x18f9ce5] ; 0x10203e4f0
0x10074480b: mov qword ptr [rip + 0x18f9cea], 0 ; 0x10203e500
0x100744816: mov qword ptr [rip + 0x18f9c83], rdx ; 0x10203e4a0
0x10074481d: lea rdx, [rip + 0x458b70] ; 0x100b9d394 kCameraAvoidClouds
0x100744824: mov qword ptr [rip + 0x18f9cdd], rdx ; 0x10203e508
0x10074482b: lea rdx, [rip + 0x18f9cd6] ; 0x10203e508
0x100744832: mov qword ptr [rip + 0x18f9cdf], rsi ; 0x10203e518
0x100744839: lea rsi, [rip + 0x5cb032] ; 0x100d0f872
0x100744840: vmovq xmm2, rsi
0x100744845: vpunpcklqdq xmm2, xmm0, xmm2
0x100744849: vmovdqu xmmword ptr [rip + 0x18f9cd7], xmm2 ; 0x10203e528
0x100744851: mov qword ptr [rip + 0x18f9ce0], rax ; 0x10203e538
0x100744858: mov qword ptr [rip + 0x18f9cdd], 0 ; 0x10203e540
0x100744863: mov qword ptr [rip + 0x18f9cde], rcx ; 0x10203e548
0x10074486a: mov qword ptr [rip + 0x18f9cdb], 0 ; 0x10203e550
0x100744875: vmovdqa xmmword ptr [rip + 0x18f9ce3], xmm1 ; 0x10203e560
0x10074487d: lea rsi, [rip + 0x18f9cdc] ; 0x10203e560
0x100744884: mov qword ptr [rip + 0x18f9ce1], 0 ; 0x10203e570
0x10074488f: mov qword ptr [rip + 0x18f9c7a], rsi ; 0x10203e510
0x100744896: lea rsi, [rip + 0x458b0a] ; 0x100b9d3a7 kDebugCameraOccluders
0x10074489d: mov qword ptr [rip + 0x18f9cdc], rsi ; 0x10203e580
0x1007448a4: lea rsi, [rip + 0x18f9cd5] ; 0x10203e580
0x1007448ab: mov qword ptr [rip + 0x18f9cde], rdx ; 0x10203e590
0x1007448b2: lea rdx, [rip + 0x18f9cbf] ; 0x10203e578
0x1007448b9: vmovq xmm2, rdx
0x1007448be: vpunpcklqdq xmm2, xmm0, xmm2
0x1007448c2: vmovdqu xmmword ptr [rip + 0x18f9cd6], xmm2 ; 0x10203e5a0
0x1007448ca: mov qword ptr [rip + 0x18f9cdf], rax ; 0x10203e5b0
0x1007448d1: mov qword ptr [rip + 0x18f9cdc], 0 ; 0x10203e5b8
0x1007448dc: mov qword ptr [rip + 0x18f9cdd], rcx ; 0x10203e5c0
0x1007448e3: mov qword ptr [rip + 0x18f9cda], 0 ; 0x10203e5c8
0x1007448ee: vmovdqa xmmword ptr [rip + 0x18f9cda], xmm1 ; 0x10203e5d0
0x1007448f6: lea rdx, [rip + 0x18f9cd3] ; 0x10203e5d0
0x1007448fd: mov qword ptr [rip + 0x18f9cd8], 0 ; 0x10203e5e0
0x100744908: mov qword ptr [rip + 0x18f9c79], rdx ; 0x10203e588
0x10074490f: lea rdx, [rip + 0x458aa7] ; 0x100b9d3bd kSideView
0x100744916: mov qword ptr [rip + 0x18f9cd3], rdx ; 0x10203e5f0
0x10074491d: lea rdx, [rip + 0x18f9ccc] ; 0x10203e5f0
0x100744924: mov qword ptr [rip + 0x18f9cd5], rsi ; 0x10203e600
0x10074492b: lea rsi, [rip + 0x18f9cb6] ; 0x10203e5e8
0x100744932: vmovq xmm2, rsi
0x100744937: vpunpcklqdq xmm2, xmm0, xmm2
0x10074493b: vmovdqu xmmword ptr [rip + 0x18f9ccd], xmm2 ; 0x10203e610
0x100744943: mov qword ptr [rip + 0x18f9cd6], rax ; 0x10203e620
0x10074494a: mov qword ptr [rip + 0x18f9cd3], 0 ; 0x10203e628
0x100744955: mov qword ptr [rip + 0x18f9cd4], rcx ; 0x10203e630
0x10074495c: mov qword ptr [rip + 0x18f9cd1], 0 ; 0x10203e638
0x100744967: vmovdqa xmmword ptr [rip + 0x18f9cd1], xmm1 ; 0x10203e640
0x10074496f: lea rsi, [rip + 0x18f9cca] ; 0x10203e640
0x100744976: mov qword ptr [rip + 0x18f9ccf], 0 ; 0x10203e650
0x100744981: mov qword ptr [rip + 0x18f9c70], rsi ; 0x10203e5f8
0x100744988: lea rsi, [rip + 0x458a38] ; 0x100b9d3c7 kMotionJoystickControl
0x10074498f: mov qword ptr [rip + 0x18f9cca], rsi ; 0x10203e660
0x100744996: lea rsi, [rip + 0x18f9cc3] ; 0x10203e660
0x10074499d: mov qword ptr [rip + 0x18f9ccc], rdx ; 0x10203e670
0x1007449a4: lea rdx, [rip + 0x18f9cad] ; 0x10203e658
0x1007449ab: vmovq xmm2, rdx
0x1007449b0: vpunpcklqdq xmm2, xmm0, xmm2
0x1007449b4: vmovdqu xmmword ptr [rip + 0x18f9cc4], xmm2 ; 0x10203e680
0x1007449bc: mov qword ptr [rip + 0x18f9ccd], rax ; 0x10203e690
0x1007449c3: mov qword ptr [rip + 0x18f9cca], 0 ; 0x10203e698
0x1007449ce: mov qword ptr [rip + 0x18f9ccb], rcx ; 0x10203e6a0
0x1007449d5: mov qword ptr [rip + 0x18f9cc8], 0 ; 0x10203e6a8
0x1007449e0: vmovdqa xmmword ptr [rip + 0x18f9cc8], xmm1 ; 0x10203e6b0
0x1007449e8: lea rdx, [rip + 0x18f9cc1] ; 0x10203e6b0
0x1007449ef: mov qword ptr [rip + 0x18f9cc6], 0 ; 0x10203e6c0
0x1007449fa: mov qword ptr [rip + 0x18f9c67], rdx ; 0x10203e668
0x100744a01: lea rdx, [rip + 0x4589d6] ; 0x100b9d3de kUseWhiskers
0x100744a08: mov qword ptr [rip + 0x18f9cb9], rdx ; 0x10203e6c8
0x100744a0f: lea rdx, [rip + 0x18f9cb2] ; 0x10203e6c8
0x100744a16: mov qword ptr [rip + 0x18f9cbb], rsi ; 0x10203e6d8
0x100744a1d: lea rsi, [rip + 0x5cae4f] ; 0x100d0f873
0x100744a24: vmovq xmm2, rsi
0x100744a29: vpunpcklqdq xmm2, xmm0, xmm2
0x100744a2d: vmovdqu xmmword ptr [rip + 0x18f9cb3], xmm2 ; 0x10203e6e8
0x100744a35: mov qword ptr [rip + 0x18f9cbc], rax ; 0x10203e6f8
0x100744a3c: mov qword ptr [rip + 0x18f9cb9], 0 ; 0x10203e700
0x100744a47: mov qword ptr [rip + 0x18f9cba], rcx ; 0x10203e708
0x100744a4e: mov qword ptr [rip + 0x18f9cb7], 0 ; 0x10203e710
0x100744a59: vmovdqa xmmword ptr [rip + 0x18f9cbf], xmm1 ; 0x10203e720
0x100744a61: lea rsi, [rip + 0x18f9cb8] ; 0x10203e720
0x100744a68: mov qword ptr [rip + 0x18f9cbd], 0 ; 0x10203e730
0x100744a73: mov qword ptr [rip + 0x18f9c56], rsi ; 0x10203e6d0
0x100744a7a: lea rsi, [rip + 0x45896a] ; 0x100b9d3eb kDynamicLeftRightHanded
0x100744a81: mov qword ptr [rip + 0x18f9cb0], rsi ; 0x10203e738
0x100744a88: lea rsi, [rip + 0x18f9ca9] ; 0x10203e738
0x100744a8f: mov qword ptr [rip + 0x18f9cb2], rdx ; 0x10203e748
0x100744a96: lea rdx, [rip + 0x5cadd7] ; 0x100d0f874
0x100744a9d: vmovq xmm2, rdx
0x100744aa2: vpunpcklqdq xmm2, xmm0, xmm2
0x100744aa6: vmovdqu xmmword ptr [rip + 0x18f9caa], xmm2 ; 0x10203e758
0x100744aae: mov qword ptr [rip + 0x18f9cb3], rax ; 0x10203e768
0x100744ab5: mov qword ptr [rip + 0x18f9cb0], 0 ; 0x10203e770
0x100744ac0: mov qword ptr [rip + 0x18f9cb1], rcx ; 0x10203e778
0x100744ac7: mov qword ptr [rip + 0x18f9cae], 0 ; 0x10203e780
0x100744ad2: vmovdqa xmmword ptr [rip + 0x18f9cb6], xmm1 ; 0x10203e790
0x100744ada: lea rdx, [rip + 0x18f9caf] ; 0x10203e790
0x100744ae1: mov qword ptr [rip + 0x18f9cb4], 0 ; 0x10203e7a0
0x100744aec: mov qword ptr [rip + 0x18f9c4d], rdx ; 0x10203e740
0x100744af3: lea rdx, [rip + 0x458909] ; 0x100b9d403 kManualZoom
0x100744afa: mov qword ptr [rip + 0x18f9caf], rdx ; 0x10203e7b0
0x100744b01: lea rdx, [rip + 0x18f9ca8] ; 0x10203e7b0
0x100744b08: mov qword ptr [rip + 0x18f9cb1], rsi ; 0x10203e7c0
0x100744b0f: lea rsi, [rip + 0x18f9c92] ; 0x10203e7a8
0x100744b16: vmovq xmm2, rsi
0x100744b1b: vpunpcklqdq xmm2, xmm0, xmm2
0x100744b1f: vmovdqu xmmword ptr [rip + 0x18f9ca9], xmm2 ; 0x10203e7d0
0x100744b27: mov qword ptr [rip + 0x18f9cb2], rax ; 0x10203e7e0
0x100744b2e: mov qword ptr [rip + 0x18f9caf], 0 ; 0x10203e7e8
0x100744b39: mov qword ptr [rip + 0x18f9cb0], rcx ; 0x10203e7f0
0x100744b40: mov qword ptr [rip + 0x18f9cad], 0 ; 0x10203e7f8
0x100744b4b: vmovdqa xmmword ptr [rip + 0x18f9cad], xmm1 ; 0x10203e800
0x100744b53: lea rsi, [rip + 0x18f9ca6] ; 0x10203e800
0x100744b5a: mov qword ptr [rip + 0x18f9cab], 0 ; 0x10203e810
0x100744b65: mov qword ptr [rip + 0x18f9c4c], rsi ; 0x10203e7b8
0x100744b6c: lea rsi, [rip + 0x45889c] ; 0x100b9d40f kNudgeCameraControl
0x100744b73: mov qword ptr [rip + 0x18f9c9e], rsi ; 0x10203e818
0x100744b7a: lea rsi, [rip + 0x18f9c97] ; 0x10203e818
0x100744b81: mov qword ptr [rip + 0x18f9ca0], rdx ; 0x10203e828
0x100744b88: lea rdx, [rip + 0x5cace6] ; 0x100d0f875
0x100744b8f: vmovq xmm2, rdx
0x100744b94: vpunpcklqdq xmm2, xmm0, xmm2
0x100744b98: vmovdqu xmmword ptr [rip + 0x18f9c98], xmm2 ; 0x10203e838
0x100744ba0: mov qword ptr [rip + 0x18f9ca1], rax ; 0x10203e848
0x100744ba7: mov qword ptr [rip + 0x18f9c9e], 0 ; 0x10203e850
0x100744bb2: mov qword ptr [rip + 0x18f9c9f], rcx ; 0x10203e858
0x100744bb9: mov qword ptr [rip + 0x18f9c9c], 0 ; 0x10203e860
0x100744bc4: vmovdqa xmmword ptr [rip + 0x18f9ca4], xmm1 ; 0x10203e870
0x100744bcc: lea rdx, [rip + 0x18f9c9d] ; 0x10203e870
0x100744bd3: mov qword ptr [rip + 0x18f9ca2], 0 ; 0x10203e880
0x100744bde: mov qword ptr [rip + 0x18f9c3b], rdx ; 0x10203e820
0x100744be5: lea rdx, [rip + 0x458837] ; 0x100b9d423 kShowFlightCamDials
0x100744bec: mov qword ptr [rip + 0x18f9c9d], rdx ; 0x10203e890
0x100744bf3: lea rdx, [rip + 0x18f9c96] ; 0x10203e890
0x100744bfa: mov qword ptr [rip + 0x18f9c9f], rsi ; 0x10203e8a0
0x100744c01: mov qword ptr [rip + 0x54b098], rdx ; 0x100c8fca0
0x100744c08: lea rdx, [rip + 0x18f9c79] ; 0x10203e888
0x100744c0f: vmovq xmm2, rdx
0x100744c14: vpunpcklqdq xmm0, xmm0, xmm2
0x100744c18: vmovdqu xmmword ptr [rip + 0x18f9c90], xmm0 ; 0x10203e8b0
0x100744c20: mov qword ptr [rip + 0x18f9c99], rax ; 0x10203e8c0
0x100744c27: mov qword ptr [rip + 0x18f9c96], 0 ; 0x10203e8c8
0x100744c32: mov qword ptr [rip + 0x18f9c97], rcx ; 0x10203e8d0
0x100744c39: mov qword ptr [rip + 0x18f9c94], 0 ; 0x10203e8d8
0x100744c44: vmovdqa xmmword ptr [rip + 0x18f9c94], xmm1 ; 0x10203e8e0
0x100744c4c: lea rax, [rip + 0x18f9c8d] ; 0x10203e8e0
0x100744c53: mov qword ptr [rip + 0x18f9c92], 0 ; 0x10203e8f0
0x100744c5e: mov qword ptr [rip + 0x18f9c33], rax ; 0x10203e898
0x100744c65: mov edi, 2
0x100744c6a: call 0x1001e0610 ; 0x1001e0610
0x100744c6f: vmulss xmm0, xmm0, dword ptr [rip + 0x363989] ; 0x100aa8600
0x100744c77: vdivss xmm0, xmm0, dword ptr [rip + 0x363985] ; 0x100aa8604
0x100744c7f: vmovss dword ptr [rip + 0x5ed1d1], xmm0 ; 0x100d31e58
0x100744c87: mov edi, 3
0x100744c8c: call 0x1001e0610 ; 0x1001e0610
0x100744c91: vmulss xmm0, xmm0, dword ptr [rip + 0x363967] ; 0x100aa8600
0x100744c99: vdivss xmm0, xmm0, dword ptr [rip + 0x363963] ; 0x100aa8604
0x100744ca1: vmovss dword ptr [rip + 0x5ed1b3], xmm0 ; 0x100d31e5c
0x100744ca9: mov edi, 3
0x100744cae: call 0x1001e0610 ; 0x1001e0610
0x100744cb3: vmulss xmm0, xmm0, dword ptr [rip + 0x363945] ; 0x100aa8600
0x100744cbb: vdivss xmm0, xmm0, dword ptr [rip + 0x363941] ; 0x100aa8604
0x100744cc3: vmovss dword ptr [rip + 0x5ed195], xmm0 ; 0x100d31e60
0x100744ccb: mov edi, 2
0x100744cd0: call 0x1001e0610 ; 0x1001e0610
0x100744cd5: vmulss xmm0, xmm0, dword ptr [rip + 0x363923] ; 0x100aa8600
0x100744cdd: vdivss xmm0, xmm0, dword ptr [rip + 0x36391f] ; 0x100aa8604
0x100744ce5: vmovss dword ptr [rip + 0x5ed177], xmm0 ; 0x100d31e64
0x100744ced: mov edi, 5
0x100744cf2: call 0x1001e0610 ; 0x1001e0610
0x100744cf7: vmulss xmm0, xmm0, dword ptr [rip + 0x363901] ; 0x100aa8600
0x100744cff: vdivss xmm0, xmm0, dword ptr [rip + 0x3638fd] ; 0x100aa8604
0x100744d07: vmovss dword ptr [rip + 0x5ed159], xmm0 ; 0x100d31e68
0x100744d0f: mov dword ptr [rip + 0x5ed153], 0xbdb2b8c3 ; 0x100d31e6c
0x100744d19: lea rax, [rip + 0x458717] ; 0x100b9d437 WhiskerCamera
0x100744d20: mov qword ptr [rip + 0x18f9bd9], rax ; 0x10203e900
0x100744d27: lea rax, [rip + 0x18f9bca] ; 0x10203e8f8
0x100744d2e: mov qword ptr [rip + 0x18f9bcf], 0 ; 0x10203e908
0x100744d39: mov rcx, qword ptr [rip + 0x52b218] ; 0x100c6ff58
0x100744d40: mov qword ptr [rip + 0x18f9bc9], rcx ; 0x10203e910
0x100744d47: mov qword ptr [rip + 0x52b20a], rax ; 0x100c6ff58
0x100744d4e: mov qword ptr [rip + 0x18f9bcb], rax ; 0x10203e920
0x100744d55: mov rax, qword ptr [rip + 0x4c2864] ; 0x100c075c0 -> 0x1001e4160 __Z18GetMetaClassByTypeIP10CameraNodeERK9MetaClassv
0x100744d5c: mov qword ptr [rip + 0x18f9bc5], rax ; 0x10203e928
0x100744d63: mov qword ptr [rip + 0x18f9bc2], 0xffffffffffffffff ; 0x10203e930
0x100744d6e: mov qword ptr [rip + 0x18f9bd7], 0 ; 0x10203e950
0x100744d79: mov rax, qword ptr [rip + 0x4c6570] ; 0x100c0b2f0
0x100744d80: add rax, 0x10
0x100744d84: mov qword ptr [rip + 0x18f9b6d], rax ; 0x10203e8f8
0x100744d8b: xor eax, eax
0x100744d8d: pop rbp
0x100744d8e: jmp 0x100011c10 ; 0x100011c10
0x100744d93: nop 
0x100744d94: nop 
0x100744d95: nop 
0x100744d96: nop 
0x100744d97: nop 
0x100744d98: nop 
0x100744d99: nop 
0x100744d9a: nop 
0x100744d9b: nop 
0x100744d9c: nop 
0x100744d9d: nop 
0x100744d9e: nop 
0x100744d9f: nop 
