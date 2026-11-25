0x100611240: push rbp
0x100611241: mov rbp, rsp
0x100611244: push r15
0x100611246: push r14
0x100611248: push r13
0x10061124a: push r12
0x10061124c: push rbx
0x10061124d: sub rsp, 0x48
0x100611251: mov dword ptr [rip + 0x71b805], 0 ; 0x100d2ca60
0x10061125b: lea r12, [rip + 0x57f500] ; 0x100b90762 SoundEmitter
0x100611262: mov qword ptr [rip + 0x1a188cf], r12 ; 0x102029b38
0x100611269: lea rax, [rip + 0x1a188c0] ; 0x102029b30
0x100611270: mov qword ptr [rip + 0x1a188c5], 0 ; 0x102029b40
0x10061127b: mov rcx, qword ptr [rip + 0x65ecd6] ; 0x100c6ff58
0x100611282: mov qword ptr [rip + 0x1a188bf], rcx ; 0x102029b48
0x100611289: mov qword ptr [rip + 0x65ecc8], rax ; 0x100c6ff58
0x100611290: mov qword ptr [rip + 0x1a188c1], rax ; 0x102029b58
0x100611297: lea rax, [rip - 0x5db9de] ; 0x1000358c0
0x10061129e: mov qword ptr [rip + 0x1a188bb], rax ; 0x102029b60
0x1006112a5: mov qword ptr [rip + 0x1a188b8], 0xffffffffffffffff ; 0x102029b68
0x1006112b0: mov qword ptr [rip + 0x1a188cd], 0 ; 0x102029b88
0x1006112bb: mov rax, qword ptr [rip + 0x5f9d8e] ; 0x100c0b050
0x1006112c2: add rax, 0x10
0x1006112c6: mov qword ptr [rip + 0x1a18863], rax ; 0x102029b30
0x1006112cd: xor eax, eax
0x1006112cf: call 0x100011c10 ; 0x100011c10
0x1006112d4: lea rax, [rip + 0x54ed61] ; 0x100b6003c Tool_Export
0x1006112db: vmovq xmm0, rax
0x1006112e0: lea rax, [rip + 0x54d6f8] ; 0x100b5e9df true
0x1006112e7: vmovq xmm8, rax
0x1006112ec: vpunpcklqdq xmm0, xmm0, xmm8
0x1006112f1: vmovdqa xmmword ptr [rip + 0x1a18897], xmm0 ; 0x102029b90
0x1006112f9: lea rax, [rip + 0x1a18890] ; 0x102029b90
0x100611300: mov rcx, qword ptr [rip + 0x1a18839] ; 0x102029b40
0x100611307: mov qword ptr [rip + 0x1a18892], rcx ; 0x102029ba0
0x10061130e: mov qword ptr [rip + 0x1a1882b], rax ; 0x102029b40
0x100611315: lea rax, [rip + 0x57dd04] ; 0x100b8f020 soundName
0x10061131c: mov qword ptr [rip + 0x6e7aad], rax ; 0x100cf8dd0
0x100611323: lea rdx, [rip + 0x6e7aa6] ; 0x100cf8dd0
0x10061132a: mov qword ptr [rip + 0x6e7aa3], 0 ; 0x100cf8dd8
0x100611335: mov rax, qword ptr [rip + 0x666924] ; 0x100c77c60
0x10061133c: mov qword ptr [rip + 0x6e7a9d], rax ; 0x100cf8de0
0x100611343: mov qword ptr [rip + 0x6e7aa2], 8 ; 0x100cf8df0
0x10061134e: mov rcx, qword ptr [rip + 0x5f5a93] ; 0x100c06de8 -> 0x1000209f0 __Z17GetMetaTypeByTypeINSt3__112basic_stringIcNS0_11char_traitsIcEE16StlPoolAllocatorIcEEEERK8MetaTypev
0x100611355: mov qword ptr [rip + 0x6e7a9c], rcx ; 0x100cf8df8
0x10061135c: mov rax, qword ptr [rip + 0x5f6735] ; 0x100c07a98 -> 0x10060f890 __Z18GetMetaClassByTypeIP12SoundEmitterERK9MetaClassv
0x100611363: mov qword ptr [rip + 0x6e7a96], rax ; 0x100cf8e00
0x10061136a: mov qword ptr [rip + 0x6e7a93], 0xffffffffffffffff ; 0x100cf8e08
0x100611375: lea rbx, [rip - 0x5f795c] ; 0x100019a20
0x10061137c: mov qword ptr [rip + 0x6e7a8d], rbx ; 0x100cf8e10
0x100611383: mov qword ptr [rip + 0x6e7a8a], 0 ; 0x100cf8e18
0x10061138e: lea rsi, [rip + 0x554b8d] ; 0x100b65f22 volume
0x100611395: mov qword ptr [rip + 0x6e7a84], rsi ; 0x100cf8e20
0x10061139c: lea rsi, [rip + 0x6e7a7d] ; 0x100cf8e20
0x1006113a3: mov qword ptr [rip + 0x6e7a86], rdx ; 0x100cf8e30
0x1006113aa: mov qword ptr [rip + 0x6e7a8b], 0x20 ; 0x100cf8e40
0x1006113b5: mov r15, qword ptr [rip + 0x5f61a4] ; 0x100c07560 -> 0x10001f430 __Z17GetMetaTypeByTypeIfERK8MetaTypev
0x1006113bc: mov qword ptr [rip + 0x6e7a85], r15 ; 0x100cf8e48
0x1006113c3: mov qword ptr [rip + 0x6e7a86], rax ; 0x100cf8e50
0x1006113ca: mov qword ptr [rip + 0x6e7a83], 0xffffffffffffffff ; 0x100cf8e58
0x1006113d5: mov qword ptr [rip + 0x6e7a84], rbx ; 0x100cf8e60
0x1006113dc: mov qword ptr [rip + 0x6e7a81], 0 ; 0x100cf8e68
0x1006113e7: lea rdx, [rip + 0x562d60] ; 0x100b7414e 1.0
0x1006113ee: vmovq xmm0, rdx
0x1006113f3: lea rdx, [rip + 0x54d608] ; 0x100b5ea02 Tool_DefaultValue
0x1006113fa: vmovq xmm2, rdx
0x1006113ff: vpunpcklqdq xmm0, xmm2, xmm0
0x100611403: vmovdqa xmm5, xmm2
0x100611407: vmovdqa xmmword ptr [rip + 0x1a187a1], xmm0 ; 0x102029bb0
0x10061140f: lea rdx, [rip + 0x1a1879a] ; 0x102029bb0
0x100611416: mov qword ptr [rip + 0x1a1879f], 0 ; 0x102029bc0
0x100611421: mov qword ptr [rip + 0x6e7a00], rdx ; 0x100cf8e28
0x100611428: lea rdx, [rip + 0x585695] ; 0x100b96ac4 pitch
0x10061142f: mov qword ptr [rip + 0x6e7a3a], rdx ; 0x100cf8e70
0x100611436: lea rdx, [rip + 0x6e7a33] ; 0x100cf8e70
0x10061143d: mov qword ptr [rip + 0x6e7a3c], rsi ; 0x100cf8e80
0x100611444: mov qword ptr [rip + 0x6e7a41], 0x24 ; 0x100cf8e90
0x10061144f: mov qword ptr [rip + 0x6e7a42], r15 ; 0x100cf8e98
0x100611456: mov qword ptr [rip + 0x6e7a43], rax ; 0x100cf8ea0
0x10061145d: mov qword ptr [rip + 0x6e7a40], 0xffffffffffffffff ; 0x100cf8ea8
0x100611468: mov qword ptr [rip + 0x6e7a41], rbx ; 0x100cf8eb0
0x10061146f: mov qword ptr [rip + 0x6e7a3e], 0 ; 0x100cf8eb8
0x10061147a: vmovdqa xmmword ptr [rip + 0x1a1874e], xmm0 ; 0x102029bd0
0x100611482: lea rsi, [rip + 0x1a18747] ; 0x102029bd0
0x100611489: mov qword ptr [rip + 0x1a1874c], 0 ; 0x102029be0
0x100611494: mov qword ptr [rip + 0x6e79dd], rsi ; 0x100cf8e78
0x10061149b: lea rsi, [rip + 0x559c1d] ; 0x100b6b0bf transform
0x1006114a2: mov qword ptr [rip + 0x6e7a17], rsi ; 0x100cf8ec0
0x1006114a9: lea rsi, [rip + 0x6e7a10] ; 0x100cf8ec0
0x1006114b0: mov qword ptr [rip + 0x6e7a0d], 0 ; 0x100cf8ec8
0x1006114bb: mov qword ptr [rip + 0x6e7a0e], rdx ; 0x100cf8ed0
0x1006114c2: mov qword ptr [rip + 0x6e7a13], 0x80 ; 0x100cf8ee0
0x1006114cd: mov rdx, qword ptr [rip + 0x5f58f4] ; 0x100c06dc8 -> 0x100199090 __Z17GetMetaTypeByTypeIN10Vectormath3Aos7Matrix4EERK8MetaTypev
0x1006114d4: mov qword ptr [rip + 0x6e7a0d], rdx ; 0x100cf8ee8
0x1006114db: mov qword ptr [rip + 0x6e7a0e], rax ; 0x100cf8ef0
0x1006114e2: mov qword ptr [rip + 0x6e7a0b], 0xffffffffffffffff ; 0x100cf8ef8
0x1006114ed: mov qword ptr [rip + 0x6e7a0c], rbx ; 0x100cf8f00
0x1006114f4: mov qword ptr [rip + 0x6e7a09], 0 ; 0x100cf8f08
0x1006114ff: lea rdx, [rip + 0x5855c4] ; 0x100b96aca is3d
0x100611506: mov qword ptr [rip + 0x6e7a03], rdx ; 0x100cf8f10
0x10061150d: lea rdx, [rip + 0x6e79fc] ; 0x100cf8f10
0x100611514: mov qword ptr [rip + 0x6e7a05], rsi ; 0x100cf8f20
0x10061151b: mov qword ptr [rip + 0x6e7a0a], 0x74 ; 0x100cf8f30
0x100611526: mov rsi, qword ptr [rip + 0x5f602b] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x10061152d: mov qword ptr [rip + 0x6e7a04], rsi ; 0x100cf8f38
0x100611534: mov r8, rsi
0x100611537: mov qword ptr [rip + 0x6e7a02], rax ; 0x100cf8f40
0x10061153e: mov qword ptr [rip + 0x6e79ff], 0xffffffffffffffff ; 0x100cf8f48
0x100611549: mov qword ptr [rip + 0x6e7a00], rbx ; 0x100cf8f50
0x100611550: mov qword ptr [rip + 0x6e79fd], 0 ; 0x100cf8f58
0x10061155b: lea rsi, [rip + 0x58556d] ; 0x100b96acf 3d
0x100611562: vmovq xmm3, rsi
0x100611567: lea rsi, [rip + 0x553021] ; 0x100b6458f Tool_Category
0x10061156e: vmovq xmm2, rsi
0x100611573: vpunpcklqdq xmm3, xmm2, xmm3
0x100611577: vmovdqa xmmword ptr [rip + 0x1a18671], xmm3 ; 0x102029bf0
0x10061157f: lea rsi, [rip + 0x1a1866a] ; 0x102029bf0
0x100611586: mov qword ptr [rip + 0x1a1866f], 0 ; 0x102029c00
0x100611591: mov qword ptr [rip + 0x6e7980], rsi ; 0x100cf8f18
0x100611598: lea rsi, [rip + 0x585533] ; 0x100b96ad2 doppler
0x10061159f: mov qword ptr [rip + 0x6e79ba], rsi ; 0x100cf8f60
0x1006115a6: lea rsi, [rip + 0x6e79b3] ; 0x100cf8f60
0x1006115ad: mov qword ptr [rip + 0x6e79bc], rdx ; 0x100cf8f70
0x1006115b4: mov qword ptr [rip + 0x6e79c1], 0x78 ; 0x100cf8f80
0x1006115bf: mov qword ptr [rip + 0x6e79c2], r15 ; 0x100cf8f88
0x1006115c6: mov qword ptr [rip + 0x6e79c3], rax ; 0x100cf8f90
0x1006115cd: mov qword ptr [rip + 0x6e79c0], 0xffffffffffffffff ; 0x100cf8f98
0x1006115d8: mov qword ptr [rip + 0x6e79c1], rbx ; 0x100cf8fa0
0x1006115df: mov qword ptr [rip + 0x6e79be], 0 ; 0x100cf8fa8
0x1006115ea: vmovdqa xmmword ptr [rip + 0x1a1861e], xmm3 ; 0x102029c10
0x1006115f2: lea rdx, [rip + 0x1a18617] ; 0x102029c10
0x1006115f9: mov qword ptr [rip + 0x1a1861c], 0 ; 0x102029c20
0x100611604: mov qword ptr [rip + 0x6e795d], rdx ; 0x100cf8f68
0x10061160b: lea rdx, [rip + 0x5854c8] ; 0x100b96ada rolloff
0x100611612: mov qword ptr [rip + 0x6e7997], rdx ; 0x100cf8fb0
0x100611619: lea rdx, [rip + 0x6e7990] ; 0x100cf8fb0
0x100611620: mov qword ptr [rip + 0x6e7999], rsi ; 0x100cf8fc0
0x100611627: mov qword ptr [rip + 0x6e799e], 0x7c ; 0x100cf8fd0
0x100611632: mov rsi, qword ptr [rip + 0x5f5597] ; 0x100c06bd0 -> 0x100604bd0 __Z17GetMetaTypeByTypeI12SoundRolloffERK8MetaTypev
0x100611639: mov qword ptr [rip + 0x6e7998], rsi ; 0x100cf8fd8
0x100611640: mov qword ptr [rip + 0x6e7999], rax ; 0x100cf8fe0
0x100611647: mov qword ptr [rip + 0x6e7996], 0xffffffffffffffff ; 0x100cf8fe8
0x100611652: mov qword ptr [rip + 0x6e7997], rbx ; 0x100cf8ff0
0x100611659: mov qword ptr [rip + 0x6e7994], 0 ; 0x100cf8ff8
0x100611664: lea rsi, [rip + 0x584823] ; 0x100b95e8e SoundRolloff_LinearSquare
0x10061166b: vmovq xmm4, rsi
0x100611670: vpunpcklqdq xmm4, xmm5, xmm4
0x100611674: vmovdqa xmmword ptr [rip + 0x1a185b4], xmm4 ; 0x102029c30
0x10061167c: lea rsi, [rip + 0x1a185ad] ; 0x102029c30
0x100611683: mov qword ptr [rip + 0x1a185b2], 0 ; 0x102029c40
0x10061168e: vmovdqa xmmword ptr [rip + 0x1a185ba], xmm3 ; 0x102029c50
0x100611696: lea rdi, [rip + 0x1a185b3] ; 0x102029c50
0x10061169d: mov qword ptr [rip + 0x1a185bc], rsi ; 0x102029c60
0x1006116a4: mov qword ptr [rip + 0x6e790d], rdi ; 0x100cf8fb8
0x1006116ab: lea rsi, [rip + 0x554860] ; 0x100b65f12 minDist
0x1006116b2: mov qword ptr [rip + 0x6e7947], rsi ; 0x100cf9000
0x1006116b9: lea rsi, [rip + 0x6e7940] ; 0x100cf9000
0x1006116c0: mov qword ptr [rip + 0x6e7949], rdx ; 0x100cf9010
0x1006116c7: mov qword ptr [rip + 0x6e794e], 0xc0 ; 0x100cf9020
0x1006116d2: mov qword ptr [rip + 0x6e794f], r15 ; 0x100cf9028
0x1006116d9: mov qword ptr [rip + 0x6e7950], rax ; 0x100cf9030
0x1006116e0: mov qword ptr [rip + 0x6e794d], 0xffffffffffffffff ; 0x100cf9038
0x1006116eb: mov qword ptr [rip + 0x6e794e], rbx ; 0x100cf9040
0x1006116f2: mov qword ptr [rip + 0x6e794b], 0 ; 0x100cf9048
0x1006116fd: lea rdx, [rip + 0x563cb3] ; 0x100b753b7 10.0
0x100611704: vmovq xmm4, rdx
0x100611709: vpunpcklqdq xmm4, xmm5, xmm4
0x10061170d: vmovdqa xmmword ptr [rip + 0x1a1855b], xmm4 ; 0x102029c70
0x100611715: lea rdx, [rip + 0x1a18554] ; 0x102029c70
0x10061171c: mov qword ptr [rip + 0x1a18559], 0 ; 0x102029c80
0x100611727: vmovdqa xmmword ptr [rip + 0x1a18561], xmm3 ; 0x102029c90
0x10061172f: lea rdi, [rip + 0x1a1855a] ; 0x102029c90
0x100611736: mov qword ptr [rip + 0x1a18563], rdx ; 0x102029ca0
0x10061173d: mov qword ptr [rip + 0x6e78c4], rdi ; 0x100cf9008
0x100611744: lea rdx, [rip + 0x5547cf] ; 0x100b65f1a maxDist
0x10061174b: mov qword ptr [rip + 0x6e78fe], rdx ; 0x100cf9050
0x100611752: lea rdx, [rip + 0x6e78f7] ; 0x100cf9050
0x100611759: mov qword ptr [rip + 0x6e7900], rsi ; 0x100cf9060
0x100611760: mov qword ptr [rip + 0x6e7905], 0xc4 ; 0x100cf9070
0x10061176b: mov qword ptr [rip + 0x6e7906], r15 ; 0x100cf9078
0x100611772: mov qword ptr [rip + 0x6e7907], rax ; 0x100cf9080
0x100611779: mov qword ptr [rip + 0x6e7904], 0xffffffffffffffff ; 0x100cf9088
0x100611784: mov qword ptr [rip + 0x6e7905], rbx ; 0x100cf9090
0x10061178b: mov qword ptr [rip + 0x6e7902], 0 ; 0x100cf9098
0x100611796: lea rsi, [rip + 0x565bf0] ; 0x100b7738d 50.0
0x10061179d: vmovq xmm4, rsi
0x1006117a2: vpunpcklqdq xmm4, xmm5, xmm4
0x1006117a6: vmovdqa xmmword ptr [rip + 0x1a18502], xmm4 ; 0x102029cb0
0x1006117ae: lea rsi, [rip + 0x1a184fb] ; 0x102029cb0
0x1006117b5: mov qword ptr [rip + 0x1a18500], 0 ; 0x102029cc0
0x1006117c0: vmovdqa xmmword ptr [rip + 0x1a18508], xmm3 ; 0x102029cd0
0x1006117c8: lea rdi, [rip + 0x1a18501] ; 0x102029cd0
0x1006117cf: mov qword ptr [rip + 0x1a1850a], rsi ; 0x102029ce0
0x1006117d6: mov qword ptr [rip + 0x6e787b], rdi ; 0x100cf9058
0x1006117dd: lea rsi, [rip + 0x5852fe] ; 0x100b96ae2 minAngle
0x1006117e4: mov qword ptr [rip + 0x6e78b5], rsi ; 0x100cf90a0
0x1006117eb: lea rsi, [rip + 0x6e78ae] ; 0x100cf90a0
0x1006117f2: mov qword ptr [rip + 0x6e78b7], rdx ; 0x100cf90b0
0x1006117f9: mov qword ptr [rip + 0x6e78bc], 0xc8 ; 0x100cf90c0
0x100611804: mov qword ptr [rip + 0x6e78bd], r15 ; 0x100cf90c8
0x10061180b: mov qword ptr [rip + 0x6e78be], rax ; 0x100cf90d0
0x100611812: mov qword ptr [rip + 0x6e78bb], 0xffffffffffffffff ; 0x100cf90d8
0x10061181d: mov qword ptr [rip + 0x6e78bc], rbx ; 0x100cf90e0
0x100611824: mov qword ptr [rip + 0x6e78b9], 0 ; 0x100cf90e8
0x10061182f: lea rdx, [rip + 0x5852b5] ; 0x100b96aeb 90.0
0x100611836: vmovq xmm3, rdx
0x10061183b: vpunpcklqdq xmm3, xmm5, xmm3
0x10061183f: vmovdqa xmmword ptr [rip + 0x1a184a9], xmm3 ; 0x102029cf0
0x100611847: lea rdx, [rip + 0x1a184a2] ; 0x102029cf0
0x10061184e: mov qword ptr [rip + 0x1a184a7], 0 ; 0x102029d00
0x100611859: lea rdi, [rip + 0x585290] ; 0x100b96af0 3d Cone
0x100611860: vmovq xmm3, rdi
0x100611865: vpunpcklqdq xmm3, xmm2, xmm3
0x100611869: vmovdqa xmmword ptr [rip + 0x1a1849f], xmm3 ; 0x102029d10
0x100611871: lea rdi, [rip + 0x1a18498] ; 0x102029d10
0x100611878: mov qword ptr [rip + 0x1a184a1], rdx ; 0x102029d20
0x10061187f: mov qword ptr [rip + 0x6e7822], rdi ; 0x100cf90a8
0x100611886: lea rdx, [rip + 0x58526b] ; 0x100b96af8 maxAngle
0x10061188d: mov qword ptr [rip + 0x6e785c], rdx ; 0x100cf90f0
0x100611894: lea rdx, [rip + 0x6e7855] ; 0x100cf90f0
0x10061189b: mov qword ptr [rip + 0x6e785e], rsi ; 0x100cf9100
0x1006118a2: mov qword ptr [rip + 0x6e7863], 0xcc ; 0x100cf9110
0x1006118ad: mov qword ptr [rip + 0x6e7864], r15 ; 0x100cf9118
0x1006118b4: mov qword ptr [rip + 0x6e7865], rax ; 0x100cf9120
0x1006118bb: mov qword ptr [rip + 0x6e7862], 0xffffffffffffffff ; 0x100cf9128
0x1006118c6: mov qword ptr [rip + 0x6e7863], rbx ; 0x100cf9130
0x1006118cd: mov qword ptr [rip + 0x6e7860], 0 ; 0x100cf9138
0x1006118d8: lea rsi, [rip + 0x585222] ; 0x100b96b01 180.0
0x1006118df: vmovq xmm4, rsi
0x1006118e4: vpunpcklqdq xmm4, xmm5, xmm4
0x1006118e8: vmovdqa xmmword ptr [rip + 0x1a18440], xmm4 ; 0x102029d30
0x1006118f0: lea rsi, [rip + 0x1a18439] ; 0x102029d30
0x1006118f7: mov qword ptr [rip + 0x1a1843e], 0 ; 0x102029d40
0x100611902: vmovdqa xmmword ptr [rip + 0x1a18446], xmm3 ; 0x102029d50
0x10061190a: lea rdi, [rip + 0x1a1843f] ; 0x102029d50
0x100611911: mov qword ptr [rip + 0x1a18448], rsi ; 0x102029d60
0x100611918: mov qword ptr [rip + 0x6e77d9], rdi ; 0x100cf90f8
0x10061191f: lea rsi, [rip + 0x5851e1] ; 0x100b96b07 maxAngleVolume
0x100611926: mov qword ptr [rip + 0x6e7813], rsi ; 0x100cf9140
0x10061192d: lea rsi, [rip + 0x6e780c] ; 0x100cf9140
0x100611934: mov qword ptr [rip + 0x6e7815], rdx ; 0x100cf9150
0x10061193b: mov qword ptr [rip + 0x6e781a], 0xd0 ; 0x100cf9160
0x100611946: mov qword ptr [rip + 0x6e781b], r15 ; 0x100cf9168
0x10061194d: mov qword ptr [rip + 0x6e781c], rax ; 0x100cf9170
0x100611954: mov qword ptr [rip + 0x6e7819], 0xffffffffffffffff ; 0x100cf9178
0x10061195f: mov qword ptr [rip + 0x6e781a], rbx ; 0x100cf9180
0x100611966: mov qword ptr [rip + 0x6e7817], 0 ; 0x100cf9188
0x100611971: vmovdqa xmmword ptr [rip + 0x1a183f7], xmm0 ; 0x102029d70
0x100611979: lea rdx, [rip + 0x1a183f0] ; 0x102029d70
0x100611980: mov qword ptr [rip + 0x1a183f5], 0 ; 0x102029d80
0x10061198b: vmovdqa xmmword ptr [rip + 0x1a183fd], xmm3 ; 0x102029d90
0x100611993: lea rdi, [rip + 0x1a183f6] ; 0x102029d90
0x10061199a: mov qword ptr [rip + 0x1a183ff], rdx ; 0x102029da0
0x1006119a1: mov qword ptr [rip + 0x6e77a0], rdi ; 0x100cf9148
0x1006119a8: lea rdx, [rip + 0x585167] ; 0x100b96b16 spreadA
0x1006119af: mov qword ptr [rip + 0x6e77da], rdx ; 0x100cf9190
0x1006119b6: lea rdx, [rip + 0x6e77d3] ; 0x100cf9190
0x1006119bd: mov qword ptr [rip + 0x6e77dc], rsi ; 0x100cf91a0
0x1006119c4: mov qword ptr [rip + 0x6e77e1], 0xd4 ; 0x100cf91b0
0x1006119cf: mov qword ptr [rip + 0x6e77e2], r15 ; 0x100cf91b8
0x1006119d6: mov qword ptr [rip + 0x6e77e3], rax ; 0x100cf91c0
0x1006119dd: mov qword ptr [rip + 0x6e77e0], 0xffffffffffffffff ; 0x100cf91c8
0x1006119e8: mov qword ptr [rip + 0x6e77e1], rbx ; 0x100cf91d0
0x1006119ef: mov qword ptr [rip + 0x6e77de], 0 ; 0x100cf91d8
0x1006119fa: lea rsi, [rip + 0x562713] ; 0x100b74114 0.0
0x100611a01: vmovq xmm3, rsi
0x100611a06: vpunpcklqdq xmm4, xmm5, xmm3
0x100611a0a: vmovdqa xmmword ptr [rip + 0x1a1839e], xmm4 ; 0x102029db0
0x100611a12: lea rsi, [rip + 0x1a18397] ; 0x102029db0
0x100611a19: mov qword ptr [rip + 0x1a1839c], 0 ; 0x102029dc0
0x100611a24: lea rdi, [rip + 0x5850f3] ; 0x100b96b1e 3d Spread
0x100611a2b: vmovq xmm3, rdi
0x100611a30: vpunpcklqdq xmm3, xmm2, xmm3
0x100611a34: vmovdqa xmmword ptr [rip + 0x1a18394], xmm3 ; 0x102029dd0
0x100611a3c: lea rdi, [rip + 0x1a1838d] ; 0x102029dd0
0x100611a43: mov qword ptr [rip + 0x1a18396], rsi ; 0x102029de0
0x100611a4a: mov qword ptr [rip + 0x6e7747], rdi ; 0x100cf9198
0x100611a51: lea rsi, [rip + 0x5850d0] ; 0x100b96b28 spreadB
0x100611a58: mov qword ptr [rip + 0x6e7781], rsi ; 0x100cf91e0
0x100611a5f: lea rsi, [rip + 0x6e777a] ; 0x100cf91e0
0x100611a66: mov qword ptr [rip + 0x6e7783], rdx ; 0x100cf91f0
0x100611a6d: mov qword ptr [rip + 0x6e7788], 0xd8 ; 0x100cf9200
0x100611a78: mov qword ptr [rip + 0x6e7789], r15 ; 0x100cf9208
0x100611a7f: mov qword ptr [rip + 0x6e778a], rax ; 0x100cf9210
0x100611a86: mov qword ptr [rip + 0x6e7787], 0xffffffffffffffff ; 0x100cf9218
0x100611a91: mov qword ptr [rip + 0x6e7788], rbx ; 0x100cf9220
0x100611a98: mov qword ptr [rip + 0x6e7785], 0 ; 0x100cf9228
0x100611aa3: vmovdqa xmmword ptr [rip + 0x1a18345], xmm4 ; 0x102029df0
0x100611aab: lea rdx, [rip + 0x1a1833e] ; 0x102029df0
0x100611ab2: mov qword ptr [rip + 0x1a18343], 0 ; 0x102029e00
0x100611abd: vmovdqa xmmword ptr [rip + 0x1a1834b], xmm3 ; 0x102029e10
0x100611ac5: lea rdi, [rip + 0x1a18344] ; 0x102029e10
0x100611acc: mov qword ptr [rip + 0x1a1834d], rdx ; 0x102029e20
0x100611ad3: mov qword ptr [rip + 0x6e770e], rdi ; 0x100cf91e8
0x100611ada: lea rdx, [rip + 0x58504f] ; 0x100b96b30 spreadADist
0x100611ae1: mov qword ptr [rip + 0x6e7748], rdx ; 0x100cf9230
0x100611ae8: lea rdx, [rip + 0x6e7741] ; 0x100cf9230
0x100611aef: mov qword ptr [rip + 0x6e774a], rsi ; 0x100cf9240
0x100611af6: mov qword ptr [rip + 0x6e774f], 0xdc ; 0x100cf9250
0x100611b01: mov qword ptr [rip + 0x6e7750], r15 ; 0x100cf9258
0x100611b08: mov qword ptr [rip + 0x6e7751], rax ; 0x100cf9260
0x100611b0f: mov qword ptr [rip + 0x6e774e], 0xffffffffffffffff ; 0x100cf9268
0x100611b1a: mov qword ptr [rip + 0x6e774f], rbx ; 0x100cf9270
0x100611b21: mov qword ptr [rip + 0x6e774c], 0 ; 0x100cf9278
0x100611b2c: lea rsi, [rip + 0x567141] ; 0x100b78c74 5.0
0x100611b33: vmovq xmm4, rsi
0x100611b38: vpunpcklqdq xmm4, xmm5, xmm4
0x100611b3c: vmovdqa xmmword ptr [rip + 0x1a182ec], xmm4 ; 0x102029e30
0x100611b44: lea rsi, [rip + 0x1a182e5] ; 0x102029e30
0x100611b4b: mov qword ptr [rip + 0x1a182ea], 0 ; 0x102029e40
0x100611b56: vmovdqa xmmword ptr [rip + 0x1a182f2], xmm3 ; 0x102029e50
0x100611b5e: lea rdi, [rip + 0x1a182eb] ; 0x102029e50
0x100611b65: mov qword ptr [rip + 0x1a182f4], rsi ; 0x102029e60
0x100611b6c: mov qword ptr [rip + 0x6e76c5], rdi ; 0x100cf9238
0x100611b73: lea rsi, [rip + 0x584fc2] ; 0x100b96b3c spreadBDist
0x100611b7a: mov qword ptr [rip + 0x6e76ff], rsi ; 0x100cf9280
0x100611b81: lea rsi, [rip + 0x6e76f8] ; 0x100cf9280
0x100611b88: mov qword ptr [rip + 0x6e7701], rdx ; 0x100cf9290
0x100611b8f: mov qword ptr [rip + 0x6e7706], 0xe0 ; 0x100cf92a0
0x100611b9a: mov qword ptr [rip + 0x6e7707], r15 ; 0x100cf92a8
0x100611ba1: mov qword ptr [rip + 0x6e7708], rax ; 0x100cf92b0
0x100611ba8: mov qword ptr [rip + 0x6e7705], 0xffffffffffffffff ; 0x100cf92b8
0x100611bb3: mov qword ptr [rip + 0x6e7706], rbx ; 0x100cf92c0
0x100611bba: mov qword ptr [rip + 0x6e7703], 0 ; 0x100cf92c8
0x100611bc5: lea rdx, [rip + 0x584f7c] ; 0x100b96b48 15.0
0x100611bcc: vmovq xmm4, rdx
0x100611bd1: vpunpcklqdq xmm4, xmm5, xmm4
0x100611bd5: vmovdqa xmmword ptr [rip + 0x1a18293], xmm4 ; 0x102029e70
0x100611bdd: lea rdx, [rip + 0x1a1828c] ; 0x102029e70
0x100611be4: mov qword ptr [rip + 0x1a18291], 0 ; 0x102029e80
0x100611bef: vmovdqa xmmword ptr [rip + 0x1a18299], xmm3 ; 0x102029e90
0x100611bf7: lea rdi, [rip + 0x1a18292] ; 0x102029e90
0x100611bfe: mov qword ptr [rip + 0x1a1829b], rdx ; 0x102029ea0
0x100611c05: mov qword ptr [rip + 0x6e767c], rdi ; 0x100cf9288
0x100611c0c: lea rdx, [rip + 0x565a18] ; 0x100b7762b rail
0x100611c13: mov qword ptr [rip + 0x6e76b6], rdx ; 0x100cf92d0
0x100611c1a: lea rdx, [rip + 0x6e76af] ; 0x100cf92d0
0x100611c21: mov qword ptr [rip + 0x6e76b8], rsi ; 0x100cf92e0
0x100611c28: mov qword ptr [rip + 0x6e76bd], 0xe8 ; 0x100cf92f0
0x100611c33: mov rsi, qword ptr [rip + 0x5f566e] ; 0x100c072a8 -> 0x1000ec410 __Z17GetMetaTypeByTypeIP4RailERK8MetaTypev
0x100611c3a: mov qword ptr [rip + 0x6e76b7], rsi ; 0x100cf92f8
0x100611c41: mov qword ptr [rip + 0x6e76b8], rax ; 0x100cf9300
0x100611c48: mov qword ptr [rip + 0x6e76b5], 0xffffffffffffffff ; 0x100cf9308
0x100611c53: mov qword ptr [rip + 0x6e76b6], rbx ; 0x100cf9310
0x100611c5a: mov qword ptr [rip + 0x6e76b3], 0 ; 0x100cf9318
0x100611c65: lea rsi, [rip + 0x54cdad] ; 0x100b5ea19 Tool_Nullable
0x100611c6c: vmovq xmm3, rsi
0x100611c71: vpunpcklqdq xmm3, xmm3, xmm8
0x100611c76: vmovdqa xmmword ptr [rip + 0x1a18232], xmm3 ; 0x102029eb0
0x100611c7e: lea rsi, [rip + 0x1a1822b] ; 0x102029eb0
0x100611c85: mov qword ptr [rip + 0x1a18230], 0 ; 0x102029ec0
0x100611c90: lea rdi, [rip + 0x54ce00] ; 0x100b5ea97 null
0x100611c97: vmovq xmm4, rdi
0x100611c9c: vpunpcklqdq xmm4, xmm5, xmm4
0x100611ca0: vmovdqa xmm7, xmm5
0x100611ca4: vmovdqa xmmword ptr [rip + 0x1a18224], xmm4 ; 0x102029ed0
0x100611cac: lea rdi, [rip + 0x1a1821d] ; 0x102029ed0
0x100611cb3: mov qword ptr [rip + 0x1a18226], rsi ; 0x102029ee0
0x100611cba: lea rsi, [rip + 0x584e8c] ; 0x100b96b4d 3d Shape
0x100611cc1: vmovq xmm5, rsi
0x100611cc6: vpunpcklqdq xmm6, xmm2, xmm5
0x100611cca: vmovdqa xmmword ptr [rip + 0x1a1821e], xmm6 ; 0x102029ef0
0x100611cd2: lea rsi, [rip + 0x1a18217] ; 0x102029ef0
0x100611cd9: mov qword ptr [rip + 0x1a18220], rdi ; 0x102029f00
0x100611ce0: mov qword ptr [rip + 0x6e75f1], rsi ; 0x100cf92d8
0x100611ce7: lea rsi, [rip + 0x584e68] ; 0x100b96b56 obbs
0x100611cee: mov qword ptr [rip + 0x6e762b], rsi ; 0x100cf9320
0x100611cf5: lea rsi, [rip + 0x6e7624] ; 0x100cf9320
0x100611cfc: mov qword ptr [rip + 0x6e762d], rdx ; 0x100cf9330
0x100611d03: mov qword ptr [rip + 0x6e7632], 0xf0 ; 0x100cf9340
0x100611d0e: mov r13, qword ptr [rip + 0x5f55b3] ; 0x100c072c8 -> 0x10001f420 __Z17GetMetaTypeByTypeIP5ClumpERK8MetaTypev
0x100611d15: mov qword ptr [rip + 0x6e762c], r13 ; 0x100cf9348
0x100611d1c: mov qword ptr [rip + 0x6e762d], rax ; 0x100cf9350
0x100611d23: mov qword ptr [rip + 0x6e762a], 0xffffffffffffffff ; 0x100cf9358
0x100611d2e: mov qword ptr [rip + 0x6e762b], rbx ; 0x100cf9360
0x100611d35: mov qword ptr [rip + 0x6e7628], 0 ; 0x100cf9368
0x100611d40: vmovdqa xmmword ptr [rip + 0x1a181c8], xmm3 ; 0x102029f10
0x100611d48: lea rdx, [rip + 0x1a181c1] ; 0x102029f10
0x100611d4f: mov qword ptr [rip + 0x1a181c6], 0 ; 0x102029f20
0x100611d5a: vmovdqa xmmword ptr [rip + 0x1a181ce], xmm4 ; 0x102029f30
0x100611d62: lea rdi, [rip + 0x1a181c7] ; 0x102029f30
0x100611d69: mov qword ptr [rip + 0x1a181d0], rdx ; 0x102029f40
0x100611d70: lea rdx, [rip + 0x54cc84] ; 0x100b5e9fb Object
0x100611d77: vmovq xmm5, rdx
0x100611d7c: lea rdx, [rip + 0x54cc69] ; 0x100b5e9ec Tool_ClumpType
0x100611d83: vmovq xmm1, rdx
0x100611d88: vmovdqa xmmword ptr [rbp - 0x40], xmm1
0x100611d8d: vpunpcklqdq xmm5, xmm1, xmm5
0x100611d91: vmovdqa xmmword ptr [rip + 0x1a181b7], xmm5 ; 0x102029f50
0x100611d99: lea rdx, [rip + 0x1a181b0] ; 0x102029f50
0x100611da0: mov qword ptr [rip + 0x1a181b9], rdi ; 0x102029f60
0x100611da7: vmovdqa xmmword ptr [rip + 0x1a181c1], xmm6 ; 0x102029f70
0x100611daf: lea rdi, [rip + 0x1a181ba] ; 0x102029f70
0x100611db6: mov qword ptr [rip + 0x1a181c3], rdx ; 0x102029f80
0x100611dbd: mov qword ptr [rip + 0x6e7564], rdi ; 0x100cf9328
0x100611dc4: lea rdx, [rip + 0x5836cf] ; 0x100b9549a point
0x100611dcb: mov qword ptr [rip + 0x6e759e], rdx ; 0x100cf9370
0x100611dd2: lea rdx, [rip + 0x6e7597] ; 0x100cf9370
0x100611dd9: mov qword ptr [rip + 0x6e75a0], rsi ; 0x100cf9380
0x100611de0: mov qword ptr [rip + 0x6e75a5], 0xf8 ; 0x100cf9390
0x100611deb: mov rsi, qword ptr [rip + 0x5f553e] ; 0x100c07330 -> 0x100148fe0 __Z17GetMetaTypeByTypeIP6ObjectERK8MetaTypev
0x100611df2: mov qword ptr [rip + 0x6e759f], rsi ; 0x100cf9398
0x100611df9: mov qword ptr [rip + 0x6e75a0], rax ; 0x100cf93a0
0x100611e00: mov qword ptr [rip + 0x6e759d], 0xffffffffffffffff ; 0x100cf93a8
0x100611e0b: mov qword ptr [rip + 0x6e759e], rbx ; 0x100cf93b0
0x100611e12: mov qword ptr [rip + 0x6e759b], 0 ; 0x100cf93b8
0x100611e1d: vmovdqa xmmword ptr [rip + 0x1a1816b], xmm3 ; 0x102029f90
0x100611e25: lea rsi, [rip + 0x1a18164] ; 0x102029f90
0x100611e2c: mov qword ptr [rip + 0x1a18169], 0 ; 0x102029fa0
0x100611e37: vmovdqa xmmword ptr [rip + 0x1a18171], xmm4 ; 0x102029fb0
0x100611e3f: lea rdi, [rip + 0x1a1816a] ; 0x102029fb0
0x100611e46: mov qword ptr [rip + 0x1a18173], rsi ; 0x102029fc0
0x100611e4d: vmovdqa xmmword ptr [rip + 0x1a1817b], xmm5 ; 0x102029fd0
0x100611e55: lea rsi, [rip + 0x1a18174] ; 0x102029fd0
0x100611e5c: mov qword ptr [rip + 0x1a1817d], rdi ; 0x102029fe0
0x100611e63: vmovdqa xmmword ptr [rip + 0x1a18185], xmm6 ; 0x102029ff0
0x100611e6b: lea rdi, [rip + 0x1a1817e] ; 0x102029ff0
0x100611e72: mov qword ptr [rip + 0x1a18187], rsi ; 0x10202a000
0x100611e79: mov qword ptr [rip + 0x6e74f8], rdi ; 0x100cf9378
0x100611e80: lea rsi, [rip + 0x584cd4] ; 0x100b96b5b useShapeDirection
0x100611e87: mov qword ptr [rip + 0x6e7532], rsi ; 0x100cf93c0
0x100611e8e: lea rsi, [rip + 0x6e752b] ; 0x100cf93c0
0x100611e95: mov qword ptr [rip + 0x6e7534], rdx ; 0x100cf93d0
0x100611e9c: mov qword ptr [rip + 0x6e7539], 0x100 ; 0x100cf93e0
0x100611ea7: mov qword ptr [rip + 0x6e753a], r8 ; 0x100cf93e8
0x100611eae: mov qword ptr [rip + 0x6e753b], rax ; 0x100cf93f0
0x100611eb5: mov qword ptr [rip + 0x6e7538], 0xffffffffffffffff ; 0x100cf93f8
0x100611ec0: mov qword ptr [rip + 0x6e7539], rbx ; 0x100cf9400
0x100611ec7: mov qword ptr [rip + 0x6e7536], 0 ; 0x100cf9408
0x100611ed2: vpunpcklqdq xmm1, xmm7, xmm8
0x100611ed7: vmovdqa xmmword ptr [rbp - 0x70], xmm1
0x100611edc: vmovdqa xmmword ptr [rbp - 0x50], xmm7
0x100611ee1: vmovdqa xmmword ptr [rip + 0x1a18127], xmm1 ; 0x10202a010
0x100611ee9: lea rdx, [rip + 0x1a18120] ; 0x10202a010
0x100611ef0: mov qword ptr [rip + 0x1a18125], 0 ; 0x10202a020
0x100611efb: vmovdqa xmmword ptr [rip + 0x1a1812d], xmm6 ; 0x10202a030
0x100611f03: lea rdi, [rip + 0x1a18126] ; 0x10202a030
0x100611f0a: mov qword ptr [rip + 0x1a1812f], rdx ; 0x10202a040
0x100611f11: mov qword ptr [rip + 0x6e74b0], rdi ; 0x100cf93c8
0x100611f18: lea rdx, [rip + 0x584c4e] ; 0x100b96b6d param1
0x100611f1f: mov qword ptr [rip + 0x6e74ea], rdx ; 0x100cf9410
0x100611f26: lea rdx, [rip + 0x6e74e3] ; 0x100cf9410
0x100611f2d: mov qword ptr [rip + 0x6e74ec], rsi ; 0x100cf9420
0x100611f34: mov qword ptr [rip + 0x6e74f1], 0x38 ; 0x100cf9430
0x100611f3f: mov qword ptr [rip + 0x6e74f2], rcx ; 0x100cf9438
0x100611f46: mov qword ptr [rip + 0x6e74f3], rax ; 0x100cf9440
0x100611f4d: mov qword ptr [rip + 0x6e74f0], 0xffffffffffffffff ; 0x100cf9448
0x100611f58: mov qword ptr [rip + 0x6e74f1], rbx ; 0x100cf9450
0x100611f5f: mov qword ptr [rip + 0x6e74ee], 0 ; 0x100cf9458
0x100611f6a: lea rsi, [rip + 0x584c03] ; 0x100b96b74 Params
0x100611f71: vmovq xmm1, rsi
0x100611f76: vpunpcklqdq xmm1, xmm2, xmm1
0x100611f7a: vmovdqa xmmword ptr [rip + 0x1a180ce], xmm1 ; 0x10202a050
0x100611f82: lea rsi, [rip + 0x1a180c7] ; 0x10202a050
0x100611f89: mov qword ptr [rip + 0x1a180cc], 0 ; 0x10202a060
0x100611f94: mov qword ptr [rip + 0x6e747d], rsi ; 0x100cf9418
0x100611f9b: lea rsi, [rip + 0x584bd9] ; 0x100b96b7b value1
0x100611fa2: mov qword ptr [rip + 0x6e74b7], rsi ; 0x100cf9460
0x100611fa9: lea rsi, [rip + 0x6e74b0] ; 0x100cf9460
0x100611fb0: mov qword ptr [rip + 0x6e74b9], rdx ; 0x100cf9470
0x100611fb7: mov qword ptr [rip + 0x6e74be], 0x50 ; 0x100cf9480
0x100611fc2: mov qword ptr [rip + 0x6e74bf], r15 ; 0x100cf9488
0x100611fc9: mov qword ptr [rip + 0x6e74c0], rax ; 0x100cf9490
0x100611fd0: mov qword ptr [rip + 0x6e74bd], 0xffffffffffffffff ; 0x100cf9498
0x100611fdb: mov qword ptr [rip + 0x6e74be], rbx ; 0x100cf94a0
0x100611fe2: mov qword ptr [rip + 0x6e74bb], 0 ; 0x100cf94a8
0x100611fed: vmovdqa xmmword ptr [rip + 0x1a1807b], xmm0 ; 0x10202a070
0x100611ff5: lea rdx, [rip + 0x1a18074] ; 0x10202a070
0x100611ffc: mov qword ptr [rip + 0x1a18079], 0 ; 0x10202a080
0x100612007: vmovdqa xmmword ptr [rip + 0x1a18081], xmm1 ; 0x10202a090
0x10061200f: lea rdi, [rip + 0x1a1807a] ; 0x10202a090
0x100612016: mov qword ptr [rip + 0x1a18083], rdx ; 0x10202a0a0
0x10061201d: mov qword ptr [rip + 0x6e7444], rdi ; 0x100cf9468
0x100612024: lea rdx, [rip + 0x584b57] ; 0x100b96b82 param2
0x10061202b: mov qword ptr [rip + 0x6e747e], rdx ; 0x100cf94b0
0x100612032: lea rdx, [rip + 0x6e7477] ; 0x100cf94b0
0x100612039: mov qword ptr [rip + 0x6e7480], rsi ; 0x100cf94c0
0x100612040: mov qword ptr [rip + 0x6e7485], 0x58 ; 0x100cf94d0
0x10061204b: mov qword ptr [rip + 0x6e7486], rcx ; 0x100cf94d8
0x100612052: mov qword ptr [rip + 0x6e7487], rax ; 0x100cf94e0
0x100612059: mov qword ptr [rip + 0x6e7484], 0xffffffffffffffff ; 0x100cf94e8
0x100612064: mov qword ptr [rip + 0x6e7485], rbx ; 0x100cf94f0
0x10061206b: mov qword ptr [rip + 0x6e7482], 0 ; 0x100cf94f8
0x100612076: vmovdqa xmmword ptr [rip + 0x1a18032], xmm1 ; 0x10202a0b0
0x10061207e: lea rcx, [rip + 0x1a1802b] ; 0x10202a0b0
0x100612085: mov qword ptr [rip + 0x1a18030], 0 ; 0x10202a0c0
0x100612090: mov qword ptr [rip + 0x6e7421], rcx ; 0x100cf94b8
0x100612097: lea rcx, [rip + 0x584aeb] ; 0x100b96b89 value2
0x10061209e: mov qword ptr [rip + 0x6e745b], rcx ; 0x100cf9500
0x1006120a5: lea rcx, [rip + 0x6e7454] ; 0x100cf9500
0x1006120ac: mov qword ptr [rip + 0x6e745d], rdx ; 0x100cf9510
0x1006120b3: mov qword ptr [rip + 0x6e7462], 0x70 ; 0x100cf9520
0x1006120be: mov qword ptr [rip + 0x6e7463], r15 ; 0x100cf9528
0x1006120c5: mov qword ptr [rip + 0x6e7464], rax ; 0x100cf9530
0x1006120cc: mov qword ptr [rip + 0x6e7461], 0xffffffffffffffff ; 0x100cf9538
0x1006120d7: mov qword ptr [rip + 0x6e7462], rbx ; 0x100cf9540
0x1006120de: mov qword ptr [rip + 0x6e745f], 0 ; 0x100cf9548
0x1006120e9: vmovdqa xmmword ptr [rip + 0x1a17fdf], xmm0 ; 0x10202a0d0
0x1006120f1: lea rdx, [rip + 0x1a17fd8] ; 0x10202a0d0
0x1006120f8: mov qword ptr [rip + 0x1a17fdd], 0 ; 0x10202a0e0
0x100612103: vmovdqa xmmword ptr [rip + 0x1a17fe5], xmm1 ; 0x10202a0f0
0x10061210b: lea rsi, [rip + 0x1a17fde] ; 0x10202a0f0
0x100612112: mov qword ptr [rip + 0x1a17fe7], rdx ; 0x10202a100
0x100612119: mov qword ptr [rip + 0x6e73e8], rsi ; 0x100cf9508
0x100612120: lea rdx, [rip + 0x584a69] ; 0x100b96b90 autoPlay
0x100612127: mov qword ptr [rip + 0x6e7422], rdx ; 0x100cf9550
0x10061212e: lea rdx, [rip + 0x6e741b] ; 0x100cf9550
0x100612135: mov qword ptr [rip + 0x6e7418], 0 ; 0x100cf9558
0x100612140: mov qword ptr [rip + 0x6e7419], rcx ; 0x100cf9560
0x100612147: mov qword ptr [rip + 0x6e741e], 4 ; 0x100cf9570
0x100612152: mov qword ptr [rip + 0x6e741f], r8 ; 0x100cf9578
0x100612159: mov r14, r8
0x10061215c: mov qword ptr [rip + 0x6e741d], rax ; 0x100cf9580
0x100612163: mov qword ptr [rip + 0x6e741a], 0xffffffffffffffff ; 0x100cf9588
0x10061216e: mov qword ptr [rip + 0x6e741b], rbx ; 0x100cf9590
0x100612175: mov qword ptr [rip + 0x6e7418], 0 ; 0x100cf9598
0x100612180: lea rcx, [rip + 0x552c68] ; 0x100b64def onFinish
0x100612187: mov qword ptr [rip + 0x6e7412], rcx ; 0x100cf95a0
0x10061218e: lea rcx, [rip + 0x6e740b] ; 0x100cf95a0
0x100612195: mov qword ptr [rip + 0x6e7414], rdx ; 0x100cf95b0
0x10061219c: mov qword ptr [rip + 0x6e7419], 0x28 ; 0x100cf95c0
0x1006121a7: mov qword ptr [rip + 0x6e741a], r13 ; 0x100cf95c8
0x1006121ae: mov qword ptr [rip + 0x6e741b], rax ; 0x100cf95d0
0x1006121b5: mov qword ptr [rip + 0x6e7418], 0xffffffffffffffff ; 0x100cf95d8
0x1006121c0: mov qword ptr [rip + 0x6e7419], rbx ; 0x100cf95e0
0x1006121c7: mov qword ptr [rip + 0x6e7416], 0 ; 0x100cf95e8
0x1006121d2: vmovdqa xmmword ptr [rip + 0x1a17f36], xmm3 ; 0x10202a110
0x1006121da: lea rdx, [rip + 0x1a17f2f] ; 0x10202a110
0x1006121e1: mov qword ptr [rip + 0x1a17f34], 0 ; 0x10202a120
0x1006121ec: vmovdqa xmmword ptr [rip + 0x1a17f3c], xmm4 ; 0x10202a130
0x1006121f4: lea rsi, [rip + 0x1a17f35] ; 0x10202a130
0x1006121fb: mov qword ptr [rip + 0x1a17f3e], rdx ; 0x10202a140
0x100612202: vmovdqa xmmword ptr [rip + 0x1a17f46], xmm5 ; 0x10202a150
0x10061220a: lea rdx, [rip + 0x1a17f3f] ; 0x10202a150
0x100612211: mov qword ptr [rip + 0x1a17f48], rsi ; 0x10202a160
0x100612218: mov qword ptr [rip + 0x6e7389], rdx ; 0x100cf95a8
0x10061221f: lea rdx, [rip + 0x57e3dc] ; 0x100b90602 mixChannel
0x100612226: mov qword ptr [rip + 0x6e73c3], rdx ; 0x100cf95f0
0x10061222d: lea rdx, [rip + 0x6e73bc] ; 0x100cf95f0
0x100612234: mov qword ptr [rip + 0x6e73c5], rcx ; 0x100cf9600
0x10061223b: mov qword ptr [rip + 0x665a1e], rdx ; 0x100c77c60
0x100612242: mov qword ptr [rip + 0x6e73c3], 0x30 ; 0x100cf9610
0x10061224d: mov rcx, qword ptr [rip + 0x5f492c] ; 0x100c06b80 PTS
0x100612254: mov qword ptr [rip + 0x6e73bd], rcx ; 0x100cf9618
0x10061225b: mov qword ptr [rip + 0x6e73be], rax ; 0x100cf9620
0x100612262: mov qword ptr [rip + 0x6e73bb], 0xffffffffffffffff ; 0x100cf9628
0x10061226d: mov qword ptr [rip + 0x6e73bc], rbx ; 0x100cf9630
0x100612274: mov qword ptr [rip + 0x6e73b9], 0 ; 0x100cf9638
0x10061227f: lea rcx, [rip + 0x57e387] ; 0x100b9060d MixChannel_Master
0x100612286: vmovq xmm0, rcx
0x10061228b: vpunpcklqdq xmm0, xmm7, xmm0
0x10061228f: vmovdqa xmmword ptr [rip + 0x1a17ed9], xmm0 ; 0x10202a170
0x100612297: lea rcx, [rip + 0x1a17ed2] ; 0x10202a170
0x10061229e: mov qword ptr [rip + 0x1a17ed7], 0 ; 0x10202a180
0x1006122a9: mov qword ptr [rip + 0x6e7348], rcx ; 0x100cf95f8
0x1006122b0: lea rcx, [rip + 0x564d8a] ; 0x100b77041 SetTransform
0x1006122b7: mov qword ptr [rip + 0x1a17eca], rcx ; 0x10202a188
0x1006122be: lea rcx, [rip + 0x1a17ec3] ; 0x10202a188
0x1006122c5: mov qword ptr [rip + 0x1a17ec0], 0 ; 0x10202a190
0x1006122d0: mov rdx, qword ptr [rip + 0x65dc89] ; 0x100c6ff60
0x1006122d7: mov qword ptr [rip + 0x1a17eba], rdx ; 0x10202a198
0x1006122de: lea rdx, [rip - 0x7ee5] ; 0x10060a400
0x1006122e5: vmovq xmm0, rdx
0x1006122ea: vmovdqu xmmword ptr [rip + 0x1a17ece], xmm0 ; 0x10202a1c0
0x1006122f2: mov rdx, qword ptr [rip + 0x5f34cf] ; 0x100c057c8 -> 0x10060f920 __Z12ApplyWrapperI12SoundEmitterMS0_FvRKN10Vectormath3Aos7Matrix4EEEvM9VoidClassFvvEPv8VariablePSC_j
0x1006122f9: mov qword ptr [rip + 0x1a17ed0], rdx ; 0x10202a1d0
0x100612300: mov rdx, qword ptr [rip + 0x5f6d51] ; 0x100c09058 -> 0x10060f9c0 __Z21InitFunctionSignatureIM12SoundEmitterFvRKN10Vectormath3Aos7Matrix4EEEvP17FunctionSignature
0x100612307: mov qword ptr [rip + 0x1a17eca], rdx ; 0x10202a1d8
0x10061230e: mov qword ptr [rip + 0x1a17ecb], rax ; 0x10202a1e0
0x100612315: lea rdx, [rip + 0x560f43] ; 0x100b7325f GetTransform
0x10061231c: mov qword ptr [rip + 0x1a17ec5], rdx ; 0x10202a1e8
0x100612323: lea rdx, [rip + 0x1a17ebe] ; 0x10202a1e8
0x10061232a: mov qword ptr [rip + 0x1a17ebb], 0 ; 0x10202a1f0
0x100612335: mov qword ptr [rip + 0x1a17ebc], rcx ; 0x10202a1f8
0x10061233c: lea rcx, [rip - 0x7f03] ; 0x10060a440
0x100612343: vmovq xmm0, rcx
0x100612348: vmovdqu xmmword ptr [rip + 0x1a17ed0], xmm0 ; 0x10202a220
0x100612350: mov rcx, qword ptr [rip + 0x5f3481] ; 0x100c057d8 -> 0x10060fa40 __Z12ApplyWrapperI12SoundEmitterMS0_KFN10Vectormath3Aos7Matrix4EvEEvM9VoidClassFvvEPv8VariablePSA_j
0x100612357: mov qword ptr [rip + 0x1a17ed2], rcx ; 0x10202a230
0x10061235e: mov rcx, qword ptr [rip + 0x5f6d03] ; 0x100c09068 -> 0x10060fad0 __Z21InitFunctionSignatureIM12SoundEmitterKFN10Vectormath3Aos7Matrix4EvEEvP17FunctionSignature
0x100612365: mov qword ptr [rip + 0x1a17ecc], rcx ; 0x10202a238
0x10061236c: mov qword ptr [rip + 0x1a17ecd], rax ; 0x10202a240
0x100612373: lea rcx, [rip + 0x564cd4] ; 0x100b7704e SetEnabled
0x10061237a: mov qword ptr [rip + 0x1a17ec7], rcx ; 0x10202a248
0x100612381: lea rcx, [rip + 0x1a17ec0] ; 0x10202a248
0x100612388: mov qword ptr [rip + 0x1a17ebd], 0 ; 0x10202a250
0x100612393: mov qword ptr [rip + 0x1a17ebe], rdx ; 0x10202a258
0x10061239a: lea rdx, [rip - 0x7f21] ; 0x10060a480
0x1006123a1: vmovq xmm0, rdx
0x1006123a6: vmovdqu xmmword ptr [rip + 0x1a17ed2], xmm0 ; 0x10202a280
0x1006123ae: mov rdx, qword ptr [rip + 0x5f341b] ; 0x100c057d0 -> 0x10060fb00 __Z12ApplyWrapperI12SoundEmitterMS0_FvbEEvM9VoidClassFvvEPv8VariablePS7_j
0x1006123b5: mov qword ptr [rip + 0x1a17ed4], rdx ; 0x10202a290
0x1006123bc: mov rdx, qword ptr [rip + 0x5f6c9d] ; 0x100c09060 -> 0x10060fba0 __Z21InitFunctionSignatureIM12SoundEmitterFvbEEvP17FunctionSignature
0x1006123c3: mov qword ptr [rip + 0x1a17ece], rdx ; 0x10202a298
0x1006123ca: mov qword ptr [rip + 0x1a17ecf], rax ; 0x10202a2a0
0x1006123d1: lea rdx, [rip + 0x560e9b] ; 0x100b73273 GetEnabled
0x1006123d8: mov qword ptr [rip + 0x1a17ec9], rdx ; 0x10202a2a8
0x1006123df: lea rdx, [rip + 0x1a17ec2] ; 0x10202a2a8
0x1006123e6: mov qword ptr [rip + 0x1a17ebf], 0 ; 0x10202a2b0
0x1006123f1: mov qword ptr [rip + 0x1a17ec0], rcx ; 0x10202a2b8
0x1006123f8: mov qword ptr [rip + 0x65db61], rdx ; 0x100c6ff60
0x1006123ff: lea rcx, [rip - 0x7f26] ; 0x10060a4e0
0x100612406: vmovq xmm0, rcx
0x10061240b: vmovdqu xmmword ptr [rip + 0x1a17ecd], xmm0 ; 0x10202a2e0
0x100612413: mov rcx, qword ptr [rip + 0x5f33a6] ; 0x100c057c0 -> 0x10060fc20 __Z12ApplyWrapperI12SoundEmitterMS0_FbvEEvM9VoidClassFvvEPv8VariablePS7_j
0x10061241a: mov qword ptr [rip + 0x1a17ecf], rcx ; 0x10202a2f0
0x100612421: mov rcx, qword ptr [rip + 0x5f6c28] ; 0x100c09050 -> 0x10060fca0 __Z21InitFunctionSignatureIM12SoundEmitterFbvEEvP17FunctionSignature
0x100612428: mov qword ptr [rip + 0x1a17ec9], rcx ; 0x10202a2f8
0x10061242f: mov qword ptr [rip + 0x1a17eca], rax ; 0x10202a300
0x100612436: lea rax, [rip + 0x58475c] ; 0x100b96b99 SoundEmitterBarn
0x10061243d: mov qword ptr [rip + 0x1a17ecc], rax ; 0x10202a310
0x100612444: lea rax, [rip + 0x1a17ebd] ; 0x10202a308
0x10061244b: mov qword ptr [rip + 0x1a17ec2], 0 ; 0x10202a318
0x100612456: mov rcx, qword ptr [rip + 0x65dafb] ; 0x100c6ff58
0x10061245d: mov qword ptr [rip + 0x1a17ebc], rcx ; 0x10202a320
0x100612464: mov qword ptr [rip + 0x65daed], rax ; 0x100c6ff58
0x10061246b: mov qword ptr [rip + 0x1a17ebe], rax ; 0x10202a330
0x100612472: mov rax, qword ptr [rip + 0x5f6237] ; 0x100c086b0 -> 0x100011c00 __Z18GetMetaClassByTypeIP6ModuleERK9MetaClassv
0x100612479: mov qword ptr [rip + 0x1a17eb8], rax ; 0x10202a338
0x100612480: mov dword ptr [rip + 0x1a17eb6], 0xffffffff ; 0x10202a340
0x10061248a: mov dword ptr [rip + 0x1a17eb0], 0xffffffff ; 0x10202a344
0x100612494: mov qword ptr [rip + 0x1a17ec1], 0 ; 0x10202a360
0x10061249f: mov rax, qword ptr [rip + 0x5f955a] ; 0x100c0ba00
0x1006124a6: add rax, 0x10
0x1006124aa: mov qword ptr [rip + 0x1a17e57], rax ; 0x10202a308
0x1006124b1: xor eax, eax
0x1006124b3: call 0x100011c10 ; 0x100011c10
0x1006124b8: lea rax, [rip + 0x54a44d] ; 0x100b5c90c Initialize
0x1006124bf: mov qword ptr [rip + 0x1a17ea2], rax ; 0x10202a368
0x1006124c6: lea rcx, [rip + 0x1a17e9b] ; 0x10202a368
0x1006124cd: mov qword ptr [rip + 0x1a17e98], 0 ; 0x10202a370
0x1006124d8: mov rax, qword ptr [rip + 0x65da81] ; 0x100c6ff60
0x1006124df: mov qword ptr [rip + 0x1a17e92], rax ; 0x10202a378
0x1006124e6: lea rax, [rip - 0x7f9d] ; 0x10060a550
0x1006124ed: vmovq xmm0, rax
0x1006124f2: vmovdqu xmmword ptr [rip + 0x1a17ea6], xmm0 ; 0x10202a3a0
0x1006124fa: mov rax, qword ptr [rip + 0x5f3917] ; 0x100c05e18 -> 0x1006100c0 __Z12ApplyWrapperI16SoundEmitterBarnMS0_FvP12SoundManagerEEvM9VoidClassFvvEPv8VariablePS9_j
0x100612501: mov qword ptr [rip + 0x1a17ea8], rax ; 0x10202a3b0
0x100612508: mov rax, qword ptr [rip + 0x5f7199] ; 0x100c096a8 -> 0x100610160 __Z21InitFunctionSignatureIM16SoundEmitterBarnFvP12SoundManagerEEvP17FunctionSignature
0x10061250f: mov qword ptr [rip + 0x1a17ea2], rax ; 0x10202a3b8
0x100612516: mov rax, qword ptr [rip + 0x5f5b5b] ; 0x100c08078 -> 0x1006100b0 __Z18GetMetaClassByTypeIP16SoundEmitterBarnERK9MetaClassv
0x10061251d: mov qword ptr [rip + 0x1a17e9c], rax ; 0x10202a3c0
0x100612524: lea rdx, [rip + 0x54e51a] ; 0x100b60a45 OnLevelLoad
0x10061252b: mov qword ptr [rip + 0x1a17e96], rdx ; 0x10202a3c8
0x100612532: lea rdx, [rip + 0x1a17e8f] ; 0x10202a3c8
0x100612539: mov qword ptr [rip + 0x1a17e98], rcx ; 0x10202a3d8
0x100612540: lea rcx, [rip - 0x7fd7] ; 0x10060a570
0x100612547: vmovq xmm0, rcx
0x10061254c: vmovdqu xmmword ptr [rip + 0x1a17eac], xmm0 ; 0x10202a400
0x100612554: mov rcx, qword ptr [rip + 0x5f38c5] ; 0x100c05e20 -> 0x1006101e0 __Z12ApplyWrapperI16SoundEmitterBarnMS0_FvP4HeapEEvM9VoidClassFvvEPv8VariablePS9_j
0x10061255b: mov qword ptr [rip + 0x1a17eae], rcx ; 0x10202a410
0x100612562: mov rcx, qword ptr [rip + 0x5f7147] ; 0x100c096b0 -> 0x100610280 __Z21InitFunctionSignatureIM16SoundEmitterBarnFvP4HeapEEvP17FunctionSignature
0x100612569: mov qword ptr [rip + 0x1a17ea8], rcx ; 0x10202a418
0x100612570: mov qword ptr [rip + 0x1a17ea9], rax ; 0x10202a420
0x100612577: lea rcx, [rip + 0x5680a8] ; 0x100b7a626 levelHeap
0x10061257e: vmovq xmm0, rcx
0x100612583: lea rcx, [rip + 0x54a38d] ; 0x100b5c917 ArgName
0x10061258a: vmovq xmm1, rcx
0x10061258f: vpunpcklqdq xmm0, xmm1, xmm0
0x100612593: vmovdqa xmmword ptr [rip + 0x1a17e95], xmm0 ; 0x10202a430
0x10061259b: lea rcx, [rip + 0x1a17e8e] ; 0x10202a430
0x1006125a2: mov qword ptr [rip + 0x1a17e93], 0 ; 0x10202a440
0x1006125ad: mov qword ptr [rip + 0x1a17e1c], rcx ; 0x10202a3d0
0x1006125b4: lea rcx, [rip + 0x54e4a0] ; 0x100b60a5b OnLevelUnload
0x1006125bb: mov qword ptr [rip + 0x1a17e86], rcx ; 0x10202a448
0x1006125c2: lea rcx, [rip + 0x1a17e7f] ; 0x10202a448
0x1006125c9: mov qword ptr [rip + 0x1a17e7c], 0 ; 0x10202a450
0x1006125d4: mov qword ptr [rip + 0x1a17e7d], rdx ; 0x10202a458
0x1006125db: lea rdx, [rip - 0x8012] ; 0x10060a5d0
0x1006125e2: vmovq xmm0, rdx
0x1006125e7: vmovdqu xmmword ptr [rip + 0x1a17e91], xmm0 ; 0x10202a480
0x1006125ef: mov rdx, qword ptr [rip + 0x5f383a] ; 0x100c05e30 -> 0x100610300 __Z12ApplyWrapperI16SoundEmitterBarnMS0_FvvEEvM9VoidClassFvvEPv8VariablePS7_j
0x1006125f6: mov qword ptr [rip + 0x1a17e93], rdx ; 0x10202a490
0x1006125fd: mov rsi, qword ptr [rip + 0x5f70bc] ; 0x100c096c0 -> 0x100610360 __Z21InitFunctionSignatureIM16SoundEmitterBarnFvvEEvP17FunctionSignature
0x100612604: mov qword ptr [rip + 0x1a17e8d], rsi ; 0x10202a498
0x10061260b: mov qword ptr [rip + 0x1a17e8e], rax ; 0x10202a4a0
0x100612612: lea rdi, [rip + 0x54a31f] ; 0x100b5c938 Terminate
0x100612619: mov qword ptr [rip + 0x1a17e88], rdi ; 0x10202a4a8
0x100612620: lea rdi, [rip + 0x1a17e81] ; 0x10202a4a8
0x100612627: mov qword ptr [rip + 0x1a17e7e], 0 ; 0x10202a4b0
0x100612632: mov qword ptr [rip + 0x1a17e7f], rcx ; 0x10202a4b8
0x100612639: lea rcx, [rip - 0x7fa0] ; 0x10060a6a0
0x100612640: vmovq xmm0, rcx
0x100612645: vmovdqu xmmword ptr [rip + 0x1a17e93], xmm0 ; 0x10202a4e0
0x10061264d: mov qword ptr [rip + 0x1a17e9c], rdx ; 0x10202a4f0
0x100612654: mov qword ptr [rip + 0x1a17e9d], rsi ; 0x10202a4f8
0x10061265b: mov qword ptr [rip + 0x1a17e9e], rax ; 0x10202a500
0x100612662: lea rcx, [rip + 0x54a2e4] ; 0x100b5c94d Update
0x100612669: mov qword ptr [rip + 0x1a17e98], rcx ; 0x10202a508
0x100612670: lea rcx, [rip + 0x1a17e91] ; 0x10202a508
0x100612677: mov qword ptr [rip + 0x1a17e8e], 0 ; 0x10202a510
0x100612682: mov qword ptr [rip + 0x1a17e8f], rdi ; 0x10202a518
0x100612689: lea rdx, [rip - 0x7fe0] ; 0x10060a6b0
0x100612690: vmovq xmm0, rdx
0x100612695: vmovdqu xmmword ptr [rip + 0x1a17ea3], xmm0 ; 0x10202a540
0x10061269d: mov rdx, qword ptr [rip + 0x5f3784] ; 0x100c05e28 -> 0x100610380 __Z12ApplyWrapperI16SoundEmitterBarnMS0_FvP8GameTimeP12SoundManagerP10DebugLinesEEvM9VoidClassFvvEPv8VariablePSD_j
0x1006126a4: mov qword ptr [rip + 0x1a17ea5], rdx ; 0x10202a550
0x1006126ab: mov rdx, qword ptr [rip + 0x5f7006] ; 0x100c096b8 -> 0x100610390 __Z21InitFunctionSignatureIM16SoundEmitterBarnFvP8GameTimeP12SoundManagerP10DebugLinesEEvP17FunctionSignature
0x1006126b2: mov qword ptr [rip + 0x1a17e9f], rdx ; 0x10202a558
0x1006126b9: mov qword ptr [rip + 0x1a17ea0], rax ; 0x10202a560
0x1006126c0: lea rdx, [rip + 0x56d034] ; 0x100b7f6fb CreateEmitter
0x1006126c7: mov qword ptr [rip + 0x1a17e9a], rdx ; 0x10202a568
0x1006126ce: lea rdx, [rip + 0x1a17e93] ; 0x10202a568
0x1006126d5: mov qword ptr [rip + 0x1a17e9c], rcx ; 0x10202a578
0x1006126dc: mov qword ptr [rip + 0x65d87d], rdx ; 0x100c6ff60
0x1006126e3: lea rcx, [rip - 0x67ca] ; 0x10060bf20
0x1006126ea: vmovq xmm0, rcx
0x1006126ef: vmovdqu xmmword ptr [rip + 0x1a17ea9], xmm0 ; 0x10202a5a0
0x1006126f7: mov rcx, qword ptr [rip + 0x5f3712] ; 0x100c05e10 -> 0x100610530 __Z12ApplyWrapperI16SoundEmitterBarnMS0_FP12SoundEmitterPK9MetaClassEEvM9VoidClassFvvEPv8VariablePSC_j
0x1006126fe: mov qword ptr [rip + 0x1a17eab], rcx ; 0x10202a5b0
0x100612705: mov rcx, qword ptr [rip + 0x5f6f94] ; 0x100c096a0 -> 0x1006105f0 __Z21InitFunctionSignatureIM16SoundEmitterBarnFP12SoundEmitterPK9MetaClassEEvP17FunctionSignature
0x10061270c: mov qword ptr [rip + 0x1a17ea5], rcx ; 0x10202a5b8
0x100612713: mov qword ptr [rip + 0x1a17ea6], rax ; 0x10202a5c0
0x10061271a: vmovq xmm1, r12
0x10061271f: vmovdqa xmmword ptr [rbp - 0x60], xmm1
0x100612724: lea rax, [rip + 0x56499d] ; 0x100b770c8 ObjectFactory_CreatesType
0x10061272b: vmovq xmm0, rax
0x100612730: vpunpcklqdq xmm0, xmm0, xmm1
0x100612734: vmovdqa xmmword ptr [rip + 0x1a17e94], xmm0 ; 0x10202a5d0
0x10061273c: lea rax, [rip + 0x1a17e8d] ; 0x10202a5d0
0x100612743: mov qword ptr [rip + 0x1a17e92], 0 ; 0x10202a5e0
0x10061274e: mov qword ptr [rip + 0x1a17e1b], rax ; 0x10202a570
0x100612755: lea rax, [rip + 0x58444e] ; 0x100b96baa FadeSound
0x10061275c: mov qword ptr [rip + 0x1a17e8d], rax ; 0x10202a5f0
0x100612763: lea rax, [rip + 0x1a17e7e] ; 0x10202a5e8
0x10061276a: mov qword ptr [rip + 0x1a17e83], 0 ; 0x10202a5f8
0x100612775: mov rcx, qword ptr [rip + 0x65d7dc] ; 0x100c6ff58
0x10061277c: mov qword ptr [rip + 0x1a17e7d], rcx ; 0x10202a600
0x100612783: mov qword ptr [rip + 0x65d7ce], rax ; 0x100c6ff58
0x10061278a: mov qword ptr [rip + 0x1a17e7f], rax ; 0x10202a610
0x100612791: mov rax, qword ptr [rip + 0x5f5e50] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x100612798: mov qword ptr [rip + 0x1a17e79], rax ; 0x10202a618
0x10061279f: mov r12, rax
0x1006127a2: mov dword ptr [rip + 0x1a17e74], 0xffffffff ; 0x10202a620
0x1006127ac: mov dword ptr [rip + 0x1a17e6e], 0xffffffff ; 0x10202a624
0x1006127b6: mov qword ptr [rip + 0x1a17e7f], 0 ; 0x10202a640
0x1006127c1: mov rax, qword ptr [rip + 0x5fa0f0] ; 0x100c0c8b8
0x1006127c8: add rax, 0x10
0x1006127cc: mov qword ptr [rip + 0x1a17e15], rax ; 0x10202a5e8
0x1006127d3: xor eax, eax
0x1006127d5: call 0x100011c10 ; 0x100011c10
0x1006127da: lea rax, [rip + 0x553841] ; 0x100b66022 sounds
0x1006127e1: mov qword ptr [rip + 0x6e6e58], rax ; 0x100cf9640
0x1006127e8: lea rcx, [rip + 0x6e6e51] ; 0x100cf9640
0x1006127ef: mov rax, qword ptr [rip + 0x66546a] ; 0x100c77c60
0x1006127f6: mov qword ptr [rip + 0x6e6e53], rax ; 0x100cf9650
0x1006127fd: mov qword ptr [rip + 0x6e6e58], 0x38 ; 0x100cf9660
0x100612808: mov qword ptr [rip + 0x6e6e59], r13 ; 0x100cf9668
0x10061280f: mov rax, qword ptr [rip + 0x5f618a] ; 0x100c089a0 -> 0x100610920 __Z18GetMetaClassByTypeIP9FadeSoundERK9MetaClassv
0x100612816: mov qword ptr [rip + 0x6e6e53], rax ; 0x100cf9670
0x10061281d: mov qword ptr [rip + 0x6e6e50], 0xffffffffffffffff ; 0x100cf9678
0x100612828: mov qword ptr [rip + 0x6e6e51], rbx ; 0x100cf9680
0x10061282f: mov qword ptr [rip + 0x6e6e4e], 0 ; 0x100cf9688
0x10061283a: vmovdqa xmm0, xmmword ptr [rbp - 0x40]
0x10061283f: vpunpcklqdq xmm0, xmm0, xmmword ptr [rbp - 0x60]
0x100612844: vmovdqa xmmword ptr [rip + 0x1a17e04], xmm0 ; 0x10202a650
0x10061284c: lea rdx, [rip + 0x1a17dfd] ; 0x10202a650
0x100612853: mov qword ptr [rip + 0x1a17e02], 0 ; 0x10202a660
0x10061285e: mov qword ptr [rip + 0x6e6de3], rdx ; 0x100cf9648
0x100612865: lea rdx, [rip + 0x54ce83] ; 0x100b5f6ef duration
0x10061286c: mov qword ptr [rip + 0x6e6e1d], rdx ; 0x100cf9690
0x100612873: lea rdx, [rip + 0x6e6e16] ; 0x100cf9690
0x10061287a: mov qword ptr [rip + 0x6e6e13], 0 ; 0x100cf9698
0x100612885: mov qword ptr [rip + 0x6e6e14], rcx ; 0x100cf96a0
0x10061288c: mov qword ptr [rip + 0x6e6e19], 0x40 ; 0x100cf96b0
0x100612897: mov qword ptr [rip + 0x6e6e1a], r15 ; 0x100cf96b8
0x10061289e: mov qword ptr [rip + 0x6e6e1b], rax ; 0x100cf96c0
0x1006128a5: mov qword ptr [rip + 0x6e6e18], 0xffffffffffffffff ; 0x100cf96c8
0x1006128b0: mov qword ptr [rip + 0x6e6e19], rbx ; 0x100cf96d0
0x1006128b7: mov qword ptr [rip + 0x6e6e16], 0 ; 0x100cf96d8
0x1006128c2: lea rcx, [rip + 0x5842eb] ; 0x100b96bb4 targetVolume
0x1006128c9: mov qword ptr [rip + 0x6e6e10], rcx ; 0x100cf96e0
0x1006128d0: lea rcx, [rip + 0x6e6e09] ; 0x100cf96e0
0x1006128d7: mov qword ptr [rip + 0x6e6e06], 0 ; 0x100cf96e8
0x1006128e2: mov qword ptr [rip + 0x6e6e07], rdx ; 0x100cf96f0
0x1006128e9: mov qword ptr [rip + 0x6e6e0c], 0x44 ; 0x100cf9700
0x1006128f4: mov qword ptr [rip + 0x6e6e0d], r15 ; 0x100cf9708
0x1006128fb: mov qword ptr [rip + 0x6e6e0e], rax ; 0x100cf9710
0x100612902: mov qword ptr [rip + 0x6e6e0b], 0xffffffffffffffff ; 0x100cf9718
0x10061290d: mov qword ptr [rip + 0x6e6e0c], rbx ; 0x100cf9720
0x100612914: mov qword ptr [rip + 0x6e6e09], 0 ; 0x100cf9728
0x10061291f: lea rdx, [rip + 0x58429b] ; 0x100b96bc1 stopAtZeroVolume
0x100612926: mov qword ptr [rip + 0x6e6e03], rdx ; 0x100cf9730
0x10061292d: lea rdx, [rip + 0x6e6dfc] ; 0x100cf9730
0x100612934: mov qword ptr [rip + 0x6e6e05], rcx ; 0x100cf9740
0x10061293b: mov qword ptr [rip + 0x66531e], rdx ; 0x100c77c60
0x100612942: mov qword ptr [rip + 0x6e6e03], 0x48 ; 0x100cf9750
0x10061294d: mov qword ptr [rip + 0x6e6e04], r14 ; 0x100cf9758
0x100612954: mov qword ptr [rip + 0x6e6e05], rax ; 0x100cf9760
0x10061295b: mov qword ptr [rip + 0x6e6e02], 0xffffffffffffffff ; 0x100cf9768
0x100612966: mov qword ptr [rip + 0x6e6e03], rbx ; 0x100cf9770
0x10061296d: mov qword ptr [rip + 0x6e6e00], 0 ; 0x100cf9778
0x100612978: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10061297d: vmovaps xmmword ptr [rip + 0x1a17ceb], xmm0 ; 0x10202a670
0x100612985: lea rax, [rip + 0x1a17ce4] ; 0x10202a670
0x10061298c: mov qword ptr [rip + 0x1a17ce9], 0 ; 0x10202a680
0x100612997: mov qword ptr [rip + 0x6e6d9a], rax ; 0x100cf9738
0x10061299e: lea rax, [rip + 0x58422d] ; 0x100b96bd2 SetChannelLevels
0x1006129a5: mov qword ptr [rip + 0x1a17ce4], rax ; 0x10202a690
0x1006129ac: lea rax, [rip + 0x1a17cd5] ; 0x10202a688
0x1006129b3: mov qword ptr [rip + 0x1a17cda], 0 ; 0x10202a698
0x1006129be: mov rcx, qword ptr [rip + 0x65d593] ; 0x100c6ff58
0x1006129c5: mov qword ptr [rip + 0x1a17cd4], rcx ; 0x10202a6a0
0x1006129cc: mov qword ptr [rip + 0x65d585], rax ; 0x100c6ff58
0x1006129d3: mov qword ptr [rip + 0x1a17cd6], rax ; 0x10202a6b0
0x1006129da: mov qword ptr [rip + 0x1a17cd7], r12 ; 0x10202a6b8
0x1006129e1: mov dword ptr [rip + 0x1a17cd5], 0xffffffff ; 0x10202a6c0
0x1006129eb: mov dword ptr [rip + 0x1a17ccf], 0xffffffff ; 0x10202a6c4
0x1006129f5: mov qword ptr [rip + 0x1a17ce0], 0 ; 0x10202a6e0
0x100612a00: mov rax, qword ptr [rip + 0x5f8fb1] ; 0x100c0b9b8
0x100612a07: add rax, 0x10
0x100612a0b: mov qword ptr [rip + 0x1a17c76], rax ; 0x10202a688
0x100612a12: xor eax, eax
0x100612a14: call 0x100011c10 ; 0x100011c10
0x100612a19: lea rax, [rip + 0x577a76] ; 0x100b8a496 emitter
0x100612a20: mov qword ptr [rip + 0x6e6d59], rax ; 0x100cf9780
0x100612a27: lea rax, [rip + 0x6e6d52] ; 0x100cf9780
0x100612a2e: mov qword ptr [rip + 0x6e6d4f], 0 ; 0x100cf9788
0x100612a39: mov rcx, qword ptr [rip + 0x665220] ; 0x100c77c60
0x100612a40: mov qword ptr [rip + 0x6e6d49], rcx ; 0x100cf9790
0x100612a47: mov qword ptr [rip + 0x6e6d4e], 0x38 ; 0x100cf97a0
0x100612a52: mov rcx, qword ptr [rip + 0x5f4557] ; 0x100c06fb0 -> 0x100610670 __Z17GetMetaTypeByTypeIP12SoundEmitterERK8MetaTypev
0x100612a59: mov qword ptr [rip + 0x6e6d48], rcx ; 0x100cf97a8
0x100612a60: lea rcx, [rip + 0x57d725] ; 0x100b9018c fadeDuration
0x100612a67: mov qword ptr [rip + 0x6e6d62], rcx ; 0x100cf97d0
0x100612a6e: lea rcx, [rip + 0x6e6d5b] ; 0x100cf97d0
0x100612a75: mov qword ptr [rip + 0x6e6d58], 0 ; 0x100cf97d8
0x100612a80: mov qword ptr [rip + 0x6e6d59], rax ; 0x100cf97e0
0x100612a87: lea rax, [rip + 0x584155] ; 0x100b96be3 channel01
0x100612a8e: mov qword ptr [rip + 0x6e6d8b], rax ; 0x100cf9820
0x100612a95: lea rax, [rip + 0x6e6d84] ; 0x100cf9820
0x100612a9c: mov qword ptr [rip + 0x6e6d81], 0 ; 0x100cf9828
0x100612aa7: mov qword ptr [rip + 0x6e6d82], rcx ; 0x100cf9830
0x100612aae: lea rcx, [rip + 0x584138] ; 0x100b96bed channel02
0x100612ab5: mov qword ptr [rip + 0x6e6db4], rcx ; 0x100cf9870
0x100612abc: lea rcx, [rip + 0x6e6dad] ; 0x100cf9870
0x100612ac3: mov qword ptr [rip + 0x6e6daa], 0 ; 0x100cf9878
0x100612ace: mov qword ptr [rip + 0x6e6dab], rax ; 0x100cf9880
0x100612ad5: lea rax, [rip + 0x58411b] ; 0x100b96bf7 channel03
0x100612adc: mov qword ptr [rip + 0x6e6ddd], rax ; 0x100cf98c0
0x100612ae3: lea rax, [rip + 0x6e6dd6] ; 0x100cf98c0
0x100612aea: mov qword ptr [rip + 0x6e6dd3], 0 ; 0x100cf98c8
0x100612af5: mov qword ptr [rip + 0x6e6dd4], rcx ; 0x100cf98d0
0x100612afc: lea rcx, [rip + 0x5840fe] ; 0x100b96c01 channel04
0x100612b03: mov qword ptr [rip + 0x6e6e06], rcx ; 0x100cf9910
0x100612b0a: lea rcx, [rip + 0x6e6dff] ; 0x100cf9910
0x100612b11: mov qword ptr [rip + 0x6e6dfc], 0 ; 0x100cf9918
0x100612b1c: mov qword ptr [rip + 0x6e6dfd], rax ; 0x100cf9920
0x100612b23: lea rax, [rip + 0x5840e1] ; 0x100b96c0b channel05
0x100612b2a: mov qword ptr [rip + 0x6e6e2f], rax ; 0x100cf9960
0x100612b31: lea rax, [rip + 0x6e6e28] ; 0x100cf9960
0x100612b38: mov qword ptr [rip + 0x6e6e25], 0 ; 0x100cf9968
0x100612b43: mov qword ptr [rip + 0x6e6e26], rcx ; 0x100cf9970
0x100612b4a: lea rcx, [rip + 0x5840c4] ; 0x100b96c15 channel06
0x100612b51: mov qword ptr [rip + 0x6e6e58], rcx ; 0x100cf99b0
0x100612b58: lea rcx, [rip + 0x6e6e51] ; 0x100cf99b0
0x100612b5f: mov qword ptr [rip + 0x6e6e4e], 0 ; 0x100cf99b8
0x100612b6a: mov qword ptr [rip + 0x6e6e4f], rax ; 0x100cf99c0
0x100612b71: lea rax, [rip + 0x5840a7] ; 0x100b96c1f channel07
0x100612b78: mov qword ptr [rip + 0x6e6e81], rax ; 0x100cf9a00
0x100612b7f: lea rax, [rip + 0x6e6e7a] ; 0x100cf9a00
0x100612b86: mov qword ptr [rip + 0x6e6e77], 0 ; 0x100cf9a08
0x100612b91: mov qword ptr [rip + 0x6e6e78], rcx ; 0x100cf9a10
0x100612b98: lea rcx, [rip + 0x58408a] ; 0x100b96c29 channel08
0x100612b9f: mov qword ptr [rip + 0x6e6eaa], rcx ; 0x100cf9a50
0x100612ba6: lea rcx, [rip + 0x6e6ea3] ; 0x100cf9a50
0x100612bad: mov qword ptr [rip + 0x6e6ea0], 0 ; 0x100cf9a58
0x100612bb8: mov qword ptr [rip + 0x6e6ea1], rax ; 0x100cf9a60
0x100612bbf: lea rax, [rip + 0x58406d] ; 0x100b96c33 channel09
0x100612bc6: mov qword ptr [rip + 0x6e6ed3], rax ; 0x100cf9aa0
0x100612bcd: lea rax, [rip + 0x6e6ecc] ; 0x100cf9aa0
0x100612bd4: mov qword ptr [rip + 0x6e6ec9], 0 ; 0x100cf9aa8
0x100612bdf: mov qword ptr [rip + 0x6e6eca], rcx ; 0x100cf9ab0
0x100612be6: lea rcx, [rip + 0x584050] ; 0x100b96c3d channel10
0x100612bed: mov qword ptr [rip + 0x6e6efc], rcx ; 0x100cf9af0
0x100612bf4: lea rcx, [rip + 0x6e6ef5] ; 0x100cf9af0
0x100612bfb: mov qword ptr [rip + 0x6e6ef2], 0 ; 0x100cf9af8
0x100612c06: mov qword ptr [rip + 0x6e6ef3], rax ; 0x100cf9b00
0x100612c0d: lea rax, [rip + 0x584033] ; 0x100b96c47 channel11
0x100612c14: mov qword ptr [rip + 0x6e6f25], rax ; 0x100cf9b40
0x100612c1b: lea rax, [rip + 0x6e6f1e] ; 0x100cf9b40
0x100612c22: mov qword ptr [rip + 0x6e6f1b], 0 ; 0x100cf9b48
0x100612c2d: mov qword ptr [rip + 0x6e6f1c], rcx ; 0x100cf9b50
0x100612c34: lea rcx, [rip + 0x584016] ; 0x100b96c51 channel12
0x100612c3b: mov qword ptr [rip + 0x6e6f4e], rcx ; 0x100cf9b90
0x100612c42: mov qword ptr [rip + 0x6e6f4b], 0 ; 0x100cf9b98
0x100612c4d: mov qword ptr [rip + 0x6e6f4c], rax ; 0x100cf9ba0
0x100612c54: lea rax, [rip + 0x584000] ; 0x100b96c5b channel13
0x100612c5b: mov qword ptr [rip + 0x6e6f7e], rax ; 0x100cf9be0
0x100612c62: mov qword ptr [rip + 0x6e6f7b], 0 ; 0x100cf9be8
0x100612c6d: lea rax, [rip + 0x6e6f1c] ; 0x100cf9b90
0x100612c74: mov qword ptr [rip + 0x6e6f75], rax ; 0x100cf9bf0
0x100612c7b: lea r14, [rip + 0x583fe3] ; 0x100b96c65 channel14
0x100612c82: mov qword ptr [rip + 0x6e6fa7], r14 ; 0x100cf9c30
0x100612c89: lea rax, [rip + 0x6e6f50] ; 0x100cf9be0
0x100612c90: mov qword ptr [rip + 0x6e6fa9], rax ; 0x100cf9c40
0x100612c97: lea r12, [rip + 0x583fd1] ; 0x100b96c6f channel15
0x100612c9e: mov qword ptr [rip + 0x6e6fdb], r12 ; 0x100cf9c80
0x100612ca5: lea rax, [rip + 0x6e6f84] ; 0x100cf9c30
0x100612cac: mov qword ptr [rip + 0x6e6fdd], rax ; 0x100cf9c90
0x100612cb3: lea r13, [rip + 0x583fbf] ; 0x100b96c79 channel16
0x100612cba: mov qword ptr [rip + 0x6e700f], r13 ; 0x100cf9cd0
0x100612cc1: lea rax, [rip + 0x6e6fb8] ; 0x100cf9c80
0x100612cc8: mov qword ptr [rip + 0x6e7011], rax ; 0x100cf9ce0
0x100612ccf: lea rax, [rip + 0x6e6ffa] ; 0x100cf9cd0
0x100612cd6: mov qword ptr [rip + 0x664f83], rax ; 0x100c77c60
0x100612cdd: mov rax, qword ptr [rip + 0x5f5374] ; 0x100c08058 -> 0x100610cf0 __Z18GetMetaClassByTypeIP16SetChannelLevelsERK9MetaClassv
0x100612ce4: mov qword ptr [rip + 0x6e6ac5], rax ; 0x100cf97b0
0x100612ceb: mov qword ptr [rip + 0x6e6afa], 0x40 ; 0x100cf97f0
0x100612cf6: mov qword ptr [rip + 0x6e6afb], r15 ; 0x100cf97f8
0x100612cfd: mov qword ptr [rip + 0x6e6afc], rax ; 0x100cf9800
0x100612d04: mov qword ptr [rip + 0x6e6b31], 0x44 ; 0x100cf9840
0x100612d0f: mov qword ptr [rip + 0x6e6b32], r15 ; 0x100cf9848
0x100612d16: mov qword ptr [rip + 0x6e6b33], rax ; 0x100cf9850
0x100612d1d: mov qword ptr [rip + 0x6e6b68], 0x48 ; 0x100cf9890
0x100612d28: mov qword ptr [rip + 0x6e6b69], r15 ; 0x100cf9898
0x100612d2f: mov qword ptr [rip + 0x6e6b6a], rax ; 0x100cf98a0
0x100612d36: mov qword ptr [rip + 0x6e6b9f], 0x4c ; 0x100cf98e0
0x100612d41: mov qword ptr [rip + 0x6e6ba0], r15 ; 0x100cf98e8
0x100612d48: mov qword ptr [rip + 0x6e6ba1], rax ; 0x100cf98f0
0x100612d4f: mov qword ptr [rip + 0x6e6bd6], 0x50 ; 0x100cf9930
0x100612d5a: mov qword ptr [rip + 0x6e6bd7], r15 ; 0x100cf9938
0x100612d61: mov qword ptr [rip + 0x6e6bd8], rax ; 0x100cf9940
0x100612d68: mov qword ptr [rip + 0x6e6c0d], 0x54 ; 0x100cf9980
0x100612d73: mov qword ptr [rip + 0x6e6c0e], r15 ; 0x100cf9988
0x100612d7a: mov qword ptr [rip + 0x6e6c0f], rax ; 0x100cf9990
0x100612d81: mov qword ptr [rip + 0x6e6c44], 0x58 ; 0x100cf99d0
0x100612d8c: mov qword ptr [rip + 0x6e6c45], r15 ; 0x100cf99d8
0x100612d93: mov qword ptr [rip + 0x6e6c46], rax ; 0x100cf99e0
0x100612d9a: mov qword ptr [rip + 0x6e6c7b], 0x5c ; 0x100cf9a20
0x100612da5: mov qword ptr [rip + 0x6e6c7c], r15 ; 0x100cf9a28
0x100612dac: mov qword ptr [rip + 0x6e6c7d], rax ; 0x100cf9a30
0x100612db3: mov qword ptr [rip + 0x6e6cb2], 0x60 ; 0x100cf9a70
0x100612dbe: mov qword ptr [rip + 0x6e6cb3], r15 ; 0x100cf9a78
0x100612dc5: mov qword ptr [rip + 0x6e6cb4], rax ; 0x100cf9a80
0x100612dcc: mov qword ptr [rip + 0x6e6ce9], 0x64 ; 0x100cf9ac0
0x100612dd7: mov qword ptr [rip + 0x6e6cea], r15 ; 0x100cf9ac8
0x100612dde: mov qword ptr [rip + 0x6e6ceb], rax ; 0x100cf9ad0
0x100612de5: mov qword ptr [rip + 0x6e6d20], 0x68 ; 0x100cf9b10
0x100612df0: mov qword ptr [rip + 0x6e6d21], r15 ; 0x100cf9b18
0x100612df7: mov qword ptr [rip + 0x6e6d22], rax ; 0x100cf9b20
0x100612dfe: mov qword ptr [rip + 0x6e6d57], 0x6c ; 0x100cf9b60
0x100612e09: mov qword ptr [rip + 0x6e6d58], r15 ; 0x100cf9b68
0x100612e10: mov qword ptr [rip + 0x6e6d59], rax ; 0x100cf9b70
0x100612e17: mov qword ptr [rip + 0x6e6d8e], 0x70 ; 0x100cf9bb0
0x100612e22: mov qword ptr [rip + 0x6e6d8f], r15 ; 0x100cf9bb8
0x100612e29: mov qword ptr [rip + 0x6e6d90], rax ; 0x100cf9bc0
0x100612e30: mov qword ptr [rip + 0x6e6dc5], 0x74 ; 0x100cf9c00
0x100612e3b: mov qword ptr [rip + 0x6e6dc6], r15 ; 0x100cf9c08
0x100612e42: mov qword ptr [rip + 0x6e6dc7], rax ; 0x100cf9c10
0x100612e49: mov qword ptr [rip + 0x6e6dfc], 0x78 ; 0x100cf9c50
0x100612e54: mov qword ptr [rip + 0x6e6dfd], r15 ; 0x100cf9c58
0x100612e5b: mov qword ptr [rip + 0x6e6dfe], rax ; 0x100cf9c60
0x100612e62: mov qword ptr [rip + 0x6e6e33], 0x7c ; 0x100cf9ca0
0x100612e6d: mov qword ptr [rip + 0x6e6e34], r15 ; 0x100cf9ca8
0x100612e74: mov qword ptr [rip + 0x6e6e35], rax ; 0x100cf9cb0
0x100612e7b: mov qword ptr [rip + 0x6e6e6a], 0x80 ; 0x100cf9cf0
0x100612e86: mov qword ptr [rip + 0x6e6e6b], r15 ; 0x100cf9cf8
0x100612e8d: mov qword ptr [rip + 0x6e6e6c], rax ; 0x100cf9d00
0x100612e94: lea rax, [rip + 0x57bbc1] ; 0x100b8ea5c -1
0x100612e9b: vmovq xmm0, rax
0x100612ea0: mov qword ptr [rip + 0x6e69ad], 0xffffffffffffffff ; 0x100cf9858
0x100612eab: mov qword ptr [rip + 0x6e69ae], rbx ; 0x100cf9860
0x100612eb2: mov qword ptr [rip + 0x6e69ab], 0 ; 0x100cf9868
0x100612ebd: vmovdqa xmm1, xmmword ptr [rbp - 0x50]
0x100612ec2: vpunpcklqdq xmm0, xmm1, xmm0
0x100612ec6: vmovdqa xmmword ptr [rip + 0x1a17822], xmm0 ; 0x10202a6f0
0x100612ece: mov rax, qword ptr [rip + 0x6e6953] ; 0x100cf9828
0x100612ed5: mov qword ptr [rip + 0x1a17824], rax ; 0x10202a700
0x100612edc: lea rax, [rip + 0x1a1780d] ; 0x10202a6f0
0x100612ee3: mov qword ptr [rip + 0x6e693e], rax ; 0x100cf9828
0x100612eea: mov qword ptr [rip + 0x6e69b3], 0xffffffffffffffff ; 0x100cf98a8
0x100612ef5: mov qword ptr [rip + 0x6e69b4], rbx ; 0x100cf98b0
0x100612efc: mov qword ptr [rip + 0x6e69b1], 0 ; 0x100cf98b8
0x100612f07: vmovdqa xmmword ptr [rip + 0x1a17801], xmm0 ; 0x10202a710
0x100612f0f: mov rax, qword ptr [rip + 0x6e6962] ; 0x100cf9878
0x100612f16: mov qword ptr [rip + 0x1a17803], rax ; 0x10202a720
0x100612f1d: lea rax, [rip + 0x1a177ec] ; 0x10202a710
0x100612f24: mov qword ptr [rip + 0x6e694d], rax ; 0x100cf9878
0x100612f2b: mov qword ptr [rip + 0x6e69c2], 0xffffffffffffffff ; 0x100cf98f8
0x100612f36: mov qword ptr [rip + 0x6e69c3], rbx ; 0x100cf9900
0x100612f3d: mov qword ptr [rip + 0x6e69c0], 0 ; 0x100cf9908
0x100612f48: vmovdqa xmmword ptr [rip + 0x1a177e0], xmm0 ; 0x10202a730
0x100612f50: mov rax, qword ptr [rip + 0x6e6971] ; 0x100cf98c8
0x100612f57: mov qword ptr [rip + 0x1a177e2], rax ; 0x10202a740
0x100612f5e: lea rax, [rip + 0x1a177cb] ; 0x10202a730
0x100612f65: mov qword ptr [rip + 0x6e695c], rax ; 0x100cf98c8
0x100612f6c: mov qword ptr [rip + 0x6e69d1], 0xffffffffffffffff ; 0x100cf9948
0x100612f77: mov qword ptr [rip + 0x6e69d2], rbx ; 0x100cf9950
0x100612f7e: mov qword ptr [rip + 0x6e69cf], 0 ; 0x100cf9958
0x100612f89: vmovdqa xmmword ptr [rip + 0x1a177bf], xmm0 ; 0x10202a750
0x100612f91: mov rax, qword ptr [rip + 0x6e6980] ; 0x100cf9918
0x100612f98: mov qword ptr [rip + 0x1a177c1], rax ; 0x10202a760
0x100612f9f: lea rax, [rip + 0x1a177aa] ; 0x10202a750
0x100612fa6: mov qword ptr [rip + 0x6e696b], rax ; 0x100cf9918
0x100612fad: mov qword ptr [rip + 0x6e69e0], 0xffffffffffffffff ; 0x100cf9998
0x100612fb8: mov qword ptr [rip + 0x6e69e1], rbx ; 0x100cf99a0
0x100612fbf: mov qword ptr [rip + 0x6e69de], 0 ; 0x100cf99a8
0x100612fca: vmovdqa xmmword ptr [rip + 0x1a1779e], xmm0 ; 0x10202a770
0x100612fd2: mov rax, qword ptr [rip + 0x6e698f] ; 0x100cf9968
0x100612fd9: mov qword ptr [rip + 0x1a177a0], rax ; 0x10202a780
0x100612fe0: lea rax, [rip + 0x1a17789] ; 0x10202a770
0x100612fe7: mov qword ptr [rip + 0x6e697a], rax ; 0x100cf9968
0x100612fee: mov qword ptr [rip + 0x6e69ef], 0xffffffffffffffff ; 0x100cf99e8
0x100612ff9: mov qword ptr [rip + 0x6e69f0], rbx ; 0x100cf99f0
0x100613000: mov qword ptr [rip + 0x6e69ed], 0 ; 0x100cf99f8
0x10061300b: vmovdqa xmmword ptr [rip + 0x1a1777d], xmm0 ; 0x10202a790
0x100613013: mov rax, qword ptr [rip + 0x6e699e] ; 0x100cf99b8
0x10061301a: mov qword ptr [rip + 0x1a1777f], rax ; 0x10202a7a0
0x100613021: lea rax, [rip + 0x1a17768] ; 0x10202a790
0x100613028: mov qword ptr [rip + 0x6e6989], rax ; 0x100cf99b8
0x10061302f: mov qword ptr [rip + 0x6e69fe], 0xffffffffffffffff ; 0x100cf9a38
0x10061303a: mov qword ptr [rip + 0x6e69ff], rbx ; 0x100cf9a40
0x100613041: mov qword ptr [rip + 0x6e69fc], 0 ; 0x100cf9a48
0x10061304c: vmovdqa xmmword ptr [rip + 0x1a1775c], xmm0 ; 0x10202a7b0
0x100613054: mov rax, qword ptr [rip + 0x6e69ad] ; 0x100cf9a08
0x10061305b: mov qword ptr [rip + 0x1a1775e], rax ; 0x10202a7c0
0x100613062: lea rax, [rip + 0x1a17747] ; 0x10202a7b0
0x100613069: mov qword ptr [rip + 0x6e6998], rax ; 0x100cf9a08
0x100613070: mov qword ptr [rip + 0x6e6a0d], 0xffffffffffffffff ; 0x100cf9a88
0x10061307b: mov qword ptr [rip + 0x6e6a0e], rbx ; 0x100cf9a90
0x100613082: mov qword ptr [rip + 0x6e6a0b], 0 ; 0x100cf9a98
0x10061308d: vmovdqa xmmword ptr [rip + 0x1a1773b], xmm0 ; 0x10202a7d0
0x100613095: mov rax, qword ptr [rip + 0x6e69bc] ; 0x100cf9a58
0x10061309c: mov qword ptr [rip + 0x1a1773d], rax ; 0x10202a7e0
0x1006130a3: lea rax, [rip + 0x1a17726] ; 0x10202a7d0
0x1006130aa: mov qword ptr [rip + 0x6e69a7], rax ; 0x100cf9a58
0x1006130b1: mov qword ptr [rip + 0x6e6a1c], 0xffffffffffffffff ; 0x100cf9ad8
0x1006130bc: mov qword ptr [rip + 0x6e6a1d], rbx ; 0x100cf9ae0
0x1006130c3: mov qword ptr [rip + 0x6e6a1a], 0 ; 0x100cf9ae8
0x1006130ce: vmovdqa xmmword ptr [rip + 0x1a1771a], xmm0 ; 0x10202a7f0
0x1006130d6: mov rax, qword ptr [rip + 0x6e69cb] ; 0x100cf9aa8
0x1006130dd: mov qword ptr [rip + 0x1a1771c], rax ; 0x10202a800
0x1006130e4: lea rax, [rip + 0x1a17705] ; 0x10202a7f0
0x1006130eb: mov qword ptr [rip + 0x6e69b6], rax ; 0x100cf9aa8
0x1006130f2: mov qword ptr [rip + 0x6e6a2b], 0xffffffffffffffff ; 0x100cf9b28
0x1006130fd: mov qword ptr [rip + 0x6e6a2c], rbx ; 0x100cf9b30
0x100613104: mov qword ptr [rip + 0x6e6a29], 0 ; 0x100cf9b38
0x10061310f: vmovdqa xmmword ptr [rip + 0x1a176f9], xmm0 ; 0x10202a810
0x100613117: mov rax, qword ptr [rip + 0x6e69da] ; 0x100cf9af8
0x10061311e: mov qword ptr [rip + 0x1a176fb], rax ; 0x10202a820
0x100613125: lea rax, [rip + 0x1a176e4] ; 0x10202a810
0x10061312c: mov qword ptr [rip + 0x6e69c5], rax ; 0x100cf9af8
0x100613133: mov qword ptr [rip + 0x6e6a3a], 0xffffffffffffffff ; 0x100cf9b78
0x10061313e: mov qword ptr [rip + 0x6e6a3b], rbx ; 0x100cf9b80
0x100613145: mov qword ptr [rip + 0x6e6a38], 0 ; 0x100cf9b88
0x100613150: vmovdqa xmmword ptr [rip + 0x1a176d8], xmm0 ; 0x10202a830
0x100613158: mov rax, qword ptr [rip + 0x6e69e9] ; 0x100cf9b48
0x10061315f: mov qword ptr [rip + 0x1a176da], rax ; 0x10202a840
0x100613166: lea rax, [rip + 0x1a176c3] ; 0x10202a830
0x10061316d: mov qword ptr [rip + 0x6e69d4], rax ; 0x100cf9b48
0x100613174: mov qword ptr [rip + 0x6e6a49], 0xffffffffffffffff ; 0x100cf9bc8
0x10061317f: mov qword ptr [rip + 0x6e6a4a], rbx ; 0x100cf9bd0
0x100613186: mov qword ptr [rip + 0x6e6a47], 0 ; 0x100cf9bd8
0x100613191: vmovdqa xmmword ptr [rip + 0x1a176b7], xmm0 ; 0x10202a850
0x100613199: mov rax, qword ptr [rip + 0x6e69f8] ; 0x100cf9b98
0x1006131a0: mov qword ptr [rip + 0x1a176b9], rax ; 0x10202a860
0x1006131a7: lea rax, [rip + 0x1a176a2] ; 0x10202a850
0x1006131ae: mov qword ptr [rip + 0x6e69e3], rax ; 0x100cf9b98
0x1006131b5: mov qword ptr [rip + 0x6e6a58], 0xffffffffffffffff ; 0x100cf9c18
0x1006131c0: mov qword ptr [rip + 0x6e6a59], rbx ; 0x100cf9c20
0x1006131c7: mov qword ptr [rip + 0x6e6a56], 0 ; 0x100cf9c28
0x1006131d2: vmovdqa xmmword ptr [rip + 0x1a17696], xmm0 ; 0x10202a870
0x1006131da: vmovdqa xmmword ptr [rbp - 0x40], xmm0
0x1006131df: mov rax, qword ptr [rip + 0x6e6a02] ; 0x100cf9be8
0x1006131e6: mov qword ptr [rip + 0x1a17693], rax ; 0x10202a880
0x1006131ed: lea rax, [rip + 0x1a1767c] ; 0x10202a870
0x1006131f4: mov qword ptr [rip + 0x6e69ed], rax ; 0x100cf9be8
0x1006131fb: mov qword ptr [rip + 0x6e6a62], 0xffffffffffffffff ; 0x100cf9c68
0x100613206: mov qword ptr [rip + 0x6e6a63], rbx ; 0x100cf9c70
0x10061320d: mov qword ptr [rip + 0x6e6a60], 0 ; 0x100cf9c78
0x100613218: lea rax, [rip + 0x1a17671] ; 0x10202a890
0x10061321f: mov qword ptr [rip + 0x6e6a12], rax ; 0x100cf9c38
0x100613226: mov qword ptr [rip + 0x6e6a87], 0xffffffffffffffff ; 0x100cf9cb8
0x100613231: mov qword ptr [rip + 0x6e6a88], rbx ; 0x100cf9cc0
0x100613238: mov qword ptr [rip + 0x6e6a85], 0 ; 0x100cf9cc8
0x100613243: lea rax, [rip + 0x1a17666] ; 0x10202a8b0
0x10061324a: mov qword ptr [rip + 0x6e6a37], rax ; 0x100cf9c88
0x100613251: mov qword ptr [rip + 0x6e6aac], 0xffffffffffffffff ; 0x100cf9d08
0x10061325c: mov qword ptr [rip + 0x6e6aad], rbx ; 0x100cf9d10
0x100613263: mov qword ptr [rip + 0x6e6aaa], 0 ; 0x100cf9d18
0x10061326e: lea rax, [rip + 0x1a1765b] ; 0x10202a8d0
0x100613275: mov qword ptr [rip + 0x6e6a5c], rax ; 0x100cf9cd8
0x10061327c: lea rax, [rip + 0x583a00] ; 0x100b96c83 SetMusicChannelLevels
0x100613283: mov qword ptr [rip + 0x1a17666], rax ; 0x10202a8f0
0x10061328a: mov qword ptr [rip + 0x1a17663], 0 ; 0x10202a8f8
0x100613295: mov rax, qword ptr [rip + 0x65ccbc] ; 0x100c6ff58
0x10061329c: mov qword ptr [rip + 0x1a1765d], rax ; 0x10202a900
0x1006132a3: lea rax, [rip + 0x1a1763e] ; 0x10202a8e8
0x1006132aa: mov qword ptr [rip + 0x65cca7], rax ; 0x100c6ff58
0x1006132b1: mov qword ptr [rip + 0x1a17658], rax ; 0x10202a910
0x1006132b8: mov rax, qword ptr [rip + 0x5f5329] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x1006132bf: mov qword ptr [rip + 0x1a17652], rax ; 0x10202a918
0x1006132c6: mov dword ptr [rip + 0x1a17650], 0xffffffff ; 0x10202a920
0x1006132d0: mov dword ptr [rip + 0x1a1764a], 0xffffffff ; 0x10202a924
0x1006132da: mov qword ptr [rip + 0x1a1765b], 0 ; 0x10202a940
0x1006132e5: mov rax, qword ptr [rip + 0x5f8d4c] ; 0x100c0c038
0x1006132ec: add rax, 0x10
0x1006132f0: mov qword ptr [rip + 0x1a175f1], rax ; 0x10202a8e8
0x1006132f7: mov qword ptr [rip + 0x6e64b6], 0xffffffffffffffff ; 0x100cf97b8
0x100613302: mov qword ptr [rip + 0x6e64b7], rbx ; 0x100cf97c0
0x100613309: mov qword ptr [rip + 0x6e64b4], 0 ; 0x100cf97c8
0x100613314: mov qword ptr [rip + 0x6e64e9], 0xffffffffffffffff ; 0x100cf9808
0x10061331f: mov qword ptr [rip + 0x6e64ea], rbx ; 0x100cf9810
0x100613326: mov qword ptr [rip + 0x6e64e7], 0 ; 0x100cf9818
0x100613331: vmovdqa xmmword ptr [rip + 0x1a17557], xmm0 ; 0x10202a890
0x100613339: mov qword ptr [rip + 0x1a1755c], 0 ; 0x10202a8a0
0x100613344: vmovdqa xmmword ptr [rip + 0x1a17564], xmm0 ; 0x10202a8b0
0x10061334c: mov qword ptr [rip + 0x1a17569], 0 ; 0x10202a8c0
0x100613357: vmovdqa xmmword ptr [rip + 0x1a17571], xmm0 ; 0x10202a8d0
0x10061335f: mov qword ptr [rip + 0x1a17576], 0 ; 0x10202a8e0
0x10061336a: xor eax, eax
0x10061336c: call 0x100011c10 ; 0x100011c10
0x100613371: lea rax, [rip + 0x58386b] ; 0x100b96be3 channel01
0x100613378: mov qword ptr [rip + 0x6e69a1], rax ; 0x100cf9d20
0x10061337f: mov qword ptr [rip + 0x6e699e], 0 ; 0x100cf9d28
0x10061338a: mov rax, qword ptr [rip + 0x6648cf] ; 0x100c77c60
0x100613391: mov qword ptr [rip + 0x6e6998], rax ; 0x100cf9d30
0x100613398: lea rax, [rip + 0x58384e] ; 0x100b96bed channel02
0x10061339f: mov qword ptr [rip + 0x6e69ca], rax ; 0x100cf9d70
0x1006133a6: mov qword ptr [rip + 0x6e69c7], 0 ; 0x100cf9d78
0x1006133b1: lea rax, [rip + 0x6e6968] ; 0x100cf9d20
0x1006133b8: mov qword ptr [rip + 0x6e69c1], rax ; 0x100cf9d80
0x1006133bf: lea rax, [rip + 0x583831] ; 0x100b96bf7 channel03
0x1006133c6: mov qword ptr [rip + 0x6e69f3], rax ; 0x100cf9dc0
0x1006133cd: mov qword ptr [rip + 0x6e69f0], 0 ; 0x100cf9dc8
0x1006133d8: lea rax, [rip + 0x6e6991] ; 0x100cf9d70
0x1006133df: mov qword ptr [rip + 0x6e69ea], rax ; 0x100cf9dd0
0x1006133e6: lea rax, [rip + 0x583814] ; 0x100b96c01 channel04
0x1006133ed: mov qword ptr [rip + 0x6e6a1c], rax ; 0x100cf9e10
0x1006133f4: mov qword ptr [rip + 0x6e6a19], 0 ; 0x100cf9e18
0x1006133ff: lea rax, [rip + 0x6e69ba] ; 0x100cf9dc0
0x100613406: mov qword ptr [rip + 0x6e6a13], rax ; 0x100cf9e20
0x10061340d: lea rax, [rip + 0x5837f7] ; 0x100b96c0b channel05
0x100613414: mov qword ptr [rip + 0x6e6a45], rax ; 0x100cf9e60
0x10061341b: mov qword ptr [rip + 0x6e6a42], 0 ; 0x100cf9e68
0x100613426: lea rax, [rip + 0x6e69e3] ; 0x100cf9e10
0x10061342d: mov qword ptr [rip + 0x6e6a3c], rax ; 0x100cf9e70
0x100613434: lea rax, [rip + 0x5837da] ; 0x100b96c15 channel06
0x10061343b: mov qword ptr [rip + 0x6e6a6e], rax ; 0x100cf9eb0
0x100613442: lea rax, [rip + 0x6e6a17] ; 0x100cf9e60
0x100613449: mov qword ptr [rip + 0x6e6a64], 0 ; 0x100cf9eb8
0x100613454: mov qword ptr [rip + 0x6e6a65], rax ; 0x100cf9ec0
0x10061345b: lea rax, [rip + 0x5837bd] ; 0x100b96c1f channel07
0x100613462: mov qword ptr [rip + 0x6e6a97], rax ; 0x100cf9f00
0x100613469: lea rax, [rip + 0x6e6a40] ; 0x100cf9eb0
0x100613470: mov qword ptr [rip + 0x6e6a8d], 0 ; 0x100cf9f08
0x10061347b: mov qword ptr [rip + 0x6e6a8e], rax ; 0x100cf9f10
0x100613482: lea rax, [rip + 0x5837a0] ; 0x100b96c29 channel08
0x100613489: mov qword ptr [rip + 0x6e6ac0], rax ; 0x100cf9f50
0x100613490: lea rax, [rip + 0x6e6a69] ; 0x100cf9f00
0x100613497: mov qword ptr [rip + 0x6e6ab6], 0 ; 0x100cf9f58
0x1006134a2: mov qword ptr [rip + 0x6e6ab7], rax ; 0x100cf9f60
0x1006134a9: lea rax, [rip + 0x583783] ; 0x100b96c33 channel09
0x1006134b0: mov qword ptr [rip + 0x6e6ae9], rax ; 0x100cf9fa0
0x1006134b7: lea rax, [rip + 0x6e6a92] ; 0x100cf9f50
0x1006134be: mov qword ptr [rip + 0x6e6adf], 0 ; 0x100cf9fa8
0x1006134c9: mov qword ptr [rip + 0x6e6ae0], rax ; 0x100cf9fb0
0x1006134d0: lea rax, [rip + 0x583766] ; 0x100b96c3d channel10
0x1006134d7: mov qword ptr [rip + 0x6e6b12], rax ; 0x100cf9ff0
0x1006134de: lea rax, [rip + 0x6e6abb] ; 0x100cf9fa0
0x1006134e5: mov qword ptr [rip + 0x6e6b08], 0 ; 0x100cf9ff8
0x1006134f0: mov qword ptr [rip + 0x6e6b09], rax ; 0x100cfa000
0x1006134f7: lea rax, [rip + 0x583749] ; 0x100b96c47 channel11
0x1006134fe: mov qword ptr [rip + 0x6e6b3b], rax ; 0x100cfa040
0x100613505: lea rax, [rip + 0x6e6ae4] ; 0x100cf9ff0
0x10061350c: mov qword ptr [rip + 0x6e6b31], 0 ; 0x100cfa048
0x100613517: mov qword ptr [rip + 0x6e6b32], rax ; 0x100cfa050
0x10061351e: lea rax, [rip + 0x58372c] ; 0x100b96c51 channel12
0x100613525: mov qword ptr [rip + 0x6e6b64], rax ; 0x100cfa090
0x10061352c: lea rax, [rip + 0x6e6b0d] ; 0x100cfa040
0x100613533: mov qword ptr [rip + 0x6e6b5a], 0 ; 0x100cfa098
0x10061353e: mov qword ptr [rip + 0x6e6b5b], rax ; 0x100cfa0a0
0x100613545: lea rax, [rip + 0x58370f] ; 0x100b96c5b channel13
0x10061354c: mov qword ptr [rip + 0x6e6b8d], rax ; 0x100cfa0e0
0x100613553: lea rax, [rip + 0x6e6b36] ; 0x100cfa090
0x10061355a: mov qword ptr [rip + 0x6e6b83], 0 ; 0x100cfa0e8
0x100613565: mov qword ptr [rip + 0x6e6b84], rax ; 0x100cfa0f0
0x10061356c: mov qword ptr [rip + 0x6e6bbd], r14 ; 0x100cfa130
0x100613573: lea rax, [rip + 0x6e6b66] ; 0x100cfa0e0
0x10061357a: mov qword ptr [rip + 0x6e6bbf], rax ; 0x100cfa140
0x100613581: mov qword ptr [rip + 0x6e6bf8], r12 ; 0x100cfa180
0x100613588: lea rax, [rip + 0x6e6ba1] ; 0x100cfa130
0x10061358f: mov qword ptr [rip + 0x6e6bfa], rax ; 0x100cfa190
0x100613596: mov qword ptr [rip + 0x6e6c33], r13 ; 0x100cfa1d0
0x10061359d: lea rax, [rip + 0x6e6bdc] ; 0x100cfa180
0x1006135a4: mov qword ptr [rip + 0x6e6c35], rax ; 0x100cfa1e0
0x1006135ab: lea rax, [rip + 0x6e6c1e] ; 0x100cfa1d0
0x1006135b2: mov qword ptr [rip + 0x6646a7], rax ; 0x100c77c60
0x1006135b9: mov qword ptr [rip + 0x6e677c], 0x38 ; 0x100cf9d40
0x1006135c4: mov qword ptr [rip + 0x6e677d], r15 ; 0x100cf9d48
0x1006135cb: mov qword ptr [rip + 0x6e67ba], 0x3c ; 0x100cf9d90
0x1006135d6: mov qword ptr [rip + 0x6e67bb], r15 ; 0x100cf9d98
0x1006135dd: mov qword ptr [rip + 0x6e67f8], 0x40 ; 0x100cf9de0
0x1006135e8: mov qword ptr [rip + 0x6e67f9], r15 ; 0x100cf9de8
0x1006135ef: mov qword ptr [rip + 0x6e6836], 0x44 ; 0x100cf9e30
0x1006135fa: mov qword ptr [rip + 0x6e6837], r15 ; 0x100cf9e38
0x100613601: mov qword ptr [rip + 0x6e6874], 0x48 ; 0x100cf9e80
0x10061360c: mov qword ptr [rip + 0x6e6875], r15 ; 0x100cf9e88
0x100613613: mov qword ptr [rip + 0x6e68b2], 0x4c ; 0x100cf9ed0
0x10061361e: mov qword ptr [rip + 0x6e68b3], r15 ; 0x100cf9ed8
0x100613625: mov qword ptr [rip + 0x6e68f0], 0x50 ; 0x100cf9f20
0x100613630: mov qword ptr [rip + 0x6e68f1], r15 ; 0x100cf9f28
0x100613637: mov qword ptr [rip + 0x6e692e], 0x54 ; 0x100cf9f70
0x100613642: mov qword ptr [rip + 0x6e692f], r15 ; 0x100cf9f78
0x100613649: mov qword ptr [rip + 0x6e696c], 0x58 ; 0x100cf9fc0
0x100613654: mov qword ptr [rip + 0x6e696d], r15 ; 0x100cf9fc8
0x10061365b: mov qword ptr [rip + 0x6e69aa], 0x5c ; 0x100cfa010
0x100613666: mov qword ptr [rip + 0x6e69ab], r15 ; 0x100cfa018
0x10061366d: mov qword ptr [rip + 0x6e69e8], 0x60 ; 0x100cfa060
0x100613678: mov qword ptr [rip + 0x6e69e9], r15 ; 0x100cfa068
0x10061367f: mov qword ptr [rip + 0x6e6a26], 0x64 ; 0x100cfa0b0
0x10061368a: mov qword ptr [rip + 0x6e6a27], r15 ; 0x100cfa0b8
0x100613691: mov qword ptr [rip + 0x6e6a64], 0x68 ; 0x100cfa100
0x10061369c: mov qword ptr [rip + 0x6e6a65], r15 ; 0x100cfa108
0x1006136a3: mov qword ptr [rip + 0x6e6aa2], 0x6c ; 0x100cfa150
0x1006136ae: mov qword ptr [rip + 0x6e6aa3], r15 ; 0x100cfa158
0x1006136b5: mov qword ptr [rip + 0x6e6ae0], 0x70 ; 0x100cfa1a0
0x1006136c0: mov qword ptr [rip + 0x6e6ae1], r15 ; 0x100cfa1a8
0x1006136c7: mov qword ptr [rip + 0x6e6b1e], 0x74 ; 0x100cfa1f0
0x1006136d2: mov qword ptr [rip + 0x6e6b1f], r15 ; 0x100cfa1f8
0x1006136d9: mov rax, qword ptr [rip + 0x5f4cc8] ; 0x100c083a8 -> 0x100610f90 __Z18GetMetaClassByTypeIP21SetMusicChannelLevelsERK9MetaClassv
0x1006136e0: mov qword ptr [rip + 0x6e6669], rax ; 0x100cf9d50
0x1006136e7: mov qword ptr [rip + 0x6e6666], 0xffffffffffffffff ; 0x100cf9d58
0x1006136f2: mov qword ptr [rip + 0x6e6667], rbx ; 0x100cf9d60
0x1006136f9: mov qword ptr [rip + 0x6e6664], 0 ; 0x100cf9d68
0x100613704: mov qword ptr [rip + 0x6e6695], rax ; 0x100cf9da0
0x10061370b: mov qword ptr [rip + 0x6e6692], 0xffffffffffffffff ; 0x100cf9da8
0x100613716: mov qword ptr [rip + 0x6e6693], rbx ; 0x100cf9db0
0x10061371d: mov qword ptr [rip + 0x6e6690], 0 ; 0x100cf9db8
0x100613728: mov qword ptr [rip + 0x6e66c1], rax ; 0x100cf9df0
0x10061372f: mov qword ptr [rip + 0x6e66be], 0xffffffffffffffff ; 0x100cf9df8
0x10061373a: mov qword ptr [rip + 0x6e66bf], rbx ; 0x100cf9e00
0x100613741: mov qword ptr [rip + 0x6e66bc], 0 ; 0x100cf9e08
0x10061374c: mov qword ptr [rip + 0x6e66ed], rax ; 0x100cf9e40
0x100613753: mov qword ptr [rip + 0x6e66ea], 0xffffffffffffffff ; 0x100cf9e48
0x10061375e: mov qword ptr [rip + 0x6e66eb], rbx ; 0x100cf9e50
0x100613765: mov qword ptr [rip + 0x6e66e8], 0 ; 0x100cf9e58
0x100613770: mov qword ptr [rip + 0x6e6719], rax ; 0x100cf9e90
0x100613777: mov qword ptr [rip + 0x6e6716], 0xffffffffffffffff ; 0x100cf9e98
0x100613782: mov qword ptr [rip + 0x6e6717], rbx ; 0x100cf9ea0
0x100613789: mov qword ptr [rip + 0x6e6714], 0 ; 0x100cf9ea8
0x100613794: mov qword ptr [rip + 0x6e6745], rax ; 0x100cf9ee0
0x10061379b: mov qword ptr [rip + 0x6e6742], 0xffffffffffffffff ; 0x100cf9ee8
0x1006137a6: mov qword ptr [rip + 0x6e6743], rbx ; 0x100cf9ef0
0x1006137ad: mov qword ptr [rip + 0x6e6740], 0 ; 0x100cf9ef8
0x1006137b8: mov qword ptr [rip + 0x6e6771], rax ; 0x100cf9f30
0x1006137bf: mov qword ptr [rip + 0x6e676e], 0xffffffffffffffff ; 0x100cf9f38
0x1006137ca: mov qword ptr [rip + 0x6e676f], rbx ; 0x100cf9f40
0x1006137d1: mov qword ptr [rip + 0x6e676c], 0 ; 0x100cf9f48
0x1006137dc: mov qword ptr [rip + 0x6e679d], rax ; 0x100cf9f80
0x1006137e3: mov qword ptr [rip + 0x6e679a], 0xffffffffffffffff ; 0x100cf9f88
0x1006137ee: mov qword ptr [rip + 0x6e679b], rbx ; 0x100cf9f90
0x1006137f5: mov qword ptr [rip + 0x6e6798], 0 ; 0x100cf9f98
0x100613800: mov qword ptr [rip + 0x6e67c9], rax ; 0x100cf9fd0
0x100613807: mov qword ptr [rip + 0x6e67c6], 0xffffffffffffffff ; 0x100cf9fd8
0x100613812: mov qword ptr [rip + 0x6e67c7], rbx ; 0x100cf9fe0
0x100613819: mov qword ptr [rip + 0x6e67c4], 0 ; 0x100cf9fe8
0x100613824: mov qword ptr [rip + 0x6e67f5], rax ; 0x100cfa020
0x10061382b: mov qword ptr [rip + 0x6e67f2], 0xffffffffffffffff ; 0x100cfa028
0x100613836: mov qword ptr [rip + 0x6e67f3], rbx ; 0x100cfa030
0x10061383d: mov qword ptr [rip + 0x6e67f0], 0 ; 0x100cfa038
0x100613848: mov qword ptr [rip + 0x6e6821], rax ; 0x100cfa070
0x10061384f: mov qword ptr [rip + 0x6e681e], 0xffffffffffffffff ; 0x100cfa078
0x10061385a: mov qword ptr [rip + 0x6e681f], rbx ; 0x100cfa080
0x100613861: mov qword ptr [rip + 0x6e681c], 0 ; 0x100cfa088
0x10061386c: mov qword ptr [rip + 0x6e684d], rax ; 0x100cfa0c0
0x100613873: mov qword ptr [rip + 0x6e684a], 0xffffffffffffffff ; 0x100cfa0c8
0x10061387e: mov qword ptr [rip + 0x6e684b], rbx ; 0x100cfa0d0
0x100613885: mov qword ptr [rip + 0x6e6848], 0 ; 0x100cfa0d8
0x100613890: mov qword ptr [rip + 0x6e6879], rax ; 0x100cfa110
0x100613897: mov qword ptr [rip + 0x6e6876], 0xffffffffffffffff ; 0x100cfa118
0x1006138a2: mov qword ptr [rip + 0x6e6877], rbx ; 0x100cfa120
0x1006138a9: mov qword ptr [rip + 0x6e6874], 0 ; 0x100cfa128
0x1006138b4: mov qword ptr [rip + 0x6e68a5], rax ; 0x100cfa160
0x1006138bb: mov qword ptr [rip + 0x6e68a2], 0xffffffffffffffff ; 0x100cfa168
0x1006138c6: mov qword ptr [rip + 0x6e68a3], rbx ; 0x100cfa170
0x1006138cd: mov qword ptr [rip + 0x6e68a0], 0 ; 0x100cfa178
0x1006138d8: mov qword ptr [rip + 0x6e68d1], rax ; 0x100cfa1b0
0x1006138df: mov qword ptr [rip + 0x6e68ce], 0xffffffffffffffff ; 0x100cfa1b8
0x1006138ea: mov qword ptr [rip + 0x6e68cf], rbx ; 0x100cfa1c0
0x1006138f1: mov qword ptr [rip + 0x6e68cc], 0 ; 0x100cfa1c8
0x1006138fc: mov qword ptr [rip + 0x6e68fd], rax ; 0x100cfa200
0x100613903: mov qword ptr [rip + 0x6e68fa], 0xffffffffffffffff ; 0x100cfa208
0x10061390e: mov qword ptr [rip + 0x6e68fb], rbx ; 0x100cfa210
0x100613915: mov qword ptr [rip + 0x6e68f8], 0 ; 0x100cfa218
0x100613920: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100613925: vmovaps xmmword ptr [rip + 0x1a17023], xmm0 ; 0x10202a950
0x10061392d: mov rax, qword ptr [rip + 0x6e63f4] ; 0x100cf9d28
0x100613934: mov qword ptr [rip + 0x1a17025], rax ; 0x10202a960
0x10061393b: lea rax, [rip + 0x1a1700e] ; 0x10202a950
0x100613942: mov qword ptr [rip + 0x6e63df], rax ; 0x100cf9d28
0x100613949: vmovaps xmmword ptr [rip + 0x1a1701f], xmm0 ; 0x10202a970
0x100613951: mov rax, qword ptr [rip + 0x6e6420] ; 0x100cf9d78
0x100613958: mov qword ptr [rip + 0x1a17021], rax ; 0x10202a980
0x10061395f: lea rax, [rip + 0x1a1700a] ; 0x10202a970
0x100613966: mov qword ptr [rip + 0x6e640b], rax ; 0x100cf9d78
0x10061396d: vmovaps xmmword ptr [rip + 0x1a1701b], xmm0 ; 0x10202a990
0x100613975: mov rax, qword ptr [rip + 0x6e644c] ; 0x100cf9dc8
0x10061397c: mov qword ptr [rip + 0x1a1701d], rax ; 0x10202a9a0
0x100613983: lea rax, [rip + 0x1a17006] ; 0x10202a990
0x10061398a: mov qword ptr [rip + 0x6e6437], rax ; 0x100cf9dc8
0x100613991: vmovaps xmmword ptr [rip + 0x1a17017], xmm0 ; 0x10202a9b0
0x100613999: mov rax, qword ptr [rip + 0x6e6478] ; 0x100cf9e18
0x1006139a0: mov qword ptr [rip + 0x1a17019], rax ; 0x10202a9c0
0x1006139a7: lea rax, [rip + 0x1a17002] ; 0x10202a9b0
0x1006139ae: mov qword ptr [rip + 0x6e6463], rax ; 0x100cf9e18
0x1006139b5: vmovaps xmmword ptr [rip + 0x1a17013], xmm0 ; 0x10202a9d0
0x1006139bd: mov rax, qword ptr [rip + 0x6e64a4] ; 0x100cf9e68
0x1006139c4: mov qword ptr [rip + 0x1a17015], rax ; 0x10202a9e0
0x1006139cb: lea rax, [rip + 0x1a16ffe] ; 0x10202a9d0
0x1006139d2: mov qword ptr [rip + 0x6e648f], rax ; 0x100cf9e68
0x1006139d9: vmovaps xmmword ptr [rip + 0x1a1700f], xmm0 ; 0x10202a9f0
0x1006139e1: mov rax, qword ptr [rip + 0x6e64d0] ; 0x100cf9eb8
0x1006139e8: mov qword ptr [rip + 0x1a17011], rax ; 0x10202aa00
0x1006139ef: lea rax, [rip + 0x1a16ffa] ; 0x10202a9f0
0x1006139f6: mov qword ptr [rip + 0x6e64bb], rax ; 0x100cf9eb8
0x1006139fd: vmovaps xmmword ptr [rip + 0x1a1700b], xmm0 ; 0x10202aa10
0x100613a05: mov rax, qword ptr [rip + 0x6e64fc] ; 0x100cf9f08
0x100613a0c: mov qword ptr [rip + 0x1a1700d], rax ; 0x10202aa20
0x100613a13: lea rax, [rip + 0x1a16ff6] ; 0x10202aa10
0x100613a1a: mov qword ptr [rip + 0x6e64e7], rax ; 0x100cf9f08
0x100613a21: vmovaps xmmword ptr [rip + 0x1a17007], xmm0 ; 0x10202aa30
0x100613a29: mov rax, qword ptr [rip + 0x6e6528] ; 0x100cf9f58
0x100613a30: mov qword ptr [rip + 0x1a17009], rax ; 0x10202aa40
0x100613a37: lea rax, [rip + 0x1a16ff2] ; 0x10202aa30
0x100613a3e: mov qword ptr [rip + 0x6e6513], rax ; 0x100cf9f58
0x100613a45: vmovaps xmmword ptr [rip + 0x1a17003], xmm0 ; 0x10202aa50
0x100613a4d: mov rax, qword ptr [rip + 0x6e6554] ; 0x100cf9fa8
0x100613a54: mov qword ptr [rip + 0x1a17005], rax ; 0x10202aa60
0x100613a5b: lea rax, [rip + 0x1a16fee] ; 0x10202aa50
0x100613a62: mov qword ptr [rip + 0x6e653f], rax ; 0x100cf9fa8
0x100613a69: vmovaps xmmword ptr [rip + 0x1a16fff], xmm0 ; 0x10202aa70
0x100613a71: mov rax, qword ptr [rip + 0x6e6580] ; 0x100cf9ff8
0x100613a78: mov qword ptr [rip + 0x1a17001], rax ; 0x10202aa80
0x100613a7f: lea rax, [rip + 0x1a16fea] ; 0x10202aa70
0x100613a86: mov qword ptr [rip + 0x6e656b], rax ; 0x100cf9ff8
0x100613a8d: vmovaps xmmword ptr [rip + 0x1a16ffb], xmm0 ; 0x10202aa90
0x100613a95: mov rax, qword ptr [rip + 0x6e65ac] ; 0x100cfa048
0x100613a9c: mov qword ptr [rip + 0x1a16ffd], rax ; 0x10202aaa0
0x100613aa3: lea rax, [rip + 0x1a16fe6] ; 0x10202aa90
0x100613aaa: mov qword ptr [rip + 0x6e6597], rax ; 0x100cfa048
0x100613ab1: vmovaps xmmword ptr [rip + 0x1a16ff7], xmm0 ; 0x10202aab0
0x100613ab9: mov rax, qword ptr [rip + 0x6e65d8] ; 0x100cfa098
0x100613ac0: mov qword ptr [rip + 0x1a16ff9], rax ; 0x10202aac0
0x100613ac7: lea rax, [rip + 0x1a16fe2] ; 0x10202aab0
0x100613ace: mov qword ptr [rip + 0x6e65c3], rax ; 0x100cfa098
0x100613ad5: vmovaps xmmword ptr [rip + 0x1a16ff3], xmm0 ; 0x10202aad0
0x100613add: mov rax, qword ptr [rip + 0x6e6604] ; 0x100cfa0e8
0x100613ae4: mov qword ptr [rip + 0x1a16ff5], rax ; 0x10202aae0
0x100613aeb: lea rax, [rip + 0x1a16fde] ; 0x10202aad0
0x100613af2: mov qword ptr [rip + 0x6e65ef], rax ; 0x100cfa0e8
0x100613af9: lea rax, [rip + 0x1a16ff0] ; 0x10202aaf0
0x100613b00: mov qword ptr [rip + 0x6e6631], rax ; 0x100cfa138
0x100613b07: lea rax, [rip + 0x1a17002] ; 0x10202ab10
0x100613b0e: mov qword ptr [rip + 0x6e6673], rax ; 0x100cfa188
0x100613b15: lea rax, [rip + 0x1a17014] ; 0x10202ab30
0x100613b1c: mov qword ptr [rip + 0x6e66b5], rax ; 0x100cfa1d8
0x100613b23: lea rax, [rip + 0x58316f] ; 0x100b96c99 SetMusicChannelOverrideEnabled
0x100613b2a: mov qword ptr [rip + 0x1a1701f], rax ; 0x10202ab50
0x100613b31: mov qword ptr [rip + 0x1a1701c], 0 ; 0x10202ab58
0x100613b3c: mov rax, qword ptr [rip + 0x65c415] ; 0x100c6ff58
0x100613b43: mov qword ptr [rip + 0x1a17016], rax ; 0x10202ab60
0x100613b4a: lea rax, [rip + 0x1a16ff7] ; 0x10202ab48
0x100613b51: mov qword ptr [rip + 0x65c400], rax ; 0x100c6ff58
0x100613b58: mov qword ptr [rip + 0x1a17011], rax ; 0x10202ab70
0x100613b5f: mov rax, qword ptr [rip + 0x5f4a82] ; 0x100c085e8 -> 0x10001ed60 __Z18GetMetaClassByTypeIP5EventERK9MetaClassv
0x100613b66: mov qword ptr [rip + 0x1a1700b], rax ; 0x10202ab78
0x100613b6d: mov dword ptr [rip + 0x1a17009], 0xffffffff ; 0x10202ab80
0x100613b77: mov dword ptr [rip + 0x1a17003], 0xffffffff ; 0x10202ab84
0x100613b81: mov qword ptr [rip + 0x1a17014], 0 ; 0x10202aba0
0x100613b8c: mov rax, qword ptr [rip + 0x5f8795] ; 0x100c0c328
0x100613b93: add rax, 0x10
0x100613b97: mov qword ptr [rip + 0x1a16faa], rax ; 0x10202ab48
0x100613b9e: vmovaps xmmword ptr [rip + 0x1a16f4a], xmm0 ; 0x10202aaf0
0x100613ba6: mov qword ptr [rip + 0x1a16f4f], 0 ; 0x10202ab00
0x100613bb1: vmovaps xmmword ptr [rip + 0x1a16f57], xmm0 ; 0x10202ab10
0x100613bb9: mov qword ptr [rip + 0x1a16f5c], 0 ; 0x10202ab20
0x100613bc4: vmovaps xmmword ptr [rip + 0x1a16f64], xmm0 ; 0x10202ab30
0x100613bcc: mov qword ptr [rip + 0x1a16f69], 0 ; 0x10202ab40
0x100613bd7: xor eax, eax
0x100613bd9: call 0x100011c10 ; 0x100011c10
0x100613bde: lea rax, [rip + 0x5830d3] ; 0x100b96cb8 overrideEnabled
0x100613be5: mov qword ptr [rip + 0x6e6634], rax ; 0x100cfa220
0x100613bec: lea rax, [rip + 0x6e662d] ; 0x100cfa220
0x100613bf3: mov rcx, qword ptr [rip + 0x664066] ; 0x100c77c60
0x100613bfa: mov qword ptr [rip + 0x6e662f], rcx ; 0x100cfa230
0x100613c01: mov qword ptr [rip + 0x664058], rax ; 0x100c77c60
0x100613c08: mov qword ptr [rip + 0x6e662d], 0x38 ; 0x100cfa240
0x100613c13: mov r14, qword ptr [rip + 0x5f393e] ; 0x100c07558 -> 0x100019a00 __Z17GetMetaTypeByTypeIbERK8MetaTypev
0x100613c1a: mov qword ptr [rip + 0x6e6627], r14 ; 0x100cfa248
0x100613c21: mov rax, qword ptr [rip + 0x5f48e0] ; 0x100c08508 -> 0x100611230 __Z18GetMetaClassByTypeIP30SetMusicChannelOverrideEnabledERK9MetaClassv
0x100613c28: mov qword ptr [rip + 0x6e6621], rax ; 0x100cfa250
0x100613c2f: mov qword ptr [rip + 0x6e661e], 0xffffffffffffffff ; 0x100cfa258
0x100613c3a: mov qword ptr [rip + 0x6e661f], rbx ; 0x100cfa260
0x100613c41: mov qword ptr [rip + 0x6e661c], 0 ; 0x100cfa268
0x100613c4c: lea rax, [rip + 0x58f3d9] ; 0x100ba302c false
0x100613c53: vmovq xmm0, rax
0x100613c58: vmovdqa xmm1, xmmword ptr [rbp - 0x50]
0x100613c5d: vpunpcklqdq xmm0, xmm1, xmm0
0x100613c61: vmovdqa xmmword ptr [rip + 0x1a16f47], xmm0 ; 0x10202abb0
0x100613c69: lea rax, [rip + 0x1a16f40] ; 0x10202abb0
0x100613c70: mov qword ptr [rip + 0x1a16f45], 0 ; 0x10202abc0
0x100613c7b: mov qword ptr [rip + 0x6e65a6], rax ; 0x100cfa228
0x100613c82: lea rdi, [rip + 0x718ddf] ; 0x100d2ca68
0x100613c89: lea rsi, [rip + 0x1a16f38] ; 0x10202abc8
0x100613c90: lea rdx, [rip + 0x583031] ; 0x100b96cc8 tag_FadeSound
0x100613c97: call 0x1007951b0 ; 0x1007951b0
0x100613c9c: lea rdi, [rip + 0x718ddd] ; 0x100d2ca80
0x100613ca3: lea rsi, [rip + 0x1a16f26] ; 0x10202abd0
0x100613caa: lea rdx, [rip + 0x583025] ; 0x100b96cd6 tag_SoundEmitter
0x100613cb1: call 0x1007951b0 ; 0x1007951b0
0x100613cb6: lea rax, [rip + 0x58302a] ; 0x100b96ce7 kDebugSoundEmitters
0x100613cbd: mov qword ptr [rip + 0x1a16f1c], rax ; 0x10202abe0
0x100613cc4: lea rax, [rip + 0x1a16f15] ; 0x10202abe0
0x100613ccb: mov rcx, qword ptr [rip + 0x67bfce] ; 0x100c8fca0
0x100613cd2: mov qword ptr [rip + 0x1a16f17], rcx ; 0x10202abf0
0x100613cd9: mov qword ptr [rip + 0x67bfc0], rax ; 0x100c8fca0
0x100613ce0: lea rax, [rip + 0x1a16ef1] ; 0x10202abd8
0x100613ce7: vmovq xmm0, rax
0x100613cec: lea rax, [rip + 0x583008] ; 0x100b96cfb SoundEmitter.cpp
0x100613cf3: vmovq xmm1, rax
0x100613cf8: vpunpcklqdq xmm0, xmm1, xmm0
0x100613cfc: vmovdqu xmmword ptr [rip + 0x1a16efc], xmm0 ; 0x10202ac00
0x100613d04: mov qword ptr [rip + 0x1a16f05], r14 ; 0x10202ac10
0x100613d0b: mov qword ptr [rip + 0x1a16f02], 0 ; 0x10202ac18
0x100613d16: mov qword ptr [rip + 0x1a16f03], rbx ; 0x10202ac20
0x100613d1d: mov qword ptr [rip + 0x1a16f00], 0 ; 0x10202ac28
0x100613d28: lea rax, [rip + 0x54e5fa] ; 0x100b62329 Audio
0x100613d2f: vmovq xmm0, rax
0x100613d34: lea rax, [rip + 0x54a2e2] ; 0x100b5e01d TweakCategory
0x100613d3b: vmovq xmm1, rax
0x100613d40: vpunpcklqdq xmm0, xmm1, xmm0
0x100613d44: vmovdqa xmmword ptr [rip + 0x1a16ee4], xmm0 ; 0x10202ac30
0x100613d4c: lea rax, [rip + 0x1a16edd] ; 0x10202ac30
0x100613d53: mov qword ptr [rip + 0x1a16ee2], 0 ; 0x10202ac40
0x100613d5e: mov qword ptr [rip + 0x1a16e83], rax ; 0x10202abe8
0x100613d65: add rsp, 0x48
0x100613d69: pop rbx
0x100613d6a: pop r12
0x100613d6c: pop r13
0x100613d6e: pop r14
0x100613d70: pop r15
0x100613d72: pop rbp
0x100613d73: ret 
0x100613d74: nop 
0x100613d75: nop 
0x100613d76: nop 
0x100613d77: nop 
0x100613d78: nop 
0x100613d79: nop 
0x100613d7a: nop 
0x100613d7b: nop 
0x100613d7c: nop 
0x100613d7d: nop 
0x100613d7e: nop 
0x100613d7f: nop 
