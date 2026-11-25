0x1000941f0: push rbp
0x1000941f1: mov rbp, rsp
0x1000941f4: push r15
0x1000941f6: push r14
0x1000941f8: push r12
0x1000941fa: push rbx
0x1000941fb: mov rbx, rdi
0x1000941fe: mov qword ptr [rbx + 0x5608], 0
0x100094209: mov dword ptr [rbx + 0x6220], 0
0x100094213: mov dword ptr [rbx + 0x5860], 0
0x10009421d: mov qword ptr [rbx + 0xd], 0
0x100094225: mov qword ptr [rbx + 8], 0
0x10009422d: vxorps xmm0, xmm0, xmm0
0x100094231: vmovups xmmword ptr [rbx + 0x5818], xmm0
0x100094239: vmovups xmmword ptr [rbx + 0x5838], xmm0
0x100094241: mov qword ptr [rbx + 0x5848], 0
0x10009424c: movabs rax, 0x100000001
0x100094256: mov qword ptr [rbx + 0x5864], rax
0x10009425d: mov dword ptr [rbx + 0x5850], 0
0x100094267: mov dword ptr [rbx + 0x5828], 0
0x100094271: test r8, r8
0x100094274: setne byte ptr [rbx + 0x5830]
0x10009427b: mov r15, rdx
0x10009427e: mov r12, rsi
0x100094281: mov dword ptr [rbx + 0x5834], 0
0x10009428b: mov qword ptr [rbx], rcx
0x10009428e: lea r14, [rbx + 0x5870]
0x100094295: mov rdi, r14
0x100094298: mov rsi, rbx
0x10009429b: mov rdx, r12
0x10009429e: mov rcx, r8
0x1000942a1: call 0x1000e7ee0 ; 0x1000e7ee0
0x1000942a6: lea rdi, [rbx + 0x5bd0]
0x1000942ad: mov rsi, rbx
0x1000942b0: mov rdx, r15
0x1000942b3: call 0x1000918d0 ; 0x1000918d0
0x1000942b8: test r12, r12
0x1000942bb: je 0x1000942cd
0x1000942bd: mov rdi, r14
0x1000942c0: call 0x1000ea880 ; 0x1000ea880
0x1000942c5: vmovss dword ptr [rbx + 0x6010], xmm0
0x1000942cd: pop rbx
0x1000942ce: pop r12
0x1000942d0: pop r14
0x1000942d2: pop r15
0x1000942d4: pop rbp
0x1000942d5: ret 
0x1000942d6: nop word ptr cs:[rax + rax]
