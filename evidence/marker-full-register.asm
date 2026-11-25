0x10043f000: push rbp
0x10043f001: mov rbp, rsp
0x10043f004: push r15
0x10043f006: push r14
0x10043f008: push rbx
0x10043f009: push rax
0x10043f00a: lea r14, [rip + 0x725628] ; 0x100b64639 Marker
0x10043f011: mov qword ptr [rip + 0x1bc5580], r14 ; 0x102004598
0x10043f018: lea rax, [rip + 0x1bc5571] ; 0x102004590
0x10043f01f: mov qword ptr [rip + 0x1bc5576], 0 ; 0x1020045a0
0x10043f02a: mov rcx, qword ptr [rip + 0x830f27] ; 0x100c6ff58
0x10043f031: mov qword ptr [rip + 0x1bc5570], rcx ; 0x1020045a8
0x10043f038: mov qword ptr [rip + 0x830f19], rax ; 0x100c6ff58
0x10043f03f: mov qword ptr [rip + 0x1bc5572], rax ; 0x1020045b8
0x10043f046: mov rax, qword ptr [rip + 0x7c88db] ; 0x100c07928 -> 0x100103d50 __Z18GetMetaClassByTypeIP11WorldObjectERK9MetaClassv
0x10043f04d: mov qword ptr [rip + 0x1bc556c], rax ; 0x1020045c0
0x10043f054: mov qword ptr [rip + 0x1bc5569], 0xffffffffffffffff ; 0x1020045c8
0x10043f05f: mov qword ptr [rip + 0x1bc557e], 0 ; 0x1020045e8
0x10043f06a: mov rax, qword ptr [rip + 0x7cd4b7] ; 0x100c0c528
0x10043f071: add rax, 0x10
0x10043f075: mov qword ptr [rip + 0x1bc5514], rax ; 0x102004590
0x10043f07c: xor eax, eax
0x10043f07e: call 0x100011c10 ; 0x100011c10
0x10043f083: lea rax, [rip + 0x71ff1c] ; 0x100b5efa6 pos
0x10043f08a: mov qword ptr [rip + 0x886f4f], rax ; 0x100cc5fe0
0x10043f091: lea rcx, [rip + 0x886f48] ; 0x100cc5fe0
0x10043f098: mov qword ptr [rip + 0x886f45], 0 ; 0x100cc5fe8
0x10043f0a3: mov rax, qword ptr [rip + 0x838bb6] ; 0x100c77c60
0x10043f0aa: mov qword ptr [rip + 0x886f3f], rax ; 0x100cc5ff0
0x10043f0b1: mov qword ptr [rip + 0x886f44], 0x10 ; 0x100cc6000
0x10043f0bc: mov rdx, qword ptr [rip + 0x7c7d0d] ; 0x100c06dd0 -> 0x100066ac0 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Vector3EERK8MetaTypev
0x10043f0c3: mov qword ptr [rip + 0x886f3e], rdx ; 0x100cc6008
0x10043f0ca: mov rax, qword ptr [rip + 0x7c95d7] ; 0x100c086a8 -> 0x10043e510 __Z18GetMetaClassByTypeIP6MarkerERK9MetaClassv
0x10043f0d1: mov qword ptr [rip + 0x886f38], rax ; 0x100cc6010
0x10043f0d8: mov qword ptr [rip + 0x886f35], 0xffffffffffffffff ; 0x100cc6018
0x10043f0e3: lea rbx, [rip - 0x4256ca] ; 0x100019a20
0x10043f0ea: mov qword ptr [rip + 0x886f2f], rbx ; 0x100cc6020
0x10043f0f1: mov qword ptr [rip + 0x886f2c], 0 ; 0x100cc6028
0x10043f0fc: lea rsi, [rip + 0x739b60] ; 0x100b78c63 quat
0x10043f103: mov qword ptr [rip + 0x886f26], rsi ; 0x100cc6030
0x10043f10a: lea rsi, [rip + 0x886f1f] ; 0x100cc6030
0x10043f111: mov qword ptr [rip + 0x886f1c], 0 ; 0x100cc6038
0x10043f11c: mov qword ptr [rip + 0x886f1d], rcx ; 0x100cc6040
0x10043f123: mov qword ptr [rip + 0x886f22], 0x20 ; 0x100cc6050
0x10043f12e: mov rcx, qword ptr [rip + 0x7c7c8b] ; 0x100c06dc0 -> 0x1001db420 __Z17GetMetaTypeByTypeIN10Vectormath3Aos4QuatEERK8MetaTypev
0x10043f135: mov qword ptr [rip + 0x886f1c], rcx ; 0x100cc6058
0x10043f13c: mov qword ptr [rip + 0x886f1d], rax ; 0x100cc6060
0x10043f143: mov qword ptr [rip + 0x886f1a], 0xffffffffffffffff ; 0x100cc6068
0x10043f14e: mov qword ptr [rip + 0x886f1b], rbx ; 0x100cc6070
0x10043f155: mov qword ptr [rip + 0x886f18], 0 ; 0x100cc6078
0x10043f160: lea rcx, [rip + 0x739b01] ; 0x100b78c68 scale
0x10043f167: mov qword ptr [rip + 0x886f12], rcx ; 0x100cc6080
0x10043f16e: lea rcx, [rip + 0x886f0b] ; 0x100cc6080
0x10043f175: mov qword ptr [rip + 0x886f08], 0 ; 0x100cc6088
0x10043f180: mov qword ptr [rip + 0x886f09], rsi ; 0x100cc6090
0x10043f187: mov qword ptr [rip + 0x886f0e], 0x30 ; 0x100cc60a0
0x10043f192: mov qword ptr [rip + 0x886f0f], rdx ; 0x100cc60a8
0x10043f199: mov qword ptr [rip + 0x886f10], rax ; 0x100cc60b0
0x10043f1a0: mov qword ptr [rip + 0x886f0d], 0xffffffffffffffff ; 0x100cc60b8
0x10043f1ab: mov qword ptr [rip + 0x886f0e], rbx ; 0x100cc60c0
0x10043f1b2: mov qword ptr [rip + 0x886f0b], 0 ; 0x100cc60c8
0x10043f1bd: lea rdx, [rip + 0x737e95] ; 0x100b77059 enabled
0x10043f1c4: mov qword ptr [rip + 0x886f05], rdx ; 0x100cc60d0
0x10043f1cb: lea rdx, [rip + 0x886efe] ; 0x100cc60d0
0x10043f1d2: mov qword ptr [rip + 0x886f07], rcx ; 0x100cc60e0
0x10043f1d9: mov qword ptr [rip + 0x838a80], rdx ; 0x100c77c60
0x10043f1e0: mov qword ptr [rip + 0x886f05], 0x40 ; 0x100cc60f0
0x10043f1eb: mov r15, qword ptr [rip + 0x7c8366] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x10043f1f2: mov qword ptr [rip + 0x886eff], r15 ; 0x100cc60f8
0x10043f1f9: mov qword ptr [rip + 0x886f00], rax ; 0x100cc6100
0x10043f200: mov qword ptr [rip + 0x886efd], 0xffffffffffffffff ; 0x100cc6108
0x10043f20b: mov qword ptr [rip + 0x886efe], rbx ; 0x100cc6110
0x10043f212: mov qword ptr [rip + 0x886efb], 0 ; 0x100cc6118
0x10043f21d: lea rcx, [rip + 0x71f7de] ; 0x100b5ea02 Tool_DefaultValue
0x10043f224: vmovq xmm0, rcx
0x10043f229: lea rcx, [rip + 0x71f7af] ; 0x100b5e9df true
0x10043f230: vmovq xmm1, rcx
0x10043f235: vpunpcklqdq xmm0, xmm0, xmm1
0x10043f239: vmovdqa xmmword ptr [rip + 0x1bc53af], xmm0 ; 0x1020045f0
0x10043f241: lea rcx, [rip + 0x1bc53a8] ; 0x1020045f0
0x10043f248: mov qword ptr [rip + 0x1bc53ad], 0 ; 0x102004600
0x10043f253: mov qword ptr [rip + 0x886e7e], rcx ; 0x100cc60d8
0x10043f25a: lea rcx, [rip + 0x720ddb] ; 0x100b6003c Tool_Export
0x10043f261: vmovq xmm0, rcx
0x10043f266: vpunpcklqdq xmm0, xmm0, xmm1
0x10043f26a: vmovdqa xmmword ptr [rip + 0x1bc539e], xmm0 ; 0x102004610
0x10043f272: lea rcx, [rip + 0x1bc5397] ; 0x102004610
0x10043f279: mov rdx, qword ptr [rip + 0x1bc5320] ; 0x1020045a0
0x10043f280: mov qword ptr [rip + 0x1bc5399], rdx ; 0x102004620
0x10043f287: mov qword ptr [rip + 0x1bc5312], rcx ; 0x1020045a0
0x10043f28e: lea rcx, [rip + 0x737dac] ; 0x100b77041 SetTransform
0x10043f295: mov qword ptr [rip + 0x1bc538c], rcx ; 0x102004628
0x10043f29c: lea rcx, [rip + 0x1bc5385] ; 0x102004628
0x10043f2a3: mov qword ptr [rip + 0x1bc5382], 0 ; 0x102004630
0x10043f2ae: mov rdx, qword ptr [rip + 0x830cab] ; 0x100c6ff60
0x10043f2b5: mov qword ptr [rip + 0x1bc537c], rdx ; 0x102004638
0x10043f2bc: lea rdx, [rip - 0x25f3] ; 0x10043ccd0
0x10043f2c3: vmovq xmm0, rdx
0x10043f2c8: vmovdqu xmmword ptr [rip + 0x1bc5390], xmm0 ; 0x102004660
0x10043f2d0: mov rdx, qword ptr [rip + 0x7c70b1] ; 0x100c06388 -> 0x10043e520 __Z12ApplyWrapperI6MarkerMS0_FvRKN10Vectormath3Aos7Matrix4EEEvM9VoidClassFvvEPv8VariablePSC_j
0x10043f2d7: mov qword ptr [rip + 0x1bc5392], rdx ; 0x102004670
0x10043f2de: mov rdx, qword ptr [rip + 0x7ca933] ; 0x100c09c18 -> 0x10043e5c0 __Z21InitFunctionSignatureIM6MarkerFvRKN10Vectormath3Aos7Matrix4EEEvP17FunctionSignature
0x10043f2e5: mov qword ptr [rip + 0x1bc538c], rdx ; 0x102004678
0x10043f2ec: mov qword ptr [rip + 0x1bc538d], rax ; 0x102004680
0x10043f2f3: lea rdx, [rip + 0x733f65] ; 0x100b7325f GetTransform
0x10043f2fa: mov qword ptr [rip + 0x1bc5387], rdx ; 0x102004688
0x10043f301: lea rsi, [rip + 0x1bc5380] ; 0x102004688
0x10043f308: mov qword ptr [rip + 0x1bc537d], 0 ; 0x102004690
0x10043f313: mov qword ptr [rip + 0x1bc537e], rcx ; 0x102004698
0x10043f31a: mov ecx, 0x19
0x10043f31f: vmovq xmm0, rcx
0x10043f324: vmovdqu xmmword ptr [rip + 0x1bc5394], xmm0 ; 0x1020046c0
0x10043f32c: mov rcx, qword ptr [rip + 0x7c7065] ; 0x100c06398 -> 0x10043e640 __Z12ApplyWrapperI6MarkerMS0_KFN10Vectormath3Aos7Matrix4EvEEvM9VoidClassFvvEPv8VariablePSA_j
0x10043f333: mov qword ptr [rip + 0x1bc5396], rcx ; 0x1020046d0
0x10043f33a: mov rdx, qword ptr [rip + 0x7ca8e7] ; 0x100c09c28 -> 0x10043e6d0 __Z21InitFunctionSignatureIM6MarkerKFN10Vectormath3Aos7Matrix4EvEEvP17FunctionSignature
0x10043f341: mov qword ptr [rip + 0x1bc5390], rdx ; 0x1020046d8
0x10043f348: mov qword ptr [rip + 0x1bc5391], rax ; 0x1020046e0
0x10043f34f: lea rdi, [rip + 0x737cf8] ; 0x100b7704e SetEnabled
0x10043f356: mov qword ptr [rip + 0x1bc538b], rdi ; 0x1020046e8
0x10043f35d: lea rdi, [rip + 0x1bc5384] ; 0x1020046e8
0x10043f364: mov qword ptr [rip + 0x1bc5381], 0 ; 0x1020046f0
0x10043f36f: mov qword ptr [rip + 0x1bc5382], rsi ; 0x1020046f8
0x10043f376: lea rsi, [rip - 0x238d] ; 0x10043cff0
0x10043f37d: vmovq xmm0, rsi
0x10043f382: vmovdqu xmmword ptr [rip + 0x1bc5396], xmm0 ; 0x102004720
0x10043f38a: mov rsi, qword ptr [rip + 0x7c6fff] ; 0x100c06390 -> 0x10043e700 __Z12ApplyWrapperI6MarkerMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x10043f391: mov qword ptr [rip + 0x1bc5398], rsi ; 0x102004730
0x10043f398: mov rsi, qword ptr [rip + 0x7ca881] ; 0x100c09c20 -> 0x10043e7a0 __Z21InitFunctionSignatureIM6MarkerFvbEEvP17FunctionSignature
0x10043f39f: mov qword ptr [rip + 0x1bc5392], rsi ; 0x102004738
0x10043f3a6: mov qword ptr [rip + 0x1bc5393], rax ; 0x102004740
0x10043f3ad: lea rsi, [rip + 0x733ebf] ; 0x100b73273 GetEnabled
0x10043f3b4: mov qword ptr [rip + 0x1bc538d], rsi ; 0x102004748
0x10043f3bb: lea rsi, [rip + 0x1bc5386] ; 0x102004748
0x10043f3c2: mov qword ptr [rip + 0x1bc5383], 0 ; 0x102004750
0x10043f3cd: mov qword ptr [rip + 0x1bc5384], rdi ; 0x102004758
0x10043f3d4: mov edi, 0x11
0x10043f3d9: vmovq xmm0, rdi
0x10043f3de: vmovdqu xmmword ptr [rip + 0x1bc539a], xmm0 ; 0x102004780
0x10043f3e6: mov rdi, qword ptr [rip + 0x7c6fb3] ; 0x100c063a0 -> 0x10043e820 __Z12ApplyWrapperI6MarkerMS0_KFbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10043f3ed: mov qword ptr [rip + 0x1bc539c], rdi ; 0x102004790
0x10043f3f4: mov rdi, qword ptr [rip + 0x7ca835] ; 0x100c09c30 -> 0x10043e8a0 __Z21InitFunctionSignatureIM6MarkerKFbvEEvP17FunctionSignature
0x10043f3fb: mov qword ptr [rip + 0x1bc5396], rdi ; 0x102004798
0x10043f402: mov qword ptr [rip + 0x1bc5397], rax ; 0x1020047a0
0x10043f409: lea rdi, [rip + 0x733e5c] ; 0x100b7326c GetObb
0x10043f410: mov qword ptr [rip + 0x1bc5391], rdi ; 0x1020047a8
0x10043f417: lea rdi, [rip + 0x1bc538a] ; 0x1020047a8
0x10043f41e: mov qword ptr [rip + 0x1bc5387], 0 ; 0x1020047b0
0x10043f429: mov qword ptr [rip + 0x1bc5388], rsi ; 0x1020047b8
0x10043f430: mov qword ptr [rip + 0x830b29], rdi ; 0x100c6ff60
0x10043f437: mov esi, 0x21
0x10043f43c: vmovq xmm0, rsi
0x10043f441: vmovdqu xmmword ptr [rip + 0x1bc5397], xmm0 ; 0x1020047e0
0x10043f449: mov qword ptr [rip + 0x1bc53a0], rcx ; 0x1020047f0
0x10043f450: mov qword ptr [rip + 0x1bc53a1], rdx ; 0x1020047f8
0x10043f457: mov qword ptr [rip + 0x1bc53a2], rax ; 0x102004800
0x10043f45e: lea rax, [rip + 0x7495ec] ; 0x100b88a51 MarkerBarn
0x10043f465: mov qword ptr [rip + 0x1bc53a4], rax ; 0x102004810
0x10043f46c: lea rax, [rip + 0x1bc5395] ; 0x102004808
0x10043f473: mov qword ptr [rip + 0x1bc539a], 0 ; 0x102004818
0x10043f47e: mov rcx, qword ptr [rip + 0x830ad3] ; 0x100c6ff58
0x10043f485: mov qword ptr [rip + 0x1bc5394], rcx ; 0x102004820
0x10043f48c: mov qword ptr [rip + 0x830ac5], rax ; 0x100c6ff58
0x10043f493: mov qword ptr [rip + 0x1bc5396], rax ; 0x102004830
0x10043f49a: mov rax, qword ptr [rip + 0x7c920f] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x10043f4a1: mov qword ptr [rip + 0x1bc5390], rax ; 0x102004838
0x10043f4a8: mov dword ptr [rip + 0x1bc538e], 0xffffffff ; 0x102004840
0x10043f4b2: mov dword ptr [rip + 0x1bc5388], 0xffffffff ; 0x102004844
0x10043f4bc: mov qword ptr [rip + 0x1bc5399], 0 ; 0x102004860
0x10043f4c7: mov rax, qword ptr [rip + 0x7cb55a] ; 0x100c0aa28
0x10043f4ce: add rax, 0x10
0x10043f4d2: mov qword ptr [rip + 0x1bc532f], rax ; 0x102004808
0x10043f4d9: xor eax, eax
0x10043f4db: call 0x100011c10 ; 0x100011c10
0x10043f4e0: lea rax, [rip + 0x71d425] ; 0x100b5c90c Initialize
0x10043f4e7: mov qword ptr [rip + 0x1bc537a], rax ; 0x102004868
0x10043f4ee: lea rsi, [rip + 0x1bc5373] ; 0x102004868
0x10043f4f5: mov qword ptr [rip + 0x1bc5370], 0 ; 0x102004870
0x10043f500: mov rax, qword ptr [rip + 0x830a59] ; 0x100c6ff60
0x10043f507: mov qword ptr [rip + 0x1bc536a], rax ; 0x102004878
0x10043f50e: lea rax, [rip - 0x24f5] ; 0x10043d020
0x10043f515: vmovq xmm0, rax
0x10043f51a: vmovdqu xmmword ptr [rip + 0x1bc537e], xmm0 ; 0x1020048a0
0x10043f522: mov rcx, qword ptr [rip + 0x7c5ed7] ; 0x100c05400 -> 0x10043eba0 __Z12ApplyWrapperI10MarkerBarnMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10043f529: mov qword ptr [rip + 0x1bc5380], rcx ; 0x1020048b0
0x10043f530: mov rdx, qword ptr [rip + 0x7c9759] ; 0x100c08c90 -> 0x10043ec00 __Z21InitFunctionSignatureIM10MarkerBarnFvvEEvP17FunctionSignature
0x10043f537: mov qword ptr [rip + 0x1bc537a], rdx ; 0x1020048b8
0x10043f53e: mov rax, qword ptr [rip + 0x7c816b] ; 0x100c076b0 -> 0x10043eb90 __Z18GetMetaClassByTypeIP10MarkerBarnERK9MetaClassv
0x10043f545: mov qword ptr [rip + 0x1bc5374], rax ; 0x1020048c0
0x10043f54c: lea rdi, [rip + 0x721508] ; 0x100b60a5b OnLevelUnload
0x10043f553: mov qword ptr [rip + 0x1bc536e], rdi ; 0x1020048c8
0x10043f55a: lea rdi, [rip + 0x1bc5367] ; 0x1020048c8
0x10043f561: mov qword ptr [rip + 0x1bc5364], 0 ; 0x1020048d0
0x10043f56c: mov qword ptr [rip + 0x1bc5365], rsi ; 0x1020048d8
0x10043f573: lea rsi, [rip - 0x254a] ; 0x10043d030
0x10043f57a: vmovq xmm0, rsi
0x10043f57f: vmovdqu xmmword ptr [rip + 0x1bc5379], xmm0 ; 0x102004900
0x10043f587: mov qword ptr [rip + 0x1bc5382], rcx ; 0x102004910
0x10043f58e: mov qword ptr [rip + 0x1bc5383], rdx ; 0x102004918
0x10043f595: mov qword ptr [rip + 0x1bc5384], rax ; 0x102004920
0x10043f59c: lea rsi, [rip + 0x71d395] ; 0x100b5c938 Terminate
0x10043f5a3: mov qword ptr [rip + 0x1bc537e], rsi ; 0x102004928
0x10043f5aa: lea rsi, [rip + 0x1bc5377] ; 0x102004928
0x10043f5b1: mov qword ptr [rip + 0x1bc5374], 0 ; 0x102004930
0x10043f5bc: mov qword ptr [rip + 0x1bc5375], rdi ; 0x102004938
0x10043f5c3: lea rdi, [rip - 0x23fa] ; 0x10043d1d0
0x10043f5ca: vmovq xmm0, rdi
0x10043f5cf: vmovdqu xmmword ptr [rip + 0x1bc5389], xmm0 ; 0x102004960
0x10043f5d7: mov qword ptr [rip + 0x1bc5392], rcx ; 0x102004970
0x10043f5de: mov qword ptr [rip + 0x1bc5393], rdx ; 0x102004978
0x10043f5e5: mov qword ptr [rip + 0x1bc5394], rax ; 0x102004980
0x10043f5ec: lea rdi, [rip + 0x72281a] ; 0x100b61e0d BuildScene
0x10043f5f3: mov qword ptr [rip + 0x1bc538e], rdi ; 0x102004988
0x10043f5fa: lea rdi, [rip + 0x1bc5387] ; 0x102004988
0x10043f601: mov qword ptr [rip + 0x1bc5384], 0 ; 0x102004990
0x10043f60c: mov qword ptr [rip + 0x1bc5385], rsi ; 0x102004998
0x10043f613: lea rsi, [rip - 0x22ba] ; 0x10043d360
0x10043f61a: vmovq xmm0, rsi
0x10043f61f: vmovdqu xmmword ptr [rip + 0x1bc5399], xmm0 ; 0x1020049c0
0x10043f627: mov rsi, qword ptr [rip + 0x7c5dc2] ; 0x100c053f0 -> 0x10043ec20 __Z12ApplyWrapperI10MarkerBarnMS0_FvP6CameraP5SceneP6ConfigEEvM9VoidClassFvvEPv8VariablePSD_j
0x10043f62e: mov qword ptr [rip + 0x1bc539b], rsi ; 0x1020049d0
0x10043f635: mov rsi, qword ptr [rip + 0x7c9644] ; 0x100c08c80 -> 0x10043ec30 __Z21InitFunctionSignatureIM10MarkerBarnFvP6CameraP5SceneP6ConfigEEvP17FunctionSignature
0x10043f63c: mov qword ptr [rip + 0x1bc5395], rsi ; 0x1020049d8
0x10043f643: mov qword ptr [rip + 0x1bc5396], rax ; 0x1020049e0
0x10043f64a: lea rsi, [rip + 0x71d30e] ; 0x100b5c95f HotLoad
0x10043f651: mov qword ptr [rip + 0x1bc5390], rsi ; 0x1020049e8
0x10043f658: lea rsi, [rip + 0x1bc5389] ; 0x1020049e8
0x10043f65f: mov qword ptr [rip + 0x1bc5386], 0 ; 0x1020049f0
0x10043f66a: mov qword ptr [rip + 0x1bc5387], rdi ; 0x1020049f8
0x10043f671: lea rdi, [rip - 0x2178] ; 0x10043d500
0x10043f678: vmovq xmm0, rdi
0x10043f67d: vmovdqu xmmword ptr [rip + 0x1bc539b], xmm0 ; 0x102004a20
0x10043f685: mov qword ptr [rip + 0x1bc53a4], rcx ; 0x102004a30
0x10043f68c: mov qword ptr [rip + 0x1bc53a5], rdx ; 0x102004a38
0x10043f693: mov qword ptr [rip + 0x1bc53a6], rax ; 0x102004a40
0x10043f69a: lea rcx, [rip + 0x7493bb] ; 0x100b88a5c CreateMarker
0x10043f6a1: mov qword ptr [rip + 0x1bc53a0], rcx ; 0x102004a48
0x10043f6a8: lea rcx, [rip + 0x1bc5399] ; 0x102004a48
0x10043f6af: mov qword ptr [rip + 0x1bc53a2], rsi ; 0x102004a58
0x10043f6b6: lea rdx, [rip - 0x201d] ; 0x10043d6a0
0x10043f6bd: vmovq xmm0, rdx
0x10043f6c2: vmovdqu xmmword ptr [rip + 0x1bc53b6], xmm0 ; 0x102004a80
0x10043f6ca: mov rdx, qword ptr [rip + 0x7c5d17] ; 0x100c053e8 -> 0x10043edd0 __Z12ApplyWrapperI10MarkerBarnMS0_FP6MarkerPK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x10043f6d1: mov qword ptr [rip + 0x1bc53b8], rdx ; 0x102004a90
0x10043f6d8: mov rdx, qword ptr [rip + 0x7c9599] ; 0x100c08c78 -> 0x10043ee90 __Z21InitFunctionSignatureIM10MarkerBarnFP6MarkerPK9MetaClassEEvP17FunctionSignature
0x10043f6df: mov qword ptr [rip + 0x1bc53b2], rdx ; 0x102004a98
0x10043f6e6: mov qword ptr [rip + 0x1bc53b3], rax ; 0x102004aa0
0x10043f6ed: lea rdx, [rip + 0x7379d4] ; 0x100b770c8 ObjectFactory_CreatesType
0x10043f6f4: vmovq xmm0, rdx
0x10043f6f9: vmovq xmm1, r14
0x10043f6fe: vpunpcklqdq xmm0, xmm0, xmm1
0x10043f702: vmovdqa xmmword ptr [rip + 0x1bc53a6], xmm0 ; 0x102004ab0
0x10043f70a: lea rdx, [rip + 0x1bc539f] ; 0x102004ab0
0x10043f711: mov qword ptr [rip + 0x1bc53a4], 0 ; 0x102004ac0
0x10043f71c: mov qword ptr [rip + 0x1bc532d], rdx ; 0x102004a50
0x10043f723: lea rdx, [rip + 0x74933f] ; 0x100b88a69 ReleaseMarker
0x10043f72a: mov qword ptr [rip + 0x1bc5397], rdx ; 0x102004ac8
0x10043f731: lea rdx, [rip + 0x1bc5390] ; 0x102004ac8
0x10043f738: mov qword ptr [rip + 0x1bc5399], rcx ; 0x102004ad8
0x10043f73f: mov qword ptr [rip + 0x83081a], rdx ; 0x100c6ff60
0x10043f746: lea rcx, [rip - 0x1fad] ; 0x10043d7a0
0x10043f74d: vmovq xmm0, rcx
0x10043f752: vmovdqu xmmword ptr [rip + 0x1bc53a6], xmm0 ; 0x102004b00
0x10043f75a: mov rcx, qword ptr [rip + 0x7c5c97] ; 0x100c053f8 -> 0x10043ef10 __Z12ApplyWrapperI10MarkerBarnMS0_FvP6MarkerEEvM9VoidClassFvvEPv8VariablePS9_j
0x10043f761: mov qword ptr [rip + 0x1bc53a8], rcx ; 0x102004b10
0x10043f768: mov rcx, qword ptr [rip + 0x7c9519] ; 0x100c08c88 -> 0x10043efa0 __Z21InitFunctionSignatureIM10MarkerBarnFvP6MarkerEEvP17FunctionSignature
0x10043f76f: mov qword ptr [rip + 0x1bc53a2], rcx ; 0x102004b18
0x10043f776: mov qword ptr [rip + 0x1bc53a3], rax ; 0x102004b20
0x10043f77d: lea rax, [rip + 0x737970] ; 0x100b770f4 ObjectFactory_ReleasesType
0x10043f784: vmovq xmm0, rax
0x10043f789: vpunpcklqdq xmm0, xmm0, xmm1
0x10043f78d: vmovdqa xmmword ptr [rip + 0x1bc539b], xmm0 ; 0x102004b30
0x10043f795: lea rax, [rip + 0x1bc5394] ; 0x102004b30
0x10043f79c: mov qword ptr [rip + 0x1bc5399], 0 ; 0x102004b40
0x10043f7a7: mov qword ptr [rip + 0x1bc5322], rax ; 0x102004ad0
0x10043f7ae: lea rax, [rip + 0x7492c2] ; 0x100b88a77 kMarkerRadius
0x10043f7b5: mov qword ptr [rip + 0x1bc538c], rax ; 0x102004b48
0x10043f7bc: lea rax, [rip + 0x1bc5385] ; 0x102004b48
0x10043f7c3: mov rcx, qword ptr [rip + 0x8504d6] ; 0x100c8fca0
0x10043f7ca: mov qword ptr [rip + 0x1bc5387], rcx ; 0x102004b58
0x10043f7d1: lea rcx, [rip + 0x8ec948] ; 0x100d2c120
0x10043f7d8: vmovq xmm0, rcx
0x10043f7dd: lea rcx, [rip + 0x7492a1] ; 0x100b88a85 Marker.cpp
0x10043f7e4: vmovq xmm1, rcx
0x10043f7e9: vpunpcklqdq xmm0, xmm1, xmm0
0x10043f7ed: vmovdqu xmmword ptr [rip + 0x1bc5373], xmm0 ; 0x102004b68
0x10043f7f5: mov qword ptr [rip + 0x1bc537c], r15 ; 0x102004b78
0x10043f7fc: mov qword ptr [rip + 0x1bc5379], 0 ; 0x102004b80
0x10043f807: mov qword ptr [rip + 0x1bc537a], rbx ; 0x102004b88
0x10043f80e: mov qword ptr [rip + 0x1bc5377], 0 ; 0x102004b90
0x10043f819: lea rcx, [rip + 0x73f4e2] ; 0x100b7ed02 DebugLines
0x10043f820: vmovq xmm0, rcx
0x10043f825: lea rcx, [rip + 0x71e7f1] ; 0x100b5e01d TweakCategory
0x10043f82c: vmovq xmm2, rcx
0x10043f831: vpunpcklqdq xmm0, xmm2, xmm0
0x10043f835: vmovdqa xmmword ptr [rip + 0x1bc5363], xmm0 ; 0x102004ba0
0x10043f83d: lea rcx, [rip + 0x1bc535c] ; 0x102004ba0
0x10043f844: mov qword ptr [rip + 0x1bc5361], 0 ; 0x102004bb0
0x10043f84f: mov qword ptr [rip + 0x1bc52fa], rcx ; 0x102004b50
0x10043f856: lea rcx, [rip + 0x749233] ; 0x100b88a90 kDebugDrawMarkers
0x10043f85d: mov qword ptr [rip + 0x1bc5354], rcx ; 0x102004bb8
0x10043f864: lea rcx, [rip + 0x1bc534d] ; 0x102004bb8
0x10043f86b: mov qword ptr [rip + 0x1bc5356], rax ; 0x102004bc8
0x10043f872: mov qword ptr [rip + 0x850427], rcx ; 0x100c8fca0
0x10043f879: lea rax, [rip + 0x8868a0] ; 0x100cc6120
0x10043f880: vmovq xmm2, rax
0x10043f885: vpunpcklqdq xmm1, xmm1, xmm2
0x10043f889: vmovdqu xmmword ptr [rip + 0x1bc5347], xmm1 ; 0x102004bd8
0x10043f891: mov qword ptr [rip + 0x1bc5350], r15 ; 0x102004be8
0x10043f898: mov qword ptr [rip + 0x1bc534d], 0 ; 0x102004bf0
0x10043f8a3: mov qword ptr [rip + 0x1bc534e], rbx ; 0x102004bf8
0x10043f8aa: mov qword ptr [rip + 0x1bc534b], 0 ; 0x102004c00
0x10043f8b5: vmovdqa xmmword ptr [rip + 0x1bc5353], xmm0 ; 0x102004c10
0x10043f8bd: lea rax, [rip + 0x1bc534c] ; 0x102004c10
0x10043f8c4: mov qword ptr [rip + 0x1bc5351], 0 ; 0x102004c20
0x10043f8cf: mov qword ptr [rip + 0x1bc52ea], rax ; 0x102004bc0
0x10043f8d6: add rsp, 8
0x10043f8da: pop rbx
0x10043f8db: pop r14
0x10043f8dd: pop r15
0x10043f8df: pop rbp
0x10043f8e0: ret 
0x10043f8e1: nop 
0x10043f8e2: nop 
0x10043f8e3: nop 
0x10043f8e4: nop 
0x10043f8e5: nop 
0x10043f8e6: nop 
0x10043f8e7: nop 
0x10043f8e8: nop 
0x10043f8e9: nop 
0x10043f8ea: nop 
0x10043f8eb: nop 
0x10043f8ec: nop 
0x10043f8ed: nop 
0x10043f8ee: nop 
0x10043f8ef: nop 
