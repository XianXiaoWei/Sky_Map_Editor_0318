0x10052e120: push rbp
0x10052e121: mov rbp, rsp
0x10052e124: push rbx
0x10052e125: push rax
0x10052e126: mov rbx, rsi
0x10052e129: mov rdi, rbx
0x10052e12c: call 0x10032eea0 ; 0x10032eea0
0x10052e131: mov rax, qword ptr [rip + 0x1aeac00] ; 0x102018d38
0x10052e138: mov eax, dword ptr [rax + 0x38]
0x10052e13b: mov dword ptr [rbx + 8], eax
0x10052e13e: mov rax, qword ptr [rip + 0x6def7b] ; 0x100c0d0c0
0x10052e145: add rax, 0x10
0x10052e149: mov qword ptr [rbx], rax
0x10052e14c: movabs rax, 0x40a000003f800000
0x10052e156: mov qword ptr [rbx + 0x40], rax
0x10052e15a: mov dword ptr [rbx + 0x48], 0x41200000
0x10052e161: mov word ptr [rbx + 0x4c], 0
0x10052e167: vxorps xmm0, xmm0, xmm0
0x10052e16b: vmovups xmmword ptr [rbx + 0xe8], xmm0
0x10052e173: mov qword ptr [rbx + 0xf8], 0
0x10052e17e: mov rax, rbx
0x10052e181: add rsp, 8
0x10052e185: pop rbx
0x10052e186: pop rbp
0x10052e187: ret 
0x10052e188: nop dword ptr [rax + rax]
