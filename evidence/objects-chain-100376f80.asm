0x100376f80: push rbp
0x100376f81: mov rbp, rsp
0x100376f84: push r15
0x100376f86: push r14
0x100376f88: push r13
0x100376f8a: push r12
0x100376f8c: push rbx
0x100376f8d: and rsp, 0xffffffffffffffe0
0x100376f91: sub rsp, 0x320
0x100376f98: mov r12, rdi
0x100376f9b: mov rax, qword ptr [rip + 0x896936] ; 0x100c0d8d8
0x100376fa2: mov rax, qword ptr [rax]
0x100376fa5: mov qword ptr [rsp + 0x300], rax
0x100376fad: xor edi, edi
0x100376faf: call 0x100aa2d3e ; 0x100aa2d3e _time
0x100376fb4: mov r14, rax
0x100376fb7: mov edi, r14d
0x100376fba: call 0x100aa2c30 ; 0x100aa2c30 _srand
0x100376fbf: call 0x1007abc10 ; 0x1007abc10
0x100376fc4: mov rax, qword ptr [rip + 0x1c83985] ; 0x101ffa950
0x100376fcb: mov eax, dword ptr [rax + 0x38]
0x100376fce: mov qword ptr [r12 + 0x1370], rax
0x100376fd6: mov rdi, qword ptr [r12 + 0x58]
0x100376fdb: mov rax, qword ptr [rdi]
0x100376fde: mov esi, 0x3c
0x100376fe3: call qword ptr [rax + 0x188]
0x100376fe9: lea rdi, [r12 + 0xe70]
0x100376ff1: call 0x1007e6eb0 ; 0x1007e6eb0
0x100376ff6: mov rdi, qword ptr [r12 + 0xa0]
0x100376ffe: call 0x10079d4f0 ; 0x10079d4f0
0x100377003: mov rax, qword ptr [r12 + 0xa0]
0x10037700b: mov byte ptr [rax + 0x20], 0
0x10037700f: call 0x1007f1e00 ; 0x1007f1e00
0x100377014: mov rbx, rax
0x100377017: call 0x1007ea2c0 ; 0x1007ea2c0
0x10037701c: mov rdi, rbx
0x10037701f: mov rsi, rax
0x100377022: call 0x1007f1e10 ; 0x1007f1e10
0x100377027: mov rdi, qword ptr [r12 + 0x108]
0x10037702f: call 0x1007c6890 ; 0x1007c6890
0x100377034: mov edi, 0x1000000
0x100377039: call 0x1007c6930 ; 0x1007c6930
0x10037703e: mov qword ptr [rip + 0x1c81f5b], r12 ; 0x101ff8fa0
0x100377045: mov edi, 0x68
0x10037704a: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x10037704f: mov rbx, rax
0x100377052: vxorps ymm0, ymm0, ymm0
0x100377056: vmovups ymmword ptr [rbx + 0x40], ymm0
0x10037705b: vmovups ymmword ptr [rbx + 0x20], ymm0
0x100377060: vmovups ymmword ptr [rbx], ymm0
0x100377064: mov qword ptr [rbx + 0x60], 0
0x10037706c: lea rdi, [rbx + 0x10]
0x100377070: vzeroupper 
0x100377073: call 0x100795360 ; 0x100795360
0x100377078: mov qword ptr [r12 + 0x10], rbx
0x10037707d: mov esi, 0xa00000
0x100377082: mov rdi, rbx
0x100377085: call 0x10041aa50 ; 0x10041aa50
0x10037708a: lea rax, [rip - 0x1411] ; 0x100375c80
0x100377091: lea rcx, [rip + 0x99ab78] ; 0x100d11c10
0x100377098: mov qword ptr [rcx], rax
0x10037709b: mov rdi, qword ptr [r12 + 0x10]
0x1003770a0: call 0x10041ab10 ; 0x10041ab10
0x1003770a5: mov qword ptr [r12 + 0x18], rax
0x1003770aa: mov rdi, rax
0x1003770ad: call 0x100825857 ; 0x100825857
0x1003770b2: mov rsi, qword ptr [r12 + 0x18]
0x1003770b7: mov rdi, qword ptr [r12 + 0x98]
0x1003770bf: call 0x1007a9f00 ; 0x1007a9f00
0x1003770c4: mov rdi, qword ptr [r12 + 0x18]
0x1003770c9: lea rsi, [rip + 0x80c798] ; 0x100b83868
0x1003770d0: call 0x1007a6ef0 ; 0x1007a6ef0
0x1003770d5: mov rdi, qword ptr [r12 + 0x18]
0x1003770da: lea rsi, [rip + 0x80c7c6] ; 0x100b838a7 function SetGame( g ) _G.game = g end
0x1003770e1: call 0x1007a6ef0 ; 0x1007a6ef0
0x1003770e6: mov rbx, qword ptr [r12 + 0x18]
0x1003770eb: mov qword ptr [rsp + 0x40], r12
0x1003770f0: lea rax, [rsp + 0x40]
0x1003770f5: mov qword ptr [rsp + 0xd0], rax
0x1003770fd: mov rax, qword ptr [rip + 0x1c8234c] ; 0x101ff9450
0x100377104: mov qword ptr [rsp + 0xd8], rax
0x10037710c: call 0x1007abbf0 ; 0x1007abbf0
0x100377111: mov dword ptr [rsp], 1
0x100377118: lea rdx, [rip + 0x80c7ae] ; 0x100b838cd SetGame
0x10037711f: lea r9, [rsp + 0xd0]
0x100377127: xor esi, esi
0x100377129: xor ecx, ecx
0x10037712b: mov rdi, rbx
0x10037712e: mov r8, rax
0x100377131: call 0x1000f0760 ; 0x1000f0760
0x100377136: mov byte ptr [rsp + 0x40], 0
0x10037713b: mov dword ptr [rsp + 0x4c], 0
0x100377143: vmovaps ymm0, ymmword ptr [rip + 0x746bd5] ; 0x100abdd20
0x10037714b: vmovups ymmword ptr [rsp + 0x60], ymm0
0x100377151: mov qword ptr [rsp + 0x44], 3
0x10037715a: lea rdi, [rsp + 0x50]
0x10037715f: vzeroupper 
0x100377162: call 0x1007d1130 ; 0x1007d1130
0x100377167: mov dword ptr [rsp + 0x48], eax
0x10037716b: lea rdi, [rsp + 0x58]
0x100377170: call 0x1007d1110 ; 0x1007d1110
0x100377175: mov dword ptr [rsp + 0x4c], eax
0x100377179: movabs rax, 0x10000000400
0x100377183: mov qword ptr [rsp + 0x60], rax
0x100377188: vmovaps xmm0, xmmword ptr [rip + 0x747040] ; 0x100abe1d0  
0x100377190: vmovups xmmword ptr [rsp + 0x68], xmm0
0x100377196: movabs rax, 0x100000000200
0x1003771a0: mov qword ptr [rsp + 0x78], rax
0x1003771a5: mov rsi, qword ptr [r12 + 0xd8]
0x1003771ad: lea rdi, [rsp + 0x40]
0x1003771b2: call 0x1007c1850 ; 0x1007c1850
0x1003771b7: mov rdi, qword ptr [r12 + 0x100]
0x1003771bf: call 0x100795b70 ; 0x100795b70
0x1003771c4: mov rcx, qword ptr [r12 + 0x60]
0x1003771c9: mov rdx, qword ptr [r12 + 0x100]
0x1003771d1: movzx esi, byte ptr [rcx + 9]
0x1003771d5: mov edi, eax
0x1003771d7: call 0x1007e39e0 ; 0x1007e39e0
0x1003771dc: mov rsi, qword ptr [r12 + 0xd0]
0x1003771e4: mov rdi, qword ptr [r12 + 0x118]
0x1003771ec: mov edx, dword ptr [r12 + 0x1468]
0x1003771f4: mov ecx, 0x100000
0x1003771f9: mov r8d, 0x100000
0x1003771ff: call 0x10079df20 ; 0x10079df20
0x100377204: mov rdi, qword ptr [r12 + 0x60]
0x100377209: call 0x100781710 ; 0x100781710
0x10037720e: call 0x100460160 ; 0x100460160
0x100377213: mov rdi, qword ptr [r12 + 0x90]
0x10037721b: call 0x1007e50c0 ; 0x1007e50c0
0x100377220: mov rdi, qword ptr [r12 + 0xd0]
0x100377228: mov rbx, qword ptr [r12 + 0x138]
0x100377230: mov rdx, qword ptr [rip + 0x1a81d61] ; 0x101df8f98
0x100377237: mov esi, 0x1900000
0x10037723c: mov ecx, 0x10
0x100377241: call 0x100795530 ; 0x100795530
0x100377246: mov edx, 0x1900000
0x10037724b: mov rdi, rbx
0x10037724e: mov rsi, rax
0x100377251: call 0x1007768a0 ; 0x1007768a0
0x100377256: lea rdi, [rsp + 0x220]
0x10037725e: lea rbx, [rsp + 0xd8]
0x100377266: mov rax, qword ptr [rip + 0x8932b3] ; 0x100c0a520
0x10037726d: lea rcx, [rax + 0x18]
0x100377271: mov qword ptr [rsp + 0x30], rcx
0x100377276: mov qword ptr [rsp + 0xd0], rcx
0x10037727e: add rax, 0x40
0x100377282: mov qword ptr [rsp + 0x38], rax
0x100377287: mov qword ptr [rsp + 0x220], rax
0x10037728f: mov rsi, rbx
0x100377292: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x100377297: mov qword ptr [rsp + 0x2a8], 0
0x1003772a3: mov dword ptr [rsp + 0x2b0], 0xffffffff
0x1003772ae: mov rax, qword ptr [rip + 0x896313] ; 0x100c0d5c8
0x1003772b5: lea rcx, [rax + 0x18]
0x1003772b9: mov qword ptr [rsp + 0x18], rcx
0x1003772be: mov qword ptr [rsp + 0xd0], rcx
0x1003772c6: add rax, 0x40
0x1003772ca: mov qword ptr [rsp + 0x28], rax
0x1003772cf: mov qword ptr [rsp + 0x220], rax
0x1003772d7: lea rsi, [rip + 0x80bb71] ; 0x100b82e4f Game
0x1003772de: mov edx, 2
0x1003772e3: mov rdi, rbx
0x1003772e6: call 0x1007a56a0 ; 0x1007a56a0
0x1003772eb: lea rsi, [rip + 0x80c5e3] ; 0x100b838d5
0x1003772f2: lea rdi, [rsp + 0xd0]
0x1003772fa: mov edx, 0xb
0x1003772ff: call 0x100011930 ; 0x100011930
0x100377304: lea rsi, [rip + 0x80c5d6] ; 0x100b838e1
0x10037730b: mov edx, 0x1f
0x100377310: mov rdi, rax
0x100377313: call 0x100011930 ; 0x100011930
0x100377318: lea rsi, [rip + 0x80c5e2] ; 0x100b83901 Device: 
0x10037731f: mov edx, 8
0x100377324: mov rdi, rax
0x100377327: call 0x100011930 ; 0x100011930
0x10037732c: mov r15, rax
0x10037732f: mov rbx, qword ptr [r12 + 0x60]
0x100377334: add rbx, 0xa
0x100377338: mov rdi, rbx
0x10037733b: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100377340: mov rdi, r15
0x100377343: mov rsi, rbx
0x100377346: mov rdx, rax
0x100377349: call 0x100011930 ; 0x100011930
0x10037734e: lea rsi, [rip + 0x7e9565] ; 0x100b608ba
0x100377355: mov edx, 1
0x10037735a: mov rdi, rax
0x10037735d: call 0x100011930 ; 0x100011930
0x100377362: lea rsi, [rip + 0x80c5a1] ; 0x100b8390a Config: 
0x100377369: mov edx, 8
0x10037736e: mov rdi, rax
0x100377371: call 0x100011930 ; 0x100011930
0x100377376: lea rsi, [rip + 0x80c596] ; 0x100b83913 Gold
0x10037737d: mov edx, 4
0x100377382: mov rdi, rax
0x100377385: call 0x100011930 ; 0x100011930
0x10037738a: lea rsi, [rip + 0x7e9529] ; 0x100b608ba
0x100377391: mov edx, 1
0x100377396: mov rdi, rax
0x100377399: call 0x100011930 ; 0x100011930
0x10037739e: lea rsi, [rip + 0x80c573] ; 0x100b83918 Type: 
0x1003773a5: mov edx, 6
0x1003773aa: mov rdi, rax
0x1003773ad: call 0x100011930 ; 0x100011930
0x1003773b2: mov r15, rax
0x1003773b5: mov rax, qword ptr [r12 + 0x60]
0x1003773ba: mov eax, dword ptr [rax + 0x210]
0x1003773c0: lea rcx, [rip + 0x80c915] ; 0x100b83cdc TV
0x1003773c7: vmovq xmm0, rcx
0x1003773cc: lea rcx, [rip + 0x80c906] ; 0x100b83cd9 PC
0x1003773d3: vmovq xmm1, rcx
0x1003773d8: vpunpcklqdq xmm0, xmm1, xmm0
0x1003773dc: lea rcx, [rip + 0x80c8ef] ; 0x100b83cd2 Tablet
0x1003773e3: vmovq xmm1, rcx
0x1003773e8: lea rcx, [rip + 0x80c8dd] ; 0x100b83ccc Phone
0x1003773ef: vmovq xmm2, rcx
0x1003773f4: vpunpcklqdq xmm1, xmm2, xmm1
0x1003773f8: vinsertf128 ymm0, ymm1, xmm0, 1
0x1003773fe: vmovups ymmword ptr [rsp + 0x2c0], ymm0
0x100377407: lea rcx, [rip + 0x80c8d1] ; 0x100b83cdf Headless
0x10037740e: mov qword ptr [rsp + 0x2e0], rcx
0x100377416: mov rbx, qword ptr [rsp + rax*8 + 0x2c0]
0x10037741e: mov rdi, rbx
0x100377421: vzeroupper 
0x100377424: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100377429: mov rdi, r15
0x10037742c: mov rsi, rbx
0x10037742f: mov rdx, rax
0x100377432: call 0x100011930 ; 0x100011930
0x100377437: lea rsi, [rip + 0x7e947c] ; 0x100b608ba
0x10037743e: mov edx, 1
0x100377443: mov rdi, rax
0x100377446: call 0x100011930 ; 0x100011930
0x10037744b: lea rsi, [rip + 0x80c4cd] ; 0x100b8391f Version: 
0x100377452: mov edx, 9
0x100377457: mov rdi, rax
0x10037745a: call 0x100011930 ; 0x100011930
0x10037745f: mov esi, dword ptr [r12 + 0x1008]
0x100377467: mov rdi, rax
0x10037746a: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x10037746f: lea rsi, [rip + 0x7fc324] ; 0x100b7379a .
0x100377476: mov edx, 1
0x10037747b: mov rdi, rax
0x10037747e: call 0x100011930 ; 0x100011930
0x100377483: mov esi, dword ptr [r12 + 0x100c]
0x10037748b: mov rdi, rax
0x10037748e: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x100377493: lea rsi, [rip + 0x7fc300] ; 0x100b7379a .
0x10037749a: mov edx, 1
0x10037749f: mov rdi, rax
0x1003774a2: call 0x100011930 ; 0x100011930
0x1003774a7: mov esi, dword ptr [r12 + 0x1010]
0x1003774af: mov rdi, rax
0x1003774b2: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x1003774b7: lea rsi, [rip + 0x7fc2dc] ; 0x100b7379a .
0x1003774be: mov edx, 1
0x1003774c3: mov rdi, rax
0x1003774c6: call 0x100011930 ; 0x100011930
0x1003774cb: mov esi, dword ptr [r12 + 0x1014]
0x1003774d3: mov rdi, rax
0x1003774d6: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x1003774db: lea r13, [rip + 0x7e93d8] ; 0x100b608ba
0x1003774e2: mov edx, 1
0x1003774e7: mov rdi, rax
0x1003774ea: mov rsi, r13
0x1003774ed: call 0x100011930 ; 0x100011930
0x1003774f2: lea rsi, [rip + 0x80c430] ; 0x100b83929 Renderer: 
0x1003774f9: mov edx, 0xa
0x1003774fe: mov rdi, rax
0x100377501: call 0x100011930 ; 0x100011930
0x100377506: mov rbx, rax
0x100377509: call 0x1007c19b0 ; 0x1007c19b0
0x10037750e: mov r15, rax
0x100377511: mov rdi, r15
0x100377514: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100377519: mov rdi, rbx
0x10037751c: mov rsi, r15
0x10037751f: mov rdx, rax
0x100377522: call 0x100011930 ; 0x100011930
0x100377527: lea rsi, [rip + 0x80c406] ; 0x100b83934
0x10037752e: movzx ecx, byte ptr [rsp + 0x40]
0x100377533: test rcx, rcx
0x100377536: cmove rsi, r13
0x10037753a: lea rdx, [rcx*8 + 1]
0x100377542: mov rdi, rax
0x100377545: call 0x100011930 ; 0x100011930
0x10037754a: lea rsi, [rip + 0x80c3ed] ; 0x100b8393e SoundSystem: 
0x100377551: mov edx, 0xd
0x100377556: mov rdi, rax
0x100377559: call 0x100011930 ; 0x100011930
0x10037755e: mov r15, rax
0x100377561: call 0x1007e3be0 ; 0x1007e3be0
0x100377566: mov rbx, rax
0x100377569: mov rdi, rbx
0x10037756c: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100377571: mov rdi, r15
0x100377574: mov rsi, rbx
0x100377577: mov rdx, rax
0x10037757a: call 0x100011930 ; 0x100011930
0x10037757f: lea rsi, [rip + 0x7e9334] ; 0x100b608ba
0x100377586: mov edx, 1
0x10037758b: mov rdi, rax
0x10037758e: call 0x100011930 ; 0x100011930
0x100377593: lea rsi, [rip + 0x80c3b2] ; 0x100b8394c RandomSeed: 
0x10037759a: mov edx, 0xc
0x10037759f: mov rdi, rax
0x1003775a2: call 0x100011930 ; 0x100011930
0x1003775a7: mov rdi, rax
0x1003775aa: mov esi, r14d
0x1003775ad: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x1003775b2: lea rsi, [rip + 0x7e9301] ; 0x100b608ba
0x1003775b9: mov edx, 1
0x1003775be: mov rdi, rax
0x1003775c1: call 0x100011930 ; 0x100011930
0x1003775c6: lea rsi, [rip + 0x80c38c] ; 0x100b83959 ==============================
0x1003775cd: mov edx, 0x1e
0x1003775d2: mov rdi, rax
0x1003775d5: call 0x100011930 ; 0x100011930
0x1003775da: mov rax, qword ptr [rsp + 0x18]
0x1003775df: mov qword ptr [rsp + 0xd0], rax
0x1003775e7: mov rax, qword ptr [rsp + 0x28]
0x1003775ec: mov qword ptr [rsp + 0x220], rax
0x1003775f4: lea rdi, [rsp + 0xd8]
0x1003775fc: call 0x1007a58d0 ; 0x1007a58d0
0x100377601: mov rsi, qword ptr [rip + 0x892f78] ; 0x100c0a580
0x100377608: add rsi, 8
0x10037760c: lea rdi, [rsp + 0xd0]
0x100377614: mov qword ptr [rsp + 0x20], rsi
0x100377619: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10037761e: lea rdi, [rsp + 0x220]
0x100377626: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10037762b: mov rsi, qword ptr [r12 + 0x60]
0x100377630: add rsi, 0xa
0x100377634: lea rdi, [rip + 0x80c33d] ; 0x100b83978 DeviceName
0x10037763b: call 0x100780960 ; 0x100780960
0x100377640: lea rdi, [rip + 0x8049e4] ; 0x100b7c02b Config
0x100377647: lea rsi, [rip + 0x80c2c5] ; 0x100b83913 Gold
0x10037764e: call 0x100780960 ; 0x100780960
0x100377653: lea rdi, [rip + 0x80c329] ; 0x100b83983 Platform
0x10037765a: lea r13, [rip + 0x80c32b] ; 0x100b8398c macosx
0x100377661: mov rsi, r13
0x100377664: call 0x100780960 ; 0x100780960
0x100377669: mov esi, dword ptr [r12 + 0x1014]
0x100377671: lea rdi, [rip + 0x80c31b] ; 0x100b83993 GameVersion
0x100377678: call 0x100780980 ; 0x100780980
0x10037767d: lea rax, [rip + 0x74c93c] ; 0x100ac3fc0
0x100377684: movzx esi, word ptr [rax]
0x100377687: lea rdi, [rip + 0x80c311] ; 0x100b8399f ServerVersion
0x10037768e: call 0x100780980 ; 0x100780980
0x100377693: lea rax, [rip + 0x74c928] ; 0x100ac3fc2
0x10037769a: movzx esi, word ptr [rax]
0x10037769d: lea rdi, [rip + 0x80c309] ; 0x100b839ad ClientVersion
0x1003776a4: call 0x100780980 ; 0x100780980
0x1003776a9: lea rdi, [rip + 0x80c30b] ; 0x100b839bb RandomSeed
0x1003776b0: mov esi, r14d
0x1003776b3: call 0x100780980 ; 0x100780980
0x1003776b8: mov rax, qword ptr [r12 + 0xf0]
0x1003776c0: mov rcx, qword ptr [r12 + 0x128]
0x1003776c8: mov qword ptr [rcx + 8], rax
0x1003776cc: mov rax, qword ptr [r12 + 0xa8]
0x1003776d4: mov qword ptr [rcx + 0x10], rax
0x1003776d8: mov rax, qword ptr [r12 + 0xb8]
0x1003776e0: mov qword ptr [rcx + 0x18], rax
0x1003776e4: mov rax, qword ptr [r12 + 0x18]
0x1003776e9: mov qword ptr [rcx + 0x20], rax
0x1003776ed: mov rax, qword ptr [r12 + 0x138]
0x1003776f5: mov qword ptr [rcx + 0x28], rax
0x1003776f9: mov rax, qword ptr [r12 + 0x5c8]
0x100377701: mov qword ptr [rcx + 0x30], rax
0x100377705: mov rax, qword ptr [r12 + 0x140]
0x10037770d: mov qword ptr [rcx + 0x38], rax
0x100377711: mov qword ptr [rcx + 0x48], r12
0x100377715: mov rax, qword ptr [r12 + 0x48]
0x10037771a: mov qword ptr [rcx + 0x40], rax
0x10037771e: mov qword ptr [r12 + 0x120], rcx
0x100377726: mov dword ptr [r12 + 0x1560], 1
0x100377732: mov rdi, qword ptr [r12 + 0x1068]
0x10037773a: lea r14, [rip + 0x7e51cb] ; 0x100b5c90c Initialize
0x100377741: lea rdx, [rip + 0x803e79] ; 0x100b7b5c1 appVfs
0x100377748: lea rbx, [rip - 0x162f] ; 0x100376120
0x10037774f: mov rsi, r14
0x100377752: mov rcx, rbx
0x100377755: call 0x1007b17c0 ; 0x1007b17c0
0x10037775a: mov rdi, qword ptr [r12 + 0x1068]
0x100377762: lea rdx, [rip + 0x80b8a0] ; 0x100b83009 streamingVfs
0x100377769: mov rsi, r14
0x10037776c: mov rcx, rbx
0x10037776f: call 0x1007b17c0 ; 0x1007b17c0
0x100377774: mov rdi, qword ptr [r12 + 0x1068]
0x10037777c: lea rdx, [rip + 0x7e51d1] ; 0x100b5c954 storageVfs
0x100377783: lea rcx, [rip - 0x157a] ; 0x100376210
0x10037778a: mov rsi, r14
0x10037778d: call 0x1007b17c0 ; 0x1007b17c0
0x100377792: mov rdi, qword ptr [r12 + 0x1068]
0x10037779a: lea rdx, [rip + 0x80b897] ; 0x100b83038 resources
0x1003777a1: lea rcx, [rip - 0x1448] ; 0x100376360
0x1003777a8: mov rsi, r14
0x1003777ab: call 0x1007b17c0 ; 0x1007b17c0
0x1003777b0: mov rdi, qword ptr [r12 + 0x1068]
0x1003777b8: lea rdx, [rip + 0x80b929] ; 0x100b830e8 objectFactory
0x1003777bf: lea rcx, [rip - 0x13b6] ; 0x100376410
0x1003777c6: mov rsi, r14
0x1003777c9: call 0x1007b17c0 ; 0x1007b17c0
0x1003777ce: mov rdi, qword ptr [r12 + 0x1068]
0x1003777d6: lea rdx, [rip + 0x80b96c] ; 0x100b83149 environment
0x1003777dd: lea rcx, [rip - 0x1374] ; 0x100376470
0x1003777e4: mov rsi, r14
0x1003777e7: call 0x1007b17c0 ; 0x1007b17c0
0x1003777ec: mov rdi, qword ptr [r12 + 0x1068]
0x1003777f4: mov edx, 1
0x1003777f9: xor ecx, ecx
0x1003777fb: mov rsi, r14
0x1003777fe: call 0x1007b1b40 ; 0x1007b1b40
0x100377803: mov rdi, qword ptr [r12 + 0x20]
0x100377808: mov rax, qword ptr [rdi]
0x10037780b: call qword ptr [rax + 0xc0]
0x100377811: mov rbx, rax
0x100377814: vxorps ymm0, ymm0, ymm0
0x100377818: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x100377821: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x10037782a: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x100377833: movzx r8d, byte ptr [rbx + 0x20a]
0x10037783b: movzx r9d, byte ptr [rbx + 0x20b]
0x100377843: movzx eax, byte ptr [rbx + 0x20c]
0x10037784a: mov dword ptr [rsp], eax
0x10037784d: lea rdx, [rip + 0x80c172] ; 0x100b839c6 %s %u.%u.%u
0x100377854: lea r14, [rsp + 0x2c0]
0x10037785c: mov esi, 0x20
0x100377861: xor eax, eax
0x100377863: mov rdi, r14
0x100377866: mov rcx, r13
0x100377869: vzeroupper 
0x10037786c: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x100377871: mov ecx, dword ptr [r12 + 0x1008]
0x100377879: mov r8d, dword ptr [r12 + 0x100c]
0x100377881: mov r9d, dword ptr [r12 + 0x1010]
0x100377889: lea rdx, [rip + 0x80c142] ; 0x100b839d2 %u.%u.%u
0x100377890: lea r13, [rsp + 0x80]
0x100377898: mov esi, 0x20
0x10037789d: xor eax, eax
0x10037789f: mov rdi, r13
0x1003778a2: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1003778a7: mov rdi, qword ptr [r12 + 0x58]
0x1003778ac: mov rax, qword ptr [rdi]
0x1003778af: lea r15, [rsp + 0xa0]
0x1003778b7: mov edx, 0x20
0x1003778bc: mov rsi, r15
0x1003778bf: call qword ptr [rax + 0xe0]
0x1003778c5: mov rdi, qword ptr [r12 + 0x2d0]
0x1003778cd: lea rsi, [r12 + 0x1028]
0x1003778d5: mov r8d, dword ptr [r12 + 0x1014]
0x1003778dd: lea r9, [rbx + 0x10a]
0x1003778e4: mov qword ptr [rsp + 8], r15
0x1003778e9: mov qword ptr [rsp], r14
0x1003778ed: lea rdx, [rip + 0x80c01f] ; 0x100b83913 Gold
0x1003778f4: mov rcx, r13
0x1003778f7: call 0x100799110 ; 0x100799110
0x1003778fc: mov rdi, qword ptr [r12 + 0x48]
0x100377901: mov rax, qword ptr [rdi]
0x100377904: mov ebx, 0x94
0x100377909: add rbx, qword ptr [r12 + 0x2d0]
0x100377911: call qword ptr [rax + 0x140]
0x100377917: mov edx, 0x25
0x10037791c: mov rdi, rbx
0x10037791f: mov rsi, rax
0x100377922: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x100377927: lea r14, [rsp + 0x220]
0x10037792f: lea r15, [rsp + 0xd8]
0x100377937: mov rax, qword ptr [rsp + 0x30]
0x10037793c: mov qword ptr [rsp + 0xd0], rax
0x100377944: mov rax, qword ptr [rsp + 0x38]
0x100377949: mov qword ptr [rsp + 0x220], rax
0x100377951: mov rdi, r14
0x100377954: mov rsi, r15
0x100377957: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10037795c: mov qword ptr [rsp + 0x2a8], 0
0x100377968: mov dword ptr [rsp + 0x2b0], 0xffffffff
0x100377973: mov rax, qword ptr [rsp + 0x18]
0x100377978: mov qword ptr [rsp + 0xd0], rax
0x100377980: mov rax, qword ptr [rsp + 0x28]
0x100377985: mov qword ptr [rsp + 0x220], rax
0x10037798d: lea rsi, [rip + 0x80b4bb] ; 0x100b82e4f Game
0x100377994: mov edx, 2
0x100377999: mov rdi, r15
0x10037799c: call 0x1007a56a0 ; 0x1007a56a0
0x1003779a1: lea rsi, [rip + 0x80c033] ; 0x100b839db User-Agent: 
0x1003779a8: lea rdi, [rsp + 0xd0]
0x1003779b0: mov edx, 0xc
0x1003779b5: call 0x100011930 ; 0x100011930
0x1003779ba: mov r13, rax
0x1003779bd: mov rbx, qword ptr [r12 + 0x2d0]
0x1003779c5: add rbx, 0x14
0x1003779c9: mov rdi, rbx
0x1003779cc: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1003779d1: mov rdi, r13
0x1003779d4: mov rsi, rbx
0x1003779d7: mov rdx, rax
0x1003779da: call 0x100011930 ; 0x100011930
0x1003779df: mov r13, qword ptr [rsp + 0x18]
0x1003779e4: mov qword ptr [rsp + 0xd0], r13
0x1003779ec: mov rbx, qword ptr [rsp + 0x28]
0x1003779f1: mov qword ptr [rsp + 0x220], rbx
0x1003779f9: mov rdi, r15
0x1003779fc: call 0x1007a58d0 ; 0x1007a58d0
0x100377a01: lea rdi, [rsp + 0xd0]
0x100377a09: mov rsi, qword ptr [rsp + 0x20]
0x100377a0e: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100377a13: mov rdi, r14
0x100377a16: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100377a1b: lea r14, [rsp + 0x220]
0x100377a23: lea r15, [rsp + 0xd8]
0x100377a2b: mov rax, qword ptr [rsp + 0x30]
0x100377a30: mov qword ptr [rsp + 0xd0], rax
0x100377a38: mov rax, qword ptr [rsp + 0x38]
0x100377a3d: mov qword ptr [rsp + 0x220], rax
0x100377a45: mov rdi, r14
0x100377a48: mov rsi, r15
0x100377a4b: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x100377a50: mov qword ptr [rsp + 0x2a8], 0
0x100377a5c: mov dword ptr [rsp + 0x2b0], 0xffffffff
0x100377a67: mov qword ptr [rsp + 0xd0], r13
0x100377a6f: mov qword ptr [rsp + 0x220], rbx
0x100377a77: lea rsi, [rip + 0x80b3d1] ; 0x100b82e4f Game
0x100377a7e: mov edx, 2
0x100377a83: mov rdi, r15
0x100377a86: call 0x1007a56a0 ; 0x1007a56a0
0x100377a8b: lea rsi, [rip + 0x80bf56] ; 0x100b839e8 X-Session-ID: 
0x100377a92: lea rdi, [rsp + 0xd0]
0x100377a9a: mov edx, 0xe
0x100377a9f: call 0x100011930 ; 0x100011930
0x100377aa4: mov r13, rax
0x100377aa7: mov rbx, qword ptr [r12 + 0x2d0]
0x100377aaf: add rbx, 0x94
0x100377ab6: mov rdi, rbx
0x100377ab9: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100377abe: mov rdi, r13
0x100377ac1: mov rsi, rbx
0x100377ac4: mov rdx, rax
0x100377ac7: call 0x100011930 ; 0x100011930
0x100377acc: mov rax, qword ptr [rsp + 0x18]
0x100377ad1: mov qword ptr [rsp + 0xd0], rax
0x100377ad9: mov rbx, qword ptr [rsp + 0x28]
0x100377ade: mov qword ptr [rsp + 0x220], rbx
0x100377ae6: mov rdi, r15
0x100377ae9: call 0x1007a58d0 ; 0x1007a58d0
0x100377aee: lea rdi, [rsp + 0xd0]
0x100377af6: mov rsi, qword ptr [rsp + 0x20]
0x100377afb: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100377b00: mov rdi, r14
0x100377b03: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100377b08: mov rdi, qword ptr [r12 + 0xe0]
0x100377b10: call 0x100795b70 ; 0x100795b70
0x100377b15: mov r13, rax
0x100377b18: call 0x1007cc650 ; 0x1007cc650
0x100377b1d: cmp rax, r13
0x100377b20: jbe 0x100377c22
0x100377b26: lea r14, [rsp + 0x220]
0x100377b2e: lea r15, [rsp + 0xd8]
0x100377b36: mov rax, qword ptr [rsp + 0x30]
0x100377b3b: mov qword ptr [rsp + 0xd0], rax
0x100377b43: mov rax, qword ptr [rsp + 0x38]
0x100377b48: mov qword ptr [rsp + 0x220], rax
0x100377b50: mov rdi, r14
0x100377b53: mov rsi, r15
0x100377b56: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x100377b5b: mov qword ptr [rsp + 0x2a8], 0
0x100377b67: mov dword ptr [rsp + 0x2b0], 0xffffffff
0x100377b72: mov rax, qword ptr [rsp + 0x18]
0x100377b77: mov qword ptr [rsp + 0xd0], rax
0x100377b7f: mov qword ptr [rsp + 0x220], rbx
0x100377b87: lea rsi, [rip + 0x80b2c1] ; 0x100b82e4f Game
0x100377b8e: mov edx, 1
0x100377b93: mov rdi, r15
0x100377b96: call 0x1007a56a0 ; 0x1007a56a0
0x100377b9b: lea rsi, [rip + 0x80be55] ; 0x100b839f7 Screenshot heap is too small for this device (Allocated 
0x100377ba2: lea rdi, [rsp + 0xd0]
0x100377baa: mov edx, 0x38
0x100377baf: call 0x100011930 ; 0x100011930
0x100377bb4: mov rdi, rax
0x100377bb7: mov rsi, r13
0x100377bba: call 0x100aa23e4 ; 0x100aa23e4 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEm
0x100377bbf: lea rsi, [rip + 0x80be6a] ; 0x100b83a30  bytes, need 
0x100377bc6: mov edx, 0xd
0x100377bcb: mov rdi, rax
0x100377bce: call 0x100011930 ; 0x100011930
0x100377bd3: mov rbx, rax
0x100377bd6: call 0x1007cc650 ; 0x1007cc650
0x100377bdb: mov rdi, rbx
0x100377bde: mov rsi, rax
0x100377be1: call 0x100aa23e4 ; 0x100aa23e4 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEm
0x100377be6: mov rax, qword ptr [rsp + 0x18]
0x100377beb: mov qword ptr [rsp + 0xd0], rax
0x100377bf3: mov rax, qword ptr [rsp + 0x28]
0x100377bf8: mov qword ptr [rsp + 0x220], rax
0x100377c00: mov rdi, r15
0x100377c03: call 0x1007a58d0 ; 0x1007a58d0
0x100377c08: lea rdi, [rsp + 0xd0]
0x100377c10: mov rsi, qword ptr [rsp + 0x20]
0x100377c15: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100377c1a: mov rdi, r14
0x100377c1d: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100377c22: call 0x100793130 ; 0x100793130
0x100377c27: call 0x1007a5960 ; 0x1007a5960
0x100377c2c: movsx edi, al
0x100377c2f: call 0x1007a5ac0 ; 0x1007a5ac0
0x100377c34: mov rax, qword ptr [r12 + 0xa0]
0x100377c3c: mov byte ptr [rax + 0x20], 1
0x100377c40: add r12, 0x14e0
0x100377c47: mov esi, 1
0x100377c4c: mov edx, 1
0x100377c51: mov rdi, r12
0x100377c54: call 0x1007e9c20 ; 0x1007e9c20
0x100377c59: mov rax, qword ptr [rip + 0x895c78] ; 0x100c0d8d8
0x100377c60: mov rax, qword ptr [rax]
0x100377c63: cmp rax, qword ptr [rsp + 0x300]
0x100377c6b: jne 0x100377c7c
0x100377c6d: lea rsp, [rbp - 0x28]
0x100377c71: pop rbx
0x100377c72: pop r12
0x100377c74: pop r13
0x100377c76: pop r14
0x100377c78: pop r15
0x100377c7a: pop rbp
0x100377c7b: ret 
0x100377c7c: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100377c81: jmp 0x100377cab ; 0x100377cab
0x100377c83: mov r12, rax
0x100377c86: mov rdi, r14
0x100377c89: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100377c8e: mov rdi, r12
0x100377c91: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100377c96: jmp 0x100377cab ; 0x100377cab
0x100377c98: mov r12, rax
0x100377c9b: mov rdi, r14
0x100377c9e: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100377ca3: mov rdi, r12
0x100377ca6: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100377cab: mov r12, rax
0x100377cae: jmp 0x100377d0f ; 0x100377d0f
0x100377cb0: mov r12, rax
0x100377cb3: mov rdi, r14
0x100377cb6: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100377cbb: mov rdi, r12
0x100377cbe: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100377cc3: mov r12, rax
0x100377cc6: jmp 0x100377d5b ; 0x100377d5b
0x100377ccb: mov r12, rax
0x100377cce: jmp 0x100377d73 ; 0x100377d73
0x100377cd3: mov r12, rax
0x100377cd6: mov rdi, rbx
0x100377cd9: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x100377cde: mov rdi, r12
0x100377ce1: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100377ce6: jmp 0x100377cea ; 0x100377cea
0x100377ce8: jmp 0x100377cea ; 0x100377cea
0x100377cea: mov r12, rax
0x100377ced: mov rax, qword ptr [rsp + 0x18]
0x100377cf2: mov qword ptr [rsp + 0xd0], rax
0x100377cfa: mov rax, qword ptr [rsp + 0x28]
0x100377cff: mov qword ptr [rsp + 0x220], rax
0x100377d07: mov rdi, r15
0x100377d0a: call 0x1007a58d0 ; 0x1007a58d0
0x100377d0f: lea rdi, [rsp + 0xd0]
0x100377d17: mov rsi, qword ptr [rsp + 0x20]
0x100377d1c: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100377d21: mov rdi, r14
0x100377d24: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100377d29: mov rdi, r12
0x100377d2c: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100377d31: mov r12, rax
0x100377d34: mov rax, qword ptr [rsp + 0x18]
0x100377d39: mov qword ptr [rsp + 0xd0], rax
0x100377d41: mov rax, qword ptr [rsp + 0x28]
0x100377d46: mov qword ptr [rsp + 0x220], rax
0x100377d4e: lea rdi, [rsp + 0xd8]
0x100377d56: call 0x1007a58d0 ; 0x1007a58d0
0x100377d5b: mov rsi, qword ptr [rip + 0x89281e] ; 0x100c0a580
0x100377d62: add rsi, 8
0x100377d66: lea rdi, [rsp + 0xd0]
0x100377d6e: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100377d73: lea rdi, [rsp + 0x220]
0x100377d7b: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100377d80: mov rdi, r12
0x100377d83: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100377d88: nop dword ptr [rax + rax]
