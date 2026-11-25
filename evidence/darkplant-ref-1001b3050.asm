0x1001b3050: push rbp
0x1001b3051: mov rbp, rsp
0x1001b3054: push r15
0x1001b3056: push r14
0x1001b3058: push r13
0x1001b305a: push r12
0x1001b305c: push rbx
0x1001b305d: sub rsp, 0x58
0x1001b3061: mov dword ptr [rip + 0xb70f31], 0 ; 0x100d23f9c
0x1001b306b: lea rax, [rip + 0x9c4e06] ; 0x100b77e78 kBlaze_RenderDebug
0x1001b3072: mov qword ptr [rip + 0x1c27cf7], rax ; 0x101ddad70
0x1001b3079: lea rax, [rip + 0x1c27cf0] ; 0x101ddad70
0x1001b3080: mov rcx, qword ptr [rip + 0xadcc19] ; 0x100c8fca0
0x1001b3087: mov qword ptr [rip + 0x1c27cf2], rcx ; 0x101ddad80
0x1001b308e: mov qword ptr [rip + 0xadcc0b], rax ; 0x100c8fca0
0x1001b3095: lea rax, [rip + 0xad8184] ; 0x100c8b220
0x1001b309c: vmovq xmm0, rax
0x1001b30a1: lea rax, [rip + 0x9c4de3] ; 0x100b77e8b Blaze.cpp
0x1001b30a8: vmovq xmm1, rax
0x1001b30ad: vpunpcklqdq xmm0, xmm1, xmm0
0x1001b30b1: vmovdqu xmmword ptr [rip + 0x1c27cd7], xmm0 ; 0x101ddad90
0x1001b30b9: mov r14, qword ptr [rip + 0xa54498] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1001b30c0: mov qword ptr [rip + 0x1c27cd9], r14 ; 0x101ddada0
0x1001b30c7: mov qword ptr [rip + 0x1c27cd6], 0 ; 0x101ddada8
0x1001b30d2: lea r13, [rip - 0x1996b9] ; 0x100019a20
0x1001b30d9: mov qword ptr [rip + 0x1c27cd0], r13 ; 0x101ddadb0
0x1001b30e0: mov qword ptr [rip + 0x1c27ccd], 0 ; 0x101ddadb8
0x1001b30eb: lea rax, [rip + 0x9aaf2b] ; 0x100b5e01d TweakCategory
0x1001b30f2: vmovq xmm0, rax
0x1001b30f7: lea rax, [rip + 0x9c4d97] ; 0x100b77e95 Blaze
0x1001b30fe: vmovq xmm1, rax
0x1001b3103: vmovdqa xmmword ptr [rbp - 0x40], xmm1
0x1001b3108: vpunpcklqdq xmm0, xmm0, xmm1
0x1001b310c: vmovdqa xmmword ptr [rip + 0x1c27cac], xmm0 ; 0x101ddadc0
0x1001b3114: lea rcx, [rip + 0x1c27ca5] ; 0x101ddadc0
0x1001b311b: mov qword ptr [rip + 0x1c27caa], 0 ; 0x101ddadd0
0x1001b3126: mov qword ptr [rip + 0x1c27c4b], rcx ; 0x101ddad78
0x1001b312d: mov qword ptr [rip + 0x1c27cac], rax ; 0x101ddade0
0x1001b3134: lea rax, [rip + 0x1c27c9d] ; 0x101ddadd8
0x1001b313b: mov qword ptr [rip + 0x1c27ca2], 0 ; 0x101ddade8
0x1001b3146: mov rcx, qword ptr [rip + 0xabce0b] ; 0x100c6ff58
0x1001b314d: mov qword ptr [rip + 0x1c27c9c], rcx ; 0x101ddadf0
0x1001b3154: mov qword ptr [rip + 0xabcdfd], rax ; 0x100c6ff58
0x1001b315b: mov qword ptr [rip + 0x1c27c9e], rax ; 0x101ddae00
0x1001b3162: lea rax, [rip - 0x17d8a9] ; 0x1000358c0
0x1001b3169: mov qword ptr [rip + 0x1c27c98], rax ; 0x101ddae08
0x1001b3170: mov dword ptr [rip + 0x1c27c96], 0xffffffff ; 0x101ddae10
0x1001b317a: mov dword ptr [rip + 0x1c27c90], 0xffffffff ; 0x101ddae14
0x1001b3184: mov qword ptr [rip + 0x1c27ca1], 0 ; 0x101ddae30
0x1001b318f: mov rax, qword ptr [rip + 0xa59272] ; 0x100c0c408
0x1001b3196: add rax, 0x10
0x1001b319a: mov qword ptr [rip + 0x1c27c37], rax ; 0x101ddadd8
0x1001b31a1: xor eax, eax
0x1001b31a3: call 0x100011c10 ; 0x100011c10
0x1001b31a8: lea rax, [rip + 0x9ace8d] ; 0x100b6003c Tool_Export
0x1001b31af: vmovq xmm0, rax
0x1001b31b4: lea rax, [rip + 0x9ab824] ; 0x100b5e9df true
0x1001b31bb: vmovq xmm1, rax
0x1001b31c0: vpunpcklqdq xmm0, xmm0, xmm1
0x1001b31c4: vmovdqa xmmword ptr [rip + 0x1c27c74], xmm0 ; 0x101ddae40
0x1001b31cc: lea rax, [rip + 0x1c27c6d] ; 0x101ddae40
0x1001b31d3: mov rcx, qword ptr [rip + 0x1c27c0e] ; 0x101ddade8
0x1001b31da: mov qword ptr [rip + 0x1c27c6f], rcx ; 0x101ddae50
0x1001b31e1: mov qword ptr [rip + 0x1c27c00], rax ; 0x101ddade8
0x1001b31e8: lea rax, [rip + 0x9c3e52] ; 0x100b77041 SetTransform
0x1001b31ef: mov qword ptr [rip + 0x1c27c62], rax ; 0x101ddae58
0x1001b31f6: lea rcx, [rip + 0x1c27c5b] ; 0x101ddae58
0x1001b31fd: mov qword ptr [rip + 0x1c27c58], 0 ; 0x101ddae60
0x1001b3208: mov rax, qword ptr [rip + 0xabcd51] ; 0x100c6ff60
0x1001b320f: mov qword ptr [rip + 0x1c27c52], rax ; 0x101ddae68
0x1001b3216: lea rax, [rip - 0x5d1d] ; 0x1001ad500
0x1001b321d: vmovq xmm0, rax
0x1001b3222: vmovdqu xmmword ptr [rip + 0x1c27c66], xmm0 ; 0x101ddae90
0x1001b322a: mov rax, qword ptr [rip + 0xa52f57] ; 0x100c06188 -> 0x1001b1f60 __Z12ApplyWrapperI5BlazeMS0_FvRKN10Vectormath3Aos7Matrix4EEEvM9VoidClassFvvEPv8VariablePSC_j
0x1001b3231: mov qword ptr [rip + 0x1c27c68], rax ; 0x101ddaea0
0x1001b3238: mov rax, qword ptr [rip + 0xa567d9] ; 0x100c09a18 -> 0x1001b2000 __Z21InitFunctionSignatureIM5BlazeFvRKN10Vectormath3Aos7Matrix4EEEvP17FunctionSignature
0x1001b323f: mov qword ptr [rip + 0x1c27c62], rax ; 0x101ddaea8
0x1001b3246: mov rax, qword ptr [rip + 0xa5536b] ; 0x100c085b8 -> 0x1001b1bf0 __Z18GetMetaClassByTypeIP5BlazeERK9MetaClassv
0x1001b324d: mov qword ptr [rip + 0x1c27c5c], rax ; 0x101ddaeb0
0x1001b3254: lea rdx, [rip + 0x9c0004] ; 0x100b7325f GetTransform
0x1001b325b: mov qword ptr [rip + 0x1c27c56], rdx ; 0x101ddaeb8
0x1001b3262: lea rdx, [rip + 0x1c27c4f] ; 0x101ddaeb8
0x1001b3269: mov qword ptr [rip + 0x1c27c4c], 0 ; 0x101ddaec0
0x1001b3274: mov qword ptr [rip + 0x1c27c4d], rcx ; 0x101ddaec8
0x1001b327b: lea rcx, [rip - 0x5d52] ; 0x1001ad530
0x1001b3282: vmovq xmm0, rcx
0x1001b3287: vmovdqu xmmword ptr [rip + 0x1c27c61], xmm0 ; 0x101ddaef0
0x1001b328f: mov rcx, qword ptr [rip + 0xa52f02] ; 0x100c06198 -> 0x1001b2080 __Z12ApplyWrapperI5BlazeMS0_KFN10Vectormath3Aos7Matrix4EvEEvM9VoidClassFvvEPv8VariablePSA_j
0x1001b3296: mov qword ptr [rip + 0x1c27c63], rcx ; 0x101ddaf00
0x1001b329d: mov rcx, qword ptr [rip + 0xa56784] ; 0x100c09a28 -> 0x1001b2110 __Z21InitFunctionSignatureIM5BlazeKFN10Vectormath3Aos7Matrix4EvEEvP17FunctionSignature
0x1001b32a4: mov qword ptr [rip + 0x1c27c5d], rcx ; 0x101ddaf08
0x1001b32ab: mov qword ptr [rip + 0x1c27c5e], rax ; 0x101ddaf10
0x1001b32b2: lea rcx, [rip + 0x9c3d95] ; 0x100b7704e SetEnabled
0x1001b32b9: mov qword ptr [rip + 0x1c27c58], rcx ; 0x101ddaf18
0x1001b32c0: lea rcx, [rip + 0x1c27c51] ; 0x101ddaf18
0x1001b32c7: mov qword ptr [rip + 0x1c27c4e], 0 ; 0x101ddaf20
0x1001b32d2: mov qword ptr [rip + 0x1c27c4f], rdx ; 0x101ddaf28
0x1001b32d9: lea rdx, [rip - 0x5d80] ; 0x1001ad560
0x1001b32e0: vmovq xmm0, rdx
0x1001b32e5: vmovdqu xmmword ptr [rip + 0x1c27c63], xmm0 ; 0x101ddaf50
0x1001b32ed: mov rdx, qword ptr [rip + 0xa52e9c] ; 0x100c06190 -> 0x1001b2140 __Z12ApplyWrapperI5BlazeMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x1001b32f4: mov qword ptr [rip + 0x1c27c65], rdx ; 0x101ddaf60
0x1001b32fb: mov rdx, qword ptr [rip + 0xa5671e] ; 0x100c09a20 -> 0x1001b21e0 __Z21InitFunctionSignatureIM5BlazeFvbEEvP17FunctionSignature
0x1001b3302: mov qword ptr [rip + 0x1c27c5f], rdx ; 0x101ddaf68
0x1001b3309: mov qword ptr [rip + 0x1c27c60], rax ; 0x101ddaf70
0x1001b3310: lea rdx, [rip + 0x9bff5c] ; 0x100b73273 GetEnabled
0x1001b3317: mov qword ptr [rip + 0x1c27c5a], rdx ; 0x101ddaf78
0x1001b331e: lea rdx, [rip + 0x1c27c53] ; 0x101ddaf78
0x1001b3325: mov qword ptr [rip + 0x1c27c50], 0 ; 0x101ddaf80
0x1001b3330: mov qword ptr [rip + 0x1c27c51], rcx ; 0x101ddaf88
0x1001b3337: mov qword ptr [rip + 0xabcc22], rdx ; 0x100c6ff60
0x1001b333e: lea rcx, [rip - 0x5dd5] ; 0x1001ad570
0x1001b3345: vmovq xmm0, rcx
0x1001b334a: vmovdqu xmmword ptr [rip + 0x1c27c5e], xmm0 ; 0x101ddafb0
0x1001b3352: mov rcx, qword ptr [rip + 0xa52e47] ; 0x100c061a0 -> 0x1001b2260 __Z12ApplyWrapperI5BlazeMS0_KFbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1001b3359: mov qword ptr [rip + 0x1c27c60], rcx ; 0x101ddafc0
0x1001b3360: mov rcx, qword ptr [rip + 0xa566c9] ; 0x100c09a30 -> 0x1001b22e0 __Z21InitFunctionSignatureIM5BlazeKFbvEEvP17FunctionSignature
0x1001b3367: mov qword ptr [rip + 0x1c27c5a], rcx ; 0x101ddafc8
0x1001b336e: mov qword ptr [rip + 0x1c27c5b], rax ; 0x101ddafd0
0x1001b3375: lea rcx, [rip + 0x9b7d43] ; 0x100b6b0bf transform
0x1001b337c: mov qword ptr [rip + 0xad7ea5], rcx ; 0x100c8b228
0x1001b3383: lea rcx, [rip + 0xad7e9e] ; 0x100c8b228
0x1001b338a: mov qword ptr [rip + 0xad7e9b], 0 ; 0x100c8b230
0x1001b3395: mov rdx, qword ptr [rip + 0xac48c4] ; 0x100c77c60
0x1001b339c: mov qword ptr [rip + 0xad7e95], rdx ; 0x100c8b238
0x1001b33a3: mov qword ptr [rip + 0xad7e9a], 0x10 ; 0x100c8b248
0x1001b33ae: mov rdx, qword ptr [rip + 0xa53a13] ; 0x100c06dc8 -> 0x100199090 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Matrix4EERK8MetaTypev
0x1001b33b5: mov qword ptr [rip + 0xad7e94], rdx ; 0x100c8b250
0x1001b33bc: mov qword ptr [rip + 0xad7e95], rax ; 0x100c8b258
0x1001b33c3: mov qword ptr [rip + 0xad7e92], 0xffffffffffffffff ; 0x100c8b260
0x1001b33ce: mov qword ptr [rip + 0xad7e93], r13 ; 0x100c8b268
0x1001b33d5: mov qword ptr [rip + 0xad7e90], 0 ; 0x100c8b270
0x1001b33e0: lea rdx, [rip + 0x9c3c72] ; 0x100b77059 enabled
0x1001b33e7: mov qword ptr [rip + 0xad7e8a], rdx ; 0x100c8b278
0x1001b33ee: lea rdx, [rip + 0xad7e83] ; 0x100c8b278
0x1001b33f5: mov qword ptr [rip + 0xad7e8c], rcx ; 0x100c8b288
0x1001b33fc: mov qword ptr [rip + 0xad7e91], 0x54 ; 0x100c8b298
0x1001b3407: mov qword ptr [rip + 0xad7e92], r14 ; 0x100c8b2a0
0x1001b340e: mov qword ptr [rip + 0xad7e93], rax ; 0x100c8b2a8
0x1001b3415: mov qword ptr [rip + 0xad7e90], 0xffffffffffffffff ; 0x100c8b2b0
0x1001b3420: mov qword ptr [rip + 0xad7e91], r13 ; 0x100c8b2b8
0x1001b3427: mov qword ptr [rip + 0xad7e8e], 0 ; 0x100c8b2c0
0x1001b3432: lea rcx, [rip + 0x9ab5c9] ; 0x100b5ea02 Tool_DefaultValue
0x1001b3439: vmovq xmm0, rcx
0x1001b343e: vpunpcklqdq xmm2, xmm0, xmm1
0x1001b3442: vmovdqa xmm4, xmm1
0x1001b3446: vmovdqa xmmword ptr [rbp - 0x70], xmm4
0x1001b344b: vmovdqa xmmword ptr [rip + 0x1c27b8d], xmm2 ; 0x101ddafe0
0x1001b3453: vmovdqa xmmword ptr [rbp - 0x80], xmm2
0x1001b3458: lea rcx, [rip + 0x1c27b81] ; 0x101ddafe0
0x1001b345f: mov qword ptr [rip + 0x1c27b86], 0 ; 0x101ddaff0
0x1001b346a: mov qword ptr [rip + 0xad7e0f], rcx ; 0x100c8b280
0x1001b3471: lea rcx, [rip + 0x9bfea8] ; 0x100b73320 root
0x1001b3478: mov qword ptr [rip + 0xad7e49], rcx ; 0x100c8b2c8
0x1001b347f: lea rcx, [rip + 0xad7e42] ; 0x100c8b2c8
0x1001b3486: mov qword ptr [rip + 0xad7e4b], rdx ; 0x100c8b2d8
0x1001b348d: mov qword ptr [rip + 0xad7e50], 0x55 ; 0x100c8b2e8
0x1001b3498: mov qword ptr [rip + 0xad7e51], r14 ; 0x100c8b2f0
0x1001b349f: mov qword ptr [rip + 0xad7e52], rax ; 0x100c8b2f8
0x1001b34a6: mov qword ptr [rip + 0xad7e4f], 0xffffffffffffffff ; 0x100c8b300
0x1001b34b1: mov qword ptr [rip + 0xad7e50], r13 ; 0x100c8b308
0x1001b34b8: mov qword ptr [rip + 0xad7e4d], 0 ; 0x100c8b310
0x1001b34c3: lea rdx, [rip + 0x9efb62] ; 0x100ba302c false
0x1001b34ca: vmovq xmm1, rdx
0x1001b34cf: vpunpcklqdq xmm1, xmm0, xmm1
0x1001b34d3: vmovdqa xmmword ptr [rip + 0x1c27b25], xmm1 ; 0x101ddb000
0x1001b34db: lea rdx, [rip + 0x1c27b1e] ; 0x101ddb000
0x1001b34e2: mov qword ptr [rip + 0x1c27b23], 0 ; 0x101ddb010
0x1001b34ed: mov qword ptr [rip + 0xad7ddc], rdx ; 0x100c8b2d0
0x1001b34f4: lea rdx, [rip + 0x9c3dbf] ; 0x100b772ba bstGuid
0x1001b34fb: mov qword ptr [rip + 0xad7e16], rdx ; 0x100c8b318
0x1001b3502: lea rdx, [rip + 0xad7e0f] ; 0x100c8b318
0x1001b3509: mov qword ptr [rip + 0xad7e0c], 0 ; 0x100c8b320
0x1001b3514: mov qword ptr [rip + 0xad7e0d], rcx ; 0x100c8b328
0x1001b351b: mov qword ptr [rip + 0xad7e12], 0x68 ; 0x100c8b338
0x1001b3526: mov rcx, qword ptr [rip + 0xa5404b] ; 0x100c07578 -> 0x100021960 __Z17GetMetaTypeByTypeIjERK8MetaTypev
0x1001b352d: mov qword ptr [rip + 0xad7e0c], rcx ; 0x100c8b340
0x1001b3534: mov qword ptr [rip + 0xad7e0d], rax ; 0x100c8b348
0x1001b353b: mov qword ptr [rip + 0xad7e0a], 0xffffffffffffffff ; 0x100c8b350
0x1001b3546: mov qword ptr [rip + 0xad7e0b], r13 ; 0x100c8b358
0x1001b354d: mov qword ptr [rip + 0xad7e08], 0 ; 0x100c8b360
0x1001b3558: lea rcx, [rip + 0x9c493c] ; 0x100b77e9b savepoint
0x1001b355f: mov qword ptr [rip + 0xad7e02], rcx ; 0x100c8b368
0x1001b3566: lea rcx, [rip + 0xad7dfb] ; 0x100c8b368
0x1001b356d: mov qword ptr [rip + 0xad7e04], rdx ; 0x100c8b378
0x1001b3574: mov qword ptr [rip + 0xad7e09], 0x57 ; 0x100c8b388
0x1001b357f: mov qword ptr [rip + 0xad7e0a], r14 ; 0x100c8b390
0x1001b3586: mov qword ptr [rip + 0xad7e0b], rax ; 0x100c8b398
0x1001b358d: mov qword ptr [rip + 0xad7e08], 0xffffffffffffffff ; 0x100c8b3a0
0x1001b3598: mov qword ptr [rip + 0xad7e09], r13 ; 0x100c8b3a8
0x1001b359f: mov qword ptr [rip + 0xad7e06], 0 ; 0x100c8b3b0
0x1001b35aa: vmovdqa xmmword ptr [rip + 0x1c27a6e], xmm1 ; 0x101ddb020
0x1001b35b2: lea rdx, [rip + 0x1c27a67] ; 0x101ddb020
0x1001b35b9: mov qword ptr [rip + 0x1c27a6c], 0 ; 0x101ddb030
0x1001b35c4: mov qword ptr [rip + 0xad7da5], rdx ; 0x100c8b370
0x1001b35cb: lea rdx, [rip + 0x9c48d3] ; 0x100b77ea5 hint
0x1001b35d2: mov qword ptr [rip + 0xad7ddf], rdx ; 0x100c8b3b8
0x1001b35d9: lea rdx, [rip + 0xad7dd8] ; 0x100c8b3b8
0x1001b35e0: mov qword ptr [rip + 0xad7de1], rcx ; 0x100c8b3c8
0x1001b35e7: mov qword ptr [rip + 0xad7de6], 0x61 ; 0x100c8b3d8
0x1001b35f2: mov qword ptr [rip + 0xad7de7], r14 ; 0x100c8b3e0
0x1001b35f9: mov qword ptr [rip + 0xad7de8], rax ; 0x100c8b3e8
0x1001b3600: mov qword ptr [rip + 0xad7de5], 0xffffffffffffffff ; 0x100c8b3f0
0x1001b360b: mov qword ptr [rip + 0xad7de6], r13 ; 0x100c8b3f8
0x1001b3612: mov qword ptr [rip + 0xad7de3], 0 ; 0x100c8b400
0x1001b361d: vmovdqa xmmword ptr [rip + 0x1c27a1b], xmm1 ; 0x101ddb040
0x1001b3625: lea rcx, [rip + 0x1c27a14] ; 0x101ddb040
0x1001b362c: mov qword ptr [rip + 0x1c27a19], 0 ; 0x101ddb050
0x1001b3637: mov qword ptr [rip + 0xad7d82], rcx ; 0x100c8b3c0
0x1001b363e: lea rcx, [rip + 0x9c4865] ; 0x100b77eaa backlit
0x1001b3645: mov qword ptr [rip + 0xad7dbc], rcx ; 0x100c8b408
0x1001b364c: lea rcx, [rip + 0xad7db5] ; 0x100c8b408
0x1001b3653: mov qword ptr [rip + 0xad7dbe], rdx ; 0x100c8b418
0x1001b365a: mov qword ptr [rip + 0xad7dc3], 0x60 ; 0x100c8b428
0x1001b3665: mov qword ptr [rip + 0xad7dc4], r14 ; 0x100c8b430
0x1001b366c: mov qword ptr [rip + 0xad7dc5], rax ; 0x100c8b438
0x1001b3673: mov qword ptr [rip + 0xad7dc2], 0xffffffffffffffff ; 0x100c8b440
0x1001b367e: mov qword ptr [rip + 0xad7dc3], r13 ; 0x100c8b448
0x1001b3685: mov qword ptr [rip + 0xad7dc0], 0 ; 0x100c8b450
0x1001b3690: vmovdqa xmmword ptr [rip + 0x1c279c8], xmm2 ; 0x101ddb060
0x1001b3698: lea rdx, [rip + 0x1c279c1] ; 0x101ddb060
0x1001b369f: mov qword ptr [rip + 0x1c279c6], 0 ; 0x101ddb070
0x1001b36aa: mov qword ptr [rip + 0xad7d5f], rdx ; 0x100c8b410
0x1001b36b1: lea rdx, [rip + 0x9c47fa] ; 0x100b77eb2 autoSave
0x1001b36b8: mov qword ptr [rip + 0xad7d99], rdx ; 0x100c8b458
0x1001b36bf: lea rdx, [rip + 0xad7d92] ; 0x100c8b458
0x1001b36c6: mov qword ptr [rip + 0xad7d9b], rcx ; 0x100c8b468
0x1001b36cd: mov qword ptr [rip + 0xad7da0], 0x91 ; 0x100c8b478
0x1001b36d8: mov qword ptr [rip + 0xad7da1], r14 ; 0x100c8b480
0x1001b36df: mov qword ptr [rip + 0xad7da2], rax ; 0x100c8b488
0x1001b36e6: mov qword ptr [rip + 0xad7d9f], 0xffffffffffffffff ; 0x100c8b490
0x1001b36f1: mov qword ptr [rip + 0xad7da0], r13 ; 0x100c8b498
0x1001b36f8: mov qword ptr [rip + 0xad7d9d], 0 ; 0x100c8b4a0
0x1001b3703: vmovdqa xmmword ptr [rip + 0x1c27975], xmm1 ; 0x101ddb080
0x1001b370b: lea rcx, [rip + 0x1c2796e] ; 0x101ddb080
0x1001b3712: mov qword ptr [rip + 0x1c27973], 0 ; 0x101ddb090
0x1001b371d: mov qword ptr [rip + 0xad7d3c], rcx ; 0x100c8b460
0x1001b3724: lea rcx, [rip + 0x9c4790] ; 0x100b77ebb middleStep
0x1001b372b: mov qword ptr [rip + 0xad7d76], rcx ; 0x100c8b4a8
0x1001b3732: lea rcx, [rip + 0xad7d6f] ; 0x100c8b4a8
0x1001b3739: mov qword ptr [rip + 0xad7d78], rdx ; 0x100c8b4b8
0x1001b3740: mov qword ptr [rip + 0xad7d7d], 0x90 ; 0x100c8b4c8
0x1001b374b: mov qword ptr [rip + 0xad7d7e], r14 ; 0x100c8b4d0
0x1001b3752: mov qword ptr [rip + 0xad7d7f], rax ; 0x100c8b4d8
0x1001b3759: mov qword ptr [rip + 0xad7d7c], 0xffffffffffffffff ; 0x100c8b4e0
0x1001b3764: mov qword ptr [rip + 0xad7d7d], r13 ; 0x100c8b4e8
0x1001b376b: mov qword ptr [rip + 0xad7d7a], 0 ; 0x100c8b4f0
0x1001b3776: vmovdqa xmmword ptr [rip + 0x1c27922], xmm1 ; 0x101ddb0a0
0x1001b377e: vmovdqa xmm5, xmm1
0x1001b3782: vmovdqa xmmword ptr [rbp - 0x60], xmm5
0x1001b3787: lea rdx, [rip + 0x1c27912] ; 0x101ddb0a0
0x1001b378e: mov qword ptr [rip + 0x1c27917], 0 ; 0x101ddb0b0
0x1001b3799: mov qword ptr [rip + 0xad7d10], rdx ; 0x100c8b4b0
0x1001b37a0: lea rdx, [rip + 0x9c471f] ; 0x100b77ec6 emberChance
0x1001b37a7: mov qword ptr [rip + 0xad7d4a], rdx ; 0x100c8b4f8
0x1001b37ae: lea rdx, [rip + 0xad7d43] ; 0x100c8b4f8
0x1001b37b5: mov qword ptr [rip + 0xad7d4c], rcx ; 0x100c8b508
0x1001b37bc: mov qword ptr [rip + 0xad7d51], 0x64 ; 0x100c8b518
0x1001b37c7: mov rcx, qword ptr [rip + 0xa53d92] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1001b37ce: mov qword ptr [rip + 0xad7d4b], rcx ; 0x100c8b520
0x1001b37d5: mov qword ptr [rip + 0xad7d4c], rax ; 0x100c8b528
0x1001b37dc: mov qword ptr [rip + 0xad7d49], 0xffffffffffffffff ; 0x100c8b530
0x1001b37e7: mov qword ptr [rip + 0xad7d4a], r13 ; 0x100c8b538
0x1001b37ee: mov qword ptr [rip + 0xad7d47], 0 ; 0x100c8b540
0x1001b37f9: lea rsi, [rip + 0x9c0914] ; 0x100b74114 0.0
0x1001b3800: vmovq xmm1, rsi
0x1001b3805: vpunpcklqdq xmm1, xmm0, xmm1
0x1001b3809: vmovdqa xmmword ptr [rip + 0x1c278af], xmm1 ; 0x101ddb0c0
0x1001b3811: lea rsi, [rip + 0x1c278a8] ; 0x101ddb0c0
0x1001b3818: mov qword ptr [rip + 0x1c278ad], 0 ; 0x101ddb0d0
0x1001b3823: mov qword ptr [rip + 0xad7cd6], rsi ; 0x100c8b500
0x1001b382a: lea rsi, [rip + 0x9c46a1] ; 0x100b77ed2 children
0x1001b3831: mov qword ptr [rip + 0xad7d10], rsi ; 0x100c8b548
0x1001b3838: lea rsi, [rip + 0xad7d09] ; 0x100c8b548
0x1001b383f: mov qword ptr [rip + 0xad7d12], rdx ; 0x100c8b558
0x1001b3846: mov qword ptr [rip + 0xad7d17], 0x70 ; 0x100c8b568
0x1001b3851: mov r15, qword ptr [rip + 0xa53a70] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x1001b3858: mov qword ptr [rip + 0xad7d11], r15 ; 0x100c8b570
0x1001b385f: mov qword ptr [rip + 0xad7d12], rax ; 0x100c8b578
0x1001b3866: mov qword ptr [rip + 0xad7d0f], 0xffffffffffffffff ; 0x100c8b580
0x1001b3871: mov qword ptr [rip + 0xad7d10], r13 ; 0x100c8b588
0x1001b3878: mov qword ptr [rip + 0xad7d0d], 0 ; 0x100c8b590
0x1001b3883: lea rdx, [rip + 0x9ab162] ; 0x100b5e9ec Tool_ClumpType
0x1001b388a: vmovq xmm3, rdx
0x1001b388f: vpunpcklqdq xmm1, xmm3, xmmword ptr [rbp - 0x40]
0x1001b3894: vmovdqa xmmword ptr [rip + 0x1c27844], xmm1 ; 0x101ddb0e0
0x1001b389c: lea rdx, [rip + 0x1c2783d] ; 0x101ddb0e0
0x1001b38a3: mov qword ptr [rip + 0x1c27842], 0 ; 0x101ddb0f0
0x1001b38ae: lea rdi, [rip + 0x9ab164] ; 0x100b5ea19 Tool_Nullable
0x1001b38b5: vmovq xmm1, rdi
0x1001b38ba: vpunpcklqdq xmm1, xmm1, xmm4
0x1001b38be: vmovdqa xmmword ptr [rip + 0x1c2783a], xmm1 ; 0x101ddb100
0x1001b38c6: lea rdi, [rip + 0x1c27833] ; 0x101ddb100
0x1001b38cd: mov qword ptr [rip + 0x1c2783c], rdx ; 0x101ddb110
0x1001b38d4: lea rdx, [rip + 0x9ab1bc] ; 0x100b5ea97 null
0x1001b38db: vmovq xmm2, rdx
0x1001b38e0: vpunpcklqdq xmm2, xmm0, xmm2
0x1001b38e4: vmovdqa xmmword ptr [rip + 0x1c27834], xmm2 ; 0x101ddb120
0x1001b38ec: lea rdx, [rip + 0x1c2782d] ; 0x101ddb120
0x1001b38f3: mov qword ptr [rip + 0x1c27836], rdi ; 0x101ddb130
0x1001b38fa: mov qword ptr [rip + 0xad7c4f], rdx ; 0x100c8b550
0x1001b3901: lea rdx, [rip + 0x9c4042] ; 0x100b7794a meshType
0x1001b3908: mov qword ptr [rip + 0xad7c89], rdx ; 0x100c8b598
0x1001b390f: lea rdx, [rip + 0xad7c82] ; 0x100c8b598
0x1001b3916: mov qword ptr [rip + 0xad7c8b], rsi ; 0x100c8b5a8
0x1001b391d: mov qword ptr [rip + 0xad7c90], 0x58 ; 0x100c8b5b8
0x1001b3928: mov rsi, qword ptr [rip + 0xa53b89] ; 0x100c074b8 -> 0x1000522e0 __Z17GetMetaTypeByTypeIP9LevelMeshERK8MetaTypev
0x1001b392f: mov qword ptr [rip + 0xad7c8a], rsi ; 0x100c8b5c0
0x1001b3936: mov qword ptr [rip + 0xad7c8b], rax ; 0x100c8b5c8
0x1001b393d: mov qword ptr [rip + 0xad7c88], 0xffffffffffffffff ; 0x100c8b5d0
0x1001b3948: mov qword ptr [rip + 0xad7c89], r13 ; 0x100c8b5d8
0x1001b394f: mov qword ptr [rip + 0xad7c86], 0 ; 0x100c8b5e0
0x1001b395a: vmovdqa xmmword ptr [rip + 0x1c277de], xmm1 ; 0x101ddb140
0x1001b3962: lea rsi, [rip + 0x1c277d7] ; 0x101ddb140
0x1001b3969: mov qword ptr [rip + 0x1c277dc], 0 ; 0x101ddb150
0x1001b3974: vmovdqa xmmword ptr [rip + 0x1c277e4], xmm2 ; 0x101ddb160
0x1001b397c: lea rdi, [rip + 0x1c277dd] ; 0x101ddb160
0x1001b3983: mov qword ptr [rip + 0x1c277e6], rsi ; 0x101ddb170
0x1001b398a: mov qword ptr [rip + 0xad7c0f], rdi ; 0x100c8b5a0
0x1001b3991: lea rsi, [rip + 0x9c4543] ; 0x100b77edb activeTime
0x1001b3998: mov qword ptr [rip + 0xad7c49], rsi ; 0x100c8b5e8
0x1001b399f: lea rsi, [rip + 0xad7c42] ; 0x100c8b5e8
0x1001b39a6: mov qword ptr [rip + 0xad7c4b], rdx ; 0x100c8b5f8
0x1001b39ad: mov qword ptr [rip + 0xad7c50], 0x78 ; 0x100c8b608
0x1001b39b8: mov qword ptr [rip + 0xad7c51], rcx ; 0x100c8b610
0x1001b39bf: mov qword ptr [rip + 0xad7c52], rax ; 0x100c8b618
0x1001b39c6: mov qword ptr [rip + 0xad7c4f], 0xffffffffffffffff ; 0x100c8b620
0x1001b39d1: mov qword ptr [rip + 0xad7c50], r13 ; 0x100c8b628
0x1001b39d8: mov qword ptr [rip + 0xad7c4d], 0 ; 0x100c8b630
0x1001b39e3: lea rdx, [rip + 0x9f13d6] ; 0x100ba4dc0 0
0x1001b39ea: vmovq xmm4, rdx
0x1001b39ef: vpunpcklqdq xmm0, xmm0, xmm4
0x1001b39f3: vmovdqa xmmword ptr [rip + 0x1c27785], xmm0 ; 0x101ddb180
0x1001b39fb: lea rdx, [rip + 0x1c2777e] ; 0x101ddb180
0x1001b3a02: mov qword ptr [rip + 0x1c27783], 0 ; 0x101ddb190
0x1001b3a0d: mov qword ptr [rip + 0xad7bdc], rdx ; 0x100c8b5f0
0x1001b3a14: lea rdx, [rip + 0x9c44cb] ; 0x100b77ee6 randomChild
0x1001b3a1b: mov qword ptr [rip + 0xad7c16], rdx ; 0x100c8b638
0x1001b3a22: lea rdx, [rip + 0xad7c0f] ; 0x100c8b638
0x1001b3a29: mov qword ptr [rip + 0xad7c18], rsi ; 0x100c8b648
0x1001b3a30: mov qword ptr [rip + 0xad7c1d], 0x7c ; 0x100c8b658
0x1001b3a3b: mov qword ptr [rip + 0xad7c1e], r14 ; 0x100c8b660
0x1001b3a42: mov qword ptr [rip + 0xad7c1f], rax ; 0x100c8b668
0x1001b3a49: mov qword ptr [rip + 0xad7c1c], 0xffffffffffffffff ; 0x100c8b670
0x1001b3a54: mov qword ptr [rip + 0xad7c1d], r13 ; 0x100c8b678
0x1001b3a5b: mov qword ptr [rip + 0xad7c1a], 0 ; 0x100c8b680
0x1001b3a66: vmovdqa xmmword ptr [rip + 0x1c27732], xmm5 ; 0x101ddb1a0
0x1001b3a6e: lea rsi, [rip + 0x1c2772b] ; 0x101ddb1a0
0x1001b3a75: mov qword ptr [rip + 0x1c27730], 0 ; 0x101ddb1b0
0x1001b3a80: mov qword ptr [rip + 0xad7bb9], rsi ; 0x100c8b640
0x1001b3a87: lea r12, [rip + 0x9c140c] ; 0x100b74e9a onActivate
0x1001b3a8e: mov qword ptr [rip + 0xad7bf3], r12 ; 0x100c8b688
0x1001b3a95: lea rsi, [rip + 0xad7bec] ; 0x100c8b688
0x1001b3a9c: mov qword ptr [rip + 0xad7bf5], rdx ; 0x100c8b698
0x1001b3aa3: mov qword ptr [rip + 0xad7bfa], 0x80 ; 0x100c8b6a8
0x1001b3aae: mov qword ptr [rip + 0xad7bfb], r15 ; 0x100c8b6b0
0x1001b3ab5: mov qword ptr [rip + 0xad7bfc], rax ; 0x100c8b6b8
0x1001b3abc: mov qword ptr [rip + 0xad7bf9], 0xffffffffffffffff ; 0x100c8b6c0
0x1001b3ac7: mov qword ptr [rip + 0xad7bfa], r13 ; 0x100c8b6c8
0x1001b3ace: mov qword ptr [rip + 0xad7bf7], 0 ; 0x100c8b6d0
0x1001b3ad9: lea rdx, [rip + 0x9aaf1b] ; 0x100b5e9fb Object
0x1001b3ae0: vmovq xmm4, rdx
0x1001b3ae5: vpunpcklqdq xmm3, xmm3, xmm4
0x1001b3ae9: vmovdqa xmmword ptr [rip + 0x1c276cf], xmm3 ; 0x101ddb1c0
0x1001b3af1: vmovdqa xmmword ptr [rbp - 0x50], xmm3
0x1001b3af6: lea rdx, [rip + 0x1c276c3] ; 0x101ddb1c0
0x1001b3afd: mov qword ptr [rip + 0x1c276c8], 0 ; 0x101ddb1d0
0x1001b3b08: vmovdqa xmmword ptr [rip + 0x1c276d0], xmm1 ; 0x101ddb1e0
0x1001b3b10: lea rdi, [rip + 0x1c276c9] ; 0x101ddb1e0
0x1001b3b17: mov qword ptr [rip + 0x1c276d2], rdx ; 0x101ddb1f0
0x1001b3b1e: vmovdqa xmmword ptr [rip + 0x1c276da], xmm2 ; 0x101ddb200
0x1001b3b26: lea rdx, [rip + 0x1c276d3] ; 0x101ddb200
0x1001b3b2d: mov qword ptr [rip + 0x1c276dc], rdi ; 0x101ddb210
0x1001b3b34: mov qword ptr [rip + 0xad7b55], rdx ; 0x100c8b690
0x1001b3b3b: lea rdx, [rip + 0x9c43b0] ; 0x100b77ef2 onFail
0x1001b3b42: mov qword ptr [rip + 0xad7b8f], rdx ; 0x100c8b6d8
0x1001b3b49: lea rdx, [rip + 0xad7b88] ; 0x100c8b6d8
0x1001b3b50: mov qword ptr [rip + 0xad7b91], rsi ; 0x100c8b6e8
0x1001b3b57: mov qword ptr [rip + 0xad7b96], 0x88 ; 0x100c8b6f8
0x1001b3b62: mov qword ptr [rip + 0xad7b97], r15 ; 0x100c8b700
0x1001b3b69: mov qword ptr [rip + 0xad7b98], rax ; 0x100c8b708
0x1001b3b70: mov qword ptr [rip + 0xad7b95], 0xffffffffffffffff ; 0x100c8b710
0x1001b3b7b: mov qword ptr [rip + 0xad7b96], r13 ; 0x100c8b718
0x1001b3b82: mov qword ptr [rip + 0xad7b93], 0 ; 0x100c8b720
0x1001b3b8d: vmovdqa xmmword ptr [rip + 0x1c2768b], xmm3 ; 0x101ddb220
0x1001b3b95: lea rsi, [rip + 0x1c27684] ; 0x101ddb220
0x1001b3b9c: mov qword ptr [rip + 0x1c27689], 0 ; 0x101ddb230
0x1001b3ba7: vmovdqa xmmword ptr [rip + 0x1c27691], xmm1 ; 0x101ddb240
0x1001b3baf: lea rdi, [rip + 0x1c2768a] ; 0x101ddb240
0x1001b3bb6: mov qword ptr [rip + 0x1c27693], rsi ; 0x101ddb250
0x1001b3bbd: vmovdqa xmmword ptr [rip + 0x1c2769b], xmm2 ; 0x101ddb260
0x1001b3bc5: lea rsi, [rip + 0x1c27694] ; 0x101ddb260
0x1001b3bcc: mov qword ptr [rip + 0x1c2769d], rdi ; 0x101ddb270
0x1001b3bd3: mov qword ptr [rip + 0xad7b06], rsi ; 0x100c8b6e0
0x1001b3bda: lea rsi, [rip + 0x9c4318] ; 0x100b77ef9 turnOnDelay
0x1001b3be1: mov qword ptr [rip + 0xad7b40], rsi ; 0x100c8b728
0x1001b3be8: lea rsi, [rip + 0xad7b39] ; 0x100c8b728
0x1001b3bef: mov qword ptr [rip + 0xad7b42], rdx ; 0x100c8b738
0x1001b3bf6: mov qword ptr [rip + 0xac4063], rsi ; 0x100c77c60
0x1001b3bfd: mov qword ptr [rip + 0xad7b40], 0x94 ; 0x100c8b748
0x1001b3c08: mov qword ptr [rip + 0xad7b41], rcx ; 0x100c8b750
0x1001b3c0f: mov qword ptr [rip + 0xad7b42], rax ; 0x100c8b758
0x1001b3c16: mov qword ptr [rip + 0xad7b3f], 0xffffffffffffffff ; 0x100c8b760
0x1001b3c21: mov qword ptr [rip + 0xad7b40], r13 ; 0x100c8b768
0x1001b3c28: mov qword ptr [rip + 0xad7b3d], 0 ; 0x100c8b770
0x1001b3c33: vmovdqa xmmword ptr [rip + 0x1c27645], xmm0 ; 0x101ddb280
0x1001b3c3b: lea rax, [rip + 0x1c2763e] ; 0x101ddb280
0x1001b3c42: mov qword ptr [rip + 0x1c27643], 0 ; 0x101ddb290
0x1001b3c4d: mov qword ptr [rip + 0xad7adc], rax ; 0x100c8b730
0x1001b3c54: lea rax, [rip + 0x9c42aa] ; 0x100b77f05 BlazeBarn
0x1001b3c5b: mov qword ptr [rip + 0x1c2763e], rax ; 0x101ddb2a0
0x1001b3c62: lea rax, [rip + 0x1c2762f] ; 0x101ddb298
0x1001b3c69: mov qword ptr [rip + 0x1c27634], 0 ; 0x101ddb2a8
0x1001b3c74: mov rcx, qword ptr [rip + 0xabc2dd] ; 0x100c6ff58
0x1001b3c7b: mov qword ptr [rip + 0x1c2762e], rcx ; 0x101ddb2b0
0x1001b3c82: mov qword ptr [rip + 0xabc2cf], rax ; 0x100c6ff58
0x1001b3c89: mov qword ptr [rip + 0x1c27630], rax ; 0x101ddb2c0
0x1001b3c90: mov rax, qword ptr [rip + 0xa54a19] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x1001b3c97: mov qword ptr [rip + 0x1c2762a], rax ; 0x101ddb2c8
0x1001b3c9e: mov dword ptr [rip + 0x1c27628], 0xffffffff ; 0x101ddb2d0
0x1001b3ca8: mov dword ptr [rip + 0x1c27622], 0xffffffff ; 0x101ddb2d4
0x1001b3cb2: mov qword ptr [rip + 0x1c27633], 0 ; 0x101ddb2f0
0x1001b3cbd: mov rax, qword ptr [rip + 0xa58b74] ; 0x100c0c838
0x1001b3cc4: add rax, 0x10
0x1001b3cc8: mov qword ptr [rip + 0x1c275c9], rax ; 0x101ddb298
0x1001b3ccf: xor eax, eax
0x1001b3cd1: call 0x100011c10 ; 0x100011c10
0x1001b3cd6: lea rax, [rip + 0x9a8c2f] ; 0x100b5c90c Initialize
0x1001b3cdd: mov qword ptr [rip + 0x1c27614], rax ; 0x101ddb2f8
0x1001b3ce4: lea rcx, [rip + 0x1c2760d] ; 0x101ddb2f8
0x1001b3ceb: mov qword ptr [rip + 0x1c2760a], 0 ; 0x101ddb300
0x1001b3cf6: mov rax, qword ptr [rip + 0xabc263] ; 0x100c6ff60
0x1001b3cfd: mov qword ptr [rip + 0x1c27604], rax ; 0x101ddb308
0x1001b3d04: lea rax, [rip - 0x676b] ; 0x1001ad5a0
0x1001b3d0b: vmovq xmm0, rax
0x1001b3d10: vmovdqu xmmword ptr [rip + 0x1c27618], xmm0 ; 0x101ddb330
0x1001b3d18: mov rdx, qword ptr [rip + 0xa52a81] ; 0x100c067a0 -> 0x1001b2720 __Z12ApplyWrapperI9BlazeBarnMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1001b3d1f: mov qword ptr [rip + 0x1c2761a], rdx ; 0x101ddb340
0x1001b3d26: mov rsi, qword ptr [rip + 0xa56303] ; 0x100c0a030 -> 0x1001b2780 __Z21InitFunctionSignatureIM9BlazeBarnFvvEEvP17FunctionSignature
0x1001b3d2d: mov qword ptr [rip + 0x1c27614], rsi ; 0x101ddb348
0x1001b3d34: mov rax, qword ptr [rip + 0xa54bed] ; 0x100c08928 -> 0x1001b2710 __Z18GetMetaClassByTypeIP9BlazeBarnERK9MetaClassv
0x1001b3d3b: mov qword ptr [rip + 0x1c2760e], rax ; 0x101ddb350
0x1001b3d42: lea rdi, [rip + 0x9accfc] ; 0x100b60a45 OnLevelLoad
0x1001b3d49: mov qword ptr [rip + 0x1c27608], rdi ; 0x101ddb358
0x1001b3d50: lea r8, [rip + 0x1c27601] ; 0x101ddb358
0x1001b3d57: mov qword ptr [rip + 0x1c275fe], 0 ; 0x101ddb360
0x1001b3d62: mov qword ptr [rip + 0x1c275ff], rcx ; 0x101ddb368
0x1001b3d69: lea rcx, [rip - 0x66f0] ; 0x1001ad680
0x1001b3d70: vmovq xmm0, rcx
0x1001b3d75: vmovdqu xmmword ptr [rip + 0x1c27613], xmm0 ; 0x101ddb390
0x1001b3d7d: mov rcx, qword ptr [rip + 0xa52a0c] ; 0x100c06790 -> 0x1001b27a0 __Z12ApplyWrapperI9BlazeBarnMS0_FvP4GameEEvM9VoidClassFvvEPv8VariablePS9_j
0x1001b3d84: mov qword ptr [rip + 0x1c27615], rcx ; 0x101ddb3a0
0x1001b3d8b: mov rbx, qword ptr [rip + 0xa5628e] ; 0x100c0a020 -> 0x1001b2840 __Z21InitFunctionSignatureIM9BlazeBarnFvP4GameEEvP17FunctionSignature
0x1001b3d92: mov qword ptr [rip + 0x1c2760f], rbx ; 0x101ddb3a8
0x1001b3d99: mov qword ptr [rip + 0x1c27610], rax ; 0x101ddb3b0
0x1001b3da0: lea rdi, [rip + 0x9accb4] ; 0x100b60a5b OnLevelUnload
0x1001b3da7: mov qword ptr [rip + 0x1c2760a], rdi ; 0x101ddb3b8
0x1001b3dae: lea r9, [rip + 0x1c27603] ; 0x101ddb3b8
0x1001b3db5: mov qword ptr [rip + 0x1c27600], 0 ; 0x101ddb3c0
0x1001b3dc0: mov qword ptr [rip + 0x1c27601], r8 ; 0x101ddb3c8
0x1001b3dc7: lea rdi, [rip - 0x66fe] ; 0x1001ad6d0
0x1001b3dce: vmovq xmm0, rdi
0x1001b3dd3: vmovdqu xmmword ptr [rip + 0x1c27615], xmm0 ; 0x101ddb3f0
0x1001b3ddb: mov qword ptr [rip + 0x1c2761e], rdx ; 0x101ddb400
0x1001b3de2: mov qword ptr [rip + 0x1c2761f], rsi ; 0x101ddb408
0x1001b3de9: mov qword ptr [rip + 0x1c27620], rax ; 0x101ddb410
0x1001b3df0: lea rdx, [rip + 0x9a8b56] ; 0x100b5c94d Update
0x1001b3df7: mov qword ptr [rip + 0x1c2761a], rdx ; 0x101ddb418
0x1001b3dfe: lea rdx, [rip + 0x1c27613] ; 0x101ddb418
0x1001b3e05: mov qword ptr [rip + 0x1c27610], 0 ; 0x101ddb420
0x1001b3e10: mov qword ptr [rip + 0x1c27611], r9 ; 0x101ddb428
0x1001b3e17: lea rsi, [rip - 0x668e] ; 0x1001ad790
0x1001b3e1e: vmovq xmm0, rsi
0x1001b3e23: vmovdqu xmmword ptr [rip + 0x1c27625], xmm0 ; 0x101ddb450
0x1001b3e2b: mov qword ptr [rip + 0x1c2762e], rcx ; 0x101ddb460
0x1001b3e32: mov qword ptr [rip + 0x1c2762f], rbx ; 0x101ddb468
0x1001b3e39: mov qword ptr [rip + 0x1c27630], rax ; 0x101ddb470
0x1001b3e40: lea rcx, [rip + 0x9c40c8] ; 0x100b77f0f CreateBlaze
0x1001b3e47: mov qword ptr [rip + 0x1c2762a], rcx ; 0x101ddb478
0x1001b3e4e: lea rcx, [rip + 0x1c27623] ; 0x101ddb478
0x1001b3e55: mov qword ptr [rip + 0x1c2762c], rdx ; 0x101ddb488
0x1001b3e5c: lea rdx, [rip - 0x6133] ; 0x1001add30
0x1001b3e63: vmovq xmm0, rdx
0x1001b3e68: vmovdqu xmmword ptr [rip + 0x1c27640], xmm0 ; 0x101ddb4b0
0x1001b3e70: mov rdx, qword ptr [rip + 0xa52911] ; 0x100c06788 -> 0x1001b28c0 __Z12ApplyWrapperI9BlazeBarnMS0_FP5BlazePK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x1001b3e77: mov qword ptr [rip + 0x1c27642], rdx ; 0x101ddb4c0
0x1001b3e7e: mov rdx, qword ptr [rip + 0xa56193] ; 0x100c0a018 -> 0x1001b2980 __Z21InitFunctionSignatureIM9BlazeBarnFP5BlazePK9MetaClassEEvP17FunctionSignature
0x1001b3e85: mov qword ptr [rip + 0x1c2763c], rdx ; 0x101ddb4c8
0x1001b3e8c: mov qword ptr [rip + 0x1c2763d], rax ; 0x101ddb4d0
0x1001b3e93: lea rdx, [rip + 0x9c322e] ; 0x100b770c8 ObjectFactory_CreatesType
0x1001b3e9a: vmovq xmm0, rdx
0x1001b3e9f: vmovdqa xmm1, xmmword ptr [rbp - 0x40]
0x1001b3ea4: vpunpcklqdq xmm0, xmm0, xmm1
0x1001b3ea8: vmovdqa xmmword ptr [rip + 0x1c27630], xmm0 ; 0x101ddb4e0
0x1001b3eb0: lea rdx, [rip + 0x1c27629] ; 0x101ddb4e0
0x1001b3eb7: mov qword ptr [rip + 0x1c2762e], 0 ; 0x101ddb4f0
0x1001b3ec2: mov qword ptr [rip + 0x1c275b7], rdx ; 0x101ddb480
0x1001b3ec9: lea rdx, [rip + 0x9c404b] ; 0x100b77f1b ReleaseBlaze
0x1001b3ed0: mov qword ptr [rip + 0x1c27621], rdx ; 0x101ddb4f8
0x1001b3ed7: lea rdx, [rip + 0x1c2761a] ; 0x101ddb4f8
0x1001b3ede: mov qword ptr [rip + 0x1c27623], rcx ; 0x101ddb508
0x1001b3ee5: mov qword ptr [rip + 0xabc074], rdx ; 0x100c6ff60
0x1001b3eec: lea rcx, [rip - 0x6043] ; 0x1001adeb0
0x1001b3ef3: vmovq xmm0, rcx
0x1001b3ef8: vmovdqu xmmword ptr [rip + 0x1c27630], xmm0 ; 0x101ddb530
0x1001b3f00: mov rcx, qword ptr [rip + 0xa52891] ; 0x100c06798 -> 0x1001b2a10 __Z12ApplyWrapperI9BlazeBarnMS0_FvP5BlazeEEvM9VoidClassFvvEPv8VariablePS9_j
0x1001b3f07: mov qword ptr [rip + 0x1c27632], rcx ; 0x101ddb540
0x1001b3f0e: mov rcx, qword ptr [rip + 0xa56113] ; 0x100c0a028 -> 0x1001b2aa0 __Z21InitFunctionSignatureIM9BlazeBarnFvP5BlazeEEvP17FunctionSignature
0x1001b3f15: mov qword ptr [rip + 0x1c2762c], rcx ; 0x101ddb548
0x1001b3f1c: mov qword ptr [rip + 0x1c2762d], rax ; 0x101ddb550
0x1001b3f23: lea rax, [rip + 0x9c31ca] ; 0x100b770f4 ObjectFactory_ReleasesType
0x1001b3f2a: vmovq xmm0, rax
0x1001b3f2f: vpunpcklqdq xmm0, xmm0, xmm1
0x1001b3f33: vmovdqa xmmword ptr [rip + 0x1c27625], xmm0 ; 0x101ddb560
0x1001b3f3b: lea rax, [rip + 0x1c2761e] ; 0x101ddb560
0x1001b3f42: mov qword ptr [rip + 0x1c27623], 0 ; 0x101ddb570
0x1001b3f4d: mov qword ptr [rip + 0x1c275ac], rax ; 0x101ddb500
0x1001b3f54: lea rax, [rip + 0x9c3fcd] ; 0x100b77f28 BlazeRpc
0x1001b3f5b: mov qword ptr [rip + 0x1c2761e], rax ; 0x101ddb580
0x1001b3f62: lea rax, [rip + 0x1c2760f] ; 0x101ddb578
0x1001b3f69: mov qword ptr [rip + 0x1c27614], 0 ; 0x101ddb588
0x1001b3f74: mov rcx, qword ptr [rip + 0xabbfdd] ; 0x100c6ff58
0x1001b3f7b: mov qword ptr [rip + 0x1c2760e], rcx ; 0x101ddb590
0x1001b3f82: mov qword ptr [rip + 0xabbfcf], rax ; 0x100c6ff58
0x1001b3f89: mov qword ptr [rip + 0x1c27610], rax ; 0x101ddb5a0
0x1001b3f90: mov rax, qword ptr [rip + 0xa54721] ; 0x100c086b8 -> 0x1000f6d40 __Z18GetMetaClassByTypeIP6NetRpcERK9MetaClassv
0x1001b3f97: mov qword ptr [rip + 0x1c2760a], rax ; 0x101ddb5a8
0x1001b3f9e: mov dword ptr [rip + 0x1c27608], 0xffffffff ; 0x101ddb5b0
0x1001b3fa8: mov dword ptr [rip + 0x1c27602], 0xffffffff ; 0x101ddb5b4
0x1001b3fb2: mov qword ptr [rip + 0x1c27613], 0 ; 0x101ddb5d0
0x1001b3fbd: mov rax, qword ptr [rip + 0xa586ac] ; 0x100c0c670
0x1001b3fc4: add rax, 0x10
0x1001b3fc8: mov qword ptr [rip + 0x1c275a9], rax ; 0x101ddb578
0x1001b3fcf: xor eax, eax
0x1001b3fd1: call 0x100011c10 ; 0x100011c10
0x1001b3fd6: lea rax, [rip + 0x9c401e] ; 0x100b77ffb OnBlaze
0x1001b3fdd: mov qword ptr [rip + 0x1c275fc], rax ; 0x101ddb5e0
0x1001b3fe4: lea rax, [rip + 0x1c275ed] ; 0x101ddb5d8
0x1001b3feb: mov qword ptr [rip + 0x1c275f2], 0 ; 0x101ddb5e8
0x1001b3ff6: mov rcx, qword ptr [rip + 0xabbf5b] ; 0x100c6ff58
0x1001b3ffd: mov qword ptr [rip + 0x1c275ec], rcx ; 0x101ddb5f0
0x1001b4004: mov qword ptr [rip + 0xabbf4d], rax ; 0x100c6ff58
0x1001b400b: mov qword ptr [rip + 0x1c275ee], rax ; 0x101ddb600
0x1001b4012: mov rax, qword ptr [rip + 0xa545cf] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x1001b4019: mov qword ptr [rip + 0x1c275e8], rax ; 0x101ddb608
0x1001b4020: mov qword ptr [rip + 0x1c275e5], 0xffffffffffffffff ; 0x101ddb610
0x1001b402b: mov qword ptr [rip + 0x1c275fa], 0 ; 0x101ddb630
0x1001b4036: mov rax, qword ptr [rip + 0xa585d3] ; 0x100c0c610
0x1001b403d: add rax, 0x10
0x1001b4041: mov qword ptr [rip + 0x1c27590], rax ; 0x101ddb5d8
0x1001b4048: xor eax, eax
0x1001b404a: call 0x100011c10 ; 0x100011c10
0x1001b404f: lea rax, [rip + 0x9aa975] ; 0x100b5e9cb Tool_AutoStartEvent
0x1001b4056: vmovq xmm0, rax
0x1001b405b: vpunpcklqdq xmm0, xmm0, xmmword ptr [rbp - 0x70]
0x1001b4060: vmovdqa xmmword ptr [rip + 0x1c275d8], xmm0 ; 0x101ddb640
0x1001b4068: lea rax, [rip + 0x1c275d1] ; 0x101ddb640
0x1001b406f: mov rcx, qword ptr [rip + 0x1c27572] ; 0x101ddb5e8
0x1001b4076: mov qword ptr [rip + 0x1c275d3], rcx ; 0x101ddb650
0x1001b407d: mov qword ptr [rip + 0x1c27564], rax ; 0x101ddb5e8
0x1001b4084: lea rax, [rip + 0x9c3f78] ; 0x100b78003 blaze
0x1001b408b: mov qword ptr [rip + 0xad76e6], rax ; 0x100c8b778
0x1001b4092: lea rcx, [rip + 0xad76df] ; 0x100c8b778
0x1001b4099: mov qword ptr [rip + 0xad76dc], 0 ; 0x100c8b780
0x1001b40a4: mov rax, qword ptr [rip + 0xac3bb5] ; 0x100c77c60
0x1001b40ab: mov qword ptr [rip + 0xad76d6], rax ; 0x100c8b788
0x1001b40b2: mov qword ptr [rip + 0xad76db], 0x38 ; 0x100c8b798
0x1001b40bd: mov rax, qword ptr [rip + 0xa531fc] ; 0x100c072c0 -> 0x1001b2a00 __Z17GetMetaTypeByTypeIP5BlazeERK8MetaTypev
0x1001b40c4: mov qword ptr [rip + 0xad76d5], rax ; 0x100c8b7a0
0x1001b40cb: mov rax, qword ptr [rip + 0xa546ae] ; 0x100c08780 -> 0x1001b3040 __Z18GetMetaClassByTypeIP7OnBlazeERK9MetaClassv
0x1001b40d2: mov qword ptr [rip + 0xad76cf], rax ; 0x100c8b7a8
0x1001b40d9: mov qword ptr [rip + 0xad76cc], 0xffffffffffffffff ; 0x100c8b7b0
0x1001b40e4: mov qword ptr [rip + 0xad76cd], r13 ; 0x100c8b7b8
0x1001b40eb: mov qword ptr [rip + 0xad76ca], 0 ; 0x100c8b7c0
0x1001b40f6: lea rdx, [rip + 0x9ab660] ; 0x100b5f75d events
0x1001b40fd: mov qword ptr [rip + 0xad76c4], rdx ; 0x100c8b7c8
0x1001b4104: lea rdx, [rip + 0xad76bd] ; 0x100c8b7c8
0x1001b410b: mov qword ptr [rip + 0xad76c6], rcx ; 0x100c8b7d8
0x1001b4112: mov qword ptr [rip + 0xad76cb], 0x40 ; 0x100c8b7e8
0x1001b411d: mov qword ptr [rip + 0xad76cc], r15 ; 0x100c8b7f0
0x1001b4124: mov qword ptr [rip + 0xad76cd], rax ; 0x100c8b7f8
0x1001b412b: mov qword ptr [rip + 0xad76ca], 0xffffffffffffffff ; 0x100c8b800
0x1001b4136: mov qword ptr [rip + 0xad76cb], r13 ; 0x100c8b808
0x1001b413d: mov qword ptr [rip + 0xad76c8], 0 ; 0x100c8b810
0x1001b4148: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1001b414d: vmovaps xmmword ptr [rip + 0x1c2750b], xmm0 ; 0x101ddb660
0x1001b4155: lea rcx, [rip + 0x1c27504] ; 0x101ddb660
0x1001b415c: mov qword ptr [rip + 0x1c27509], 0 ; 0x101ddb670
0x1001b4167: mov qword ptr [rip + 0xad7662], rcx ; 0x100c8b7d0
0x1001b416e: lea rcx, [rip + 0x9c1178] ; 0x100b752ed fireOnce
0x1001b4175: mov qword ptr [rip + 0xad769c], rcx ; 0x100c8b818
0x1001b417c: lea rcx, [rip + 0xad7695] ; 0x100c8b818
0x1001b4183: mov qword ptr [rip + 0xad769e], rdx ; 0x100c8b828
0x1001b418a: mov qword ptr [rip + 0xad76a3], 0x48 ; 0x100c8b838
0x1001b4195: mov qword ptr [rip + 0xad76a4], r14 ; 0x100c8b840
0x1001b419c: mov qword ptr [rip + 0xad76a5], rax ; 0x100c8b848
0x1001b41a3: mov qword ptr [rip + 0xad76a2], 0xffffffffffffffff ; 0x100c8b850
0x1001b41ae: mov qword ptr [rip + 0xad76a3], r13 ; 0x100c8b858
0x1001b41b5: mov qword ptr [rip + 0xad76a0], 0 ; 0x100c8b860
0x1001b41c0: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1001b41c5: vmovaps xmmword ptr [rip + 0x1c274b3], xmm0 ; 0x101ddb680
0x1001b41cd: lea rdx, [rip + 0x1c274ac] ; 0x101ddb680
0x1001b41d4: mov qword ptr [rip + 0x1c274b1], 0 ; 0x101ddb690
0x1001b41df: mov qword ptr [rip + 0xad763a], rdx ; 0x100c8b820
0x1001b41e6: mov qword ptr [rip + 0xad767b], r12 ; 0x100c8b868
0x1001b41ed: lea rdx, [rip + 0xad7674] ; 0x100c8b868
0x1001b41f4: mov qword ptr [rip + 0xad767d], rcx ; 0x100c8b878
0x1001b41fb: mov qword ptr [rip + 0xac3a5e], rdx ; 0x100c77c60
0x1001b4202: mov qword ptr [rip + 0xad767b], 0x49 ; 0x100c8b888
0x1001b420d: mov qword ptr [rip + 0xad767c], r14 ; 0x100c8b890
0x1001b4214: mov qword ptr [rip + 0xad767d], rax ; 0x100c8b898
0x1001b421b: mov qword ptr [rip + 0xad767a], 0xffffffffffffffff ; 0x100c8b8a0
0x1001b4226: mov qword ptr [rip + 0xad767b], r13 ; 0x100c8b8a8
0x1001b422d: mov qword ptr [rip + 0xad7678], 0 ; 0x100c8b8b0
0x1001b4238: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x1001b423d: vmovaps xmmword ptr [rip + 0x1c2745b], xmm0 ; 0x101ddb6a0
0x1001b4245: lea rax, [rip + 0x1c27454] ; 0x101ddb6a0
0x1001b424c: mov qword ptr [rip + 0x1c27459], 0 ; 0x101ddb6b0
0x1001b4257: mov qword ptr [rip + 0xad7612], rax ; 0x100c8b870
0x1001b425e: add rsp, 0x58
0x1001b4262: pop rbx
0x1001b4263: pop r12
0x1001b4265: pop r13
0x1001b4267: pop r14
0x1001b4269: pop r15
0x1001b426b: pop rbp
0x1001b426c: ret 
0x1001b426d: nop 
0x1001b426e: nop 
0x1001b426f: nop 
