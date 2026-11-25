0x1003a1390: push rbp
0x1003a1391: mov rbp, rsp
0x1003a1394: push rbx
0x1003a1395: push rax
0x1003a1396: mov rbx, rsi
0x1003a1399: mov rdi, rbx
0x1003a139c: call 0x10032eea0 ; 0x10032eea0
0x1003a13a1: mov rax, qword ptr [rip + 0x1c5b468] ; 0x101ffc810
0x1003a13a8: mov eax, dword ptr [rax + 0x38]
0x1003a13ab: mov dword ptr [rbx + 8], eax
0x1003a13ae: lea rax, [rip + 0x87459b] ; 0x100c15950
0x1003a13b5: mov qword ptr [rbx], rax
0x1003a13b8: vxorps xmm0, xmm0, xmm0
0x1003a13bc: vmovups xmmword ptr [rbx + 0x38], xmm0
0x1003a13c1: mov word ptr [rbx + 0x48], 0
0x1003a13c7: movabs rax, 0x3f8000003f800000
0x1003a13d1: mov qword ptr [rbx + 0x4c], rax
0x1003a13d5: mov byte ptr [rbx + 0x54], 0
0x1003a13d9: vmovaps xmm0, xmmword ptr [rip + 0x71db7f] ; 0x100abef60
0x1003a13e1: vmovups xmmword ptr [rbx + 0x58], xmm0
0x1003a13e6: movabs rax, 0x3e80000000000000
0x1003a13f0: mov qword ptr [rbx + 0x68], rax
0x1003a13f4: mov qword ptr [rbx + 0x70], 0
0x1003a13fc: mov dword ptr [rbx + 0x78], 0x3f800000
0x1003a1403: mov dword ptr [rbx + 0x90], 0
0x1003a140d: mov byte ptr [rbx + 0xa4], 0
0x1003a1414: mov rax, rbx
0x1003a1417: add rsp, 8
0x1003a141b: pop rbx
0x1003a141c: pop rbp
0x1003a141d: ret 
0x1003a141e: nop 
