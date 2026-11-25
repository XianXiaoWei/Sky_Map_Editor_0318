0x100247330: push rbp
0x100247331: mov rbp, rsp
0x100247334: push r15
0x100247336: push r14
0x100247338: push r13
0x10024733a: push r12
0x10024733c: push rbx
0x10024733d: push rax
0x10024733e: mov r14, rsi
0x100247341: mov rbx, rdi
0x100247344: vxorps xmm0, xmm0, xmm0
0x100247348: vmovups xmmword ptr [rbx], xmm0
0x10024734c: mov qword ptr [rbx + 0x10], 0
0x100247354: mov rdi, r14
0x100247357: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x10024735c: mov r15, rax
0x10024735f: cmp r15, 0xff1
0x100247366: jae 0x100247608
0x10024736c: cmp r15, 0x17
0x100247370: jae 0x100247384
0x100247372: mov eax, r15d
0x100247375: add al, al
0x100247377: mov byte ptr [rbx], al
0x100247379: lea r12, [rbx + 1]
0x10024737d: test r15, r15
0x100247380: jne 0x1002473b1
0x100247382: jmp 0x1002473bf ; 0x1002473bf
0x100247384: mov r13, r15
0x100247387: add r13, 0x10
0x10024738b: and r13, 0xfffffffffffffff0
0x10024738f: call 0x1007e50d0 ; 0x1007e50d0
0x100247394: mov rdi, rax
0x100247397: mov rsi, r13
0x10024739a: call 0x1007e5790 ; 0x1007e5790
0x10024739f: mov r12, rax
0x1002473a2: mov qword ptr [rbx + 0x10], r12
0x1002473a6: or r13, 1
0x1002473aa: mov qword ptr [rbx], r13
0x1002473ad: mov qword ptr [rbx + 8], r15
0x1002473b1: mov rdi, r12
0x1002473b4: mov rsi, r14
0x1002473b7: mov rdx, r15
0x1002473ba: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1002473bf: mov byte ptr [r12 + r15], 0
0x1002473c4: mov eax, 0xffffffff
0x1002473c9: mov qword ptr [rbx + 0x18], rax
0x1002473cd: mov dword ptr [rbx + 0x20], 0
0x1002473d4: vxorps xmm0, xmm0, xmm0
0x1002473d8: vmovups xmmword ptr [rbx + 0x28], xmm0
0x1002473dd: mov qword ptr [rbx + 0x38], 0
0x1002473e5: vmovups xmmword ptr [rbx + 0x50], xmm0
0x1002473ea: mov qword ptr [rbx + 0x60], 0
0x1002473f2: vmovups xmmword ptr [rbx + 0x78], xmm0
0x1002473f7: mov qword ptr [rbx + 0x88], 0
0x100247402: vmovups xmmword ptr [rbx + 0xa0], xmm0
0x10024740a: mov qword ptr [rbx + 0xb0], 0
0x100247415: vmovups xmmword ptr [rbx + 0xc8], xmm0
0x10024741d: mov qword ptr [rbx + 0xd8], 0
0x100247428: vmovups xmmword ptr [rbx + 0xf0], xmm0
0x100247430: mov qword ptr [rbx + 0x100], 0
0x10024743b: vmovups xmmword ptr [rbx + 0x118], xmm0
0x100247443: mov qword ptr [rbx + 0x128], 0
0x10024744e: vmovups xmmword ptr [rbx + 0x140], xmm0
0x100247456: mov qword ptr [rbx + 0x150], 0
0x100247461: vmovups xmmword ptr [rbx + 0x168], xmm0
0x100247469: mov qword ptr [rbx + 0x178], 0
0x100247474: vmovups xmmword ptr [rbx + 0x1a0], xmm0
0x10024747c: mov qword ptr [rbx + 0x1b0], 0
0x100247487: vmovups xmmword ptr [rbx + 0x1d8], xmm0
0x10024748f: mov qword ptr [rbx + 0x1e8], 0
0x10024749a: vmovups xmmword ptr [rbx + 0x210], xmm0
0x1002474a2: mov qword ptr [rbx + 0x220], 0
0x1002474ad: vmovups xmmword ptr [rbx + 0x248], xmm0
0x1002474b5: mov qword ptr [rbx + 0x258], 0
0x1002474c0: vmovups xmmword ptr [rbx + 0x280], xmm0
0x1002474c8: mov qword ptr [rbx + 0x290], 0
0x1002474d3: vmovups xmmword ptr [rbx + 0x2b8], xmm0
0x1002474db: mov qword ptr [rbx + 0x2c8], 0
0x1002474e6: vmovups xmmword ptr [rbx + 0x2f0], xmm0
0x1002474ee: mov qword ptr [rbx + 0x300], 0
0x1002474f9: mov byte ptr [rbx + 0x328], 1
0x100247500: mov byte ptr [rbx + 0x329], 1
0x100247507: mov byte ptr [rbx + 0x32a], 0
0x10024750e: vmovddup xmm0, qword ptr [rip + 0x86bc2a] ; 0x100ab3140
0x100247516: vmovupd xmmword ptr [rbx + 0x32c], xmm0
0x10024751e: mov dword ptr [rbx + 0x33c], 0
0x100247528: mov dword ptr [rbx + 0x340], 0
0x100247532: mov byte ptr [rbx + 0x344], 1
0x100247539: mov byte ptr [rbx + 0x345], 1
0x100247540: mov byte ptr [rbx + 0x346], 0
0x100247547: mov dword ptr [rbx + 0x348], 1
0x100247551: vmovaps xmm1, xmmword ptr [rip + 0x86ba27] ; 0x100ab2f80 -> 0x100000000 __mh_execute_header
0x100247559: vmovups xmmword ptr [rbx + 0x34c], xmm1
0x100247561: mov dword ptr [rbx + 0x35c], 0
0x10024756b: mov byte ptr [rbx + 0x360], 1
0x100247572: mov byte ptr [rbx + 0x361], 1
0x100247579: mov byte ptr [rbx + 0x362], 0
0x100247580: vmovupd xmmword ptr [rbx + 0x364], xmm0
0x100247588: mov dword ptr [rbx + 0x374], 0
0x100247592: mov dword ptr [rbx + 0x378], 0
0x10024759c: mov byte ptr [rbx + 0x37c], 1
0x1002475a3: mov byte ptr [rbx + 0x37d], 1
0x1002475aa: mov byte ptr [rbx + 0x37e], 0
0x1002475b1: vmovupd xmmword ptr [rbx + 0x380], xmm0
0x1002475b9: mov dword ptr [rbx + 0x390], 0
0x1002475c3: mov dword ptr [rbx + 0x394], 0
0x1002475cd: mov byte ptr [rbx + 0x398], 1
0x1002475d4: mov byte ptr [rbx + 0x399], 0
0x1002475db: mov dword ptr [rbx + 0x39c], 0
0x1002475e5: mov dword ptr [rbx + 0x3a0], 0
0x1002475ef: mov dword ptr [rbx + 0x3a4], 0
0x1002475f9: add rsp, 8
0x1002475fd: pop rbx
0x1002475fe: pop r12
0x100247600: pop r13
0x100247602: pop r14
0x100247604: pop r15
0x100247606: pop rbp
0x100247607: ret 
0x100247608: mov rdi, rbx
0x10024760b: call 0x100aa230c ; 0x100aa230c __ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
