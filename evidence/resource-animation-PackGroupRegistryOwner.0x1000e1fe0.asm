0x1000e1fe0: push rbp
0x1000e1fe1: mov rbp, rsp
0x1000e1fe4: push r15
0x1000e1fe6: push r14
0x1000e1fe8: push r13
0x1000e1fea: push r12
0x1000e1fec: push rbx
0x1000e1fed: push rax
0x1000e1fee: lea rdi, [rip + 0xc416db] ; 0x100d236d0
0x1000e1ff5: lea rsi, [rip + 0x1c92614] ; 0x101d74610
0x1000e1ffc: lea rdx, [rip + 0xa83ed7] ; 0x100b65eda tag_AnimList
0x1000e2003: call 0x1007951b0 ; 0x1007951b0
0x1000e2008: lea rax, [rip + 0xa83ed8] ; 0x100b65ee7 AnimationSoundEffect
0x1000e200f: mov qword ptr [rip + 0x1c9260a], rax ; 0x101d74620
0x1000e2016: lea rax, [rip + 0x1c925fb] ; 0x101d74618
0x1000e201d: mov qword ptr [rip + 0x1c92600], 0 ; 0x101d74628
0x1000e2028: mov rcx, qword ptr [rip + 0xb8df29] ; 0x100c6ff58
0x1000e202f: mov qword ptr [rip + 0x1c925fa], rcx ; 0x101d74630
0x1000e2036: mov qword ptr [rip + 0xb8df1b], rax ; 0x100c6ff58
0x1000e203d: mov qword ptr [rip + 0x1c925fc], rax ; 0x101d74640
0x1000e2044: lea rax, [rip - 0xac78b] ; 0x1000358c0
0x1000e204b: mov qword ptr [rip + 0x1c925f6], rax ; 0x101d74648
0x1000e2052: mov rbx, rax
0x1000e2055: mov qword ptr [rip + 0x1c925f0], 0xffffffffffffffff ; 0x101d74650
0x1000e2060: mov qword ptr [rip + 0x1c92605], 0 ; 0x101d74670
0x1000e206b: mov rax, qword ptr [rip + 0xb29e7e] ; 0x100c0bef0
0x1000e2072: add rax, 0x10
0x1000e2076: mov qword ptr [rip + 0x1c9259b], rax ; 0x101d74618
0x1000e207d: xor eax, eax
0x1000e207f: call 0x100011c10 ; 0x100011c10
0x1000e2084: lea rax, [rip + 0xa83e71] ; 0x100b65efc frame
0x1000e208b: mov qword ptr [rip + 0xb9c30e], rax ; 0x100c7e3a0
0x1000e2092: lea rcx, [rip + 0xb9c307] ; 0x100c7e3a0
0x1000e2099: mov qword ptr [rip + 0xb9c304], 0 ; 0x100c7e3a8
0x1000e20a4: mov rax, qword ptr [rip + 0xb95bb5] ; 0x100c77c60
0x1000e20ab: mov qword ptr [rip + 0xb9c2fe], rax ; 0x100c7e3b0
0x1000e20b2: mov qword ptr [rip + 0xb9c303], 4 ; 0x100c7e3c0
0x1000e20bd: mov r12, qword ptr [rip + 0xb254ac] ; 0x100c07570 -> 0x10003a520 __Z17GetMetaTypeByTypeIiERK8MetaTypev
0x1000e20c4: mov qword ptr [rip + 0xb9c2fd], r12 ; 0x100c7e3c8
0x1000e20cb: mov rax, qword ptr [rip + 0xb2625e] ; 0x100c08330 -> 0x1000df460 __Z18GetMetaClassByTypeIP20AnimationSoundEffectERK9MetaClassv
0x1000e20d2: mov qword ptr [rip + 0xb9c2f7], rax ; 0x100c7e3d0
0x1000e20d9: mov qword ptr [rip + 0xb9c2f4], 0xffffffffffffffff ; 0x100c7e3d8
0x1000e20e4: lea rdx, [rip + 0xa83e17] ; 0x100b65f02 effect
0x1000e20eb: mov qword ptr [rip + 0xb9c2fe], rdx ; 0x100c7e3f0
0x1000e20f2: lea rdx, [rip + 0xb9c2f7] ; 0x100c7e3f0
0x1000e20f9: mov qword ptr [rip + 0xb9c2f4], 0 ; 0x100c7e3f8
0x1000e2104: mov qword ptr [rip + 0xb9c2f5], rcx ; 0x100c7e400
0x1000e210b: mov qword ptr [rip + 0xb9c2fa], 8 ; 0x100c7e410
0x1000e2116: mov rcx, qword ptr [rip + 0xb24ccb] ; 0x100c06de8 -> 0x1000209f0 __Z17GetMetaTypeByTypeINSt3__112basic_stringIcNS0_11char_traitsIcEE16StlPoolAllocatorIcEEEERK8MetaTypev
0x1000e211d: mov qword ptr [rip + 0xb9c2f4], rcx ; 0x100c7e418
0x1000e2124: mov rsi, rcx
0x1000e2127: mov qword ptr [rip + 0xb9c2f2], rax ; 0x100c7e420
0x1000e212e: lea rcx, [rip + 0xa83dd4] ; 0x100b65f09 boneName
0x1000e2135: mov qword ptr [rip + 0xb9c304], rcx ; 0x100c7e440
0x1000e213c: lea rcx, [rip + 0xb9c2fd] ; 0x100c7e440
0x1000e2143: mov qword ptr [rip + 0xb9c2fa], 0 ; 0x100c7e448
0x1000e214e: mov qword ptr [rip + 0xb9c2fb], rdx ; 0x100c7e450
0x1000e2155: mov qword ptr [rip + 0xb9c300], 0x20 ; 0x100c7e460
0x1000e2160: mov qword ptr [rip + 0xb9c301], rsi ; 0x100c7e468
0x1000e2167: mov qword ptr [rip + 0xb9c302], rax ; 0x100c7e470
0x1000e216e: lea rdx, [rip + 0xa83d9d] ; 0x100b65f12 minDist
0x1000e2175: mov qword ptr [rip + 0xb9c314], rdx ; 0x100c7e490
0x1000e217c: lea rdx, [rip + 0xb9c30d] ; 0x100c7e490
0x1000e2183: mov qword ptr [rip + 0xb9c30a], 0 ; 0x100c7e498
0x1000e218e: mov qword ptr [rip + 0xb9c30b], rcx ; 0x100c7e4a0
0x1000e2195: mov qword ptr [rip + 0xb9c310], 0x38 ; 0x100c7e4b0
0x1000e21a0: mov r13, qword ptr [rip + 0xb253b9] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1000e21a7: mov qword ptr [rip + 0xb9c30a], r13 ; 0x100c7e4b8
0x1000e21ae: mov qword ptr [rip + 0xb9c30b], rax ; 0x100c7e4c0
0x1000e21b5: lea rcx, [rip + 0xa83d5e] ; 0x100b65f1a maxDist
0x1000e21bc: mov qword ptr [rip + 0xb9c31d], rcx ; 0x100c7e4e0
0x1000e21c3: lea rcx, [rip + 0xb9c316] ; 0x100c7e4e0
0x1000e21ca: mov qword ptr [rip + 0xb9c313], 0 ; 0x100c7e4e8
0x1000e21d5: mov qword ptr [rip + 0xb9c314], rdx ; 0x100c7e4f0
0x1000e21dc: mov qword ptr [rip + 0xb9c319], 0x3c ; 0x100c7e500
0x1000e21e7: mov qword ptr [rip + 0xb9c31a], r13 ; 0x100c7e508
0x1000e21ee: mov qword ptr [rip + 0xb9c31b], rax ; 0x100c7e510
0x1000e21f5: lea rdx, [rip + 0xa7e822] ; 0x100b60a1e player
0x1000e21fc: mov qword ptr [rip + 0xb9c32d], rdx ; 0x100c7e530
0x1000e2203: lea rdx, [rip + 0xb9c326] ; 0x100c7e530
0x1000e220a: mov qword ptr [rip + 0xb9c323], 0 ; 0x100c7e538
0x1000e2215: mov qword ptr [rip + 0xb9c324], rcx ; 0x100c7e540
0x1000e221c: mov qword ptr [rip + 0xb9c329], 0x40 ; 0x100c7e550
0x1000e2227: mov rcx, qword ptr [rip + 0xb24bb2] ; 0x100c06de0 -> 0x1000df470 __Z17GetMetaTypeByTypeIN20AnimationSoundEffect6PlayerEERK8MetaTypev
0x1000e222e: mov qword ptr [rip + 0xb9c323], rcx ; 0x100c7e558
0x1000e2235: mov qword ptr [rip + 0xb9c324], rax ; 0x100c7e560
0x1000e223c: lea rcx, [rip + 0xa83cdf] ; 0x100b65f22 volume
0x1000e2243: mov qword ptr [rip + 0xb9c336], rcx ; 0x100c7e580
0x1000e224a: lea rcx, [rip + 0xb9c32f] ; 0x100c7e580
0x1000e2251: mov qword ptr [rip + 0xb9c32c], 0 ; 0x100c7e588
0x1000e225c: mov qword ptr [rip + 0xb9c32d], rdx ; 0x100c7e590
0x1000e2263: mov qword ptr [rip + 0xb9c332], 0x44 ; 0x100c7e5a0
0x1000e226e: mov qword ptr [rip + 0xb9c333], r13 ; 0x100c7e5a8
0x1000e2275: mov qword ptr [rip + 0xb9c334], rax ; 0x100c7e5b0
0x1000e227c: lea rdx, [rip + 0xa83ca6] ; 0x100b65f29 is3D
0x1000e2283: mov qword ptr [rip + 0xb9c346], rdx ; 0x100c7e5d0
0x1000e228a: lea rdx, [rip + 0xb9c33f] ; 0x100c7e5d0
0x1000e2291: mov qword ptr [rip + 0xb9c33c], 0 ; 0x100c7e5d8
0x1000e229c: mov qword ptr [rip + 0xb9c33d], rcx ; 0x100c7e5e0
0x1000e22a3: mov qword ptr [rip + 0xb9c342], 0x48 ; 0x100c7e5f0
0x1000e22ae: lea rcx, [rip + 0xa83c79] ; 0x100b65f2e isEmote
0x1000e22b5: mov qword ptr [rip + 0xb9c364], rcx ; 0x100c7e620
0x1000e22bc: lea rcx, [rip + 0xb9c35d] ; 0x100c7e620
0x1000e22c3: mov qword ptr [rip + 0xb9c35a], 0 ; 0x100c7e628
0x1000e22ce: mov qword ptr [rip + 0xb9c35b], rdx ; 0x100c7e630
0x1000e22d5: lea rdx, [rip + 0xa83c5a] ; 0x100b65f36 isLowerBody
0x1000e22dc: mov qword ptr [rip + 0xb9c38d], rdx ; 0x100c7e670
0x1000e22e3: lea rdx, [rip + 0xb9c386] ; 0x100c7e670
0x1000e22ea: mov qword ptr [rip + 0xb9c383], 0 ; 0x100c7e678
0x1000e22f5: mov qword ptr [rip + 0xb9c384], rcx ; 0x100c7e680
0x1000e22fc: lea rcx, [rip + 0xa83c3f] ; 0x100b65f42 attached
0x1000e2303: mov qword ptr [rip + 0xb9c3b6], rcx ; 0x100c7e6c0
0x1000e230a: lea rcx, [rip + 0xb9c3af] ; 0x100c7e6c0
0x1000e2311: mov qword ptr [rip + 0xb9c3ac], 0 ; 0x100c7e6c8
0x1000e231c: mov qword ptr [rip + 0xb9c3ad], rdx ; 0x100c7e6d0
0x1000e2323: lea r15, [rip + 0xa83c21] ; 0x100b65f4b conditionalFlags
0x1000e232a: mov qword ptr [rip + 0xb9c3df], r15 ; 0x100c7e710
0x1000e2331: mov qword ptr [rip + 0xb9c3dc], 0 ; 0x100c7e718
0x1000e233c: mov qword ptr [rip + 0xb9c3dd], rcx ; 0x100c7e720
0x1000e2343: lea rcx, [rip + 0xb9c3c6] ; 0x100c7e710
0x1000e234a: mov qword ptr [rip + 0xb9590f], rcx ; 0x100c77c60
0x1000e2351: mov r14, qword ptr [rip + 0xb25200] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x1000e2358: mov qword ptr [rip + 0xb9c299], r14 ; 0x100c7e5f8
0x1000e235f: mov qword ptr [rip + 0xb9c29a], rax ; 0x100c7e600
0x1000e2366: mov qword ptr [rip + 0xb9c2cf], 0x49 ; 0x100c7e640
0x1000e2371: mov qword ptr [rip + 0xb9c2d0], r14 ; 0x100c7e648
0x1000e2378: mov qword ptr [rip + 0xb9c2d1], rax ; 0x100c7e650
0x1000e237f: mov qword ptr [rip + 0xb9c306], 0x4a ; 0x100c7e690
0x1000e238a: mov qword ptr [rip + 0xb9c307], r14 ; 0x100c7e698
0x1000e2391: mov qword ptr [rip + 0xb9c308], rax ; 0x100c7e6a0
0x1000e2398: mov qword ptr [rip + 0xb9c33d], 0x4b ; 0x100c7e6e0
0x1000e23a3: mov qword ptr [rip + 0xb9c33e], r14 ; 0x100c7e6e8
0x1000e23aa: mov qword ptr [rip + 0xb9c33f], rax ; 0x100c7e6f0
0x1000e23b1: mov qword ptr [rip + 0xb9c374], 0x4c ; 0x100c7e730
0x1000e23bc: mov qword ptr [rip + 0xb9c375], r12 ; 0x100c7e738
0x1000e23c3: mov qword ptr [rip + 0xb9c376], rax ; 0x100c7e740
0x1000e23ca: lea rax, [rip + 0xa83b8b] ; 0x100b65f5c AnimationEmitterEffect
0x1000e23d1: mov qword ptr [rip + 0x1c922a8], rax ; 0x101d74680
0x1000e23d8: mov qword ptr [rip + 0x1c922a5], 0 ; 0x101d74688
0x1000e23e3: mov rax, qword ptr [rip + 0xb8db6e] ; 0x100c6ff58
0x1000e23ea: mov qword ptr [rip + 0x1c9229f], rax ; 0x101d74690
0x1000e23f1: lea rax, [rip + 0x1c92280] ; 0x101d74678
0x1000e23f8: mov qword ptr [rip + 0xb8db59], rax ; 0x100c6ff58
0x1000e23ff: mov qword ptr [rip + 0x1c9229a], rax ; 0x101d746a0
0x1000e2406: mov qword ptr [rip + 0x1c9229b], rbx ; 0x101d746a8
0x1000e240d: mov dword ptr [rip + 0x1c92299], 0xffffffff ; 0x101d746b0
0x1000e2417: mov dword ptr [rip + 0x1c92293], 0xffffffff ; 0x101d746b4
0x1000e2421: mov qword ptr [rip + 0x1c922a4], 0 ; 0x101d746d0
0x1000e242c: mov rax, qword ptr [rip + 0xb29c55] ; 0x100c0c088
0x1000e2433: add rax, 0x10
0x1000e2437: mov qword ptr [rip + 0x1c9223a], rax ; 0x101d74678
0x1000e243e: lea rbx, [rip - 0xc8a25] ; 0x100019a20
0x1000e2445: mov qword ptr [rip + 0xb9bf94], rbx ; 0x100c7e3e0
0x1000e244c: mov qword ptr [rip + 0xb9bf91], 0 ; 0x100c7e3e8
0x1000e2457: mov qword ptr [rip + 0xb9bfc6], 0xffffffffffffffff ; 0x100c7e428
0x1000e2462: mov qword ptr [rip + 0xb9bfc7], rbx ; 0x100c7e430
0x1000e2469: mov qword ptr [rip + 0xb9bfc4], 0 ; 0x100c7e438
0x1000e2474: mov qword ptr [rip + 0xb9bff9], 0xffffffffffffffff ; 0x100c7e478
0x1000e247f: mov qword ptr [rip + 0xb9bffa], rbx ; 0x100c7e480
0x1000e2486: mov qword ptr [rip + 0xb9bff7], 0 ; 0x100c7e488
0x1000e2491: mov qword ptr [rip + 0xb9c02c], 0xffffffffffffffff ; 0x100c7e4c8
0x1000e249c: mov qword ptr [rip + 0xb9c02d], rbx ; 0x100c7e4d0
0x1000e24a3: mov qword ptr [rip + 0xb9c02a], 0 ; 0x100c7e4d8
0x1000e24ae: mov qword ptr [rip + 0xb9c05f], 0xffffffffffffffff ; 0x100c7e518
0x1000e24b9: mov qword ptr [rip + 0xb9c060], rbx ; 0x100c7e520
0x1000e24c0: mov qword ptr [rip + 0xb9c05d], 0 ; 0x100c7e528
0x1000e24cb: mov qword ptr [rip + 0xb9c092], 0xffffffffffffffff ; 0x100c7e568
0x1000e24d6: mov qword ptr [rip + 0xb9c093], rbx ; 0x100c7e570
0x1000e24dd: mov qword ptr [rip + 0xb9c090], 0 ; 0x100c7e578
0x1000e24e8: mov qword ptr [rip + 0xb9c0c5], 0xffffffffffffffff ; 0x100c7e5b8
0x1000e24f3: mov qword ptr [rip + 0xb9c0c6], rbx ; 0x100c7e5c0
0x1000e24fa: mov qword ptr [rip + 0xb9c0c3], 0 ; 0x100c7e5c8
0x1000e2505: mov qword ptr [rip + 0xb9c0f8], 0xffffffffffffffff ; 0x100c7e608
0x1000e2510: mov qword ptr [rip + 0xb9c0f9], rbx ; 0x100c7e610
0x1000e2517: mov qword ptr [rip + 0xb9c0f6], 0 ; 0x100c7e618
0x1000e2522: mov qword ptr [rip + 0xb9c12b], 0xffffffffffffffff ; 0x100c7e658
0x1000e252d: mov qword ptr [rip + 0xb9c12c], rbx ; 0x100c7e660
0x1000e2534: mov qword ptr [rip + 0xb9c129], 0 ; 0x100c7e668
0x1000e253f: mov qword ptr [rip + 0xb9c15e], 0xffffffffffffffff ; 0x100c7e6a8
0x1000e254a: mov qword ptr [rip + 0xb9c15f], rbx ; 0x100c7e6b0
0x1000e2551: mov qword ptr [rip + 0xb9c15c], 0 ; 0x100c7e6b8
0x1000e255c: mov qword ptr [rip + 0xb9c191], 0xffffffffffffffff ; 0x100c7e6f8
0x1000e2567: mov qword ptr [rip + 0xb9c192], rbx ; 0x100c7e700
0x1000e256e: mov qword ptr [rip + 0xb9c18f], 0 ; 0x100c7e708
0x1000e2579: mov qword ptr [rip + 0xb9c1c4], 0xffffffffffffffff ; 0x100c7e748
0x1000e2584: mov qword ptr [rip + 0xb9c1c5], rbx ; 0x100c7e750
0x1000e258b: mov qword ptr [rip + 0xb9c1c2], 0 ; 0x100c7e758
0x1000e2596: xor eax, eax
0x1000e2598: call 0x100011c10 ; 0x100011c10
0x1000e259d: lea rax, [rip + 0xa83958] ; 0x100b65efc frame
0x1000e25a4: mov qword ptr [rip + 0xb9c1b5], rax ; 0x100c7e760
0x1000e25ab: lea rcx, [rip + 0xb9c1ae] ; 0x100c7e760
0x1000e25b2: mov qword ptr [rip + 0xb9c1ab], 0 ; 0x100c7e768
0x1000e25bd: mov rax, qword ptr [rip + 0xb9569c] ; 0x100c77c60
0x1000e25c4: mov qword ptr [rip + 0xb9c1a5], rax ; 0x100c7e770
0x1000e25cb: mov qword ptr [rip + 0xb9c1aa], 4 ; 0x100c7e780
0x1000e25d6: mov qword ptr [rip + 0xb9c1ab], r12 ; 0x100c7e788
0x1000e25dd: mov rax, qword ptr [rip + 0xb25dfc] ; 0x100c083e0 -> 0x1000df7d0 __Z18GetMetaClassByTypeIP22AnimationEmitterEffectERK9MetaClassv
0x1000e25e4: mov qword ptr [rip + 0xb9c1a5], rax ; 0x100c7e790
0x1000e25eb: mov qword ptr [rip + 0xb9c1a2], 0xffffffffffffffff ; 0x100c7e798
0x1000e25f6: mov qword ptr [rip + 0xb9c1a3], rbx ; 0x100c7e7a0
0x1000e25fd: mov qword ptr [rip + 0xb9c1a0], 0 ; 0x100c7e7a8
0x1000e2608: lea rdx, [rip + 0xa83964] ; 0x100b65f73 endFrame
0x1000e260f: mov qword ptr [rip + 0xb9c19a], rdx ; 0x100c7e7b0
0x1000e2616: lea rdx, [rip + 0xb9c193] ; 0x100c7e7b0
0x1000e261d: mov qword ptr [rip + 0xb9c190], 0 ; 0x100c7e7b8
0x1000e2628: mov qword ptr [rip + 0xb9c191], rcx ; 0x100c7e7c0
0x1000e262f: mov qword ptr [rip + 0xb9c196], 8 ; 0x100c7e7d0
0x1000e263a: mov qword ptr [rip + 0xb9c197], r12 ; 0x100c7e7d8
0x1000e2641: mov qword ptr [rip + 0xb9c198], rax ; 0x100c7e7e0
0x1000e2648: mov qword ptr [rip + 0xb9c195], 0xffffffffffffffff ; 0x100c7e7e8
0x1000e2653: mov qword ptr [rip + 0xb9c196], rbx ; 0x100c7e7f0
0x1000e265a: mov qword ptr [rip + 0xb9c193], 0 ; 0x100c7e7f8
0x1000e2665: lea rcx, [rip + 0xa83910] ; 0x100b65f7c emitterDef
0x1000e266c: mov qword ptr [rip + 0xb9c18d], rcx ; 0x100c7e800
0x1000e2673: lea rcx, [rip + 0xb9c186] ; 0x100c7e800
0x1000e267a: mov qword ptr [rip + 0xb9c183], 0 ; 0x100c7e808
0x1000e2685: mov qword ptr [rip + 0xb9c184], rdx ; 0x100c7e810
0x1000e268c: mov qword ptr [rip + 0xb9c189], 0x10 ; 0x100c7e820
0x1000e2697: mov rsi, qword ptr [rip + 0xb2474a] ; 0x100c06de8 -> 0x1000209f0 __Z17GetMetaTypeByTypeINSt3__112basic_stringIcNS0_11char_traitsIcEE16StlPoolAllocatorIcEEEERK8MetaTypev
0x1000e269e: mov qword ptr [rip + 0xb9c183], rsi ; 0x100c7e828
0x1000e26a5: mov qword ptr [rip + 0xb9c184], rax ; 0x100c7e830
0x1000e26ac: mov qword ptr [rip + 0xb9c181], 0xffffffffffffffff ; 0x100c7e838
0x1000e26b7: mov qword ptr [rip + 0xb9c182], rbx ; 0x100c7e840
0x1000e26be: mov qword ptr [rip + 0xb9c17f], 0 ; 0x100c7e848
0x1000e26c9: lea rdx, [rip + 0xa83839] ; 0x100b65f09 boneName
0x1000e26d0: mov qword ptr [rip + 0xb9c179], rdx ; 0x100c7e850
0x1000e26d7: lea rdx, [rip + 0xb9c172] ; 0x100c7e850
0x1000e26de: mov qword ptr [rip + 0xb9c16f], 0 ; 0x100c7e858
0x1000e26e9: mov qword ptr [rip + 0xb9c170], rcx ; 0x100c7e860
0x1000e26f0: mov qword ptr [rip + 0xb9c175], 0x28 ; 0x100c7e870
0x1000e26fb: mov qword ptr [rip + 0xb9c176], rsi ; 0x100c7e878
0x1000e2702: mov qword ptr [rip + 0xb9c177], rax ; 0x100c7e880
0x1000e2709: mov qword ptr [rip + 0xb9c174], 0xffffffffffffffff ; 0x100c7e888
0x1000e2714: mov qword ptr [rip + 0xb9c175], rbx ; 0x100c7e890
0x1000e271b: mov qword ptr [rip + 0xb9c172], 0 ; 0x100c7e898
0x1000e2726: mov qword ptr [rip + 0xb9c173], r15 ; 0x100c7e8a0
0x1000e272d: lea rcx, [rip + 0xb9c16c] ; 0x100c7e8a0
0x1000e2734: mov qword ptr [rip + 0xb9c169], 0 ; 0x100c7e8a8
0x1000e273f: mov qword ptr [rip + 0xb9c16a], rdx ; 0x100c7e8b0
0x1000e2746: mov qword ptr [rip + 0xb9c16f], 0x50 ; 0x100c7e8c0
0x1000e2751: mov qword ptr [rip + 0xb9c170], r12 ; 0x100c7e8c8
0x1000e2758: mov qword ptr [rip + 0xb9c171], rax ; 0x100c7e8d0
0x1000e275f: mov qword ptr [rip + 0xb9c16e], 0xffffffffffffffff ; 0x100c7e8d8
0x1000e276a: mov qword ptr [rip + 0xb9c16f], rbx ; 0x100c7e8e0
0x1000e2771: mov qword ptr [rip + 0xb9c16c], 0 ; 0x100c7e8e8
0x1000e277c: lea rdx, [rip + 0xa837bf] ; 0x100b65f42 attached
0x1000e2783: mov qword ptr [rip + 0xb9c166], rdx ; 0x100c7e8f0
0x1000e278a: lea rdx, [rip + 0xb9c15f] ; 0x100c7e8f0
0x1000e2791: mov qword ptr [rip + 0xb9c15c], 0 ; 0x100c7e8f8
0x1000e279c: mov qword ptr [rip + 0xb9c15d], rcx ; 0x100c7e900
0x1000e27a3: mov qword ptr [rip + 0xb9c162], 0x4c ; 0x100c7e910
0x1000e27ae: mov qword ptr [rip + 0xb9c163], r14 ; 0x100c7e918
0x1000e27b5: mov qword ptr [rip + 0xb9c164], rax ; 0x100c7e920
0x1000e27bc: mov qword ptr [rip + 0xb9c161], 0xffffffffffffffff ; 0x100c7e928
0x1000e27c7: mov qword ptr [rip + 0xb9c162], rbx ; 0x100c7e930
0x1000e27ce: mov qword ptr [rip + 0xb9c15f], 0 ; 0x100c7e938
0x1000e27d9: lea rcx, [rip + 0xa8373a] ; 0x100b65f1a maxDist
0x1000e27e0: mov qword ptr [rip + 0xb9c159], rcx ; 0x100c7e940
0x1000e27e7: lea rcx, [rip + 0xb9c152] ; 0x100c7e940
0x1000e27ee: mov qword ptr [rip + 0xb9c14f], 0 ; 0x100c7e948
0x1000e27f9: mov qword ptr [rip + 0xb9c150], rdx ; 0x100c7e950
0x1000e2800: mov qword ptr [rip + 0xb9c155], 0x54 ; 0x100c7e960
0x1000e280b: mov qword ptr [rip + 0xb9c156], r13 ; 0x100c7e968
0x1000e2812: mov qword ptr [rip + 0xb9c157], rax ; 0x100c7e970
0x1000e2819: mov qword ptr [rip + 0xb9c154], 0xffffffffffffffff ; 0x100c7e978
0x1000e2824: mov qword ptr [rip + 0xb9c155], rbx ; 0x100c7e980
0x1000e282b: mov qword ptr [rip + 0xb9c152], 0 ; 0x100c7e988
0x1000e2836: lea rdx, [rip + 0xa8374a] ; 0x100b65f87 offsetX
0x1000e283d: mov qword ptr [rip + 0xb9c14c], rdx ; 0x100c7e990
0x1000e2844: lea rdx, [rip + 0xb9c145] ; 0x100c7e990
0x1000e284b: mov qword ptr [rip + 0xb9c142], 0 ; 0x100c7e998
0x1000e2856: mov qword ptr [rip + 0xb9c143], rcx ; 0x100c7e9a0
0x1000e285d: mov qword ptr [rip + 0xb9c148], 0x40 ; 0x100c7e9b0
0x1000e2868: mov qword ptr [rip + 0xb9c149], r13 ; 0x100c7e9b8
0x1000e286f: mov qword ptr [rip + 0xb9c14a], rax ; 0x100c7e9c0
0x1000e2876: mov qword ptr [rip + 0xb9c147], 0xffffffffffffffff ; 0x100c7e9c8
0x1000e2881: mov qword ptr [rip + 0xb9c148], rbx ; 0x100c7e9d0
0x1000e2888: mov qword ptr [rip + 0xb9c145], 0 ; 0x100c7e9d8
0x1000e2893: lea rcx, [rip + 0xa836f5] ; 0x100b65f8f offsetY
0x1000e289a: mov qword ptr [rip + 0xb9c13f], rcx ; 0x100c7e9e0
0x1000e28a1: lea rcx, [rip + 0xb9c138] ; 0x100c7e9e0
0x1000e28a8: mov qword ptr [rip + 0xb9c135], 0 ; 0x100c7e9e8
0x1000e28b3: mov qword ptr [rip + 0xb9c136], rdx ; 0x100c7e9f0
0x1000e28ba: mov qword ptr [rip + 0xb9c13b], 0x44 ; 0x100c7ea00
0x1000e28c5: mov qword ptr [rip + 0xb9c13c], r13 ; 0x100c7ea08
0x1000e28cc: mov qword ptr [rip + 0xb9c13d], rax ; 0x100c7ea10
0x1000e28d3: mov qword ptr [rip + 0xb9c13a], 0xffffffffffffffff ; 0x100c7ea18
0x1000e28de: mov qword ptr [rip + 0xb9c13b], rbx ; 0x100c7ea20
0x1000e28e5: mov qword ptr [rip + 0xb9c138], 0 ; 0x100c7ea28
0x1000e28f0: lea rdx, [rip + 0xa836a0] ; 0x100b65f97 offsetZ
0x1000e28f7: mov qword ptr [rip + 0xb9c132], rdx ; 0x100c7ea30
0x1000e28fe: lea rdx, [rip + 0xb9c12b] ; 0x100c7ea30
0x1000e2905: mov qword ptr [rip + 0xb9c128], 0 ; 0x100c7ea38
0x1000e2910: mov qword ptr [rip + 0xb9c129], rcx ; 0x100c7ea40
0x1000e2917: mov qword ptr [rip + 0xb95342], rdx ; 0x100c77c60
0x1000e291e: mov qword ptr [rip + 0xb9c127], 0x48 ; 0x100c7ea50
0x1000e2929: mov qword ptr [rip + 0xb9c128], r13 ; 0x100c7ea58
0x1000e2930: mov qword ptr [rip + 0xb9c129], rax ; 0x100c7ea60
0x1000e2937: mov qword ptr [rip + 0xb9c126], 0xffffffffffffffff ; 0x100c7ea68
0x1000e2942: mov qword ptr [rip + 0xb9c127], rbx ; 0x100c7ea70
0x1000e2949: mov qword ptr [rip + 0xb9c124], 0 ; 0x100c7ea78
0x1000e2954: lea rax, [rip + 0xa83644] ; 0x100b65f9f AnimationMetaData
0x1000e295b: mov qword ptr [rip + 0x1c91d7e], rax ; 0x101d746e0
0x1000e2962: lea rax, [rip + 0x1c91d6f] ; 0x101d746d8
0x1000e2969: mov qword ptr [rip + 0x1c91d74], 0 ; 0x101d746e8
0x1000e2974: mov rcx, qword ptr [rip + 0xb8d5dd] ; 0x100c6ff58
0x1000e297b: mov qword ptr [rip + 0x1c91d6e], rcx ; 0x101d746f0
0x1000e2982: mov qword ptr [rip + 0xb8d5cf], rax ; 0x100c6ff58
0x1000e2989: mov qword ptr [rip + 0x1c91d70], rax ; 0x101d74700
0x1000e2990: lea rax, [rip - 0xad0d7] ; 0x1000358c0
0x1000e2997: mov qword ptr [rip + 0x1c91d6a], rax ; 0x101d74708
0x1000e299e: mov dword ptr [rip + 0x1c91d68], 0xffffffff ; 0x101d74710
0x1000e29a8: mov dword ptr [rip + 0x1c91d62], 0xffffffff ; 0x101d74714
0x1000e29b2: mov qword ptr [rip + 0x1c91d73], 0 ; 0x101d74730
0x1000e29bd: mov rax, qword ptr [rip + 0xb290c4] ; 0x100c0ba88
0x1000e29c4: add rax, 0x10
0x1000e29c8: mov qword ptr [rip + 0x1c91d09], rax ; 0x101d746d8
0x1000e29cf: xor eax, eax
0x1000e29d1: call 0x100011c10 ; 0x100011c10
0x1000e29d6: lea rax, [rip + 0xa835d4] ; 0x100b65fb1 start
0x1000e29dd: mov qword ptr [rip + 0xb9c09c], rax ; 0x100c7ea80
0x1000e29e4: lea rcx, [rip + 0xb9c095] ; 0x100c7ea80
0x1000e29eb: mov qword ptr [rip + 0xb9c092], 0 ; 0x100c7ea88
0x1000e29f6: mov rax, qword ptr [rip + 0xb95263] ; 0x100c77c60
0x1000e29fd: mov qword ptr [rip + 0xb9c08c], rax ; 0x100c7ea90
0x1000e2a04: mov qword ptr [rip + 0xb9c091], 4 ; 0x100c7eaa0
0x1000e2a0f: mov qword ptr [rip + 0xb9c092], r12 ; 0x100c7eaa8
0x1000e2a16: mov rax, qword ptr [rip + 0xb25683] ; 0x100c080a0 -> 0x1000dfb10 __Z18GetMetaClassByTypeIP17AnimationMetaDataERK9MetaClassv
0x1000e2a1d: mov qword ptr [rip + 0xb9c08c], rax ; 0x100c7eab0
0x1000e2a24: mov qword ptr [rip + 0xb9c089], 0xffffffffffffffff ; 0x100c7eab8
0x1000e2a2f: mov qword ptr [rip + 0xb9c08a], rbx ; 0x100c7eac0
0x1000e2a36: mov qword ptr [rip + 0xb9c087], 0 ; 0x100c7eac8
0x1000e2a41: lea rdx, [rip + 0xa8356f] ; 0x100b65fb7 stop
0x1000e2a48: mov qword ptr [rip + 0xb9c081], rdx ; 0x100c7ead0
0x1000e2a4f: lea rdx, [rip + 0xb9c07a] ; 0x100c7ead0
0x1000e2a56: mov qword ptr [rip + 0xb9c077], 0 ; 0x100c7ead8
0x1000e2a61: mov qword ptr [rip + 0xb9c078], rcx ; 0x100c7eae0
0x1000e2a68: mov qword ptr [rip + 0xb9c07d], 8 ; 0x100c7eaf0
0x1000e2a73: mov qword ptr [rip + 0xb9c07e], r12 ; 0x100c7eaf8
0x1000e2a7a: mov qword ptr [rip + 0xb9c07f], rax ; 0x100c7eb00
0x1000e2a81: mov qword ptr [rip + 0xb9c07c], 0xffffffffffffffff ; 0x100c7eb08
0x1000e2a8c: mov qword ptr [rip + 0xb9c07d], rbx ; 0x100c7eb10
0x1000e2a93: mov qword ptr [rip + 0xb9c07a], 0 ; 0x100c7eb18
0x1000e2a9e: lea r15, [rip + 0xa7bfe3] ; 0x100b5ea88 name
0x1000e2aa5: mov qword ptr [rip + 0xb9c074], r15 ; 0x100c7eb20
0x1000e2aac: lea rcx, [rip + 0xb9c06d] ; 0x100c7eb20
0x1000e2ab3: mov qword ptr [rip + 0xb9c06a], 0 ; 0x100c7eb28
0x1000e2abe: mov qword ptr [rip + 0xb9c06b], rdx ; 0x100c7eb30
0x1000e2ac5: mov qword ptr [rip + 0xb9c070], 0x10 ; 0x100c7eb40
0x1000e2ad0: mov rdx, qword ptr [rip + 0xb24311] ; 0x100c06de8 -> 0x1000209f0 __Z17GetMetaTypeByTypeINSt3__112basic_stringIcNS0_11char_traitsIcEE16StlPoolAllocatorIcEEEERK8MetaTypev
0x1000e2ad7: mov qword ptr [rip + 0xb9c06a], rdx ; 0x100c7eb48
0x1000e2ade: mov qword ptr [rip + 0xb9c06b], rax ; 0x100c7eb50
0x1000e2ae5: mov qword ptr [rip + 0xb9c068], 0xffffffffffffffff ; 0x100c7eb58
0x1000e2af0: mov qword ptr [rip + 0xb9c069], rbx ; 0x100c7eb60
0x1000e2af7: mov qword ptr [rip + 0xb9c066], 0 ; 0x100c7eb68
0x1000e2b02: lea rdx, [rip + 0xa834b3] ; 0x100b65fbc hashedName
0x1000e2b09: mov qword ptr [rip + 0xb9c060], rdx ; 0x100c7eb70
0x1000e2b10: lea rdx, [rip + 0xb9c059] ; 0x100c7eb70
0x1000e2b17: mov qword ptr [rip + 0xb9c056], 0 ; 0x100c7eb78
0x1000e2b22: mov qword ptr [rip + 0xb9c057], rcx ; 0x100c7eb80
0x1000e2b29: mov qword ptr [rip + 0xb9c05c], 0x28 ; 0x100c7eb90
0x1000e2b34: mov rcx, qword ptr [rip + 0xb24a45] ; 0x100c07580 -> 0x1000dfb20 __Z17GetMetaTypeByTypeIyERK8MetaTypev
0x1000e2b3b: mov qword ptr [rip + 0xb9c056], rcx ; 0x100c7eb98
0x1000e2b42: mov qword ptr [rip + 0xb9c057], rax ; 0x100c7eba0
0x1000e2b49: mov qword ptr [rip + 0xb9c054], 0xffffffffffffffff ; 0x100c7eba8
0x1000e2b54: mov qword ptr [rip + 0xb9c055], rbx ; 0x100c7ebb0
0x1000e2b5b: mov qword ptr [rip + 0xb9c052], 0 ; 0x100c7ebb8
0x1000e2b66: lea rcx, [rip + 0xa8345a] ; 0x100b65fc7 animType
0x1000e2b6d: mov qword ptr [rip + 0xb9c04c], rcx ; 0x100c7ebc0
0x1000e2b74: lea rcx, [rip + 0xb9c045] ; 0x100c7ebc0
0x1000e2b7b: mov qword ptr [rip + 0xb9c042], 0 ; 0x100c7ebc8
0x1000e2b86: mov qword ptr [rip + 0xb9c043], rdx ; 0x100c7ebd0
0x1000e2b8d: mov qword ptr [rip + 0xb9c048], 0x30 ; 0x100c7ebe0
0x1000e2b98: mov qword ptr [rip + 0xb9c049], r12 ; 0x100c7ebe8
0x1000e2b9f: mov qword ptr [rip + 0xb9c04a], rax ; 0x100c7ebf0
0x1000e2ba6: mov qword ptr [rip + 0xb9c047], 0xffffffffffffffff ; 0x100c7ebf8
0x1000e2bb1: mov qword ptr [rip + 0xb9c048], rbx ; 0x100c7ec00
0x1000e2bb8: mov qword ptr [rip + 0xb9c045], 0 ; 0x100c7ec08
0x1000e2bc3: lea rdx, [rip + 0xa83406] ; 0x100b65fd0 speedMult
0x1000e2bca: mov qword ptr [rip + 0xb9c03f], rdx ; 0x100c7ec10
0x1000e2bd1: lea rdx, [rip + 0xb9c038] ; 0x100c7ec10
0x1000e2bd8: mov qword ptr [rip + 0xb9c035], 0 ; 0x100c7ec18
0x1000e2be3: mov qword ptr [rip + 0xb9c036], rcx ; 0x100c7ec20
0x1000e2bea: mov qword ptr [rip + 0xb9c03b], 0x34 ; 0x100c7ec30
0x1000e2bf5: mov qword ptr [rip + 0xb9c03c], r13 ; 0x100c7ec38
0x1000e2bfc: mov qword ptr [rip + 0xb9c03d], rax ; 0x100c7ec40
0x1000e2c03: mov qword ptr [rip + 0xb9c03a], 0xffffffffffffffff ; 0x100c7ec48
0x1000e2c0e: mov qword ptr [rip + 0xb9c03b], rbx ; 0x100c7ec50
0x1000e2c15: mov qword ptr [rip + 0xb9c038], 0 ; 0x100c7ec58
0x1000e2c20: lea rcx, [rip + 0xa833b3] ; 0x100b65fda mirrored
0x1000e2c27: mov qword ptr [rip + 0xb9c032], rcx ; 0x100c7ec60
0x1000e2c2e: lea rcx, [rip + 0xb9c02b] ; 0x100c7ec60
0x1000e2c35: mov qword ptr [rip + 0xb9c028], 0 ; 0x100c7ec68
0x1000e2c40: mov qword ptr [rip + 0xb9c029], rdx ; 0x100c7ec70
0x1000e2c47: mov qword ptr [rip + 0xb9c02e], 0x40 ; 0x100c7ec80
0x1000e2c52: mov qword ptr [rip + 0xb9c02f], r14 ; 0x100c7ec88
0x1000e2c59: mov qword ptr [rip + 0xb9c030], rax ; 0x100c7ec90
0x1000e2c60: mov qword ptr [rip + 0xb9c02d], 0xffffffffffffffff ; 0x100c7ec98
0x1000e2c6b: mov qword ptr [rip + 0xb9c02e], rbx ; 0x100c7eca0
0x1000e2c72: mov qword ptr [rip + 0xb9c02b], 0 ; 0x100c7eca8
0x1000e2c7d: lea rdx, [rip + 0xa8335f] ; 0x100b65fe3 soundEffectCount
0x1000e2c84: mov qword ptr [rip + 0xb9c025], rdx ; 0x100c7ecb0
0x1000e2c8b: lea rdx, [rip + 0xb9c01e] ; 0x100c7ecb0
0x1000e2c92: mov qword ptr [rip + 0xb9c01b], 0 ; 0x100c7ecb8
0x1000e2c9d: mov qword ptr [rip + 0xb9c01c], rcx ; 0x100c7ecc0
0x1000e2ca4: mov qword ptr [rip + 0xb9c021], 0xc8 ; 0x100c7ecd0
0x1000e2caf: mov qword ptr [rip + 0xb9c022], r12 ; 0x100c7ecd8
0x1000e2cb6: mov qword ptr [rip + 0xb9c023], rax ; 0x100c7ece0
0x1000e2cbd: mov qword ptr [rip + 0xb9c020], 0xffffffffffffffff ; 0x100c7ece8
0x1000e2cc8: mov qword ptr [rip + 0xb9c021], rbx ; 0x100c7ecf0
0x1000e2ccf: mov qword ptr [rip + 0xb9c01e], 0 ; 0x100c7ecf8
0x1000e2cda: lea rcx, [rip + 0xa83313] ; 0x100b65ff4 emitterEffectCount
0x1000e2ce1: mov qword ptr [rip + 0xb9c018], rcx ; 0x100c7ed00
0x1000e2ce8: lea rcx, [rip + 0xb9c011] ; 0x100c7ed00
0x1000e2cef: mov qword ptr [rip + 0xb9c00e], 0 ; 0x100c7ed08
0x1000e2cfa: mov qword ptr [rip + 0xb9c00f], rdx ; 0x100c7ed10
0x1000e2d01: mov qword ptr [rip + 0xb9c014], 0x100 ; 0x100c7ed20
0x1000e2d0c: mov qword ptr [rip + 0xb9c015], r12 ; 0x100c7ed28
0x1000e2d13: mov qword ptr [rip + 0xb9c016], rax ; 0x100c7ed30
0x1000e2d1a: mov qword ptr [rip + 0xb9c013], 0xffffffffffffffff ; 0x100c7ed38
0x1000e2d25: mov qword ptr [rip + 0xb9c014], rbx ; 0x100c7ed40
0x1000e2d2c: mov qword ptr [rip + 0xb9c011], 0 ; 0x100c7ed48
0x1000e2d37: lea rdx, [rip + 0xa832c9] ; 0x100b66007 easingFunction
0x1000e2d3e: mov qword ptr [rip + 0xb9c00b], rdx ; 0x100c7ed50
0x1000e2d45: lea rdx, [rip + 0xb9c004] ; 0x100c7ed50
0x1000e2d4c: mov qword ptr [rip + 0xb9c001], 0 ; 0x100c7ed58
0x1000e2d57: mov qword ptr [rip + 0xb9c002], rcx ; 0x100c7ed60
0x1000e2d5e: mov qword ptr [rip + 0xb9c007], 0x38 ; 0x100c7ed70
0x1000e2d69: mov rcx, qword ptr [rip + 0xb23ec0] ; 0x100c06c30 -> 0x1000dfb40 __Z17GetMetaTypeByTypeI14EasingFunctionERK8MetaTypev
0x1000e2d70: mov qword ptr [rip + 0xb9c001], rcx ; 0x100c7ed78
0x1000e2d77: mov qword ptr [rip + 0xb9c002], rax ; 0x100c7ed80
0x1000e2d7e: mov qword ptr [rip + 0xb9bfff], 0xffffffffffffffff ; 0x100c7ed88
0x1000e2d89: mov qword ptr [rip + 0xb9c000], rbx ; 0x100c7ed90
0x1000e2d90: mov qword ptr [rip + 0xb9bffd], 0 ; 0x100c7ed98
0x1000e2d9b: lea rcx, [rip + 0xa83274] ; 0x100b66016 easingPower
0x1000e2da2: mov qword ptr [rip + 0xb9bff7], rcx ; 0x100c7eda0
0x1000e2da9: lea rcx, [rip + 0xb9bff0] ; 0x100c7eda0
0x1000e2db0: mov qword ptr [rip + 0xb9bfed], 0 ; 0x100c7eda8
0x1000e2dbb: mov qword ptr [rip + 0xb9bfee], rdx ; 0x100c7edb0
0x1000e2dc2: mov qword ptr [rip + 0xb9bff3], 0x3c ; 0x100c7edc0
0x1000e2dcd: mov qword ptr [rip + 0xb9bff4], r13 ; 0x100c7edc8
0x1000e2dd4: mov qword ptr [rip + 0xb9bff5], rax ; 0x100c7edd0
0x1000e2ddb: mov qword ptr [rip + 0xb9bff2], 0xffffffffffffffff ; 0x100c7edd8
0x1000e2de6: mov qword ptr [rip + 0xb9bff3], rbx ; 0x100c7ede0
0x1000e2ded: mov qword ptr [rip + 0xb9bff0], 0 ; 0x100c7ede8
0x1000e2df8: lea rdx, [rip + 0xa83223] ; 0x100b66022 sounds
0x1000e2dff: mov qword ptr [rip + 0xb9bfea], rdx ; 0x100c7edf0
0x1000e2e06: lea rdx, [rip + 0xb9bfe3] ; 0x100c7edf0
0x1000e2e0d: mov qword ptr [rip + 0xb9bfe0], 0 ; 0x100c7edf8
0x1000e2e18: mov qword ptr [rip + 0xb9bfe1], rcx ; 0x100c7ee00
0x1000e2e1f: mov qword ptr [rip + 0xb9bfe6], 0x48 ; 0x100c7ee10
0x1000e2e2a: mov rcx, qword ptr [rip + 0xb24707] ; 0x100c07538 -> 0x1000dfb60 __Z17GetMetaTypeByTypeIPK20AnimationSoundEffectERK8MetaTypev
0x1000e2e31: mov qword ptr [rip + 0xb9bfe0], rcx ; 0x100c7ee18
0x1000e2e38: mov qword ptr [rip + 0xb9bfe1], rax ; 0x100c7ee20
0x1000e2e3f: mov qword ptr [rip + 0xb9bfde], 0xc8 ; 0x100c7ee28
0x1000e2e4a: mov qword ptr [rip + 0xb9bfdf], r12 ; 0x100c7ee30
0x1000e2e51: mov qword ptr [rip + 0xb9bfdc], 0x10 ; 0x100c7ee38
0x1000e2e5c: lea rcx, [rip + 0xa831c6] ; 0x100b66029 emitters
0x1000e2e63: mov qword ptr [rip + 0xb9bfd6], rcx ; 0x100c7ee40
0x1000e2e6a: lea rcx, [rip + 0xb9bfcf] ; 0x100c7ee40
0x1000e2e71: mov qword ptr [rip + 0xb9bfcc], 0 ; 0x100c7ee48
0x1000e2e7c: mov qword ptr [rip + 0xb9bfcd], rdx ; 0x100c7ee50
0x1000e2e83: mov qword ptr [rip + 0xb9bfd2], 0xd0 ; 0x100c7ee60
0x1000e2e8e: mov rdx, qword ptr [rip + 0xb246b3] ; 0x100c07548 -> 0x1000dfb70 __Z17GetMetaTypeByTypeIPK22AnimationEmitterEffectERK8MetaTypev
0x1000e2e95: mov qword ptr [rip + 0xb9bfcc], rdx ; 0x100c7ee68
0x1000e2e9c: mov qword ptr [rip + 0xb9bfcd], rax ; 0x100c7ee70
0x1000e2ea3: mov qword ptr [rip + 0xb9bfca], 0x100 ; 0x100c7ee78
0x1000e2eae: mov qword ptr [rip + 0xb9bfcb], r12 ; 0x100c7ee80
0x1000e2eb5: mov qword ptr [rip + 0xb9bfc8], 6 ; 0x100c7ee88
0x1000e2ec0: lea rdx, [rip + 0xa8316b] ; 0x100b66032 rootMotionY
0x1000e2ec7: mov qword ptr [rip + 0xb9bfc2], rdx ; 0x100c7ee90
0x1000e2ece: lea rdx, [rip + 0xb9bfbb] ; 0x100c7ee90
0x1000e2ed5: mov qword ptr [rip + 0xb9bfb8], 0 ; 0x100c7ee98
0x1000e2ee0: mov qword ptr [rip + 0xb9bfb9], rcx ; 0x100c7eea0
0x1000e2ee7: mov qword ptr [rip + 0xb9bfbe], 0x41 ; 0x100c7eeb0
0x1000e2ef2: mov qword ptr [rip + 0xb9bfbf], r14 ; 0x100c7eeb8
0x1000e2ef9: mov qword ptr [rip + 0xb9bfc0], rax ; 0x100c7eec0
0x1000e2f00: mov qword ptr [rip + 0xb9bfbd], 0xffffffffffffffff ; 0x100c7eec8
0x1000e2f0b: mov qword ptr [rip + 0xb9bfbe], rbx ; 0x100c7eed0
0x1000e2f12: mov qword ptr [rip + 0xb9bfbb], 0 ; 0x100c7eed8
0x1000e2f1d: lea rcx, [rip + 0xa8311a] ; 0x100b6603e rootMotionXZ
0x1000e2f24: mov qword ptr [rip + 0xb9bfb5], rcx ; 0x100c7eee0
0x1000e2f2b: lea rcx, [rip + 0xb9bfae] ; 0x100c7eee0
0x1000e2f32: mov qword ptr [rip + 0xb9bfab], 0 ; 0x100c7eee8
0x1000e2f3d: mov qword ptr [rip + 0xb9bfac], rdx ; 0x100c7eef0
0x1000e2f44: mov qword ptr [rip + 0xb94d15], rcx ; 0x100c77c60
0x1000e2f4b: mov qword ptr [rip + 0xb9bfaa], 0x42 ; 0x100c7ef00
0x1000e2f56: mov qword ptr [rip + 0xb9bfab], r14 ; 0x100c7ef08
0x1000e2f5d: mov qword ptr [rip + 0xb9bfac], rax ; 0x100c7ef10
0x1000e2f64: mov qword ptr [rip + 0xb9bfa9], 0xffffffffffffffff ; 0x100c7ef18
0x1000e2f6f: mov qword ptr [rip + 0xb9bfaa], rbx ; 0x100c7ef20
0x1000e2f76: mov qword ptr [rip + 0xb9bfa7], 0 ; 0x100c7ef28
0x1000e2f81: lea rax, [rip + 0xa830c3] ; 0x100b6604b AnimationFile
0x1000e2f88: mov qword ptr [rip + 0x1c917b1], rax ; 0x101d74740
0x1000e2f8f: lea rax, [rip + 0x1c917a2] ; 0x101d74738
0x1000e2f96: mov qword ptr [rip + 0x1c917a7], 0 ; 0x101d74748
0x1000e2fa1: mov rcx, qword ptr [rip + 0xb8cfb0] ; 0x100c6ff58
0x1000e2fa8: mov qword ptr [rip + 0x1c917a1], rcx ; 0x101d74750
0x1000e2faf: mov qword ptr [rip + 0xb8cfa2], rax ; 0x100c6ff58
0x1000e2fb6: mov qword ptr [rip + 0x1c917a3], rax ; 0x101d74760
0x1000e2fbd: lea r13, [rip - 0xad704] ; 0x1000358c0
0x1000e2fc4: mov qword ptr [rip + 0x1c9179d], r13 ; 0x101d74768
0x1000e2fcb: mov dword ptr [rip + 0x1c9179b], 0xffffffff ; 0x101d74770
0x1000e2fd5: mov dword ptr [rip + 0x1c91795], 0xffffffff ; 0x101d74774
0x1000e2fdf: mov qword ptr [rip + 0x1c917a6], 0 ; 0x101d74790
0x1000e2fea: mov rax, qword ptr [rip + 0xb280d7] ; 0x100c0b0c8
0x1000e2ff1: add rax, 0x10
0x1000e2ff5: mov qword ptr [rip + 0x1c9173c], rax ; 0x101d74738
0x1000e2ffc: xor eax, eax
0x1000e2ffe: call 0x100011c10 ; 0x100011c10
0x1000e3003: mov qword ptr [rip + 0xb9bf26], r15 ; 0x100c7ef30
0x1000e300a: lea rax, [rip + 0xb9bf1f] ; 0x100c7ef30
0x1000e3011: mov qword ptr [rip + 0xb9bf1c], 0 ; 0x100c7ef38
0x1000e301c: mov rcx, qword ptr [rip + 0xb94c3d] ; 0x100c77c60
0x1000e3023: mov qword ptr [rip + 0xb9bf16], rcx ; 0x100c7ef40
0x1000e302a: mov qword ptr [rip + 0xb9bf1b], 8 ; 0x100c7ef50
0x1000e3035: mov rcx, qword ptr [rip + 0xb23dac] ; 0x100c06de8 -> 0x1000209f0 __Z17GetMetaTypeByTypeINSt3__112basic_stringIcNS0_11char_traitsIcEE16StlPoolAllocatorIcEEEERK8MetaTypev
0x1000e303c: mov qword ptr [rip + 0xb9bf15], rcx ; 0x100c7ef58
0x1000e3043: mov rcx, qword ptr [rip + 0xb24abe] ; 0x100c07b08 -> 0x1000dfe30 __Z18GetMetaClassByTypeIP13AnimationFileERK9MetaClassv
0x1000e304a: mov qword ptr [rip + 0xb9bf0f], rcx ; 0x100c7ef60
0x1000e3051: mov qword ptr [rip + 0xb9bf0c], 0xffffffffffffffff ; 0x100c7ef68
0x1000e305c: mov qword ptr [rip + 0xb9bf0d], rbx ; 0x100c7ef70
0x1000e3063: mov qword ptr [rip + 0xb9bf0a], 0 ; 0x100c7ef78
0x1000e306e: lea rdx, [rip + 0xa82fe4] ; 0x100b66059 metaDataStart
0x1000e3075: mov qword ptr [rip + 0xb9bf04], rdx ; 0x100c7ef80
0x1000e307c: lea rdx, [rip + 0xb9befd] ; 0x100c7ef80
0x1000e3083: mov qword ptr [rip + 0xb9befa], 0 ; 0x100c7ef88
0x1000e308e: mov qword ptr [rip + 0xb9befb], rax ; 0x100c7ef90
0x1000e3095: mov qword ptr [rip + 0xb9bf00], 0x24 ; 0x100c7efa0
0x1000e30a0: mov qword ptr [rip + 0xb9bf01], r12 ; 0x100c7efa8
0x1000e30a7: mov qword ptr [rip + 0xb9bf02], rcx ; 0x100c7efb0
0x1000e30ae: mov qword ptr [rip + 0xb9beff], 0xffffffffffffffff ; 0x100c7efb8
0x1000e30b9: mov qword ptr [rip + 0xb9bf00], rbx ; 0x100c7efc0
0x1000e30c0: mov qword ptr [rip + 0xb9befd], 0 ; 0x100c7efc8
0x1000e30cb: lea r14, [rip + 0xa82f95] ; 0x100b66067 metaDataCount
0x1000e30d2: mov qword ptr [rip + 0xb9bef7], r14 ; 0x100c7efd0
0x1000e30d9: lea rax, [rip + 0xb9bef0] ; 0x100c7efd0
0x1000e30e0: mov qword ptr [rip + 0xb9beed], 0 ; 0x100c7efd8
0x1000e30eb: mov qword ptr [rip + 0xb9beee], rdx ; 0x100c7efe0
0x1000e30f2: mov qword ptr [rip + 0xb94b67], rax ; 0x100c77c60
0x1000e30f9: mov qword ptr [rip + 0xb9beec], 0x20 ; 0x100c7eff0
0x1000e3104: mov qword ptr [rip + 0xb9beed], r12 ; 0x100c7eff8
0x1000e310b: mov qword ptr [rip + 0xb9beee], rcx ; 0x100c7f000
0x1000e3112: mov qword ptr [rip + 0xb9beeb], 0xffffffffffffffff ; 0x100c7f008
0x1000e311d: mov qword ptr [rip + 0xb9beec], rbx ; 0x100c7f010
0x1000e3124: mov qword ptr [rip + 0xb9bee9], 0 ; 0x100c7f018
0x1000e312f: lea rax, [rip + 0xa82f3f] ; 0x100b66075 AnimationList
0x1000e3136: mov qword ptr [rip + 0x1c91663], rax ; 0x101d747a0
0x1000e313d: lea rax, [rip + 0x1c91654] ; 0x101d74798
0x1000e3144: mov qword ptr [rip + 0x1c91659], 0 ; 0x101d747a8
0x1000e314f: mov rcx, qword ptr [rip + 0xb8ce02] ; 0x100c6ff58
0x1000e3156: mov qword ptr [rip + 0x1c91653], rcx ; 0x101d747b0
0x1000e315d: mov qword ptr [rip + 0xb8cdf4], rax ; 0x100c6ff58
0x1000e3164: mov qword ptr [rip + 0x1c91655], rax ; 0x101d747c0
0x1000e316b: mov qword ptr [rip + 0x1c91656], r13 ; 0x101d747c8
0x1000e3172: mov dword ptr [rip + 0x1c91654], 0xffffffff ; 0x101d747d0
0x1000e317c: mov dword ptr [rip + 0x1c9164e], 0xffffffff ; 0x101d747d4
0x1000e3186: mov qword ptr [rip + 0x1c9165f], 0 ; 0x101d747f0
0x1000e3191: mov rax, qword ptr [rip + 0xb27f38] ; 0x100c0b0d0
0x1000e3198: add rax, 0x10
0x1000e319c: mov qword ptr [rip + 0x1c915f5], rax ; 0x101d74798
0x1000e31a3: xor eax, eax
0x1000e31a5: call 0x100011c10 ; 0x100011c10
0x1000e31aa: lea rax, [rip + 0xa82ed2] ; 0x100b66083 fileCount
0x1000e31b1: mov qword ptr [rip + 0xb9be68], rax ; 0x100c7f020
0x1000e31b8: lea rcx, [rip + 0xb9be61] ; 0x100c7f020
0x1000e31bf: mov qword ptr [rip + 0xb9be5e], 0 ; 0x100c7f028
0x1000e31ca: mov rax, qword ptr [rip + 0xb94a8f] ; 0x100c77c60
0x1000e31d1: mov qword ptr [rip + 0xb9be58], rax ; 0x100c7f030
0x1000e31d8: mov qword ptr [rip + 0xb9be5d], 8 ; 0x100c7f040
0x1000e31e3: mov qword ptr [rip + 0xb9be5e], r12 ; 0x100c7f048
0x1000e31ea: mov rax, qword ptr [rip + 0xb2491f] ; 0x100c07b10 -> 0x1000e00c0 __Z18GetMetaClassByTypeIP13AnimationListERK9MetaClassv
0x1000e31f1: mov qword ptr [rip + 0xb9be58], rax ; 0x100c7f050
0x1000e31f8: mov qword ptr [rip + 0xb9be55], 0xffffffffffffffff ; 0x100c7f058
0x1000e3203: mov qword ptr [rip + 0xb9be56], rbx ; 0x100c7f060
0x1000e320a: mov qword ptr [rip + 0xb9be53], 0 ; 0x100c7f068
0x1000e3215: lea rdx, [rip + 0xa82e71] ; 0x100b6608d files
0x1000e321c: mov qword ptr [rip + 0xb9be4d], rdx ; 0x100c7f070
0x1000e3223: lea rdx, [rip + 0xb9be46] ; 0x100c7f070
0x1000e322a: mov qword ptr [rip + 0xb9be43], 0 ; 0x100c7f078
0x1000e3235: mov qword ptr [rip + 0xb9be44], rcx ; 0x100c7f080
0x1000e323c: mov qword ptr [rip + 0xb9be49], 0x10 ; 0x100c7f090
0x1000e3247: mov rcx, qword ptr [rip + 0xb23da2] ; 0x100c06ff0 -> 0x1000e00d0 __Z17GetMetaTypeByTypeIP13AnimationFileERK8MetaTypev
0x1000e324e: mov qword ptr [rip + 0xb9be43], rcx ; 0x100c7f098
0x1000e3255: mov qword ptr [rip + 0xb9be44], rax ; 0x100c7f0a0
0x1000e325c: mov qword ptr [rip + 0xb9be41], 8 ; 0x100c7f0a8
0x1000e3267: mov qword ptr [rip + 0xb9be42], r12 ; 0x100c7f0b0
0x1000e326e: mov qword ptr [rip + 0xb9be3f], 0x200 ; 0x100c7f0b8
0x1000e3279: mov qword ptr [rip + 0xb9be40], r14 ; 0x100c7f0c0
0x1000e3280: lea rcx, [rip + 0xb9be39] ; 0x100c7f0c0
0x1000e3287: mov qword ptr [rip + 0xb9be36], 0 ; 0x100c7f0c8
0x1000e3292: mov qword ptr [rip + 0xb9be37], rdx ; 0x100c7f0d0
0x1000e3299: mov qword ptr [rip + 0xb9be3c], 0x1010 ; 0x100c7f0e0
0x1000e32a4: mov qword ptr [rip + 0xb9be3d], r12 ; 0x100c7f0e8
0x1000e32ab: mov qword ptr [rip + 0xb9be3e], rax ; 0x100c7f0f0
0x1000e32b2: mov qword ptr [rip + 0xb9be3b], 0xffffffffffffffff ; 0x100c7f0f8
0x1000e32bd: mov qword ptr [rip + 0xb9be3c], rbx ; 0x100c7f100
0x1000e32c4: mov qword ptr [rip + 0xb9be39], 0 ; 0x100c7f108
0x1000e32cf: lea rdx, [rip + 0xa82dbd] ; 0x100b66093 metaDatas
0x1000e32d6: mov qword ptr [rip + 0xb9be33], rdx ; 0x100c7f110
0x1000e32dd: lea rdx, [rip + 0xb9be2c] ; 0x100c7f110
0x1000e32e4: mov qword ptr [rip + 0xb9be29], 0 ; 0x100c7f118
0x1000e32ef: mov qword ptr [rip + 0xb9be2a], rcx ; 0x100c7f120
0x1000e32f6: mov qword ptr [rip + 0xb94963], rdx ; 0x100c77c60
0x1000e32fd: mov qword ptr [rip + 0xb9be28], 0x1018 ; 0x100c7f130
0x1000e3308: mov rcx, qword ptr [rip + 0xb23ea9] ; 0x100c071b8 -> 0x1000e00e0 __Z17GetMetaTypeByTypeIP17AnimationMetaDataERK8MetaTypev
0x1000e330f: mov qword ptr [rip + 0xb9be22], rcx ; 0x100c7f138
0x1000e3316: mov qword ptr [rip + 0xb9be23], rax ; 0x100c7f140
0x1000e331d: mov qword ptr [rip + 0xb9be20], 0x1010 ; 0x100c7f148
0x1000e3328: mov qword ptr [rip + 0xb9be21], r12 ; 0x100c7f150
0x1000e332f: mov qword ptr [rip + 0xb9be1e], 0x1000 ; 0x100c7f158
0x1000e333a: lea rax, [rip + 0xa82d5c] ; 0x100b6609d CompiledAnimationList
0x1000e3341: mov qword ptr [rip + 0x1c914b8], rax ; 0x101d74800
0x1000e3348: lea rax, [rip + 0x1c914a9] ; 0x101d747f8
0x1000e334f: mov qword ptr [rip + 0x1c914ae], 0 ; 0x101d74808
0x1000e335a: mov rcx, qword ptr [rip + 0xb8cbf7] ; 0x100c6ff58
0x1000e3361: mov qword ptr [rip + 0x1c914a8], rcx ; 0x101d74810
0x1000e3368: mov qword ptr [rip + 0xb8cbe9], rax ; 0x100c6ff58
0x1000e336f: mov qword ptr [rip + 0x1c914aa], rax ; 0x101d74820
0x1000e3376: mov rax, qword ptr [rip + 0xb2550b] ; 0x100c08888 -> 0x100059560 __Z18GetMetaClassByTypeIP8ResourceERK9MetaClassv
0x1000e337d: mov qword ptr [rip + 0x1c914a4], rax ; 0x101d74828
0x1000e3384: mov dword ptr [rip + 0x1c914a2], 0xffffffff ; 0x101d74830
0x1000e338e: mov dword ptr [rip + 0x1c9149c], 0xffffffff ; 0x101d74834
0x1000e3398: mov qword ptr [rip + 0x1c914ad], 0 ; 0x101d74850
0x1000e33a3: mov rax, qword ptr [rip + 0xb28c3e] ; 0x100c0bfe8
0x1000e33aa: add rax, 0x10
0x1000e33ae: mov qword ptr [rip + 0x1c91443], rax ; 0x101d747f8
0x1000e33b5: xor eax, eax
0x1000e33b7: call 0x100011c10 ; 0x100011c10
0x1000e33bc: lea rax, [rip + 0xa82cf0] ; 0x100b660b3 AnimationManager
0x1000e33c3: mov qword ptr [rip + 0x1c91496], rax ; 0x101d74860
0x1000e33ca: lea rax, [rip + 0x1c91487] ; 0x101d74858
0x1000e33d1: mov qword ptr [rip + 0x1c9148c], 0 ; 0x101d74868
0x1000e33dc: mov rcx, qword ptr [rip + 0xb8cb75] ; 0x100c6ff58
0x1000e33e3: mov qword ptr [rip + 0x1c91486], rcx ; 0x101d74870
0x1000e33ea: mov qword ptr [rip + 0xb8cb67], rax ; 0x100c6ff58
0x1000e33f1: mov qword ptr [rip + 0x1c91488], rax ; 0x101d74880
0x1000e33f8: mov rax, qword ptr [rip + 0xb252b1] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x1000e33ff: mov qword ptr [rip + 0x1c91482], rax ; 0x101d74888
0x1000e3406: mov qword ptr [rip + 0x1c9147f], 0xffffffffffffffff ; 0x101d74890
0x1000e3411: mov qword ptr [rip + 0x1c91494], 0 ; 0x101d748b0
0x1000e341c: mov rax, qword ptr [rip + 0xb2845d] ; 0x100c0b880
0x1000e3423: add rax, 0x10
0x1000e3427: mov qword ptr [rip + 0x1c9142a], rax ; 0x101d74858
0x1000e342e: xor eax, eax
0x1000e3430: call 0x100011c10 ; 0x100011c10
0x1000e3435: lea rax, [rip + 0xa794d0] ; 0x100b5c90c Initialize
0x1000e343c: mov qword ptr [rip + 0x1c91475], rax ; 0x101d748b8
0x1000e3443: lea rax, [rip + 0x1c9146e] ; 0x101d748b8
0x1000e344a: mov rcx, qword ptr [rip + 0xb8cb0f] ; 0x100c6ff60
0x1000e3451: mov qword ptr [rip + 0x1c91470], rcx ; 0x101d748c8
0x1000e3458: lea rcx, [rip - 0x4385f] ; 0x10009fc00
0x1000e345f: vmovq xmm0, rcx
0x1000e3464: vmovdqu xmmword ptr [rip + 0x1c91484], xmm0 ; 0x101d748f0
0x1000e346c: mov rcx, qword ptr [rip + 0xb2292d] ; 0x100c05da0 -> 0x1000e0700 __Z12ApplyWrapperI16AnimationManagerMS0_FvP9lua_StateP4HeapP15ResourceManagerP12ResourceArgsEEvM9VoidClassFvvEPv8VariablePSF_j
0x1000e3473: mov qword ptr [rip + 0x1c91486], rcx ; 0x101d74900
0x1000e347a: mov rcx, qword ptr [rip + 0xb261af] ; 0x100c09630 -> 0x1000e0710 __Z21InitFunctionSignatureIM16AnimationManagerFvP9lua_StateP4HeapP15ResourceManagerP12ResourceArgsEEvP17FunctionSignature
0x1000e3481: mov qword ptr [rip + 0x1c91480], rcx ; 0x101d74908
0x1000e3488: mov rcx, qword ptr [rip + 0xb24b19] ; 0x100c07fa8 -> 0x1000e06f0 __Z18GetMetaClassByTypeIP16AnimationManagerERK9MetaClassv
0x1000e348f: mov qword ptr [rip + 0x1c9147a], rcx ; 0x101d74910
0x1000e3496: lea rdx, [rip + 0xa82c27] ; 0x100b660c4 resourceHeap
0x1000e349d: vmovq xmm0, rdx
0x1000e34a2: lea rdx, [rip + 0xa7946e] ; 0x100b5c917 ArgName
0x1000e34a9: vmovq xmm1, rdx
0x1000e34ae: vpunpcklqdq xmm0, xmm1, xmm0
0x1000e34b2: vmovdqa xmmword ptr [rip + 0x1c91466], xmm0 ; 0x101d74920
0x1000e34ba: lea rdx, [rip + 0x1c9145f] ; 0x101d74920
0x1000e34c1: mov qword ptr [rip + 0x1c91464], 0 ; 0x101d74930
0x1000e34cc: mov qword ptr [rip + 0x1c913ed], rdx ; 0x101d748c0
0x1000e34d3: lea rdx, [rip + 0xa7945e] ; 0x100b5c938 Terminate
0x1000e34da: mov qword ptr [rip + 0x1c91457], rdx ; 0x101d74938
0x1000e34e1: lea rdx, [rip + 0x1c91450] ; 0x101d74938
0x1000e34e8: mov qword ptr [rip + 0x1c91459], rax ; 0x101d74948
0x1000e34ef: mov qword ptr [rip + 0xb8ca6a], rdx ; 0x100c6ff60
0x1000e34f6: lea rax, [rip - 0x4386d] ; 0x10009fc90
0x1000e34fd: vmovq xmm1, rax
0x1000e3502: vmovdqu xmmword ptr [rip + 0x1c91466], xmm1 ; 0x101d74970
0x1000e350a: mov rax, qword ptr [rip + 0xb22887] ; 0x100c05d98 -> 0x1000e0900 __Z12ApplyWrapperI16AnimationManagerMS0_FvP4HeapEEvM9VoidClassFvvEPv8VariablePS9_j
0x1000e3511: mov qword ptr [rip + 0x1c91468], rax ; 0x101d74980
0x1000e3518: mov rax, qword ptr [rip + 0xb26109] ; 0x100c09628 -> 0x1000e09a0 __Z21InitFunctionSignatureIM16AnimationManagerFvP4HeapEEvP17FunctionSignature
0x1000e351f: mov qword ptr [rip + 0x1c91462], rax ; 0x101d74988
0x1000e3526: mov qword ptr [rip + 0x1c91463], rcx ; 0x101d74990
0x1000e352d: vmovdqa xmmword ptr [rip + 0x1c9146b], xmm0 ; 0x101d749a0
0x1000e3535: lea rax, [rip + 0x1c91464] ; 0x101d749a0
0x1000e353c: mov qword ptr [rip + 0x1c91469], 0 ; 0x101d749b0
0x1000e3547: mov qword ptr [rip + 0x1c913f2], rax ; 0x101d74940
0x1000e354e: lea rax, [rip + 0x1c9146b] ; 0x101d749c0
0x1000e3555: vpxor xmm0, xmm0, xmm0
0x1000e3559: lea rcx, [rip + 0x1ca9b00] ; 0x101d8d060
0x1000e3560: mov dword ptr [rax], 0
0x1000e3566: vmovdqu xmmword ptr [rax + 0x14], xmm0
0x1000e356b: vmovdqu xmmword ptr [rax + 8], xmm0
0x1000e3570: mov dword ptr [rax + 0x28], 0
0x1000e3577: vmovdqu xmmword ptr [rax + 0x3c], xmm0
0x1000e357c: vmovdqu xmmword ptr [rax + 0x30], xmm0
0x1000e3581: mov dword ptr [rax + 0x50], 0
0x1000e3588: vmovdqu xmmword ptr [rax + 0x64], xmm0
0x1000e358d: vmovdqu xmmword ptr [rax + 0x58], xmm0
0x1000e3592: mov dword ptr [rax + 0x78], 0
0x1000e3599: vmovdqu xmmword ptr [rax + 0x8c], xmm0
0x1000e35a1: vmovdqu xmmword ptr [rax + 0x80], xmm0
0x1000e35a9: mov dword ptr [rax + 0xa0], 0
0x1000e35b3: vmovdqu xmmword ptr [rax + 0xb4], xmm0
0x1000e35bb: vmovdqu xmmword ptr [rax + 0xa8], xmm0
0x1000e35c3: mov dword ptr [rax + 0xc8], 0
0x1000e35cd: vmovdqu xmmword ptr [rax + 0xdc], xmm0
0x1000e35d5: vmovdqu xmmword ptr [rax + 0xd0], xmm0
0x1000e35dd: mov dword ptr [rax + 0xf0], 0
0x1000e35e7: vmovdqu xmmword ptr [rax + 0x104], xmm0
0x1000e35ef: vmovdqu xmmword ptr [rax + 0xf8], xmm0
0x1000e35f7: mov dword ptr [rax + 0x118], 0
0x1000e3601: vmovdqu xmmword ptr [rax + 0x12c], xmm0
0x1000e3609: vmovdqu xmmword ptr [rax + 0x120], xmm0
0x1000e3611: mov dword ptr [rax + 0x140], 0
0x1000e361b: vmovdqu xmmword ptr [rax + 0x154], xmm0
0x1000e3623: vmovdqu xmmword ptr [rax + 0x148], xmm0
0x1000e362b: mov dword ptr [rax + 0x168], 0
0x1000e3635: vmovdqu xmmword ptr [rax + 0x17c], xmm0
0x1000e363d: vmovdqu xmmword ptr [rax + 0x170], xmm0
0x1000e3645: add rax, 0x190
0x1000e364b: cmp rax, rcx
0x1000e364e: jne 0x1000e3560
0x1000e3654: xor eax, eax
0x1000e3656: lea rcx, [rip + 0x1ca9a03] ; 0x101d8d060
0x1000e365d: vpxor xmm0, xmm0, xmm0
0x1000e3661: nop word ptr cs:[rax + rax]
0x1000e3670: mov dword ptr [rax + rcx + 0xa0], 0
0x1000e367b: vmovdqu xmmword ptr [rax + rcx + 0xc], xmm0
0x1000e3681: vmovdqu xmmword ptr [rax + rcx], xmm0
0x1000e3686: mov dword ptr [rax + rcx + 0x148], 0
0x1000e3691: vmovdqu xmmword ptr [rax + rcx + 0xb4], xmm0
0x1000e369a: vmovdqu xmmword ptr [rax + rcx + 0xa8], xmm0
0x1000e36a3: mov dword ptr [rax + rcx + 0x1f0], 0
0x1000e36ae: vmovdqu xmmword ptr [rax + rcx + 0x15c], xmm0
0x1000e36b7: vmovdqu xmmword ptr [rax + rcx + 0x150], xmm0
0x1000e36c0: mov dword ptr [rax + rcx + 0x298], 0
0x1000e36cb: vmovdqu xmmword ptr [rax + rcx + 0x204], xmm0
0x1000e36d4: vmovdqu xmmword ptr [rax + rcx + 0x1f8], xmm0
0x1000e36dd: mov dword ptr [rax + rcx + 0x340], 0
0x1000e36e8: vmovdqu xmmword ptr [rax + rcx + 0x2ac], xmm0
0x1000e36f1: vmovdqu xmmword ptr [rax + rcx + 0x2a0], xmm0
0x1000e36fa: mov dword ptr [rax + rcx + 0x3e8], 0
0x1000e3705: vmovdqu xmmword ptr [rax + rcx + 0x354], xmm0
0x1000e370e: vmovdqu xmmword ptr [rax + rcx + 0x348], xmm0
0x1000e3717: mov dword ptr [rax + rcx + 0x490], 0
0x1000e3722: vmovdqu xmmword ptr [rax + rcx + 0x3fc], xmm0
0x1000e372b: vmovdqu xmmword ptr [rax + rcx + 0x3f0], xmm0
0x1000e3734: mov dword ptr [rax + rcx + 0x538], 0
0x1000e373f: vmovdqu xmmword ptr [rax + rcx + 0x4a4], xmm0
0x1000e3748: vmovdqu xmmword ptr [rax + rcx + 0x498], xmm0
0x1000e3751: mov dword ptr [rax + rcx + 0x5e0], 0
0x1000e375c: vmovdqu xmmword ptr [rax + rcx + 0x54c], xmm0
0x1000e3765: vmovdqu xmmword ptr [rax + rcx + 0x540], xmm0
0x1000e376e: mov dword ptr [rax + rcx + 0x688], 0
0x1000e3779: vmovdqu xmmword ptr [rax + rcx + 0x5f4], xmm0
0x1000e3782: vmovdqu xmmword ptr [rax + rcx + 0x5e8], xmm0
0x1000e378b: add rax, 0x690
0x1000e3791: cmp rax, 0x396c0
0x1000e3797: jne 0x1000e3670
0x1000e379d: mov qword ptr [rip + 0x1ce2f78], 0 ; 0x101dc6720
0x1000e37a8: mov dword ptr [rip + 0x1ce2f76], 0 ; 0x101dc6728
0x1000e37b2: mov qword ptr [rip + 0x1ce3093], 0 ; 0x101dc6850
0x1000e37bd: mov dword ptr [rip + 0x1ce3091], 0 ; 0x101dc6858
0x1000e37c7: mov qword ptr [rip + 0x1ce31ae], 0 ; 0x101dc6980
0x1000e37d2: mov dword ptr [rip + 0x1ce31ac], 0 ; 0x101dc6988
0x1000e37dc: mov qword ptr [rip + 0x1ce32c9], 0 ; 0x101dc6ab0
0x1000e37e7: mov dword ptr [rip + 0x1ce32c7], 0 ; 0x101dc6ab8
0x1000e37f1: mov qword ptr [rip + 0x1ce33e4], 0 ; 0x101dc6be0
0x1000e37fc: mov dword ptr [rip + 0x1ce33e2], 0 ; 0x101dc6be8
0x1000e3806: mov qword ptr [rip + 0x1ce34ff], 0 ; 0x101dc6d10
0x1000e3811: mov dword ptr [rip + 0x1ce34fd], 0 ; 0x101dc6d18
0x1000e381b: mov qword ptr [rip + 0x1ce361a], 0 ; 0x101dc6e40
0x1000e3826: mov dword ptr [rip + 0x1ce3618], 0 ; 0x101dc6e48
0x1000e3830: mov qword ptr [rip + 0x1ce3735], 0 ; 0x101dc6f70
0x1000e383b: mov dword ptr [rip + 0x1ce3733], 0 ; 0x101dc6f78
0x1000e3845: mov qword ptr [rip + 0x1ce3850], 0 ; 0x101dc70a0
0x1000e3850: mov dword ptr [rip + 0x1ce384e], 0 ; 0x101dc70a8
0x1000e385a: mov qword ptr [rip + 0x1ce396b], 0 ; 0x101dc71d0
0x1000e3865: mov dword ptr [rip + 0x1ce3969], 0 ; 0x101dc71d8
0x1000e386f: mov qword ptr [rip + 0x1ce3a86], 0 ; 0x101dc7300
0x1000e387a: mov dword ptr [rip + 0x1ce3a84], 0 ; 0x101dc7308
0x1000e3884: mov qword ptr [rip + 0x1ce3ba1], 0 ; 0x101dc7430
0x1000e388f: mov dword ptr [rip + 0x1ce3b9f], 0 ; 0x101dc7438
0x1000e3899: mov qword ptr [rip + 0x1ce3cbc], 0 ; 0x101dc7560
0x1000e38a4: mov dword ptr [rip + 0x1ce3cba], 0 ; 0x101dc7568
0x1000e38ae: mov qword ptr [rip + 0x1ce3dd7], 0 ; 0x101dc7690
0x1000e38b9: mov dword ptr [rip + 0x1ce3dd5], 0 ; 0x101dc7698
0x1000e38c3: mov qword ptr [rip + 0x1ce3ef2], 0 ; 0x101dc77c0
0x1000e38ce: mov dword ptr [rip + 0x1ce3ef0], 0 ; 0x101dc77c8
0x1000e38d8: mov qword ptr [rip + 0x1ce400d], 0 ; 0x101dc78f0
0x1000e38e3: mov dword ptr [rip + 0x1ce400b], 0 ; 0x101dc78f8
0x1000e38ed: mov qword ptr [rip + 0x1ce4128], 0 ; 0x101dc7a20
0x1000e38f8: mov dword ptr [rip + 0x1ce4126], 0 ; 0x101dc7a28
0x1000e3902: mov qword ptr [rip + 0x1ce4243], 0 ; 0x101dc7b50
0x1000e390d: mov dword ptr [rip + 0x1ce4241], 0 ; 0x101dc7b58
0x1000e3917: mov qword ptr [rip + 0x1ce435e], 0 ; 0x101dc7c80
0x1000e3922: mov dword ptr [rip + 0x1ce435c], 0 ; 0x101dc7c88
0x1000e392c: mov qword ptr [rip + 0x1ce4479], 0 ; 0x101dc7db0
0x1000e3937: mov dword ptr [rip + 0x1ce4477], 0 ; 0x101dc7db8
0x1000e3941: mov qword ptr [rip + 0x1ce4594], 0 ; 0x101dc7ee0
0x1000e394c: mov dword ptr [rip + 0x1ce4592], 0 ; 0x101dc7ee8
0x1000e3956: mov qword ptr [rip + 0x1ce46af], 0 ; 0x101dc8010
0x1000e3961: mov dword ptr [rip + 0x1ce46ad], 0 ; 0x101dc8018
0x1000e396b: mov qword ptr [rip + 0x1ce47ca], 0 ; 0x101dc8140
0x1000e3976: mov dword ptr [rip + 0x1ce47c8], 0 ; 0x101dc8148
0x1000e3980: mov qword ptr [rip + 0x1ce48e5], 0 ; 0x101dc8270
0x1000e398b: mov dword ptr [rip + 0x1ce48e3], 0 ; 0x101dc8278
0x1000e3995: mov qword ptr [rip + 0x1ce4a00], 0 ; 0x101dc83a0
0x1000e39a0: mov dword ptr [rip + 0x1ce49fe], 0 ; 0x101dc83a8
0x1000e39aa: mov qword ptr [rip + 0x1ce4b1b], 0 ; 0x101dc84d0
0x1000e39b5: mov dword ptr [rip + 0x1ce4b19], 0 ; 0x101dc84d8
0x1000e39bf: mov qword ptr [rip + 0x1ce4c36], 0 ; 0x101dc8600
0x1000e39ca: mov dword ptr [rip + 0x1ce4c34], 0 ; 0x101dc8608
0x1000e39d4: mov qword ptr [rip + 0x1ce4d51], 0 ; 0x101dc8730
0x1000e39df: mov dword ptr [rip + 0x1ce4d4f], 0 ; 0x101dc8738
0x1000e39e9: mov qword ptr [rip + 0x1ce4e6c], 0 ; 0x101dc8860
0x1000e39f4: mov dword ptr [rip + 0x1ce4e6a], 0 ; 0x101dc8868
0x1000e39fe: mov qword ptr [rip + 0x1ce4f87], 0 ; 0x101dc8990
0x1000e3a09: mov dword ptr [rip + 0x1ce4f85], 0 ; 0x101dc8998
0x1000e3a13: mov qword ptr [rip + 0x1ce50a2], 0 ; 0x101dc8ac0
0x1000e3a1e: mov dword ptr [rip + 0x1ce50a0], 0 ; 0x101dc8ac8
0x1000e3a28: mov qword ptr [rip + 0x1ce51bd], 0 ; 0x101dc8bf0
0x1000e3a33: mov dword ptr [rip + 0x1ce51bb], 0 ; 0x101dc8bf8
0x1000e3a3d: mov qword ptr [rip + 0x1ce52d8], 0 ; 0x101dc8d20
0x1000e3a48: mov dword ptr [rip + 0x1ce52d6], 0 ; 0x101dc8d28
0x1000e3a52: mov qword ptr [rip + 0x1ce53f3], 0 ; 0x101dc8e50
0x1000e3a5d: mov dword ptr [rip + 0x1ce53f1], 0 ; 0x101dc8e58
0x1000e3a67: mov qword ptr [rip + 0x1ce550e], 0 ; 0x101dc8f80
0x1000e3a72: mov dword ptr [rip + 0x1ce550c], 0 ; 0x101dc8f88
0x1000e3a7c: mov qword ptr [rip + 0x1ce5629], 0 ; 0x101dc90b0
0x1000e3a87: mov dword ptr [rip + 0x1ce5627], 0 ; 0x101dc90b8
0x1000e3a91: mov qword ptr [rip + 0x1ce5744], 0 ; 0x101dc91e0
0x1000e3a9c: mov dword ptr [rip + 0x1ce5742], 0 ; 0x101dc91e8
0x1000e3aa6: mov qword ptr [rip + 0x1ce585f], 0 ; 0x101dc9310
0x1000e3ab1: mov dword ptr [rip + 0x1ce585d], 0 ; 0x101dc9318
0x1000e3abb: mov qword ptr [rip + 0x1ce597a], 0 ; 0x101dc9440
0x1000e3ac6: mov dword ptr [rip + 0x1ce5978], 0 ; 0x101dc9448
0x1000e3ad0: mov qword ptr [rip + 0x1ce5a95], 0 ; 0x101dc9570
0x1000e3adb: mov dword ptr [rip + 0x1ce5a93], 0 ; 0x101dc9578
0x1000e3ae5: mov qword ptr [rip + 0x1ce5bb0], 0 ; 0x101dc96a0
0x1000e3af0: mov dword ptr [rip + 0x1ce5bae], 0 ; 0x101dc96a8
0x1000e3afa: mov qword ptr [rip + 0x1ce5ccb], 0 ; 0x101dc97d0
0x1000e3b05: mov dword ptr [rip + 0x1ce5cc9], 0 ; 0x101dc97d8
0x1000e3b0f: mov qword ptr [rip + 0x1ce5de6], 0 ; 0x101dc9900
0x1000e3b1a: mov dword ptr [rip + 0x1ce5de4], 0 ; 0x101dc9908
0x1000e3b24: mov qword ptr [rip + 0x1ce5f01], 0 ; 0x101dc9a30
0x1000e3b2f: mov dword ptr [rip + 0x1ce5eff], 0 ; 0x101dc9a38
0x1000e3b39: mov qword ptr [rip + 0x1ce601c], 0 ; 0x101dc9b60
0x1000e3b44: mov dword ptr [rip + 0x1ce601a], 0 ; 0x101dc9b68
0x1000e3b4e: mov qword ptr [rip + 0x1ce6137], 0 ; 0x101dc9c90
0x1000e3b59: mov dword ptr [rip + 0x1ce6135], 0 ; 0x101dc9c98
0x1000e3b63: mov qword ptr [rip + 0x1ce6252], 0 ; 0x101dc9dc0
0x1000e3b6e: mov dword ptr [rip + 0x1ce6250], 0 ; 0x101dc9dc8
0x1000e3b78: mov qword ptr [rip + 0x1ce636d], 0 ; 0x101dc9ef0
0x1000e3b83: mov dword ptr [rip + 0x1ce636b], 0 ; 0x101dc9ef8
0x1000e3b8d: mov qword ptr [rip + 0x1ce6488], 0 ; 0x101dca020
0x1000e3b98: mov dword ptr [rip + 0x1ce6486], 0 ; 0x101dca028
0x1000e3ba2: mov qword ptr [rip + 0x1ce65a3], 0 ; 0x101dca150
0x1000e3bad: mov dword ptr [rip + 0x1ce65a1], 0 ; 0x101dca158
0x1000e3bb7: mov qword ptr [rip + 0x1ce66be], 0 ; 0x101dca280
0x1000e3bc2: mov dword ptr [rip + 0x1ce66bc], 0 ; 0x101dca288
0x1000e3bcc: mov qword ptr [rip + 0x1ce67d9], 0 ; 0x101dca3b0
0x1000e3bd7: mov dword ptr [rip + 0x1ce67d7], 0 ; 0x101dca3b8
0x1000e3be1: mov qword ptr [rip + 0x1ce68f4], 0 ; 0x101dca4e0
0x1000e3bec: mov dword ptr [rip + 0x1ce68f2], 0 ; 0x101dca4e8
0x1000e3bf6: mov qword ptr [rip + 0x1ce6a0f], 0 ; 0x101dca610
0x1000e3c01: mov dword ptr [rip + 0x1ce6a0d], 0 ; 0x101dca618
0x1000e3c0b: mov qword ptr [rip + 0x1ce6b2a], 0 ; 0x101dca740
0x1000e3c16: mov dword ptr [rip + 0x1ce6b28], 0 ; 0x101dca748
0x1000e3c20: mov qword ptr [rip + 0x1ce6c45], 0 ; 0x101dca870
0x1000e3c2b: mov dword ptr [rip + 0x1ce6c43], 0 ; 0x101dca878
0x1000e3c35: mov qword ptr [rip + 0x1ce6d60], 0 ; 0x101dca9a0
0x1000e3c40: mov dword ptr [rip + 0x1ce6d5e], 0 ; 0x101dca9a8
0x1000e3c4a: mov qword ptr [rip + 0x1ce6e7b], 0 ; 0x101dcaad0
0x1000e3c55: mov dword ptr [rip + 0x1ce6e79], 0 ; 0x101dcaad8
0x1000e3c5f: mov qword ptr [rip + 0x1ce6f96], 0 ; 0x101dcac00
0x1000e3c6a: mov dword ptr [rip + 0x1ce6f94], 0 ; 0x101dcac08
0x1000e3c74: mov qword ptr [rip + 0x1ce70b1], 0 ; 0x101dcad30
0x1000e3c7f: mov dword ptr [rip + 0x1ce70af], 0 ; 0x101dcad38
0x1000e3c89: mov qword ptr [rip + 0x1ce71cc], 0 ; 0x101dcae60
0x1000e3c94: mov dword ptr [rip + 0x1ce71ca], 0 ; 0x101dcae68
0x1000e3c9e: mov qword ptr [rip + 0x1ce72e7], 0 ; 0x101dcaf90
0x1000e3ca9: mov dword ptr [rip + 0x1ce72e5], 0 ; 0x101dcaf98
0x1000e3cb3: mov qword ptr [rip + 0x1ce7402], 0 ; 0x101dcb0c0
0x1000e3cbe: mov dword ptr [rip + 0x1ce7400], 0 ; 0x101dcb0c8
0x1000e3cc8: mov qword ptr [rip + 0x1ce751d], 0 ; 0x101dcb1f0
0x1000e3cd3: mov dword ptr [rip + 0x1ce751b], 0 ; 0x101dcb1f8
0x1000e3cdd: mov qword ptr [rip + 0x1ce7638], 0 ; 0x101dcb320
0x1000e3ce8: mov dword ptr [rip + 0x1ce7636], 0 ; 0x101dcb328
0x1000e3cf2: mov qword ptr [rip + 0x1ce7753], 0 ; 0x101dcb450
0x1000e3cfd: mov dword ptr [rip + 0x1ce7751], 0 ; 0x101dcb458
0x1000e3d07: mov qword ptr [rip + 0x1ce786e], 0 ; 0x101dcb580
0x1000e3d12: mov dword ptr [rip + 0x1ce786c], 0 ; 0x101dcb588
0x1000e3d1c: mov qword ptr [rip + 0x1ce7989], 0 ; 0x101dcb6b0
0x1000e3d27: mov dword ptr [rip + 0x1ce7987], 0 ; 0x101dcb6b8
0x1000e3d31: mov qword ptr [rip + 0x1ce7aa4], 0 ; 0x101dcb7e0
0x1000e3d3c: mov dword ptr [rip + 0x1ce7aa2], 0 ; 0x101dcb7e8
0x1000e3d46: mov qword ptr [rip + 0x1ce7bbf], 0 ; 0x101dcb910
0x1000e3d51: mov dword ptr [rip + 0x1ce7bbd], 0 ; 0x101dcb918
0x1000e3d5b: mov qword ptr [rip + 0x1ce7cda], 0 ; 0x101dcba40
0x1000e3d66: mov dword ptr [rip + 0x1ce7cd8], 0 ; 0x101dcba48
0x1000e3d70: mov qword ptr [rip + 0x1ce7df5], 0 ; 0x101dcbb70
0x1000e3d7b: mov dword ptr [rip + 0x1ce7df3], 0 ; 0x101dcbb78
0x1000e3d85: mov qword ptr [rip + 0x1ce7f10], 0 ; 0x101dcbca0
0x1000e3d90: mov dword ptr [rip + 0x1ce7f0e], 0 ; 0x101dcbca8
0x1000e3d9a: mov qword ptr [rip + 0x1ce802b], 0 ; 0x101dcbdd0
0x1000e3da5: mov dword ptr [rip + 0x1ce8029], 0 ; 0x101dcbdd8
0x1000e3daf: mov qword ptr [rip + 0x1ce8146], 0 ; 0x101dcbf00
0x1000e3dba: mov dword ptr [rip + 0x1ce8144], 0 ; 0x101dcbf08
0x1000e3dc4: mov qword ptr [rip + 0x1ce8261], 0 ; 0x101dcc030
0x1000e3dcf: mov dword ptr [rip + 0x1ce825f], 0 ; 0x101dcc038
0x1000e3dd9: mov qword ptr [rip + 0x1ce837c], 0 ; 0x101dcc160
0x1000e3de4: mov dword ptr [rip + 0x1ce837a], 0 ; 0x101dcc168
0x1000e3dee: mov qword ptr [rip + 0x1ce8497], 0 ; 0x101dcc290
0x1000e3df9: mov dword ptr [rip + 0x1ce8495], 0 ; 0x101dcc298
0x1000e3e03: mov qword ptr [rip + 0x1ce85b2], 0 ; 0x101dcc3c0
0x1000e3e0e: mov dword ptr [rip + 0x1ce85b0], 0 ; 0x101dcc3c8
0x1000e3e18: mov qword ptr [rip + 0x1ce86cd], 0 ; 0x101dcc4f0
0x1000e3e23: mov dword ptr [rip + 0x1ce86cb], 0 ; 0x101dcc4f8
0x1000e3e2d: mov qword ptr [rip + 0x1ce87e8], 0 ; 0x101dcc620
0x1000e3e38: mov dword ptr [rip + 0x1ce87e6], 0 ; 0x101dcc628
0x1000e3e42: mov qword ptr [rip + 0x1ce8903], 0 ; 0x101dcc750
0x1000e3e4d: mov dword ptr [rip + 0x1ce8901], 0 ; 0x101dcc758
0x1000e3e57: mov qword ptr [rip + 0x1ce8a1e], 0 ; 0x101dcc880
0x1000e3e62: mov dword ptr [rip + 0x1ce8a1c], 0 ; 0x101dcc888
0x1000e3e6c: mov qword ptr [rip + 0x1ce8b39], 0 ; 0x101dcc9b0
0x1000e3e77: mov dword ptr [rip + 0x1ce8b37], 0 ; 0x101dcc9b8
0x1000e3e81: mov qword ptr [rip + 0x1ce8c54], 0 ; 0x101dccae0
0x1000e3e8c: mov dword ptr [rip + 0x1ce8c52], 0 ; 0x101dccae8
0x1000e3e96: mov qword ptr [rip + 0x1ce8d6f], 0 ; 0x101dccc10
0x1000e3ea1: mov dword ptr [rip + 0x1ce8d6d], 0 ; 0x101dccc18
0x1000e3eab: mov qword ptr [rip + 0x1ce8e8a], 0 ; 0x101dccd40
0x1000e3eb6: mov dword ptr [rip + 0x1ce8e88], 0 ; 0x101dccd48
0x1000e3ec0: mov qword ptr [rip + 0x1ce8fa5], 0 ; 0x101dcce70
0x1000e3ecb: mov dword ptr [rip + 0x1ce8fa3], 0 ; 0x101dcce78
0x1000e3ed5: mov qword ptr [rip + 0x1ce90c0], 0 ; 0x101dccfa0
0x1000e3ee0: mov dword ptr [rip + 0x1ce90be], 0 ; 0x101dccfa8
0x1000e3eea: mov qword ptr [rip + 0x1ce91db], 0 ; 0x101dcd0d0
0x1000e3ef5: mov dword ptr [rip + 0x1ce91d9], 0 ; 0x101dcd0d8
0x1000e3eff: mov qword ptr [rip + 0x1ce92f6], 0 ; 0x101dcd200
0x1000e3f0a: mov dword ptr [rip + 0x1ce92f4], 0 ; 0x101dcd208
0x1000e3f14: mov qword ptr [rip + 0x1ce9411], 0 ; 0x101dcd330
0x1000e3f1f: mov dword ptr [rip + 0x1ce940f], 0 ; 0x101dcd338
0x1000e3f29: mov qword ptr [rip + 0x1ce952c], 0 ; 0x101dcd460
0x1000e3f34: mov dword ptr [rip + 0x1ce952a], 0 ; 0x101dcd468
0x1000e3f3e: mov qword ptr [rip + 0x1ce9647], 0 ; 0x101dcd590
0x1000e3f49: mov dword ptr [rip + 0x1ce9645], 0 ; 0x101dcd598
0x1000e3f53: mov qword ptr [rip + 0x1ce9762], 0 ; 0x101dcd6c0
0x1000e3f5e: mov dword ptr [rip + 0x1ce9760], 0 ; 0x101dcd6c8
0x1000e3f68: mov qword ptr [rip + 0x1ce987d], 0 ; 0x101dcd7f0
0x1000e3f73: mov dword ptr [rip + 0x1ce987b], 0 ; 0x101dcd7f8
0x1000e3f7d: mov qword ptr [rip + 0x1ce9998], 0 ; 0x101dcd920
0x1000e3f88: mov dword ptr [rip + 0x1ce9996], 0 ; 0x101dcd928
0x1000e3f92: mov qword ptr [rip + 0x1ce9ab3], 0 ; 0x101dcda50
0x1000e3f9d: mov dword ptr [rip + 0x1ce9ab1], 0 ; 0x101dcda58
0x1000e3fa7: mov qword ptr [rip + 0x1ce9bce], 0 ; 0x101dcdb80
0x1000e3fb2: mov dword ptr [rip + 0x1ce9bcc], 0 ; 0x101dcdb88
0x1000e3fbc: mov qword ptr [rip + 0x1ce9ce9], 0 ; 0x101dcdcb0
0x1000e3fc7: mov dword ptr [rip + 0x1ce9ce7], 0 ; 0x101dcdcb8
0x1000e3fd1: mov qword ptr [rip + 0x1ce9e04], 0 ; 0x101dcdde0
0x1000e3fdc: mov dword ptr [rip + 0x1ce9e02], 0 ; 0x101dcdde8
0x1000e3fe6: mov qword ptr [rip + 0x1ce9f1f], 0 ; 0x101dcdf10
0x1000e3ff1: mov dword ptr [rip + 0x1ce9f1d], 0 ; 0x101dcdf18
0x1000e3ffb: mov qword ptr [rip + 0x1cea03a], 0 ; 0x101dce040
0x1000e4006: mov dword ptr [rip + 0x1cea038], 0 ; 0x101dce048
0x1000e4010: mov qword ptr [rip + 0x1cea155], 0 ; 0x101dce170
0x1000e401b: mov dword ptr [rip + 0x1cea153], 0 ; 0x101dce178
0x1000e4025: mov qword ptr [rip + 0x1cea270], 0 ; 0x101dce2a0
0x1000e4030: mov dword ptr [rip + 0x1cea26e], 0 ; 0x101dce2a8
0x1000e403a: mov qword ptr [rip + 0x1cea38b], 0 ; 0x101dce3d0
0x1000e4045: mov dword ptr [rip + 0x1cea389], 0 ; 0x101dce3d8
0x1000e404f: mov qword ptr [rip + 0x1cea4a6], 0 ; 0x101dce500
0x1000e405a: mov dword ptr [rip + 0x1cea4a4], 0 ; 0x101dce508
0x1000e4064: mov qword ptr [rip + 0x1cea5c1], 0 ; 0x101dce630
0x1000e406f: mov dword ptr [rip + 0x1cea5bf], 0 ; 0x101dce638
0x1000e4079: mov qword ptr [rip + 0x1cea6dc], 0 ; 0x101dce760
0x1000e4084: mov dword ptr [rip + 0x1cea6da], 0 ; 0x101dce768
0x1000e408e: mov qword ptr [rip + 0x1cea7f7], 0 ; 0x101dce890
0x1000e4099: mov dword ptr [rip + 0x1cea7f5], 0 ; 0x101dce898
0x1000e40a3: mov qword ptr [rip + 0x1cea912], 0 ; 0x101dce9c0
0x1000e40ae: mov dword ptr [rip + 0x1cea910], 0 ; 0x101dce9c8
0x1000e40b8: mov qword ptr [rip + 0x1ceaa2d], 0 ; 0x101dceaf0
0x1000e40c3: mov dword ptr [rip + 0x1ceaa2b], 0 ; 0x101dceaf8
0x1000e40cd: mov qword ptr [rip + 0x1ceab48], 0 ; 0x101dcec20
0x1000e40d8: mov dword ptr [rip + 0x1ceab46], 0 ; 0x101dcec28
0x1000e40e2: mov qword ptr [rip + 0x1ceac63], 0 ; 0x101dced50
0x1000e40ed: mov dword ptr [rip + 0x1ceac61], 0 ; 0x101dced58
0x1000e40f7: mov qword ptr [rip + 0x1cead7e], 0 ; 0x101dcee80
0x1000e4102: mov dword ptr [rip + 0x1cead7c], 0 ; 0x101dcee88
0x1000e410c: mov qword ptr [rip + 0x1ceae99], 0 ; 0x101dcefb0
0x1000e4117: mov dword ptr [rip + 0x1ceae97], 0 ; 0x101dcefb8
0x1000e4121: mov qword ptr [rip + 0x1ceafb4], 0 ; 0x101dcf0e0
0x1000e412c: mov dword ptr [rip + 0x1ceafb2], 0 ; 0x101dcf0e8
0x1000e4136: mov qword ptr [rip + 0x1ceb0cf], 0 ; 0x101dcf210
0x1000e4141: mov dword ptr [rip + 0x1ceb0cd], 0 ; 0x101dcf218
0x1000e414b: mov qword ptr [rip + 0x1ceb1ea], 0 ; 0x101dcf340
0x1000e4156: mov dword ptr [rip + 0x1ceb1e8], 0 ; 0x101dcf348
0x1000e4160: mov qword ptr [rip + 0x1ceb305], 0 ; 0x101dcf470
0x1000e416b: mov dword ptr [rip + 0x1ceb303], 0 ; 0x101dcf478
0x1000e4175: mov qword ptr [rip + 0x1ceb420], 0 ; 0x101dcf5a0
0x1000e4180: mov dword ptr [rip + 0x1ceb41e], 0 ; 0x101dcf5a8
0x1000e418a: mov qword ptr [rip + 0x1ceb53b], 0 ; 0x101dcf6d0
0x1000e4195: mov dword ptr [rip + 0x1ceb539], 0 ; 0x101dcf6d8
0x1000e419f: mov qword ptr [rip + 0x1ceb656], 0 ; 0x101dcf800
0x1000e41aa: mov dword ptr [rip + 0x1ceb654], 0 ; 0x101dcf808
0x1000e41b4: mov qword ptr [rip + 0x1ceb771], 0 ; 0x101dcf930
0x1000e41bf: mov dword ptr [rip + 0x1ceb76f], 0 ; 0x101dcf938
0x1000e41c9: mov qword ptr [rip + 0x1ceb88c], 0 ; 0x101dcfa60
0x1000e41d4: mov dword ptr [rip + 0x1ceb88a], 0 ; 0x101dcfa68
0x1000e41de: mov qword ptr [rip + 0x1ceb9a7], 0 ; 0x101dcfb90
0x1000e41e9: mov dword ptr [rip + 0x1ceb9a5], 0 ; 0x101dcfb98
0x1000e41f3: mov qword ptr [rip + 0x1cebac2], 0 ; 0x101dcfcc0
0x1000e41fe: mov dword ptr [rip + 0x1cebac0], 0 ; 0x101dcfcc8
0x1000e4208: mov qword ptr [rip + 0x1cebbdd], 0 ; 0x101dcfdf0
0x1000e4213: mov dword ptr [rip + 0x1cebbdb], 0 ; 0x101dcfdf8
0x1000e421d: mov dword ptr [rip + 0x1cebd09], 0 ; 0x101dcff30
0x1000e4227: mov dword ptr [rip + 0x1cee8c7], 0 ; 0x101dd2af8
0x1000e4231: lea rax, [rip + 0x1cee8e8] ; 0x101dd2b20
0x1000e4238: vmovq xmm0, rax
0x1000e423d: lea rax, [rip + 0xa81e8d] ; 0x100b660d1 g_animationList
0x1000e4244: vmovq xmm1, rax
0x1000e4249: vpunpcklqdq xmm0, xmm1, xmm0
0x1000e424d: vmovdqa xmmword ptr [rip + 0x1cee8db], xmm0 ; 0x101dd2b30
0x1000e4255: lea rax, [rip + 0x1cee8d4] ; 0x101dd2b30
0x1000e425c: mov qword ptr [rip + 0x1cee8d9], 8 ; 0x101dd2b40
0x1000e4267: mov rcx, qword ptr [rip + 0xbb4e72] ; 0x100c990e0
0x1000e426e: mov qword ptr [rip + 0x1cee8d3], rcx ; 0x101dd2b48
0x1000e4275: mov qword ptr [rip + 0xbb4e64], rax ; 0x100c990e0
0x1000e427c: mov qword ptr [rip + 0x1cee8c9], 0 ; 0x101dd2b50
0x1000e4287: mov qword ptr [rip + 0x1cee8ce], 0 ; 0x101dd2b60
0x1000e4292: add rsp, 8
0x1000e4296: pop rbx
0x1000e4297: pop r12
0x1000e4299: pop r13
0x1000e429b: pop r14
0x1000e429d: pop r15
0x1000e429f: pop rbp
0x1000e42a0: ret 
0x1000e42a1: nop 
0x1000e42a2: nop 
0x1000e42a3: nop 
0x1000e42a4: nop 
0x1000e42a5: nop 
0x1000e42a6: nop 
0x1000e42a7: nop 
0x1000e42a8: nop 
0x1000e42a9: nop 
0x1000e42aa: nop 
0x1000e42ab: nop 
0x1000e42ac: nop 
0x1000e42ad: nop 
0x1000e42ae: nop 
0x1000e42af: nop 
