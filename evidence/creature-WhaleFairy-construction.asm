0x1007390b0: push rbp
0x1007390b1: mov rbp, rsp
0x1007390b4: push rbx
0x1007390b5: push rax
0x1007390b6: mov rbx, rsi
0x1007390b9: call 0x1007abc10 ; 0x1007abc10
0x1007390be: mov eax, dword ptr [rax + 0x38]
0x1007390c1: mov dword ptr [rbx + 8], eax
0x1007390c4: call 0x10074a170 ; 0x10074a170
0x1007390c9: mov eax, dword ptr [rax + 0x38]
0x1007390cc: mov dword ptr [rbx + 8], eax
0x1007390cf: mov rax, qword ptr [rip + 0x4d4772] ; 0x100c0d848
0x1007390d6: add rax, 0x10
0x1007390da: mov qword ptr [rbx], rax
0x1007390dd: call 0x100262d70 ; 0x100262d70
0x1007390e2: mov rax, qword ptr [rip + 0x1904e2f] ; 0x10203df18
0x1007390e9: mov eax, dword ptr [rax + 0x38]
0x1007390ec: mov dword ptr [rbx + 8], eax
0x1007390ef: lea rax, [rip + 0x4ee45a] ; 0x100c27550
0x1007390f6: mov qword ptr [rbx], rax
0x1007390f9: mov byte ptr [rbx + 0x330], 0
0x100739100: mov dword ptr [rbx + 0x334], 0
0x10073910a: mov dword ptr [rbx + 0x374], 0
0x100739114: mov dword ptr [rbx + 0x3a8], 0
0x10073911e: mov qword ptr [rbx + 0x3b8], 0
0x100739129: mov rax, rbx
0x10073912c: add rsp, 8
0x100739130: pop rbx
0x100739131: pop rbp
0x100739132: ret 
