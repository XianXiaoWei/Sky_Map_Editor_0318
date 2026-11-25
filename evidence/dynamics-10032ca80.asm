0x10032ca80: push rbp
0x10032ca81: mov rbp, rsp
0x10032ca84: push r15
0x10032ca86: push r14
0x10032ca88: push r13
0x10032ca8a: push r12
0x10032ca8c: push rbx
0x10032ca8d: sub rsp, 0x68
0x10032ca91: mov dword ptr [rip + 0x9ff0e5], 0 ; 0x100d2bb80
0x10032ca9b: mov rax, qword ptr [rip + 0x77e2ce] ; 0x100aaad70
0x10032caa2: mov qword ptr [rip + 0x9ff0e7], rax ; 0x100d2bb90
0x10032caa9: mov dword ptr [rip + 0x9ff0e5], 0 ; 0x100d2bb98
0x10032cab3: vmovss xmm0, dword ptr [rip + 0x778605] ; 0x100aa50c0
0x10032cabb: vmovlps qword ptr [rip + 0x9ff0dd], xmm0 ; 0x100d2bba0
0x10032cac3: mov dword ptr [rip + 0x9ff0db], 0 ; 0x100d2bba8
0x10032cacd: lea rax, [rip + 0x8542d0] ; 0x100b80da4 kAmbientWind
0x10032cad4: mov qword ptr [rip + 0x1ac6815], rax ; 0x101df32f0
0x10032cadb: lea rax, [rip + 0x1ac680e] ; 0x101df32f0
0x10032cae2: mov rcx, qword ptr [rip + 0x9631b7] ; 0x100c8fca0
0x10032cae9: mov qword ptr [rip + 0x1ac6810], rcx ; 0x101df3300
0x10032caf0: lea rcx, [rip + 0x8542ba] ; 0x100b80db1 EnvironmentForces.cpp
0x10032caf7: mov qword ptr [rip + 0x1ac6812], rcx ; 0x101df3310
0x10032cafe: lea rdx, [rip + 0x97f64b] ; 0x100cac150
0x10032cb05: mov qword ptr [rip + 0x1ac680c], rdx ; 0x101df3318
0x10032cb0c: mov r14, qword ptr [rip + 0x8daa4d] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x10032cb13: mov qword ptr [rip + 0x1ac6806], r14 ; 0x101df3320
0x10032cb1a: mov qword ptr [rip + 0x1ac6803], 0 ; 0x101df3328
0x10032cb25: lea r12, [rip - 0x31310c] ; 0x100019a20
0x10032cb2c: mov qword ptr [rip + 0x1ac67fd], r12 ; 0x101df3330
0x10032cb33: mov qword ptr [rip + 0x1ac67fa], 0 ; 0x101df3338
0x10032cb3e: lea rdx, [rip + 0x835322] ; 0x100b61e67 Environment
0x10032cb45: vmovq xmm0, rdx
0x10032cb4a: lea rdx, [rip + 0x8314cc] ; 0x100b5e01d TweakCategory
0x10032cb51: vmovq xmm1, rdx
0x10032cb56: vpunpcklqdq xmm0, xmm1, xmm0
0x10032cb5a: vmovdqa xmmword ptr [rip + 0x1ac67de], xmm0 ; 0x101df3340
0x10032cb62: lea rdx, [rip + 0x1ac67d7] ; 0x101df3340
0x10032cb69: mov qword ptr [rip + 0x1ac67dc], 0 ; 0x101df3350
0x10032cb74: lea rsi, [rip + 0x85424c] ; 0x100b80dc7 1.5 8.5
0x10032cb7b: vmovq xmm0, rsi
0x10032cb80: lea rsi, [rip + 0x8335c7] ; 0x100b6014e TweakRange
0x10032cb87: vmovq xmm2, rsi
0x10032cb8c: vpunpcklqdq xmm0, xmm2, xmm0
0x10032cb90: vmovdqa xmmword ptr [rip + 0x1ac67c8], xmm0 ; 0x101df3360
0x10032cb98: lea rsi, [rip + 0x1ac67c1] ; 0x101df3360
0x10032cb9f: mov qword ptr [rip + 0x1ac67ca], rdx ; 0x101df3370
0x10032cba6: mov qword ptr [rip + 0x1ac674b], rsi ; 0x101df32f8
0x10032cbad: lea rdx, [rip + 0x85421b] ; 0x100b80dcf kBoundaryDebug
0x10032cbb4: mov qword ptr [rip + 0x1ac67c5], rdx ; 0x101df3380
0x10032cbbb: lea rdx, [rip + 0x1ac67be] ; 0x101df3380
0x10032cbc2: mov qword ptr [rip + 0x1ac67c7], rax ; 0x101df3390
0x10032cbc9: lea rax, [rip + 0x1ac67a8] ; 0x101df3378
0x10032cbd0: vmovq xmm0, rax
0x10032cbd5: vmovq xmm2, rcx
0x10032cbda: vpunpcklqdq xmm0, xmm2, xmm0
0x10032cbde: vmovdqu xmmword ptr [rip + 0x1ac67ba], xmm0 ; 0x101df33a0
0x10032cbe6: mov r13, qword ptr [rip + 0x8da96b] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x10032cbed: mov qword ptr [rip + 0x1ac67bc], r13 ; 0x101df33b0
0x10032cbf4: mov qword ptr [rip + 0x1ac67b9], 0 ; 0x101df33b8
0x10032cbff: mov qword ptr [rip + 0x1ac67ba], r12 ; 0x101df33c0
0x10032cc06: mov qword ptr [rip + 0x1ac67b7], 0 ; 0x101df33c8
0x10032cc11: lea rax, [rip + 0x83521a] ; 0x100b61e32 Debug
0x10032cc18: vmovq xmm0, rax
0x10032cc1d: vpunpcklqdq xmm0, xmm1, xmm0
0x10032cc21: vmovdqa xmmword ptr [rip + 0x1ac67a7], xmm0 ; 0x101df33d0
0x10032cc29: lea rax, [rip + 0x1ac67a0] ; 0x101df33d0
0x10032cc30: mov qword ptr [rip + 0x1ac67a5], 0 ; 0x101df33e0
0x10032cc3b: mov qword ptr [rip + 0x1ac6746], rax ; 0x101df3388
0x10032cc42: lea rax, [rip + 0x854195] ; 0x100b80dde kBoomDebug
0x10032cc49: mov qword ptr [rip + 0x1ac67a0], rax ; 0x101df33f0
0x10032cc50: lea rax, [rip + 0x1ac6799] ; 0x101df33f0
0x10032cc57: mov qword ptr [rip + 0x1ac67a2], rdx ; 0x101df3400
0x10032cc5e: mov qword ptr [rip + 0x96303b], rax ; 0x100c8fca0
0x10032cc65: lea rax, [rip + 0x1ac677c] ; 0x101df33e8
0x10032cc6c: vmovq xmm1, rax
0x10032cc71: vpunpcklqdq xmm1, xmm2, xmm1
0x10032cc75: vmovdqu xmmword ptr [rip + 0x1ac6793], xmm1 ; 0x101df3410
0x10032cc7d: mov qword ptr [rip + 0x1ac679c], r13 ; 0x101df3420
0x10032cc84: mov qword ptr [rip + 0x1ac6799], 0 ; 0x101df3428
0x10032cc8f: mov qword ptr [rip + 0x1ac679a], r12 ; 0x101df3430
0x10032cc96: mov qword ptr [rip + 0x1ac6797], 0 ; 0x101df3438
0x10032cca1: vmovdqa xmmword ptr [rip + 0x1ac6797], xmm0 ; 0x101df3440
0x10032cca9: lea rax, [rip + 0x1ac6790] ; 0x101df3440
0x10032ccb0: mov qword ptr [rip + 0x1ac6795], 0 ; 0x101df3450
0x10032ccbb: mov qword ptr [rip + 0x1ac6736], rax ; 0x101df33f8
0x10032ccc2: lea rax, [rip + 0x849150] ; 0x100b75e19 Wind
0x10032ccc9: mov qword ptr [rip + 0x1ac6790], rax ; 0x101df3460
0x10032ccd0: lea rax, [rip + 0x1ac6781] ; 0x101df3458
0x10032ccd7: mov qword ptr [rip + 0x1ac6786], 0 ; 0x101df3468
0x10032cce2: mov rcx, qword ptr [rip + 0x94326f] ; 0x100c6ff58
0x10032cce9: mov qword ptr [rip + 0x1ac6780], rcx ; 0x101df3470
0x10032ccf0: mov qword ptr [rip + 0x943261], rax ; 0x100c6ff58
0x10032ccf7: mov qword ptr [rip + 0x1ac6782], rax ; 0x101df3480
0x10032ccfe: lea rax, [rip - 0x2f7445] ; 0x1000358c0
0x10032cd05: mov qword ptr [rip + 0x1ac677c], rax ; 0x101df3488
0x10032cd0c: mov dword ptr [rip + 0x1ac677a], 0xffffffff ; 0x101df3490
0x10032cd16: mov dword ptr [rip + 0x1ac6774], 0xffffffff ; 0x101df3494
0x10032cd20: mov qword ptr [rip + 0x1ac6785], 0 ; 0x101df34b0
0x10032cd2b: mov rax, qword ptr [rip + 0x8df6c6] ; 0x100c0c3f8
0x10032cd32: add rax, 0x10
0x10032cd36: mov qword ptr [rip + 0x1ac671b], rax ; 0x101df3458
0x10032cd3d: xor eax, eax
0x10032cd3f: call 0x100011c10 ; 0x100011c10
0x10032cd44: lea rax, [rip + 0x8332f1] ; 0x100b6003c Tool_Export
0x10032cd4b: vmovq xmm1, rax
0x10032cd50: lea rax, [rip + 0x831c88] ; 0x100b5e9df true
0x10032cd57: vmovq xmm0, rax
0x10032cd5c: vpunpcklqdq xmm1, xmm1, xmm0
0x10032cd60: vmovdqa xmmword ptr [rbp - 0x40], xmm1
0x10032cd65: vmovdqa xmmword ptr [rip + 0x1ac6753], xmm1 ; 0x101df34c0
0x10032cd6d: lea rax, [rip + 0x1ac674c] ; 0x101df34c0
0x10032cd74: mov rcx, qword ptr [rip + 0x1ac66ed] ; 0x101df3468
0x10032cd7b: mov qword ptr [rip + 0x1ac674e], rcx ; 0x101df34d0
0x10032cd82: mov qword ptr [rip + 0x1ac66df], rax ; 0x101df3468
0x10032cd89: lea rax, [rip + 0x83e32f] ; 0x100b6b0bf transform
0x10032cd90: mov qword ptr [rip + 0x97f3c1], rax ; 0x100cac158
0x10032cd97: lea rcx, [rip + 0x97f3ba] ; 0x100cac158
0x10032cd9e: mov qword ptr [rip + 0x97f3b7], 0 ; 0x100cac160
0x10032cda9: mov rax, qword ptr [rip + 0x94aeb0] ; 0x100c77c60
0x10032cdb0: mov qword ptr [rip + 0x97f3b1], rax ; 0x100cac168
0x10032cdb7: mov qword ptr [rip + 0x97f3b6], 0x10 ; 0x100cac178
0x10032cdc2: mov rax, qword ptr [rip + 0x8d9fff] ; 0x100c06dc8 -> 0x100199090 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Matrix4EERK8MetaTypev
0x10032cdc9: mov qword ptr [rip + 0x97f3b0], rax ; 0x100cac180
0x10032cdd0: mov rax, qword ptr [rip + 0x8db7d1] ; 0x100c085a8 -> 0x10032a0c0 __Z18GetMetaClassByTypeIP4WindERK9MetaClassv
0x10032cdd7: mov qword ptr [rip + 0x97f3aa], rax ; 0x100cac188
0x10032cdde: lea rdx, [rip + 0x854004] ; 0x100b80de9 order
0x10032cde5: mov qword ptr [rip + 0x97f3bc], rdx ; 0x100cac1a8
0x10032cdec: lea rdx, [rip + 0x97f3b5] ; 0x100cac1a8
0x10032cdf3: mov qword ptr [rip + 0x97f3be], rcx ; 0x100cac1b8
0x10032cdfa: mov qword ptr [rip + 0x97f3c3], 0x60 ; 0x100cac1c8
0x10032ce05: mov rcx, qword ptr [rip + 0x8da764] ; 0x100c07570 -> 0x10003a520 __Z17GetMetaTypeByTypeIiERK8MetaTypev
0x10032ce0c: mov qword ptr [rip + 0x97f3bd], rcx ; 0x100cac1d0
0x10032ce13: mov qword ptr [rip + 0x97f3be], rax ; 0x100cac1d8
0x10032ce1a: mov qword ptr [rip + 0x97f3bb], 0xffffffffffffffff ; 0x100cac1e0
0x10032ce25: mov qword ptr [rip + 0x97f3bc], r12 ; 0x100cac1e8
0x10032ce2c: mov qword ptr [rip + 0x97f3b9], 0 ; 0x100cac1f0
0x10032ce37: lea rcx, [rip + 0x8472d6] ; 0x100b74114 0.0
0x10032ce3e: vmovq xmm8, rcx
0x10032ce43: lea rcx, [rip + 0x831bb8] ; 0x100b5ea02 Tool_DefaultValue
0x10032ce4a: vmovq xmm3, rcx
0x10032ce4f: lea rcx, [rip + 0x1ac668a] ; 0x101df34e0
0x10032ce56: mov qword ptr [rip + 0x97f353], rcx ; 0x100cac1b0
0x10032ce5d: lea rcx, [rip + 0x853f8b] ; 0x100b80def fadeDist
0x10032ce64: mov qword ptr [rip + 0x97f38d], rcx ; 0x100cac1f8
0x10032ce6b: lea rcx, [rip + 0x97f386] ; 0x100cac1f8
0x10032ce72: mov qword ptr [rip + 0x97f38f], rdx ; 0x100cac208
0x10032ce79: mov qword ptr [rip + 0x97f394], 0x54 ; 0x100cac218
0x10032ce84: mov qword ptr [rip + 0x97f395], r14 ; 0x100cac220
0x10032ce8b: mov qword ptr [rip + 0x97f396], rax ; 0x100cac228
0x10032ce92: mov qword ptr [rip + 0x97f393], 0xffffffffffffffff ; 0x100cac230
0x10032ce9d: mov qword ptr [rip + 0x97f394], r12 ; 0x100cac238
0x10032cea4: mov qword ptr [rip + 0x97f391], 0 ; 0x100cac240
0x10032ceaf: lea rdx, [rip + 0x847298] ; 0x100b7414e 1.0
0x10032ceb6: vmovq xmm9, rdx
0x10032cebb: lea rdx, [rip + 0x1ac663e] ; 0x101df3500
0x10032cec2: mov qword ptr [rip + 0x97f337], rdx ; 0x100cac200
0x10032cec9: lea rdx, [rip + 0x853f28] ; 0x100b80df8 fadeTime
0x10032ced0: mov qword ptr [rip + 0x97f371], rdx ; 0x100cac248
0x10032ced7: lea rdx, [rip + 0x97f36a] ; 0x100cac248
0x10032cede: mov qword ptr [rip + 0x97f373], rcx ; 0x100cac258
0x10032cee5: mov qword ptr [rip + 0x97f378], 0x58 ; 0x100cac268
0x10032cef0: mov qword ptr [rip + 0x97f379], r14 ; 0x100cac270
0x10032cef7: mov qword ptr [rip + 0x97f37a], rax ; 0x100cac278
0x10032cefe: mov qword ptr [rip + 0x97f377], 0xffffffffffffffff ; 0x100cac280
0x10032cf09: mov qword ptr [rip + 0x97f378], r12 ; 0x100cac288
0x10032cf10: mov qword ptr [rip + 0x97f375], 0 ; 0x100cac290
0x10032cf1b: lea rcx, [rip + 0x8485f4] ; 0x100b75516 3.0
0x10032cf22: vmovq xmm10, rcx
0x10032cf27: lea rcx, [rip + 0x1ac65f2] ; 0x101df3520
0x10032cf2e: mov qword ptr [rip + 0x97f31b], rcx ; 0x100cac250
0x10032cf35: lea rcx, [rip + 0x834e2b] ; 0x100b61d67 intensity
0x10032cf3c: mov qword ptr [rip + 0x97f355], rcx ; 0x100cac298
0x10032cf43: lea rcx, [rip + 0x97f34e] ; 0x100cac298
0x10032cf4a: mov qword ptr [rip + 0x97f357], rdx ; 0x100cac2a8
0x10032cf51: mov qword ptr [rip + 0x97f35c], 0x5c ; 0x100cac2b8
0x10032cf5c: mov qword ptr [rip + 0x97f35d], r14 ; 0x100cac2c0
0x10032cf63: mov qword ptr [rip + 0x97f35e], rax ; 0x100cac2c8
0x10032cf6a: mov qword ptr [rip + 0x97f35b], 0xffffffffffffffff ; 0x100cac2d0
0x10032cf75: mov qword ptr [rip + 0x97f35c], r12 ; 0x100cac2d8
0x10032cf7c: mov qword ptr [rip + 0x97f359], 0 ; 0x100cac2e0
0x10032cf87: lea rdx, [rip + 0x84bce6] ; 0x100b78c74 5.0
0x10032cf8e: vmovq xmm11, rdx
0x10032cf93: lea rdx, [rip + 0x1ac65a6] ; 0x101df3540
0x10032cf9a: mov qword ptr [rip + 0x97f2ff], rdx ; 0x100cac2a0
0x10032cfa1: lea rdx, [rip + 0x84a0b1] ; 0x100b77059 enabled
0x10032cfa8: mov qword ptr [rip + 0x97f339], rdx ; 0x100cac2e8
0x10032cfaf: lea rdx, [rip + 0x97f332] ; 0x100cac2e8
0x10032cfb6: mov qword ptr [rip + 0x97f33b], rcx ; 0x100cac2f8
0x10032cfbd: mov qword ptr [rip + 0x97f340], 0x50 ; 0x100cac308
0x10032cfc8: mov qword ptr [rip + 0x97f341], r13 ; 0x100cac310
0x10032cfcf: mov qword ptr [rip + 0x97f342], rax ; 0x100cac318
0x10032cfd6: mov qword ptr [rip + 0x97f33f], 0xffffffffffffffff ; 0x100cac320
0x10032cfe1: mov qword ptr [rip + 0x97f340], r12 ; 0x100cac328
0x10032cfe8: mov qword ptr [rip + 0x97f33d], 0 ; 0x100cac330
0x10032cff3: lea rcx, [rip + 0x1ac6566] ; 0x101df3560
0x10032cffa: mov qword ptr [rip + 0x97f2ef], rcx ; 0x100cac2f0
0x10032d001: lea rcx, [rip + 0x853df9] ; 0x100b80e01 spawnParticle
0x10032d008: mov qword ptr [rip + 0x97f329], rcx ; 0x100cac338
0x10032d00f: lea rcx, [rip + 0x97f322] ; 0x100cac338
0x10032d016: mov qword ptr [rip + 0x97f32b], rdx ; 0x100cac348
0x10032d01d: mov qword ptr [rip + 0x97f330], 0x51 ; 0x100cac358
0x10032d028: mov qword ptr [rip + 0x97f331], r13 ; 0x100cac360
0x10032d02f: mov qword ptr [rip + 0x97f332], rax ; 0x100cac368
0x10032d036: mov qword ptr [rip + 0x97f32f], 0xffffffffffffffff ; 0x100cac370
0x10032d041: mov qword ptr [rip + 0x97f330], r12 ; 0x100cac378
0x10032d048: mov qword ptr [rip + 0x97f32d], 0 ; 0x100cac380
0x10032d053: lea rdx, [rip + 0x1ac6526] ; 0x101df3580
0x10032d05a: mov qword ptr [rip + 0x97f2df], rdx ; 0x100cac340
0x10032d061: lea rdx, [rip + 0x853da7] ; 0x100b80e0f additionalWindMarkers
0x10032d068: mov qword ptr [rip + 0x97f319], rdx ; 0x100cac388
0x10032d06f: lea rdx, [rip + 0x97f312] ; 0x100cac388
0x10032d076: mov qword ptr [rip + 0x97f31b], rcx ; 0x100cac398
0x10032d07d: mov qword ptr [rip + 0x97f320], 0x68 ; 0x100cac3a8
0x10032d088: mov rcx, qword ptr [rip + 0x8da239] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x10032d08f: mov qword ptr [rip + 0x97f31a], rcx ; 0x100cac3b0
0x10032d096: mov qword ptr [rip + 0x97f31b], rax ; 0x100cac3b8
0x10032d09d: mov qword ptr [rip + 0x97f318], 0xffffffffffffffff ; 0x100cac3c0
0x10032d0a8: mov qword ptr [rip + 0x97f319], r12 ; 0x100cac3c8
0x10032d0af: mov qword ptr [rip + 0x97f316], 0 ; 0x100cac3d0
0x10032d0ba: lea rcx, [rip + 0x837578] ; 0x100b64639 Marker
0x10032d0c1: vmovq xmm12, rcx
0x10032d0c6: lea rcx, [rip + 0x83191f] ; 0x100b5e9ec Tool_ClumpType
0x10032d0cd: vmovq xmm5, rcx
0x10032d0d2: vmovdqa xmmword ptr [rbp - 0x60], xmm5
0x10032d0d7: lea rcx, [rip + 0x1ac64c2] ; 0x101df35a0
0x10032d0de: lea rsi, [rip + 0x831934] ; 0x100b5ea19 Tool_Nullable
0x10032d0e5: vmovq xmm1, rsi
0x10032d0ea: vmovdqa xmmword ptr [rbp - 0x70], xmm1
0x10032d0ef: vpunpcklqdq xmm6, xmm1, xmm0
0x10032d0f3: vmovdqa xmmword ptr [rip + 0x1ac64c5], xmm6 ; 0x101df35c0
0x10032d0fb: lea rsi, [rip + 0x1ac64be] ; 0x101df35c0
0x10032d102: mov qword ptr [rip + 0x1ac64c7], rcx ; 0x101df35d0
0x10032d109: lea rcx, [rip + 0x831904] ; 0x100b5ea14 NULL
0x10032d110: vmovq xmm1, rcx
0x10032d115: vpunpcklqdq xmm1, xmm3, xmm1
0x10032d119: vmovdqa xmmword ptr [rip + 0x1ac64bf], xmm1 ; 0x101df35e0
0x10032d121: lea rcx, [rip + 0x1ac64b8] ; 0x101df35e0
0x10032d128: mov qword ptr [rip + 0x1ac64c1], rsi ; 0x101df35f0
0x10032d12f: mov qword ptr [rip + 0x97f25a], rcx ; 0x100cac390
0x10032d136: lea rcx, [rip + 0x84a4ee] ; 0x100b7762b rail
0x10032d13d: mov qword ptr [rip + 0x97f294], rcx ; 0x100cac3d8
0x10032d144: mov qword ptr [rip + 0x97f29d], rdx ; 0x100cac3e8
0x10032d14b: mov qword ptr [rip + 0x97f2a2], 0x70 ; 0x100cac3f8
0x10032d156: mov rcx, qword ptr [rip + 0x8da14b] ; 0x100c072a8 -> 0x1000ec410 __Z17GetMetaTypeByTypeIP4RailERK8MetaTypev
0x10032d15d: mov qword ptr [rip + 0x97f29c], rcx ; 0x100cac400
0x10032d164: mov qword ptr [rip + 0x97f29d], rax ; 0x100cac408
0x10032d16b: mov qword ptr [rip + 0x97f29a], 0xffffffffffffffff ; 0x100cac410
0x10032d176: mov qword ptr [rip + 0x97f29b], r12 ; 0x100cac418
0x10032d17d: mov qword ptr [rip + 0x97f298], 0 ; 0x100cac420
0x10032d188: lea rcx, [rip + 0x1ac6471] ; 0x101df3600
0x10032d18f: vmovdqa xmmword ptr [rip + 0x1ac6489], xmm1 ; 0x101df3620
0x10032d197: lea rdx, [rip + 0x1ac6482] ; 0x101df3620
0x10032d19e: mov qword ptr [rip + 0x1ac648b], rcx ; 0x101df3630
0x10032d1a5: mov qword ptr [rip + 0x97f234], rdx ; 0x100cac3e0
0x10032d1ac: lea rbx, [rip + 0x849e9b] ; 0x100b7704e SetEnabled
0x10032d1b3: mov qword ptr [rip + 0x1ac647e], rbx ; 0x101df3638
0x10032d1ba: lea rcx, [rip + 0x1ac6477] ; 0x101df3638
0x10032d1c1: mov qword ptr [rip + 0x1ac6474], 0 ; 0x101df3640
0x10032d1cc: mov rdx, qword ptr [rip + 0x942d8d] ; 0x100c6ff60
0x10032d1d3: mov qword ptr [rip + 0x1ac646e], rdx ; 0x101df3648
0x10032d1da: lea rdx, [rip - 0x92c1] ; 0x100323f20
0x10032d1e1: vmovq xmm1, rdx
0x10032d1e6: vmovdqu xmmword ptr [rip + 0x1ac6482], xmm1 ; 0x101df3670
0x10032d1ee: mov rdx, qword ptr [rip + 0x8d8f73] ; 0x100c06168 -> 0x10032a0d0 __Z12ApplyWrapperI4WindMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x10032d1f5: mov qword ptr [rip + 0x1ac6484], rdx ; 0x101df3680
0x10032d1fc: mov rdx, qword ptr [rip + 0x8dc7f5] ; 0x100c099f8 -> 0x10032a170 __Z21InitFunctionSignatureIM4WindFvbEEvP17FunctionSignature
0x10032d203: mov qword ptr [rip + 0x1ac647e], rdx ; 0x101df3688
0x10032d20a: lea r15, [rip + 0x846062] ; 0x100b73273 GetEnabled
0x10032d211: mov qword ptr [rip + 0x1ac6480], r15 ; 0x101df3698
0x10032d218: lea rdx, [rip + 0x1ac6479] ; 0x101df3698
0x10032d21f: mov qword ptr [rip + 0x1ac6476], 0 ; 0x101df36a0
0x10032d22a: mov qword ptr [rip + 0x1ac6477], rcx ; 0x101df36a8
0x10032d231: lea rcx, [rip - 0x9308] ; 0x100323f30
0x10032d238: vmovq xmm1, rcx
0x10032d23d: vmovdqu xmmword ptr [rip + 0x1ac648b], xmm1 ; 0x101df36d0
0x10032d245: mov rcx, qword ptr [rip + 0x8d8f0c] ; 0x100c06158 -> 0x10032a1f0 __Z12ApplyWrapperI4WindMS0_FbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10032d24c: mov qword ptr [rip + 0x1ac648d], rcx ; 0x101df36e0
0x10032d253: mov rcx, qword ptr [rip + 0x8dc78e] ; 0x100c099e8 -> 0x10032a270 __Z21InitFunctionSignatureIM4WindFbvEEvP17FunctionSignature
0x10032d25a: mov qword ptr [rip + 0x1ac6487], rcx ; 0x101df36e8
0x10032d261: lea rcx, [rip + 0x849dd9] ; 0x100b77041 SetTransform
0x10032d268: mov qword ptr [rip + 0x1ac6489], rcx ; 0x101df36f8
0x10032d26f: lea rcx, [rip + 0x1ac6482] ; 0x101df36f8
0x10032d276: mov qword ptr [rip + 0x1ac647f], 0 ; 0x101df3700
0x10032d281: mov qword ptr [rip + 0x1ac6480], rdx ; 0x101df3708
0x10032d288: lea rdx, [rip - 0x934f] ; 0x100323f40
0x10032d28f: vmovq xmm1, rdx
0x10032d294: vmovdqu xmmword ptr [rip + 0x1ac6494], xmm1 ; 0x101df3730
0x10032d29c: mov rdx, qword ptr [rip + 0x8d8ebd] ; 0x100c06160 -> 0x10032a2a0 __Z12ApplyWrapperI4WindMS0_FvRKN10Vectormath3Aos7Matrix4EEEvM9VoidClassFvvEPv8VariablePSC_j
0x10032d2a3: mov qword ptr [rip + 0x1ac6496], rdx ; 0x101df3740
0x10032d2aa: mov rdx, qword ptr [rip + 0x8dc73f] ; 0x100c099f0 -> 0x10032a340 __Z21InitFunctionSignatureIM4WindFvRKN10Vectormath3Aos7Matrix4EEEvP17FunctionSignature
0x10032d2b1: mov qword ptr [rip + 0x1ac6490], rdx ; 0x101df3748
0x10032d2b8: lea rdx, [rip + 0x845fa0] ; 0x100b7325f GetTransform
0x10032d2bf: mov qword ptr [rip + 0x1ac6492], rdx ; 0x101df3758
0x10032d2c6: mov qword ptr [rip + 0x1ac648f], 0 ; 0x101df3760
0x10032d2d1: mov qword ptr [rip + 0x1ac6490], rcx ; 0x101df3768
0x10032d2d8: lea rcx, [rip + 0x1ac6479] ; 0x101df3758
0x10032d2df: mov qword ptr [rip + 0x942c7a], rcx ; 0x100c6ff60
0x10032d2e6: lea rcx, [rip - 0x937d] ; 0x100323f70
0x10032d2ed: vmovq xmm1, rcx
0x10032d2f2: vmovdqu xmmword ptr [rip + 0x1ac6496], xmm1 ; 0x101df3790
0x10032d2fa: mov rcx, qword ptr [rip + 0x8d8e4f] ; 0x100c06150 -> 0x10032a3c0 __Z12ApplyWrapperI4WindMS0_FRN10Vectormath3Aos7Matrix4EvEEvM9VoidClassFvvEPv8VariablePSB_j
0x10032d301: mov qword ptr [rip + 0x1ac6498], rcx ; 0x101df37a0
0x10032d308: mov rcx, qword ptr [rip + 0x8dc6d1] ; 0x100c099e0 -> 0x10032a440 __Z21InitFunctionSignatureIM4WindFRN10Vectormath3Aos7Matrix4EvEEvP17FunctionSignature
0x10032d30f: mov qword ptr [rip + 0x1ac6492], rcx ; 0x101df37a8
0x10032d316: lea rcx, [rip + 0x853b08] ; 0x100b80e25 windSound
0x10032d31d: mov qword ptr [rip + 0x97f104], rcx ; 0x100cac428
0x10032d324: lea rcx, [rip + 0x97f0ad] ; 0x100cac3d8
0x10032d32b: mov qword ptr [rip + 0x1ac635e], rax ; 0x101df3690
0x10032d332: mov qword ptr [rip + 0x1ac63b7], rax ; 0x101df36f0
0x10032d339: mov qword ptr [rip + 0x1ac6410], rax ; 0x101df3750
0x10032d340: mov qword ptr [rip + 0x1ac6469], rax ; 0x101df37b0
0x10032d347: mov qword ptr [rip + 0x97f0ea], rcx ; 0x100cac438
0x10032d34e: mov qword ptr [rip + 0x97f0ef], 0x88 ; 0x100cac448
0x10032d359: mov rcx, qword ptr [rip + 0x8d9a88] ; 0x100c06de8 -> 0x1000209f0 __Z17GetMetaTypeByTypeINSt3__112basic_stringIcNS0_11char_traitsIcEE16StlPoolAllocatorIcEEEERK8MetaTypev
0x10032d360: mov qword ptr [rip + 0x97f0e9], rcx ; 0x100cac450
0x10032d367: mov qword ptr [rip + 0x97f0ea], rax ; 0x100cac458
0x10032d36e: mov qword ptr [rip + 0x97f0e7], 0xffffffffffffffff ; 0x100cac460
0x10032d379: mov qword ptr [rip + 0x97f0e8], r12 ; 0x100cac468
0x10032d380: mov qword ptr [rip + 0x97f0e5], 0 ; 0x100cac470
0x10032d38b: lea rcx, [rip + 0x84a2b7] ; 0x100b77649 Sound
0x10032d392: vmovq xmm1, rcx
0x10032d397: lea rcx, [rip + 0x8371f1] ; 0x100b6458f Tool_Category
0x10032d39e: vmovq xmm2, rcx
0x10032d3a3: lea rcx, [rip + 0x1ac6416] ; 0x101df37c0
0x10032d3aa: mov qword ptr [rip + 0x97f07f], rcx ; 0x100cac430
0x10032d3b1: lea rcx, [rip + 0x838b5a] ; 0x100b65f12 minDist
0x10032d3b8: mov qword ptr [rip + 0x97f0b9], rcx ; 0x100cac478
0x10032d3bf: lea rcx, [rip + 0x97f062] ; 0x100cac428
0x10032d3c6: vpunpcklqdq xmm7, xmm2, xmm1
0x10032d3ca: mov qword ptr [rip + 0x97f0b7], rcx ; 0x100cac488
0x10032d3d1: mov qword ptr [rip + 0x97f0bc], 0xa0 ; 0x100cac498
0x10032d3dc: mov qword ptr [rip + 0x97f0bd], r14 ; 0x100cac4a0
0x10032d3e3: mov qword ptr [rip + 0x97f0be], rax ; 0x100cac4a8
0x10032d3ea: mov qword ptr [rip + 0x97f0bb], 0xffffffffffffffff ; 0x100cac4b0
0x10032d3f5: mov qword ptr [rip + 0x97f0bc], r12 ; 0x100cac4b8
0x10032d3fc: mov qword ptr [rip + 0x97f0b9], 0 ; 0x100cac4c0
0x10032d407: lea rcx, [rip + 0x85388d] ; 0x100b80c9b 30.0
0x10032d40e: vmovq xmm1, rcx
0x10032d413: lea rcx, [rip + 0x1ac63c6] ; 0x101df37e0
0x10032d41a: vmovdqa xmmword ptr [rip + 0x1ac63de], xmm7 ; 0x101df3800
0x10032d422: mov qword ptr [rip + 0x1ac63e7], rcx ; 0x101df3810
0x10032d429: lea rcx, [rip + 0x1ac63d0] ; 0x101df3800
0x10032d430: mov qword ptr [rip + 0x97f049], rcx ; 0x100cac480
0x10032d437: lea rcx, [rip + 0x838adc] ; 0x100b65f1a maxDist
0x10032d43e: mov qword ptr [rip + 0x97f083], rcx ; 0x100cac4c8
0x10032d445: lea rcx, [rip + 0x97f02c] ; 0x100cac478
0x10032d44c: mov qword ptr [rip + 0x97f085], rcx ; 0x100cac4d8
0x10032d453: lea rcx, [rip + 0x97f06e] ; 0x100cac4c8
0x10032d45a: mov qword ptr [rip + 0x94a7ff], rcx ; 0x100c77c60
0x10032d461: mov qword ptr [rip + 0x97f07c], 0xa4 ; 0x100cac4e8
0x10032d46c: mov qword ptr [rip + 0x97f07d], r14 ; 0x100cac4f0
0x10032d473: mov qword ptr [rip + 0x97f07e], rax ; 0x100cac4f8
0x10032d47a: mov qword ptr [rip + 0x97f07b], 0xffffffffffffffff ; 0x100cac500
0x10032d485: mov qword ptr [rip + 0x97f07c], r12 ; 0x100cac508
0x10032d48c: mov qword ptr [rip + 0x97f079], 0 ; 0x100cac510
0x10032d497: lea rax, [rip + 0x849eef] ; 0x100b7738d 50.0
0x10032d49e: vmovq xmm2, rax
0x10032d4a3: lea rax, [rip + 0x1ac6376] ; 0x101df3820
0x10032d4aa: vmovdqa xmmword ptr [rip + 0x1ac638e], xmm7 ; 0x101df3840
0x10032d4b2: lea rcx, [rip + 0x1ac6387] ; 0x101df3840
0x10032d4b9: mov qword ptr [rip + 0x1ac6390], rax ; 0x101df3850
0x10032d4c0: mov qword ptr [rip + 0x97f009], rcx ; 0x100cac4d0
0x10032d4c7: lea rax, [rip + 0x853961] ; 0x100b80e2f Boundary
0x10032d4ce: mov qword ptr [rip + 0x1ac638b], rax ; 0x101df3860
0x10032d4d5: mov qword ptr [rip + 0x1ac6388], 0 ; 0x101df3868
0x10032d4e0: mov rax, qword ptr [rip + 0x942a71] ; 0x100c6ff58
0x10032d4e7: mov qword ptr [rip + 0x1ac6382], rax ; 0x101df3870
0x10032d4ee: lea rax, [rip + 0x1ac6363] ; 0x101df3858
0x10032d4f5: mov qword ptr [rip + 0x942a5c], rax ; 0x100c6ff58
0x10032d4fc: mov qword ptr [rip + 0x1ac637d], rax ; 0x101df3880
0x10032d503: lea rax, [rip - 0x2f7c4a] ; 0x1000358c0
0x10032d50a: mov qword ptr [rip + 0x1ac6377], rax ; 0x101df3888
0x10032d511: mov dword ptr [rip + 0x1ac6375], 0xffffffff ; 0x101df3890
0x10032d51b: mov dword ptr [rip + 0x1ac636f], 0xffffffff ; 0x101df3894
0x10032d525: mov qword ptr [rip + 0x1ac6380], 0 ; 0x101df38b0
0x10032d530: mov rax, qword ptr [rip + 0x8df151] ; 0x100c0c688
0x10032d537: add rax, 0x10
0x10032d53b: mov qword ptr [rip + 0x1ac6316], rax ; 0x101df3858
0x10032d542: vmovdqa xmm4, xmm3
0x10032d546: vmovdqa xmmword ptr [rbp - 0x80], xmm4
0x10032d54b: vpunpcklqdq xmm3, xmm4, xmm8
0x10032d550: vmovdqa xmmword ptr [rip + 0x1ac5f88], xmm3 ; 0x101df34e0
0x10032d558: vpunpcklqdq xmm3, xmm4, xmm10
0x10032d55d: vmovdqa xmmword ptr [rip + 0x1ac5fbb], xmm3 ; 0x101df3520
0x10032d565: vpunpcklqdq xmm3, xmm4, xmm11
0x10032d56a: vmovdqa xmmword ptr [rip + 0x1ac5fce], xmm3 ; 0x101df3540
0x10032d572: vpunpcklqdq xmm3, xmm5, xmm12
0x10032d577: vmovdqa xmmword ptr [rip + 0x1ac6021], xmm3 ; 0x101df35a0
0x10032d57f: vmovdqa xmmword ptr [rip + 0x1ac6079], xmm6 ; 0x101df3600
0x10032d587: vmovdqa xmmword ptr [rip + 0x1ac6231], xmm7 ; 0x101df37c0
0x10032d58f: mov qword ptr [rip + 0x97ebf6], 0xffffffffffffffff ; 0x100cac190
0x10032d59a: mov qword ptr [rip + 0x97ebf7], r12 ; 0x100cac198
0x10032d5a1: mov qword ptr [rip + 0x97ebf4], 0 ; 0x100cac1a0
0x10032d5ac: mov qword ptr [rip + 0x1ac5f39], 0 ; 0x101df34f0
0x10032d5b7: vpunpcklqdq xmm3, xmm4, xmm9
0x10032d5bc: vmovdqa xmmword ptr [rbp - 0x90], xmm3
0x10032d5c4: vmovdqa xmmword ptr [rip + 0x1ac5f34], xmm3 ; 0x101df3500
0x10032d5cc: mov qword ptr [rip + 0x1ac5f39], 0 ; 0x101df3510
0x10032d5d7: mov qword ptr [rip + 0x1ac5f4e], 0 ; 0x101df3530
0x10032d5e2: mov qword ptr [rip + 0x1ac5f63], 0 ; 0x101df3550
0x10032d5ed: vpunpcklqdq xmm0, xmm4, xmm0
0x10032d5f1: vmovdqa xmmword ptr [rbp - 0x50], xmm0
0x10032d5f6: vmovdqa xmmword ptr [rip + 0x1ac5f62], xmm0 ; 0x101df3560
0x10032d5fe: mov qword ptr [rip + 0x1ac5f67], 0 ; 0x101df3570
0x10032d609: vmovdqa xmmword ptr [rip + 0x1ac5f6f], xmm0 ; 0x101df3580
0x10032d611: mov qword ptr [rip + 0x1ac5f74], 0 ; 0x101df3590
0x10032d61c: mov qword ptr [rip + 0x1ac5f89], 0 ; 0x101df35b0
0x10032d627: mov qword ptr [rip + 0x1ac5fde], 0 ; 0x101df3610
0x10032d632: mov qword ptr [rip + 0x1ac6193], 0 ; 0x101df37d0
0x10032d63d: vpunpcklqdq xmm0, xmm4, xmm1
0x10032d641: vmovdqa xmmword ptr [rip + 0x1ac6197], xmm0 ; 0x101df37e0
0x10032d649: mov qword ptr [rip + 0x1ac619c], 0 ; 0x101df37f0
0x10032d654: vpunpcklqdq xmm0, xmm4, xmm2
0x10032d658: vmovdqa xmmword ptr [rip + 0x1ac61c0], xmm0 ; 0x101df3820
0x10032d660: mov qword ptr [rip + 0x1ac61c5], 0 ; 0x101df3830
0x10032d66b: xor eax, eax
0x10032d66d: call 0x100011c10 ; 0x100011c10
0x10032d672: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10032d677: vmovaps xmmword ptr [rip + 0x1ac6241], xmm0 ; 0x101df38c0
0x10032d67f: lea rax, [rip + 0x1ac623a] ; 0x101df38c0
0x10032d686: mov rcx, qword ptr [rip + 0x1ac61db] ; 0x101df3868
0x10032d68d: mov qword ptr [rip + 0x1ac623c], rcx ; 0x101df38d0
0x10032d694: mov qword ptr [rip + 0x1ac61cd], rax ; 0x101df3868
0x10032d69b: lea rax, [rip + 0x8499b7] ; 0x100b77059 enabled
0x10032d6a2: mov qword ptr [rip + 0x97ee6f], rax ; 0x100cac518
0x10032d6a9: lea rcx, [rip + 0x97ee68] ; 0x100cac518
0x10032d6b0: mov rax, qword ptr [rip + 0x94a5a9] ; 0x100c77c60
0x10032d6b7: mov qword ptr [rip + 0x97ee6a], rax ; 0x100cac528
0x10032d6be: mov qword ptr [rip + 0x97ee6f], 4 ; 0x100cac538
0x10032d6c9: mov qword ptr [rip + 0x97ee70], r13 ; 0x100cac540
0x10032d6d0: mov rax, qword ptr [rip + 0x8db0f9] ; 0x100c087d0 -> 0x10032a6c0 __Z18GetMetaClassByTypeIP8BoundaryERK9MetaClassv
0x10032d6d7: mov qword ptr [rip + 0x97ee6a], rax ; 0x100cac548
0x10032d6de: mov qword ptr [rip + 0x97ee67], 0xffffffffffffffff ; 0x100cac550
0x10032d6e9: mov qword ptr [rip + 0x97ee68], r12 ; 0x100cac558
0x10032d6f0: mov qword ptr [rip + 0x97ee65], 0 ; 0x100cac560
0x10032d6fb: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10032d700: vmovaps xmmword ptr [rip + 0x1ac61d8], xmm0 ; 0x101df38e0
0x10032d708: lea rdx, [rip + 0x1ac61d1] ; 0x101df38e0
0x10032d70f: mov qword ptr [rip + 0x1ac61d6], 0 ; 0x101df38f0
0x10032d71a: mov qword ptr [rip + 0x97edff], rdx ; 0x100cac520
0x10032d721: lea rdx, [rip + 0x853710] ; 0x100b80e38 rails
0x10032d728: mov qword ptr [rip + 0x97ee39], rdx ; 0x100cac568
0x10032d72f: lea rdx, [rip + 0x97ee32] ; 0x100cac568
0x10032d736: mov qword ptr [rip + 0x97ee3b], rcx ; 0x100cac578
0x10032d73d: mov qword ptr [rip + 0x94a51c], rdx ; 0x100c77c60
0x10032d744: mov qword ptr [rip + 0x97ee39], 8 ; 0x100cac588
0x10032d74f: mov rcx, qword ptr [rip + 0x8d9b72] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x10032d756: mov qword ptr [rip + 0x97ee33], rcx ; 0x100cac590
0x10032d75d: mov qword ptr [rip + 0x97ee34], rax ; 0x100cac598
0x10032d764: mov qword ptr [rip + 0x97ee31], 0xffffffffffffffff ; 0x100cac5a0
0x10032d76f: mov qword ptr [rip + 0x97ee32], r12 ; 0x100cac5a8
0x10032d776: mov qword ptr [rip + 0x97ee2f], 0 ; 0x100cac5b0
0x10032d781: lea rcx, [rip + 0x84a326] ; 0x100b77aae Rail
0x10032d788: vmovq xmm0, rcx
0x10032d78d: vmovdqa xmm1, xmmword ptr [rbp - 0x60]
0x10032d792: vpunpcklqdq xmm0, xmm1, xmm0
0x10032d796: vmovdqa xmmword ptr [rip + 0x1ac6162], xmm0 ; 0x101df3900
0x10032d79e: lea rcx, [rip + 0x1ac615b] ; 0x101df3900
0x10032d7a5: mov qword ptr [rip + 0x1ac6160], 0 ; 0x101df3910
0x10032d7b0: lea rdx, [rip + 0x875875] ; 0x100ba302c false
0x10032d7b7: vmovq xmm0, rdx
0x10032d7bc: vmovdqa xmm1, xmmword ptr [rbp - 0x70]
0x10032d7c1: vpunpcklqdq xmm0, xmm1, xmm0
0x10032d7c5: vmovdqa xmmword ptr [rip + 0x1ac6153], xmm0 ; 0x101df3920
0x10032d7cd: lea rdx, [rip + 0x1ac614c] ; 0x101df3920
0x10032d7d4: mov qword ptr [rip + 0x1ac6155], rcx ; 0x101df3930
0x10032d7db: mov qword ptr [rip + 0x97ed8e], rdx ; 0x100cac570
0x10032d7e2: mov qword ptr [rip + 0x1ac614f], rbx ; 0x101df3938
0x10032d7e9: lea rcx, [rip + 0x1ac6148] ; 0x101df3938
0x10032d7f0: mov qword ptr [rip + 0x1ac6145], 0 ; 0x101df3940
0x10032d7fb: mov rdx, qword ptr [rip + 0x94275e] ; 0x100c6ff60
0x10032d802: mov qword ptr [rip + 0x1ac613f], rdx ; 0x101df3948
0x10032d809: lea rdx, [rip - 0x9870] ; 0x100323fa0
0x10032d810: vmovq xmm0, rdx
0x10032d815: vmovdqu xmmword ptr [rip + 0x1ac6153], xmm0 ; 0x101df3970
0x10032d81d: mov rdx, qword ptr [rip + 0x8d8cdc] ; 0x100c06500 -> 0x10032a6d0 __Z12ApplyWrapperI8BoundaryMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x10032d824: mov qword ptr [rip + 0x1ac6155], rdx ; 0x101df3980
0x10032d82b: mov rdx, qword ptr [rip + 0x8dc55e] ; 0x100c09d90 -> 0x10032a770 __Z21InitFunctionSignatureIM8BoundaryFvbEEvP17FunctionSignature
0x10032d832: mov qword ptr [rip + 0x1ac614f], rdx ; 0x101df3988
0x10032d839: mov qword ptr [rip + 0x1ac6150], rax ; 0x101df3990
0x10032d840: mov qword ptr [rip + 0x1ac6151], r15 ; 0x101df3998
0x10032d847: lea rdx, [rip + 0x1ac614a] ; 0x101df3998
0x10032d84e: mov qword ptr [rip + 0x1ac6147], 0 ; 0x101df39a0
0x10032d859: mov qword ptr [rip + 0x1ac6148], rcx ; 0x101df39a8
0x10032d860: mov qword ptr [rip + 0x9426f9], rdx ; 0x100c6ff60
0x10032d867: lea rcx, [rip - 0x98be] ; 0x100323fb0
0x10032d86e: vmovq xmm0, rcx
0x10032d873: vmovdqu xmmword ptr [rip + 0x1ac6155], xmm0 ; 0x101df39d0
0x10032d87b: mov rcx, qword ptr [rip + 0x8d8c76] ; 0x100c064f8 -> 0x10032a7f0 __Z12ApplyWrapperI8BoundaryMS0_FbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10032d882: mov qword ptr [rip + 0x1ac6157], rcx ; 0x101df39e0
0x10032d889: mov rcx, qword ptr [rip + 0x8dc4f8] ; 0x100c09d88 -> 0x10032a870 __Z21InitFunctionSignatureIM8BoundaryFbvEEvP17FunctionSignature
0x10032d890: mov qword ptr [rip + 0x1ac6151], rcx ; 0x101df39e8
0x10032d897: mov qword ptr [rip + 0x1ac6152], rax ; 0x101df39f0
0x10032d89e: lea rax, [rip + 0x853599] ; 0x100b80e3e EnvironmentForces
0x10032d8a5: mov qword ptr [rip + 0x1ac6154], rax ; 0x101df3a00
0x10032d8ac: lea rax, [rip + 0x1ac6145] ; 0x101df39f8
0x10032d8b3: mov qword ptr [rip + 0x1ac614a], 0 ; 0x101df3a08
0x10032d8be: mov rcx, qword ptr [rip + 0x942693] ; 0x100c6ff58
0x10032d8c5: mov qword ptr [rip + 0x1ac6144], rcx ; 0x101df3a10
0x10032d8cc: mov qword ptr [rip + 0x942685], rax ; 0x100c6ff58
0x10032d8d3: mov qword ptr [rip + 0x1ac6146], rax ; 0x101df3a20
0x10032d8da: mov rax, qword ptr [rip + 0x8dadcf] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x10032d8e1: mov qword ptr [rip + 0x1ac6140], rax ; 0x101df3a28
0x10032d8e8: mov dword ptr [rip + 0x1ac613e], 0xffffffff ; 0x101df3a30
0x10032d8f2: mov dword ptr [rip + 0x1ac6138], 0xffffffff ; 0x101df3a34
0x10032d8fc: mov qword ptr [rip + 0x1ac6149], 0 ; 0x101df3a50
0x10032d907: mov rax, qword ptr [rip + 0x8de1c2] ; 0x100c0bad0
0x10032d90e: add rax, 0x10
0x10032d912: mov qword ptr [rip + 0x1ac60df], rax ; 0x101df39f8
0x10032d919: xor eax, eax
0x10032d91b: call 0x100011c10 ; 0x100011c10
0x10032d920: lea rax, [rip + 0x82efe5] ; 0x100b5c90c Initialize
0x10032d927: mov qword ptr [rip + 0x1ac612a], rax ; 0x101df3a58
0x10032d92e: lea rsi, [rip + 0x1ac6123] ; 0x101df3a58
0x10032d935: mov qword ptr [rip + 0x1ac6120], 0 ; 0x101df3a60
0x10032d940: mov rax, qword ptr [rip + 0x942619] ; 0x100c6ff60
0x10032d947: mov qword ptr [rip + 0x1ac611a], rax ; 0x101df3a68
0x10032d94e: lea rax, [rip - 0x9975] ; 0x100323fe0
0x10032d955: vmovq xmm0, rax
0x10032d95a: vmovdqu xmmword ptr [rip + 0x1ac612e], xmm0 ; 0x101df3a90
0x10032d962: mov rcx, qword ptr [rip + 0x8d8547] ; 0x100c05eb0 -> 0x10032b830 __Z12ApplyWrapperI17EnvironmentForcesMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10032d969: mov qword ptr [rip + 0x1ac6130], rcx ; 0x101df3aa0
0x10032d970: mov rdx, qword ptr [rip + 0x8dbdc9] ; 0x100c09740 -> 0x10032b890 __Z21InitFunctionSignatureIM17EnvironmentForcesFvvEEvP17FunctionSignature
0x10032d977: mov qword ptr [rip + 0x1ac612a], rdx ; 0x101df3aa8
0x10032d97e: mov rax, qword ptr [rip + 0x8da74b] ; 0x100c080d0 -> 0x10032b3f0 __Z18GetMetaClassByTypeIP17EnvironmentForcesERK9MetaClassv
0x10032d985: mov qword ptr [rip + 0x1ac6124], rax ; 0x101df3ab0
0x10032d98c: lea rdi, [rip + 0x8330b2] ; 0x100b60a45 OnLevelLoad
0x10032d993: mov qword ptr [rip + 0x1ac611e], rdi ; 0x101df3ab8
0x10032d99a: lea rdi, [rip + 0x1ac6117] ; 0x101df3ab8
0x10032d9a1: mov qword ptr [rip + 0x1ac6114], 0 ; 0x101df3ac0
0x10032d9ac: mov qword ptr [rip + 0x1ac6115], rsi ; 0x101df3ac8
0x10032d9b3: lea rsi, [rip - 0x994a] ; 0x100324070
0x10032d9ba: vmovq xmm0, rsi
0x10032d9bf: vmovdqu xmmword ptr [rip + 0x1ac6129], xmm0 ; 0x101df3af0
0x10032d9c7: mov qword ptr [rip + 0x1ac6132], rcx ; 0x101df3b00
0x10032d9ce: mov qword ptr [rip + 0x1ac6133], rdx ; 0x101df3b08
0x10032d9d5: mov qword ptr [rip + 0x1ac6134], rax ; 0x101df3b10
0x10032d9dc: lea rsi, [rip + 0x833078] ; 0x100b60a5b OnLevelUnload
0x10032d9e3: mov qword ptr [rip + 0x1ac612e], rsi ; 0x101df3b18
0x10032d9ea: lea rsi, [rip + 0x1ac6127] ; 0x101df3b18
0x10032d9f1: mov qword ptr [rip + 0x1ac6124], 0 ; 0x101df3b20
0x10032d9fc: mov qword ptr [rip + 0x1ac6125], rdi ; 0x101df3b28
0x10032da03: lea rdi, [rip - 0x971a] ; 0x1003242f0
0x10032da0a: vmovq xmm0, rdi
0x10032da0f: vmovdqu xmmword ptr [rip + 0x1ac6139], xmm0 ; 0x101df3b50
0x10032da17: mov qword ptr [rip + 0x1ac6142], rcx ; 0x101df3b60
0x10032da1e: mov qword ptr [rip + 0x1ac6143], rdx ; 0x101df3b68
0x10032da25: mov qword ptr [rip + 0x1ac6144], rax ; 0x101df3b70
0x10032da2c: lea rdi, [rip + 0x82ef05] ; 0x100b5c938 Terminate
0x10032da33: mov qword ptr [rip + 0x1ac613e], rdi ; 0x101df3b78
0x10032da3a: lea rdi, [rip + 0x1ac6137] ; 0x101df3b78
0x10032da41: mov qword ptr [rip + 0x1ac6134], 0 ; 0x101df3b80
0x10032da4c: mov qword ptr [rip + 0x1ac6135], rsi ; 0x101df3b88
0x10032da53: lea rsi, [rip - 0x930a] ; 0x100324750
0x10032da5a: vmovq xmm0, rsi
0x10032da5f: vmovdqu xmmword ptr [rip + 0x1ac6149], xmm0 ; 0x101df3bb0
0x10032da67: mov qword ptr [rip + 0x1ac6152], rcx ; 0x101df3bc0
0x10032da6e: mov qword ptr [rip + 0x1ac6153], rdx ; 0x101df3bc8
0x10032da75: mov qword ptr [rip + 0x1ac6154], rax ; 0x101df3bd0
0x10032da7c: lea rsi, [rip + 0x82eedc] ; 0x100b5c95f HotLoad
0x10032da83: mov qword ptr [rip + 0x1ac614e], rsi ; 0x101df3bd8
0x10032da8a: lea rsi, [rip + 0x1ac6147] ; 0x101df3bd8
0x10032da91: mov qword ptr [rip + 0x1ac6144], 0 ; 0x101df3be0
0x10032da9c: mov qword ptr [rip + 0x1ac6145], rdi ; 0x101df3be8
0x10032daa3: lea rdi, [rip - 0x934a] ; 0x100324760
0x10032daaa: vmovq xmm0, rdi
0x10032daaf: vmovdqu xmmword ptr [rip + 0x1ac6159], xmm0 ; 0x101df3c10
0x10032dab7: mov qword ptr [rip + 0x1ac6162], rcx ; 0x101df3c20
0x10032dabe: mov qword ptr [rip + 0x1ac6163], rdx ; 0x101df3c28
0x10032dac5: mov qword ptr [rip + 0x1ac6164], rax ; 0x101df3c30
0x10032dacc: lea rcx, [rip + 0x82ee7a] ; 0x100b5c94d Update
0x10032dad3: mov qword ptr [rip + 0x1ac615e], rcx ; 0x101df3c38
0x10032dada: lea rcx, [rip + 0x1ac6157] ; 0x101df3c38
0x10032dae1: mov qword ptr [rip + 0x1ac6154], 0 ; 0x101df3c40
0x10032daec: mov qword ptr [rip + 0x1ac6155], rsi ; 0x101df3c48
0x10032daf3: lea rdx, [rip - 0x907a] ; 0x100324a80
0x10032dafa: vmovq xmm0, rdx
0x10032daff: vmovdqu xmmword ptr [rip + 0x1ac6169], xmm0 ; 0x101df3c70
0x10032db07: mov rdx, qword ptr [rip + 0x8d8392] ; 0x100c05ea0 -> 0x10032b8b0 __Z12ApplyWrapperI17EnvironmentForcesMS0_FvP4GameEEvM9VoidClassFvvEPv8VariablePS9_j
0x10032db0e: mov qword ptr [rip + 0x1ac616b], rdx ; 0x101df3c80
0x10032db15: mov rdx, qword ptr [rip + 0x8dbc14] ; 0x100c09730 -> 0x10032b950 __Z21InitFunctionSignatureIM17EnvironmentForcesFvP4GameEEvP17FunctionSignature
0x10032db1c: mov qword ptr [rip + 0x1ac6165], rdx ; 0x101df3c88
0x10032db23: mov qword ptr [rip + 0x1ac6166], rax ; 0x101df3c90
0x10032db2a: lea rdx, [rip + 0x8342dc] ; 0x100b61e0d BuildScene
0x10032db31: mov qword ptr [rip + 0x1ac6160], rdx ; 0x101df3c98
0x10032db38: lea rdx, [rip + 0x1ac6159] ; 0x101df3c98
0x10032db3f: mov qword ptr [rip + 0x1ac6156], 0 ; 0x101df3ca0
0x10032db4a: mov qword ptr [rip + 0x1ac6157], rcx ; 0x101df3ca8
0x10032db51: lea rcx, [rip - 0x64b8] ; 0x1003276a0
0x10032db58: vmovq xmm0, rcx
0x10032db5d: vmovdqu xmmword ptr [rip + 0x1ac616b], xmm0 ; 0x101df3cd0
0x10032db65: mov rcx, qword ptr [rip + 0x8d833c] ; 0x100c05ea8 -> 0x10032b9d0 __Z12ApplyWrapperI17EnvironmentForcesMS0_FvP5SceneEEvM9VoidClassFvvEPv8VariablePS9_j
0x10032db6c: mov qword ptr [rip + 0x1ac616d], rcx ; 0x101df3ce0
0x10032db73: mov rcx, qword ptr [rip + 0x8dbbbe] ; 0x100c09738 -> 0x10032ba70 __Z21InitFunctionSignatureIM17EnvironmentForcesFvP5SceneEEvP17FunctionSignature
0x10032db7a: mov qword ptr [rip + 0x1ac6167], rcx ; 0x101df3ce8
0x10032db81: mov qword ptr [rip + 0x1ac6168], rax ; 0x101df3cf0
0x10032db88: lea rcx, [rip + 0x8532c1] ; 0x100b80e50 CreateWind
0x10032db8f: mov qword ptr [rip + 0x1ac6162], rcx ; 0x101df3cf8
0x10032db96: lea rcx, [rip + 0x1ac615b] ; 0x101df3cf8
0x10032db9d: mov qword ptr [rip + 0x1ac6164], rdx ; 0x101df3d08
0x10032dba4: lea rdx, [rip - 0x64bb] ; 0x1003276f0
0x10032dbab: vmovq xmm0, rdx
0x10032dbb0: vmovdqu xmmword ptr [rip + 0x1ac6178], xmm0 ; 0x101df3d30
0x10032dbb8: mov rdx, qword ptr [rip + 0x8d82d1] ; 0x100c05e90 -> 0x10032baf0 __Z12ApplyWrapperI17EnvironmentForcesMS0_FP4WindPK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x10032dbbf: mov qword ptr [rip + 0x1ac617a], rdx ; 0x101df3d40
0x10032dbc6: mov rdx, qword ptr [rip + 0x8dbb53] ; 0x100c09720 -> 0x10032bbb0 __Z21InitFunctionSignatureIM17EnvironmentForcesFP4WindPK9MetaClassEEvP17FunctionSignature
0x10032dbcd: mov qword ptr [rip + 0x1ac6174], rdx ; 0x101df3d48
0x10032dbd4: mov qword ptr [rip + 0x1ac6175], rax ; 0x101df3d50
0x10032dbdb: lea rdx, [rip + 0x848237] ; 0x100b75e19 Wind
0x10032dbe2: vmovq xmm1, rdx
0x10032dbe7: lea rdx, [rip + 0x8494da] ; 0x100b770c8 ObjectFactory_CreatesType
0x10032dbee: vmovq xmm0, rdx
0x10032dbf3: vpunpcklqdq xmm1, xmm0, xmm1
0x10032dbf7: vmovdqa xmmword ptr [rip + 0x1ac6161], xmm1 ; 0x101df3d60
0x10032dbff: lea rdx, [rip + 0x1ac615a] ; 0x101df3d60
0x10032dc06: mov qword ptr [rip + 0x1ac615f], 0 ; 0x101df3d70
0x10032dc11: mov qword ptr [rip + 0x1ac60e8], rdx ; 0x101df3d00
0x10032dc18: lea rdx, [rip + 0x85323c] ; 0x100b80e5b CreateBoundary
0x10032dc1f: mov qword ptr [rip + 0x1ac6152], rdx ; 0x101df3d78
0x10032dc26: lea rdx, [rip + 0x1ac614b] ; 0x101df3d78
0x10032dc2d: mov qword ptr [rip + 0x1ac6154], rcx ; 0x101df3d88
0x10032dc34: lea rcx, [rip - 0x64fb] ; 0x100327740
0x10032dc3b: vmovq xmm1, rcx
0x10032dc40: vmovdqu xmmword ptr [rip + 0x1ac6168], xmm1 ; 0x101df3db0
0x10032dc48: mov rcx, qword ptr [rip + 0x8d8249] ; 0x100c05e98 -> 0x10032bc30 __Z12ApplyWrapperI17EnvironmentForcesMS0_FP8BoundaryPK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x10032dc4f: mov qword ptr [rip + 0x1ac616a], rcx ; 0x101df3dc0
0x10032dc56: mov rcx, qword ptr [rip + 0x8dbacb] ; 0x100c09728 -> 0x10032bcf0 __Z21InitFunctionSignatureIM17EnvironmentForcesFP8BoundaryPK9MetaClassEEvP17FunctionSignature
0x10032dc5d: mov qword ptr [rip + 0x1ac6164], rcx ; 0x101df3dc8
0x10032dc64: mov qword ptr [rip + 0x1ac6165], rax ; 0x101df3dd0
0x10032dc6b: lea rcx, [rip + 0x8531bd] ; 0x100b80e2f Boundary
0x10032dc72: vmovq xmm1, rcx
0x10032dc77: vpunpcklqdq xmm1, xmm0, xmm1
0x10032dc7b: vmovdqa xmmword ptr [rip + 0x1ac615d], xmm1 ; 0x101df3de0
0x10032dc83: lea rcx, [rip + 0x1ac6156] ; 0x101df3de0
0x10032dc8a: mov qword ptr [rip + 0x1ac615b], 0 ; 0x101df3df0
0x10032dc95: mov qword ptr [rip + 0x1ac60e4], rcx ; 0x101df3d80
0x10032dc9c: lea rcx, [rip + 0x8531c7] ; 0x100b80e6a CreateBoom
0x10032dca3: mov qword ptr [rip + 0x1ac614e], rcx ; 0x101df3df8
0x10032dcaa: lea rcx, [rip + 0x1ac6147] ; 0x101df3df8
0x10032dcb1: mov qword ptr [rip + 0x1ac6150], rdx ; 0x101df3e08
0x10032dcb8: mov qword ptr [rip + 0x9422a1], rcx ; 0x100c6ff60
0x10032dcbf: lea rcx, [rip - 0x6536] ; 0x100327790
0x10032dcc6: vmovq xmm1, rcx
0x10032dccb: vmovdqu xmmword ptr [rip + 0x1ac615d], xmm1 ; 0x101df3e30
0x10032dcd3: mov rcx, qword ptr [rip + 0x8d81ae] ; 0x100c05e88 -> 0x10032bd70 __Z12ApplyWrapperI17EnvironmentForcesMS0_FP4BoomPK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x10032dcda: mov qword ptr [rip + 0x1ac615f], rcx ; 0x101df3e40
0x10032dce1: mov rcx, qword ptr [rip + 0x8dba30] ; 0x100c09718 -> 0x10032be30 __Z21InitFunctionSignatureIM17EnvironmentForcesFP4BoomPK9MetaClassEEvP17FunctionSignature
0x10032dce8: mov qword ptr [rip + 0x1ac6159], rcx ; 0x101df3e48
0x10032dcef: mov qword ptr [rip + 0x1ac615a], rax ; 0x101df3e50
0x10032dcf6: lea rax, [rip + 0x853178] ; 0x100b80e75 Boom
0x10032dcfd: vmovq xmm1, rax
0x10032dd02: vpunpcklqdq xmm0, xmm0, xmm1
0x10032dd06: vmovdqa xmmword ptr [rip + 0x1ac6152], xmm0 ; 0x101df3e60
0x10032dd0e: lea rcx, [rip + 0x1ac614b] ; 0x101df3e60
0x10032dd15: mov qword ptr [rip + 0x1ac6150], 0 ; 0x101df3e70
0x10032dd20: mov qword ptr [rip + 0x1ac60d9], rcx ; 0x101df3e00
0x10032dd27: mov qword ptr [rip + 0x1ac6152], rax ; 0x101df3e80
0x10032dd2e: lea rax, [rip + 0x1ac6143] ; 0x101df3e78
0x10032dd35: mov qword ptr [rip + 0x1ac6148], 0 ; 0x101df3e88
0x10032dd40: mov rcx, qword ptr [rip + 0x942211] ; 0x100c6ff58
0x10032dd47: mov qword ptr [rip + 0x1ac6142], rcx ; 0x101df3e90
0x10032dd4e: mov qword ptr [rip + 0x942203], rax ; 0x100c6ff58
0x10032dd55: mov qword ptr [rip + 0x1ac6144], rax ; 0x101df3ea0
0x10032dd5c: lea rax, [rip - 0x2f84a3] ; 0x1000358c0
0x10032dd63: mov qword ptr [rip + 0x1ac613e], rax ; 0x101df3ea8
0x10032dd6a: mov dword ptr [rip + 0x1ac613c], 0xffffffff ; 0x101df3eb0
0x10032dd74: mov dword ptr [rip + 0x1ac6136], 0xffffffff ; 0x101df3eb4
0x10032dd7e: mov qword ptr [rip + 0x1ac6147], 0 ; 0x101df3ed0
0x10032dd89: mov rax, qword ptr [rip + 0x8de5e8] ; 0x100c0c378
0x10032dd90: add rax, 0x10
0x10032dd94: mov qword ptr [rip + 0x1ac60dd], rax ; 0x101df3e78
0x10032dd9b: xor eax, eax
0x10032dd9d: call 0x100011c10 ; 0x100011c10
0x10032dda2: mov qword ptr [rip + 0x1ac612f], rbx ; 0x101df3ed8
0x10032dda9: lea rax, [rip + 0x1ac6128] ; 0x101df3ed8
0x10032ddb0: mov qword ptr [rip + 0x1ac6125], 0 ; 0x101df3ee0
0x10032ddbb: mov rcx, qword ptr [rip + 0x94219e] ; 0x100c6ff60
0x10032ddc2: mov qword ptr [rip + 0x1ac611f], rcx ; 0x101df3ee8
0x10032ddc9: lea rcx, [rip - 0x5fb0] ; 0x100327e20
0x10032ddd0: vmovq xmm0, rcx
0x10032ddd5: vmovdqu xmmword ptr [rip + 0x1ac6133], xmm0 ; 0x101df3f10
0x10032dddd: mov rcx, qword ptr [rip + 0x8d829c] ; 0x100c06080 -> 0x10032c110 __Z12ApplyWrapperI4BoomMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x10032dde4: mov qword ptr [rip + 0x1ac6135], rcx ; 0x101df3f20
0x10032ddeb: mov rcx, qword ptr [rip + 0x8dbb1e] ; 0x100c09910 -> 0x10032c1b0 __Z21InitFunctionSignatureIM4BoomFvbEEvP17FunctionSignature
0x10032ddf2: mov qword ptr [rip + 0x1ac612f], rcx ; 0x101df3f28
0x10032ddf9: mov rbx, qword ptr [rip + 0x8da730] ; 0x100c08530 -> 0x10032b400 __Z18GetMetaClassByTypeIP4BoomERK9MetaClassv
0x10032de00: mov qword ptr [rip + 0x1ac6129], rbx ; 0x101df3f30
0x10032de07: mov qword ptr [rip + 0x1ac612a], r15 ; 0x101df3f38
0x10032de0e: lea rcx, [rip + 0x1ac6123] ; 0x101df3f38
0x10032de15: mov qword ptr [rip + 0x1ac6120], 0 ; 0x101df3f40
0x10032de20: mov qword ptr [rip + 0x1ac6121], rax ; 0x101df3f48
0x10032de27: lea rax, [rip - 0x5fee] ; 0x100327e40
0x10032de2e: vmovq xmm0, rax
0x10032de33: vmovdqu xmmword ptr [rip + 0x1ac6135], xmm0 ; 0x101df3f70
0x10032de3b: mov rax, qword ptr [rip + 0x8d824e] ; 0x100c06090 -> 0x10032c230 __Z12ApplyWrapperI4BoomMS0_KFbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10032de42: mov qword ptr [rip + 0x1ac6137], rax ; 0x101df3f80
0x10032de49: mov rax, qword ptr [rip + 0x8dbad0] ; 0x100c09920 -> 0x10032c2b0 __Z21InitFunctionSignatureIM4BoomKFbvEEvP17FunctionSignature
0x10032de50: mov qword ptr [rip + 0x1ac6131], rax ; 0x101df3f88
0x10032de57: mov qword ptr [rip + 0x1ac6132], rbx ; 0x101df3f90
0x10032de5e: lea rax, [rip + 0x8491dc] ; 0x100b77041 SetTransform
0x10032de65: mov qword ptr [rip + 0x1ac612c], rax ; 0x101df3f98
0x10032de6c: lea rax, [rip + 0x1ac6125] ; 0x101df3f98
0x10032de73: mov qword ptr [rip + 0x1ac6122], 0 ; 0x101df3fa0
0x10032de7e: mov qword ptr [rip + 0x1ac6123], rcx ; 0x101df3fa8
0x10032de85: lea rcx, [rip - 0x603c] ; 0x100327e50
0x10032de8c: vmovq xmm0, rcx
0x10032de91: vmovdqu xmmword ptr [rip + 0x1ac6137], xmm0 ; 0x101df3fd0
0x10032de99: mov rcx, qword ptr [rip + 0x8d81d8] ; 0x100c06078 -> 0x10032c2e0 __Z12ApplyWrapperI4BoomMS0_FvRKN10Vectormath3Aos7Matrix4EEEvM9VoidClassFvvEPv8VariablePSC_j
0x10032dea0: mov qword ptr [rip + 0x1ac6139], rcx ; 0x101df3fe0
0x10032dea7: mov rcx, qword ptr [rip + 0x8dba5a] ; 0x100c09908 -> 0x10032c380 __Z21InitFunctionSignatureIM4BoomFvRKN10Vectormath3Aos7Matrix4EEEvP17FunctionSignature
0x10032deae: mov qword ptr [rip + 0x1ac6133], rcx ; 0x101df3fe8
0x10032deb5: mov qword ptr [rip + 0x1ac6134], rbx ; 0x101df3ff0
0x10032debc: lea rcx, [rip + 0x84539c] ; 0x100b7325f GetTransform
0x10032dec3: mov qword ptr [rip + 0x1ac612e], rcx ; 0x101df3ff8
0x10032deca: lea rcx, [rip + 0x1ac6127] ; 0x101df3ff8
0x10032ded1: mov qword ptr [rip + 0x1ac6124], 0 ; 0x101df4000
0x10032dedc: mov qword ptr [rip + 0x1ac6125], rax ; 0x101df4008
0x10032dee3: mov qword ptr [rip + 0x942076], rcx ; 0x100c6ff60
0x10032deea: lea rax, [rip - 0x5fc1] ; 0x100327f30
0x10032def1: vmovq xmm0, rax
0x10032def6: vmovdqu xmmword ptr [rip + 0x1ac6132], xmm0 ; 0x101df4030
0x10032defe: mov rax, qword ptr [rip + 0x8d8183] ; 0x100c06088 -> 0x10032c400 __Z12ApplyWrapperI4BoomMS0_KFN10Vectormath3Aos7Matrix4EvEEvM9VoidClassFvvEPv8VariablePSA_j
0x10032df05: mov qword ptr [rip + 0x1ac6134], rax ; 0x101df4040
0x10032df0c: mov rax, qword ptr [rip + 0x8dba05] ; 0x100c09918 -> 0x10032c490 __Z21InitFunctionSignatureIM4BoomKFN10Vectormath3Aos7Matrix4EvEEvP17FunctionSignature
0x10032df13: mov qword ptr [rip + 0x1ac612e], rax ; 0x101df4048
0x10032df1a: mov qword ptr [rip + 0x1ac612f], rbx ; 0x101df4050
0x10032df21: lea rax, [rip + 0x83d197] ; 0x100b6b0bf transform
0x10032df28: mov qword ptr [rip + 0x97e689], rax ; 0x100cac5b8
0x10032df2f: lea rax, [rip + 0x97e682] ; 0x100cac5b8
0x10032df36: mov qword ptr [rip + 0x97e67f], 0 ; 0x100cac5c0
0x10032df41: mov rcx, qword ptr [rip + 0x949d18] ; 0x100c77c60
0x10032df48: mov qword ptr [rip + 0x97e679], rcx ; 0x100cac5c8
0x10032df4f: mov qword ptr [rip + 0x97e67e], 0x10 ; 0x100cac5d8
0x10032df5a: mov rcx, qword ptr [rip + 0x8d8e67] ; 0x100c06dc8 -> 0x100199090 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Matrix4EERK8MetaTypev
0x10032df61: mov qword ptr [rip + 0x97e678], rcx ; 0x100cac5e0
0x10032df68: mov qword ptr [rip + 0x97e679], rbx ; 0x100cac5e8
0x10032df6f: mov qword ptr [rip + 0x97e676], 0xffffffffffffffff ; 0x100cac5f0
0x10032df7a: mov qword ptr [rip + 0x97e677], r12 ; 0x100cac5f8
0x10032df81: mov qword ptr [rip + 0x97e674], 0 ; 0x100cac600
0x10032df8c: lea rcx, [rip + 0x833dd4] ; 0x100b61d67 intensity
0x10032df93: mov qword ptr [rip + 0x97e66e], rcx ; 0x100cac608
0x10032df9a: lea rcx, [rip + 0x97e667] ; 0x100cac608
0x10032dfa1: mov qword ptr [rip + 0x97e670], rax ; 0x100cac618
0x10032dfa8: mov qword ptr [rip + 0x97e675], 0x50 ; 0x100cac628
0x10032dfb3: mov qword ptr [rip + 0x97e676], r14 ; 0x100cac630
0x10032dfba: mov qword ptr [rip + 0x97e677], rbx ; 0x100cac638
0x10032dfc1: mov qword ptr [rip + 0x97e674], 0xffffffffffffffff ; 0x100cac640
0x10032dfcc: mov qword ptr [rip + 0x97e675], r12 ; 0x100cac648
0x10032dfd3: mov qword ptr [rip + 0x97e672], 0 ; 0x100cac650
0x10032dfde: lea rax, [rip + 0x8473d2] ; 0x100b753b7 10.0
0x10032dfe5: vmovq xmm0, rax
0x10032dfea: vmovdqa xmm1, xmmword ptr [rbp - 0x80]
0x10032dfef: vpunpcklqdq xmm0, xmm1, xmm0
0x10032dff3: vmovdqa xmmword ptr [rip + 0x1ac6065], xmm0 ; 0x101df4060
0x10032dffb: lea rax, [rip + 0x1ac605e] ; 0x101df4060
0x10032e002: mov qword ptr [rip + 0x1ac6063], 0 ; 0x101df4070
0x10032e00d: mov qword ptr [rip + 0x97e5fc], rax ; 0x100cac610
0x10032e014: lea rax, [rip + 0x8316d4] ; 0x100b5f6ef duration
0x10032e01b: mov qword ptr [rip + 0x97e636], rax ; 0x100cac658
0x10032e022: lea rax, [rip + 0x97e62f] ; 0x100cac658
0x10032e029: mov qword ptr [rip + 0x97e638], rcx ; 0x100cac668
0x10032e030: mov qword ptr [rip + 0x97e63d], 0x54 ; 0x100cac678
0x10032e03b: mov qword ptr [rip + 0x97e63e], r14 ; 0x100cac680
0x10032e042: mov qword ptr [rip + 0x97e63f], rbx ; 0x100cac688
0x10032e049: mov qword ptr [rip + 0x97e63c], 0xffffffffffffffff ; 0x100cac690
0x10032e054: mov qword ptr [rip + 0x97e63d], r12 ; 0x100cac698
0x10032e05b: mov qword ptr [rip + 0x97e63a], 0 ; 0x100cac6a0
0x10032e066: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x10032e06e: vmovaps xmmword ptr [rip + 0x1ac600a], xmm0 ; 0x101df4080
0x10032e076: lea rcx, [rip + 0x1ac6003] ; 0x101df4080
0x10032e07d: mov qword ptr [rip + 0x1ac6008], 0 ; 0x101df4090
0x10032e088: mov qword ptr [rip + 0x97e5d1], rcx ; 0x100cac660
0x10032e08f: lea rcx, [rip + 0x852de4] ; 0x100b80e7a maxInheritedSpeed
0x10032e096: mov qword ptr [rip + 0x97e60b], rcx ; 0x100cac6a8
0x10032e09d: lea rcx, [rip + 0x97e604] ; 0x100cac6a8
0x10032e0a4: mov qword ptr [rip + 0x97e60d], rax ; 0x100cac6b8
0x10032e0ab: mov qword ptr [rip + 0x949bae], rcx ; 0x100c77c60
0x10032e0b2: mov qword ptr [rip + 0x97e60b], 0x58 ; 0x100cac6c8
0x10032e0bd: mov qword ptr [rip + 0x97e60c], r14 ; 0x100cac6d0
0x10032e0c4: mov qword ptr [rip + 0x97e60d], rbx ; 0x100cac6d8
0x10032e0cb: mov qword ptr [rip + 0x97e60a], 0xffffffffffffffff ; 0x100cac6e0
0x10032e0d6: mov qword ptr [rip + 0x97e60b], r12 ; 0x100cac6e8
0x10032e0dd: mov qword ptr [rip + 0x97e608], 0 ; 0x100cac6f0
0x10032e0e8: lea rax, [rip + 0x849238] ; 0x100b77327 1000.0
0x10032e0ef: vmovq xmm0, rax
0x10032e0f4: vpunpcklqdq xmm0, xmm1, xmm0
0x10032e0f8: vmovdqa xmmword ptr [rip + 0x1ac5fa0], xmm0 ; 0x101df40a0
0x10032e100: lea rax, [rip + 0x1ac5f99] ; 0x101df40a0
0x10032e107: mov qword ptr [rip + 0x1ac5f9e], 0 ; 0x101df40b0
0x10032e112: lea rcx, [rip + 0x852d73] ; 0x100b80e8c Maximum wind intensity that can be generated from the movement speed of the Boom
0x10032e119: vmovq xmm0, rcx
0x10032e11e: lea rcx, [rip + 0x84a094] ; 0x100b781b9 Tool_Description
0x10032e125: vmovq xmm1, rcx
0x10032e12a: vpunpcklqdq xmm0, xmm1, xmm0
0x10032e12e: vmovdqa xmmword ptr [rip + 0x1ac5f8a], xmm0 ; 0x101df40c0
0x10032e136: lea rcx, [rip + 0x1ac5f83] ; 0x101df40c0
0x10032e13d: mov qword ptr [rip + 0x1ac5f8c], rax ; 0x101df40d0
0x10032e144: mov qword ptr [rip + 0x97e565], rcx ; 0x100cac6b0
0x10032e14b: lea rax, [rip + 0x852d8b] ; 0x100b80edd BoomSphere
0x10032e152: mov qword ptr [rip + 0x1ac5f87], rax ; 0x101df40e0
0x10032e159: lea rax, [rip + 0x1ac5f78] ; 0x101df40d8
0x10032e160: mov qword ptr [rip + 0x1ac5f7d], 0 ; 0x101df40e8
0x10032e16b: mov rcx, qword ptr [rip + 0x941de6] ; 0x100c6ff58
0x10032e172: mov qword ptr [rip + 0x1ac5f77], rcx ; 0x101df40f0
0x10032e179: mov qword ptr [rip + 0x941dd8], rax ; 0x100c6ff58
0x10032e180: mov qword ptr [rip + 0x1ac5f79], rax ; 0x101df4100
0x10032e187: mov qword ptr [rip + 0x1ac5f7a], rbx ; 0x101df4108
0x10032e18e: mov dword ptr [rip + 0x1ac5f78], 0xffffffff ; 0x101df4110
0x10032e198: mov dword ptr [rip + 0x1ac5f72], 0xffffffff ; 0x101df4114
0x10032e1a2: mov qword ptr [rip + 0x1ac5f83], 0 ; 0x101df4130
0x10032e1ad: mov rax, qword ptr [rip + 0x8dc754] ; 0x100c0a908
0x10032e1b4: add rax, 0x10
0x10032e1b8: mov qword ptr [rip + 0x1ac5f19], rax ; 0x101df40d8
0x10032e1bf: xor eax, eax
0x10032e1c1: call 0x100011c10 ; 0x100011c10
0x10032e1c6: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10032e1cb: vmovaps xmmword ptr [rip + 0x1ac5f6d], xmm0 ; 0x101df4140
0x10032e1d3: lea rax, [rip + 0x1ac5f66] ; 0x101df4140
0x10032e1da: mov rcx, qword ptr [rip + 0x1ac5f07] ; 0x101df40e8
0x10032e1e1: mov qword ptr [rip + 0x1ac5f68], rcx ; 0x101df4150
0x10032e1e8: mov qword ptr [rip + 0x1ac5ef9], rax ; 0x101df40e8
0x10032e1ef: lea rax, [rip + 0x852cf2] ; 0x100b80ee8 BoomCone
0x10032e1f6: mov qword ptr [rip + 0x1ac5f63], rax ; 0x101df4160
0x10032e1fd: lea rax, [rip + 0x1ac5f54] ; 0x101df4158
0x10032e204: mov qword ptr [rip + 0x1ac5f59], 0 ; 0x101df4168
0x10032e20f: mov rcx, qword ptr [rip + 0x941d42] ; 0x100c6ff58
0x10032e216: mov qword ptr [rip + 0x1ac5f53], rcx ; 0x101df4170
0x10032e21d: mov qword ptr [rip + 0x941d34], rax ; 0x100c6ff58
0x10032e224: mov qword ptr [rip + 0x1ac5f55], rax ; 0x101df4180
0x10032e22b: mov qword ptr [rip + 0x1ac5f56], rbx ; 0x101df4188
0x10032e232: mov qword ptr [rip + 0x1ac5f53], 0xffffffffffffffff ; 0x101df4190
0x10032e23d: mov qword ptr [rip + 0x1ac5f68], 0 ; 0x101df41b0
0x10032e248: mov rax, qword ptr [rip + 0x8de431] ; 0x100c0c680
0x10032e24f: add rax, 0x10
0x10032e253: mov qword ptr [rip + 0x1ac5efe], rax ; 0x101df4158
0x10032e25a: xor eax, eax
0x10032e25c: call 0x100011c10 ; 0x100011c10
0x10032e261: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10032e266: vmovaps xmmword ptr [rip + 0x1ac5f52], xmm0 ; 0x101df41c0
0x10032e26e: lea rax, [rip + 0x1ac5f4b] ; 0x101df41c0
0x10032e275: mov rcx, qword ptr [rip + 0x1ac5eec] ; 0x101df4168
0x10032e27c: mov qword ptr [rip + 0x1ac5f4d], rcx ; 0x101df41d0
0x10032e283: mov qword ptr [rip + 0x1ac5ede], rax ; 0x101df4168
0x10032e28a: add rsp, 0x68
0x10032e28e: pop rbx
0x10032e28f: pop r12
0x10032e291: pop r13
0x10032e293: pop r14
0x10032e295: pop r15
0x10032e297: pop rbp
0x10032e298: ret 
0x10032e299: nop 
0x10032e29a: nop 
0x10032e29b: nop 
0x10032e29c: nop 
0x10032e29d: nop 
0x10032e29e: nop 
0x10032e29f: nop 
