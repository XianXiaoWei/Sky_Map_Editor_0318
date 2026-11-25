0x1006a47d0: push rbp
0x1006a47d1: mov rbp, rsp
0x1006a47d4: push r15
0x1006a47d6: push r14
0x1006a47d8: push r13
0x1006a47da: push r12
0x1006a47dc: push rbx
0x1006a47dd: sub rsp, 0x648
0x1006a47e4: mov r13, rdi
0x1006a47e7: mov rax, qword ptr [rip + 0x5690ea] ; 0x100c0d8d8
0x1006a47ee: mov rax, qword ptr [rax]
0x1006a47f1: mov qword ptr [rbp - 0x30], rax
0x1006a47f5: lea r12, [rbp - 0x2e0]
0x1006a47fc: lea rbx, [rbp - 0x428]
0x1006a4803: mov rax, qword ptr [rip + 0x565d16] ; 0x100c0a520
0x1006a480a: lea rcx, [rax + 0x18]
0x1006a480e: mov qword ptr [rbp - 0x638], rcx
0x1006a4815: mov qword ptr [rbp - 0x430], rcx
0x1006a481c: add rax, 0x40
0x1006a4820: mov qword ptr [rbp - 0x620], rax
0x1006a4827: mov qword ptr [rbp - 0x2e0], rax
0x1006a482e: mov rdi, r12
0x1006a4831: mov rsi, rbx
0x1006a4834: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006a4839: mov qword ptr [rbp - 0x258], 0
0x1006a4844: mov dword ptr [rbp - 0x250], 0xffffffff
0x1006a484e: mov r14, qword ptr [rip + 0x568d73] ; 0x100c0d5c8
0x1006a4855: lea rax, [r14 + 0x18]
0x1006a4859: mov qword ptr [rbp - 0x628], rax
0x1006a4860: mov qword ptr [rbp - 0x430], rax
0x1006a4867: add r14, 0x40
0x1006a486b: mov qword ptr [rbp - 0x2e0], r14
0x1006a4872: lea rsi, [rip + 0x4bc18d] ; 0x100b60a06 DEV
0x1006a4879: mov edx, 8
0x1006a487e: mov rdi, rbx
0x1006a4881: call 0x1007a56a0 ; 0x1007a56a0
0x1006a4886: lea rsi, [rip + 0x4f523e] ; 0x100b99acb miscellaneousTime
0x1006a488d: lea rdi, [rbp - 0x430]
0x1006a4894: mov edx, 0x11
0x1006a4899: call 0x100011930 ; 0x100011930
0x1006a489e: lea rsi, [rip + 0x4bc167] ; 0x100b60a0c : 
0x1006a48a5: mov edx, 2
0x1006a48aa: mov rdi, rax
0x1006a48ad: call 0x100011930 ; 0x100011930
0x1006a48b2: vmovsd xmm0, qword ptr [r13 + 0x18]
0x1006a48b8: mov rdi, rax
0x1006a48bb: call 0x100aa23cc ; 0x100aa23cc __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd
0x1006a48c0: lea rsi, [rip + 0x4bc148] ; 0x100b60a0f  
0x1006a48c7: mov edx, 1
0x1006a48cc: mov rdi, rax
0x1006a48cf: call 0x100011930 ; 0x100011930
0x1006a48d4: mov r15, qword ptr [rbp - 0x628]
0x1006a48db: mov qword ptr [rbp - 0x430], r15
0x1006a48e2: mov qword ptr [rbp - 0x2e0], r14
0x1006a48e9: mov rdi, rbx
0x1006a48ec: call 0x1007a58d0 ; 0x1007a58d0
0x1006a48f1: mov rsi, qword ptr [rip + 0x565c88] ; 0x100c0a580
0x1006a48f8: add rsi, 8
0x1006a48fc: lea rdi, [rbp - 0x430]
0x1006a4903: mov qword ptr [rbp - 0x630], rsi
0x1006a490a: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a490f: mov rdi, r12
0x1006a4912: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a4917: lea rdi, [rbp - 0x2e0]
0x1006a491e: lea r12, [rbp - 0x428]
0x1006a4925: mov rax, qword ptr [rbp - 0x638]
0x1006a492c: mov qword ptr [rbp - 0x430], rax
0x1006a4933: mov rax, qword ptr [rbp - 0x620]
0x1006a493a: mov qword ptr [rbp - 0x2e0], rax
0x1006a4941: mov rsi, r12
0x1006a4944: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006a4949: mov qword ptr [rbp - 0x258], 0
0x1006a4954: mov dword ptr [rbp - 0x250], 0xffffffff
0x1006a495e: mov qword ptr [rbp - 0x430], r15
0x1006a4965: mov qword ptr [rbp - 0x2e0], r14
0x1006a496c: lea rsi, [rip + 0x4bc093] ; 0x100b60a06 DEV
0x1006a4973: mov edx, 8
0x1006a4978: mov rdi, r12
0x1006a497b: call 0x1007a56a0 ; 0x1007a56a0
0x1006a4980: lea rsi, [rip + 0x4f5156] ; 0x100b99add cullingTime
0x1006a4987: lea rdi, [rbp - 0x430]
0x1006a498e: mov edx, 0xb
0x1006a4993: mov r15, qword ptr [rbp - 0x630]
0x1006a499a: call 0x100011930 ; 0x100011930
0x1006a499f: lea rsi, [rip + 0x4bc066] ; 0x100b60a0c : 
0x1006a49a6: mov edx, 2
0x1006a49ab: mov rdi, rax
0x1006a49ae: call 0x100011930 ; 0x100011930
0x1006a49b3: vmovsd xmm0, qword ptr [r13 + 0x20]
0x1006a49b9: mov rdi, rax
0x1006a49bc: call 0x100aa23cc ; 0x100aa23cc __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd
0x1006a49c1: lea rsi, [rip + 0x4bc047] ; 0x100b60a0f  
0x1006a49c8: mov edx, 1
0x1006a49cd: mov rdi, rax
0x1006a49d0: call 0x100011930 ; 0x100011930
0x1006a49d5: mov rbx, qword ptr [rbp - 0x628]
0x1006a49dc: mov qword ptr [rbp - 0x430], rbx
0x1006a49e3: mov qword ptr [rbp - 0x2e0], r14
0x1006a49ea: mov rdi, r12
0x1006a49ed: call 0x1007a58d0 ; 0x1007a58d0
0x1006a49f2: lea rdi, [rbp - 0x430]
0x1006a49f9: mov rsi, r15
0x1006a49fc: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a4a01: lea rdi, [rbp - 0x2e0]
0x1006a4a08: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a4a0d: lea r15, [rbp - 0x2e0]
0x1006a4a14: lea r12, [rbp - 0x428]
0x1006a4a1b: mov rax, qword ptr [rbp - 0x638]
0x1006a4a22: mov qword ptr [rbp - 0x430], rax
0x1006a4a29: mov rax, qword ptr [rbp - 0x620]
0x1006a4a30: mov qword ptr [rbp - 0x2e0], rax
0x1006a4a37: mov rdi, r15
0x1006a4a3a: mov rsi, r12
0x1006a4a3d: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006a4a42: mov qword ptr [rbp - 0x258], 0
0x1006a4a4d: mov dword ptr [rbp - 0x250], 0xffffffff
0x1006a4a57: mov qword ptr [rbp - 0x430], rbx
0x1006a4a5e: mov qword ptr [rbp - 0x2e0], r14
0x1006a4a65: lea rsi, [rip + 0x4bbf9a] ; 0x100b60a06 DEV
0x1006a4a6c: mov edx, 8
0x1006a4a71: mov rdi, r12
0x1006a4a74: call 0x1007a56a0 ; 0x1007a56a0
0x1006a4a79: lea rsi, [rip + 0x4f5069] ; 0x100b99ae9 lodTime
0x1006a4a80: lea rdi, [rbp - 0x430]
0x1006a4a87: mov edx, 7
0x1006a4a8c: call 0x100011930 ; 0x100011930
0x1006a4a91: lea rsi, [rip + 0x4bbf74] ; 0x100b60a0c : 
0x1006a4a98: mov edx, 2
0x1006a4a9d: mov rdi, rax
0x1006a4aa0: call 0x100011930 ; 0x100011930
0x1006a4aa5: vmovsd xmm0, qword ptr [r13 + 0x28]
0x1006a4aab: mov rdi, rax
0x1006a4aae: call 0x100aa23cc ; 0x100aa23cc __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd
0x1006a4ab3: lea rsi, [rip + 0x4bbf55] ; 0x100b60a0f  
0x1006a4aba: mov edx, 1
0x1006a4abf: mov rdi, rax
0x1006a4ac2: call 0x100011930 ; 0x100011930
0x1006a4ac7: mov rbx, qword ptr [rbp - 0x628]
0x1006a4ace: mov qword ptr [rbp - 0x430], rbx
0x1006a4ad5: mov qword ptr [rbp - 0x2e0], r14
0x1006a4adc: mov rdi, r12
0x1006a4adf: call 0x1007a58d0 ; 0x1007a58d0
0x1006a4ae4: lea rdi, [rbp - 0x430]
0x1006a4aeb: mov rsi, qword ptr [rbp - 0x630]
0x1006a4af2: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a4af7: mov rdi, r15
0x1006a4afa: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a4aff: lea r15, [rbp - 0x2e0]
0x1006a4b06: lea r12, [rbp - 0x428]
0x1006a4b0d: mov rax, qword ptr [rbp - 0x638]
0x1006a4b14: mov qword ptr [rbp - 0x430], rax
0x1006a4b1b: mov rax, qword ptr [rbp - 0x620]
0x1006a4b22: mov qword ptr [rbp - 0x2e0], rax
0x1006a4b29: mov rdi, r15
0x1006a4b2c: mov rsi, r12
0x1006a4b2f: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006a4b34: mov qword ptr [rbp - 0x258], 0
0x1006a4b3f: mov dword ptr [rbp - 0x250], 0xffffffff
0x1006a4b49: mov qword ptr [rbp - 0x430], rbx
0x1006a4b50: mov qword ptr [rbp - 0x2e0], r14
0x1006a4b57: lea rsi, [rip + 0x4bbea8] ; 0x100b60a06 DEV
0x1006a4b5e: mov edx, 8
0x1006a4b63: mov rdi, r12
0x1006a4b66: call 0x1007a56a0 ; 0x1007a56a0
0x1006a4b6b: lea rsi, [rip + 0x4f4f7f] ; 0x100b99af1 updateTime
0x1006a4b72: lea rdi, [rbp - 0x430]
0x1006a4b79: mov edx, 0xa
0x1006a4b7e: call 0x100011930 ; 0x100011930
0x1006a4b83: lea rsi, [rip + 0x4bbe82] ; 0x100b60a0c : 
0x1006a4b8a: mov edx, 2
0x1006a4b8f: mov rdi, rax
0x1006a4b92: call 0x100011930 ; 0x100011930
0x1006a4b97: vmovsd xmm0, qword ptr [r13 + 0x30]
0x1006a4b9d: mov rdi, rax
0x1006a4ba0: call 0x100aa23cc ; 0x100aa23cc __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd
0x1006a4ba5: lea rsi, [rip + 0x4bbe63] ; 0x100b60a0f  
0x1006a4bac: mov edx, 1
0x1006a4bb1: mov rdi, rax
0x1006a4bb4: call 0x100011930 ; 0x100011930
0x1006a4bb9: mov rbx, qword ptr [rbp - 0x628]
0x1006a4bc0: mov qword ptr [rbp - 0x430], rbx
0x1006a4bc7: mov qword ptr [rbp - 0x2e0], r14
0x1006a4bce: mov rdi, r12
0x1006a4bd1: call 0x1007a58d0 ; 0x1007a58d0
0x1006a4bd6: lea rdi, [rbp - 0x430]
0x1006a4bdd: mov rsi, qword ptr [rbp - 0x630]
0x1006a4be4: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a4be9: mov rdi, r15
0x1006a4bec: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a4bf1: lea r15, [rbp - 0x2e0]
0x1006a4bf8: lea r12, [rbp - 0x428]
0x1006a4bff: mov rax, qword ptr [rbp - 0x638]
0x1006a4c06: mov qword ptr [rbp - 0x430], rax
0x1006a4c0d: mov rax, qword ptr [rbp - 0x620]
0x1006a4c14: mov qword ptr [rbp - 0x2e0], rax
0x1006a4c1b: mov rdi, r15
0x1006a4c1e: mov rsi, r12
0x1006a4c21: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006a4c26: mov qword ptr [rbp - 0x258], 0
0x1006a4c31: mov dword ptr [rbp - 0x250], 0xffffffff
0x1006a4c3b: mov qword ptr [rbp - 0x430], rbx
0x1006a4c42: mov qword ptr [rbp - 0x2e0], r14
0x1006a4c49: lea rsi, [rip + 0x4bbdb6] ; 0x100b60a06 DEV
0x1006a4c50: mov edx, 8
0x1006a4c55: mov rdi, r12
0x1006a4c58: call 0x1007a56a0 ; 0x1007a56a0
0x1006a4c5d: lea rsi, [rip + 0x4f4e98] ; 0x100b99afc accumTime
0x1006a4c64: lea rdi, [rbp - 0x430]
0x1006a4c6b: mov edx, 9
0x1006a4c70: call 0x100011930 ; 0x100011930
0x1006a4c75: lea rsi, [rip + 0x4bbd90] ; 0x100b60a0c : 
0x1006a4c7c: mov edx, 2
0x1006a4c81: mov rdi, rax
0x1006a4c84: call 0x100011930 ; 0x100011930
0x1006a4c89: vmovsd xmm0, qword ptr [r13 + 0x38]
0x1006a4c8f: mov rdi, rax
0x1006a4c92: call 0x100aa23cc ; 0x100aa23cc __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd
0x1006a4c97: lea rsi, [rip + 0x4bbd71] ; 0x100b60a0f  
0x1006a4c9e: mov edx, 1
0x1006a4ca3: mov rdi, rax
0x1006a4ca6: call 0x100011930 ; 0x100011930
0x1006a4cab: mov rbx, qword ptr [rbp - 0x628]
0x1006a4cb2: mov qword ptr [rbp - 0x430], rbx
0x1006a4cb9: mov qword ptr [rbp - 0x2e0], r14
0x1006a4cc0: mov rdi, r12
0x1006a4cc3: call 0x1007a58d0 ; 0x1007a58d0
0x1006a4cc8: lea rdi, [rbp - 0x430]
0x1006a4ccf: mov rsi, qword ptr [rbp - 0x630]
0x1006a4cd6: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a4cdb: mov rdi, r15
0x1006a4cde: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a4ce3: lea r15, [rbp - 0x2e0]
0x1006a4cea: lea r12, [rbp - 0x428]
0x1006a4cf1: mov rax, qword ptr [rbp - 0x638]
0x1006a4cf8: mov qword ptr [rbp - 0x430], rax
0x1006a4cff: mov rax, qword ptr [rbp - 0x620]
0x1006a4d06: mov qword ptr [rbp - 0x2e0], rax
0x1006a4d0d: mov rdi, r15
0x1006a4d10: mov rsi, r12
0x1006a4d13: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006a4d18: mov qword ptr [rbp - 0x258], 0
0x1006a4d23: mov dword ptr [rbp - 0x250], 0xffffffff
0x1006a4d2d: mov qword ptr [rbp - 0x430], rbx
0x1006a4d34: mov qword ptr [rbp - 0x2e0], r14
0x1006a4d3b: lea rsi, [rip + 0x4bbcc4] ; 0x100b60a06 DEV
0x1006a4d42: mov edx, 8
0x1006a4d47: mov rdi, r12
0x1006a4d4a: call 0x1007a56a0 ; 0x1007a56a0
0x1006a4d4f: lea rsi, [rip + 0x4f4db0] ; 0x100b99b06 idxCopyTime
0x1006a4d56: lea rdi, [rbp - 0x430]
0x1006a4d5d: mov edx, 0xb
0x1006a4d62: call 0x100011930 ; 0x100011930
0x1006a4d67: lea rsi, [rip + 0x4bbc9e] ; 0x100b60a0c : 
0x1006a4d6e: mov edx, 2
0x1006a4d73: mov rdi, rax
0x1006a4d76: call 0x100011930 ; 0x100011930
0x1006a4d7b: vmovsd xmm0, qword ptr [r13]
0x1006a4d81: mov rdi, rax
0x1006a4d84: call 0x100aa23cc ; 0x100aa23cc __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd
0x1006a4d89: lea rsi, [rip + 0x4bbc7f] ; 0x100b60a0f  
0x1006a4d90: mov edx, 1
0x1006a4d95: mov rdi, rax
0x1006a4d98: call 0x100011930 ; 0x100011930
0x1006a4d9d: mov rbx, qword ptr [rbp - 0x628]
0x1006a4da4: mov qword ptr [rbp - 0x430], rbx
0x1006a4dab: mov qword ptr [rbp - 0x2e0], r14
0x1006a4db2: mov rdi, r12
0x1006a4db5: call 0x1007a58d0 ; 0x1007a58d0
0x1006a4dba: lea rdi, [rbp - 0x430]
0x1006a4dc1: mov rsi, qword ptr [rbp - 0x630]
0x1006a4dc8: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a4dcd: mov rdi, r15
0x1006a4dd0: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a4dd5: lea r15, [rbp - 0x2e0]
0x1006a4ddc: lea r12, [rbp - 0x428]
0x1006a4de3: mov rax, qword ptr [rbp - 0x638]
0x1006a4dea: mov qword ptr [rbp - 0x430], rax
0x1006a4df1: mov rax, qword ptr [rbp - 0x620]
0x1006a4df8: mov qword ptr [rbp - 0x2e0], rax
0x1006a4dff: mov rdi, r15
0x1006a4e02: mov rsi, r12
0x1006a4e05: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006a4e0a: mov qword ptr [rbp - 0x258], 0
0x1006a4e15: mov dword ptr [rbp - 0x250], 0xffffffff
0x1006a4e1f: mov qword ptr [rbp - 0x430], rbx
0x1006a4e26: mov qword ptr [rbp - 0x2e0], r14
0x1006a4e2d: lea rsi, [rip + 0x4bbbd2] ; 0x100b60a06 DEV
0x1006a4e34: mov edx, 8
0x1006a4e39: mov rdi, r12
0x1006a4e3c: call 0x1007a56a0 ; 0x1007a56a0
0x1006a4e41: lea rsi, [rip + 0x4f4cca] ; 0x100b99b12 vrtCopyTime
0x1006a4e48: lea rdi, [rbp - 0x430]
0x1006a4e4f: mov edx, 0xb
0x1006a4e54: call 0x100011930 ; 0x100011930
0x1006a4e59: lea rsi, [rip + 0x4bbbac] ; 0x100b60a0c : 
0x1006a4e60: mov edx, 2
0x1006a4e65: mov rdi, rax
0x1006a4e68: call 0x100011930 ; 0x100011930
0x1006a4e6d: vmovsd xmm0, qword ptr [r13 + 8]
0x1006a4e73: mov rdi, rax
0x1006a4e76: call 0x100aa23cc ; 0x100aa23cc __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd
0x1006a4e7b: lea rsi, [rip + 0x4bbb8d] ; 0x100b60a0f  
0x1006a4e82: mov edx, 1
0x1006a4e87: mov rdi, rax
0x1006a4e8a: call 0x100011930 ; 0x100011930
0x1006a4e8f: mov rbx, qword ptr [rbp - 0x628]
0x1006a4e96: mov qword ptr [rbp - 0x430], rbx
0x1006a4e9d: mov qword ptr [rbp - 0x2e0], r14
0x1006a4ea4: mov rdi, r12
0x1006a4ea7: call 0x1007a58d0 ; 0x1007a58d0
0x1006a4eac: lea rdi, [rbp - 0x430]
0x1006a4eb3: mov rsi, qword ptr [rbp - 0x630]
0x1006a4eba: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a4ebf: mov rdi, r15
0x1006a4ec2: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a4ec7: lea rdi, [rbp - 0x2e0]
0x1006a4ece: lea r12, [rbp - 0x428]
0x1006a4ed5: mov rax, qword ptr [rbp - 0x638]
0x1006a4edc: mov qword ptr [rbp - 0x430], rax
0x1006a4ee3: mov rax, qword ptr [rbp - 0x620]
0x1006a4eea: mov qword ptr [rbp - 0x2e0], rax
0x1006a4ef1: mov rsi, r12
0x1006a4ef4: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006a4ef9: mov qword ptr [rbp - 0x258], 0
0x1006a4f04: mov dword ptr [rbp - 0x250], 0xffffffff
0x1006a4f0e: mov qword ptr [rbp - 0x430], rbx
0x1006a4f15: mov qword ptr [rbp - 0x2e0], r14
0x1006a4f1c: lea rsi, [rip + 0x4bbae3] ; 0x100b60a06 DEV
0x1006a4f23: mov edx, 8
0x1006a4f28: mov rdi, r12
0x1006a4f2b: call 0x1007a56a0 ; 0x1007a56a0
0x1006a4f30: lea rsi, [rip + 0x4f4be7] ; 0x100b99b1e distCopyTime
0x1006a4f37: lea rdi, [rbp - 0x430]
0x1006a4f3e: mov edx, 0xc
0x1006a4f43: mov r15, qword ptr [rbp - 0x630]
0x1006a4f4a: call 0x100011930 ; 0x100011930
0x1006a4f4f: lea rsi, [rip + 0x4bbab6] ; 0x100b60a0c : 
0x1006a4f56: mov edx, 2
0x1006a4f5b: mov rdi, rax
0x1006a4f5e: call 0x100011930 ; 0x100011930
0x1006a4f63: vmovsd xmm0, qword ptr [r13 + 0x10]
0x1006a4f69: mov rdi, rax
0x1006a4f6c: call 0x100aa23cc ; 0x100aa23cc __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd
0x1006a4f71: lea rsi, [rip + 0x4bba97] ; 0x100b60a0f  
0x1006a4f78: mov edx, 1
0x1006a4f7d: mov rdi, rax
0x1006a4f80: call 0x100011930 ; 0x100011930
0x1006a4f85: mov rbx, qword ptr [rbp - 0x628]
0x1006a4f8c: mov qword ptr [rbp - 0x430], rbx
0x1006a4f93: mov qword ptr [rbp - 0x2e0], r14
0x1006a4f9a: mov rdi, r12
0x1006a4f9d: call 0x1007a58d0 ; 0x1007a58d0
0x1006a4fa2: lea rdi, [rbp - 0x430]
0x1006a4fa9: mov rsi, r15
0x1006a4fac: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a4fb1: lea rdi, [rbp - 0x2e0]
0x1006a4fb8: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a4fbd: vmovsd xmm0, qword ptr [r13 + 0x18]
0x1006a4fc3: vaddsd xmm0, xmm0, qword ptr [r13 + 0x20]
0x1006a4fc9: vmovsd qword ptr [rbp - 0x670], xmm0
0x1006a4fd1: vmovsd xmm0, qword ptr [r13 + 0x28]
0x1006a4fd7: vmovsd qword ptr [rbp - 0x668], xmm0
0x1006a4fdf: vmovsd xmm0, qword ptr [r13 + 0x30]
0x1006a4fe5: vmovsd qword ptr [rbp - 0x660], xmm0
0x1006a4fed: vmovsd xmm0, qword ptr [r13 + 0x38]
0x1006a4ff3: vmovsd qword ptr [rbp - 0x658], xmm0
0x1006a4ffb: vmovsd xmm0, qword ptr [r13]
0x1006a5001: vmovsd qword ptr [rbp - 0x650], xmm0
0x1006a5009: vmovsd xmm0, qword ptr [r13 + 8]
0x1006a500f: vmovsd qword ptr [rbp - 0x648], xmm0
0x1006a5017: vmovsd xmm0, qword ptr [r13 + 0x10]
0x1006a501d: vmovsd qword ptr [rbp - 0x640], xmm0
0x1006a5025: lea rdi, [rbp - 0x2e0]
0x1006a502c: lea r12, [rbp - 0x428]
0x1006a5033: mov rax, qword ptr [rbp - 0x638]
0x1006a503a: mov qword ptr [rbp - 0x430], rax
0x1006a5041: mov rax, qword ptr [rbp - 0x620]
0x1006a5048: mov qword ptr [rbp - 0x2e0], rax
0x1006a504f: mov rsi, r12
0x1006a5052: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006a5057: mov qword ptr [rbp - 0x258], 0
0x1006a5062: mov dword ptr [rbp - 0x250], 0xffffffff
0x1006a506c: mov qword ptr [rbp - 0x430], rbx
0x1006a5073: mov qword ptr [rbp - 0x2e0], r14
0x1006a507a: lea rsi, [rip + 0x4bb985] ; 0x100b60a06 DEV
0x1006a5081: mov edx, 8
0x1006a5086: mov rdi, r12
0x1006a5089: call 0x1007a56a0 ; 0x1007a56a0
0x1006a508e: lea rsi, [rip + 0x4f4a96] ; 0x100b99b2b total
0x1006a5095: lea rdi, [rbp - 0x430]
0x1006a509c: mov edx, 5
0x1006a50a1: call 0x100011930 ; 0x100011930
0x1006a50a6: lea rsi, [rip + 0x4bb95f] ; 0x100b60a0c : 
0x1006a50ad: mov edx, 2
0x1006a50b2: mov rdi, rax
0x1006a50b5: call 0x100011930 ; 0x100011930
0x1006a50ba: vmovsd xmm0, qword ptr [rbp - 0x668]
0x1006a50c2: vaddsd xmm0, xmm0, qword ptr [rbp - 0x670]
0x1006a50ca: vaddsd xmm0, xmm0, qword ptr [rbp - 0x660]
0x1006a50d2: vaddsd xmm0, xmm0, qword ptr [rbp - 0x658]
0x1006a50da: vaddsd xmm0, xmm0, qword ptr [rbp - 0x650]
0x1006a50e2: vaddsd xmm0, xmm0, qword ptr [rbp - 0x648]
0x1006a50ea: vaddsd xmm0, xmm0, qword ptr [rbp - 0x640]
0x1006a50f2: mov rdi, rax
0x1006a50f5: call 0x100aa23cc ; 0x100aa23cc __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEd
0x1006a50fa: lea rsi, [rip + 0x4bb90e] ; 0x100b60a0f  
0x1006a5101: mov edx, 1
0x1006a5106: mov rdi, rax
0x1006a5109: call 0x100011930 ; 0x100011930
0x1006a510e: mov rbx, qword ptr [rbp - 0x628]
0x1006a5115: mov qword ptr [rbp - 0x430], rbx
0x1006a511c: mov qword ptr [rbp - 0x2e0], r14
0x1006a5123: mov rdi, r12
0x1006a5126: call 0x1007a58d0 ; 0x1007a58d0
0x1006a512b: lea rdi, [rbp - 0x430]
0x1006a5132: mov rsi, r15
0x1006a5135: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a513a: lea rdi, [rbp - 0x2e0]
0x1006a5141: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a5146: mov eax, dword ptr [r13 + 0x40]
0x1006a514a: vcvtsi2sd xmm0, xmm1, rax
0x1006a514f: vmulsd xmm0, xmm0, qword ptr [rip + 0x431ec1] ; 0x100ad7018
0x1006a5157: vmovsd xmm1, qword ptr [r13]
0x1006a515d: vdivsd xmm1, xmm1, qword ptr [rip + 0x40cc73] ; 0x100ab1dd8
0x1006a5165: vdivsd xmm2, xmm0, xmm1
0x1006a5169: lea rdx, [rip + 0x4f49c1] ; 0x100b99b31 Index Throughput: %.3fMB / %.2fms (%.1fMB/ms)
0x1006a5170: lea rdi, [rbp - 0x430]
0x1006a5177: mov esi, 0x400
0x1006a517c: mov al, 3
0x1006a517e: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1006a5183: lea rdi, [rbp - 0x4c8]
0x1006a518a: lea r12, [rbp - 0x610]
0x1006a5191: mov rax, qword ptr [rbp - 0x638]
0x1006a5198: mov qword ptr [rbp - 0x618], rax
0x1006a519f: mov rax, qword ptr [rbp - 0x620]
0x1006a51a6: mov qword ptr [rbp - 0x4c8], rax
0x1006a51ad: mov rsi, r12
0x1006a51b0: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006a51b5: mov qword ptr [rbp - 0x440], 0
0x1006a51c0: mov dword ptr [rbp - 0x438], 0xffffffff
0x1006a51ca: mov qword ptr [rbp - 0x618], rbx
0x1006a51d1: mov qword ptr [rbp - 0x4c8], r14
0x1006a51d8: lea rsi, [rip + 0x4bb827] ; 0x100b60a06 DEV
0x1006a51df: mov edx, 8
0x1006a51e4: mov rdi, r12
0x1006a51e7: call 0x1007a56a0 ; 0x1007a56a0
0x1006a51ec: lea rbx, [rbp - 0x430]
0x1006a51f3: mov rdi, rbx
0x1006a51f6: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1006a51fb: lea rdi, [rbp - 0x618]
0x1006a5202: mov rsi, rbx
0x1006a5205: mov rdx, rax
0x1006a5208: call 0x100011930 ; 0x100011930
0x1006a520d: mov rbx, qword ptr [rbp - 0x628]
0x1006a5214: mov qword ptr [rbp - 0x618], rbx
0x1006a521b: mov qword ptr [rbp - 0x4c8], r14
0x1006a5222: mov rdi, r12
0x1006a5225: call 0x1007a58d0 ; 0x1007a58d0
0x1006a522a: lea rdi, [rbp - 0x618]
0x1006a5231: mov rsi, r15
0x1006a5234: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a5239: lea rdi, [rbp - 0x4c8]
0x1006a5240: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a5245: mov eax, dword ptr [r13 + 0x44]
0x1006a5249: vcvtsi2sd xmm0, xmm3, rax
0x1006a524e: vmulsd xmm0, xmm0, qword ptr [rip + 0x431dc2] ; 0x100ad7018
0x1006a5256: vmovsd xmm1, qword ptr [r13 + 8]
0x1006a525c: vdivsd xmm1, xmm1, qword ptr [rip + 0x40cb74] ; 0x100ab1dd8
0x1006a5264: vdivsd xmm2, xmm0, xmm1
0x1006a5268: lea rdx, [rip + 0x4f48f0] ; 0x100b99b5f Vert Throughput: %.3fMB / %.2fms (%.1fMB/ms)
0x1006a526f: lea rdi, [rbp - 0x430]
0x1006a5276: mov esi, 0x400
0x1006a527b: mov al, 3
0x1006a527d: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1006a5282: lea rdi, [rbp - 0x4c8]
0x1006a5289: lea r12, [rbp - 0x610]
0x1006a5290: mov rax, qword ptr [rbp - 0x638]
0x1006a5297: mov qword ptr [rbp - 0x618], rax
0x1006a529e: mov rax, qword ptr [rbp - 0x620]
0x1006a52a5: mov qword ptr [rbp - 0x4c8], rax
0x1006a52ac: mov rsi, r12
0x1006a52af: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006a52b4: mov qword ptr [rbp - 0x440], 0
0x1006a52bf: mov dword ptr [rbp - 0x438], 0xffffffff
0x1006a52c9: mov qword ptr [rbp - 0x618], rbx
0x1006a52d0: mov qword ptr [rbp - 0x4c8], r14
0x1006a52d7: lea rsi, [rip + 0x4bb728] ; 0x100b60a06 DEV
0x1006a52de: mov edx, 8
0x1006a52e3: mov rdi, r12
0x1006a52e6: call 0x1007a56a0 ; 0x1007a56a0
0x1006a52eb: lea rbx, [rbp - 0x430]
0x1006a52f2: mov rdi, rbx
0x1006a52f5: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1006a52fa: lea rdi, [rbp - 0x618]
0x1006a5301: mov rsi, rbx
0x1006a5304: mov rdx, rax
0x1006a5307: call 0x100011930 ; 0x100011930
0x1006a530c: mov rbx, qword ptr [rbp - 0x628]
0x1006a5313: mov qword ptr [rbp - 0x618], rbx
0x1006a531a: mov qword ptr [rbp - 0x4c8], r14
0x1006a5321: mov rdi, r12
0x1006a5324: call 0x1007a58d0 ; 0x1007a58d0
0x1006a5329: lea rdi, [rbp - 0x618]
0x1006a5330: mov rsi, r15
0x1006a5333: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a5338: lea rdi, [rbp - 0x4c8]
0x1006a533f: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a5344: mov eax, dword ptr [r13 + 0x48]
0x1006a5348: vcvtsi2sd xmm0, xmm3, rax
0x1006a534d: vmulsd xmm0, xmm0, qword ptr [rip + 0x431cc3] ; 0x100ad7018
0x1006a5355: vmovsd xmm1, qword ptr [r13 + 0x10]
0x1006a535b: vdivsd xmm1, xmm1, qword ptr [rip + 0x40ca75] ; 0x100ab1dd8
0x1006a5363: vdivsd xmm2, xmm0, xmm1
0x1006a5367: lea rdx, [rip + 0x4f481e] ; 0x100b99b8c Distant Throughput: %.3fMB / %.2fms (%.1fMB/ms)
0x1006a536e: lea rdi, [rbp - 0x430]
0x1006a5375: mov esi, 0x400
0x1006a537a: mov al, 3
0x1006a537c: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x1006a5381: lea r13, [rbp - 0x4c8]
0x1006a5388: lea r12, [rbp - 0x610]
0x1006a538f: mov rax, qword ptr [rbp - 0x638]
0x1006a5396: mov qword ptr [rbp - 0x618], rax
0x1006a539d: mov rax, qword ptr [rbp - 0x620]
0x1006a53a4: mov qword ptr [rbp - 0x4c8], rax
0x1006a53ab: mov rdi, r13
0x1006a53ae: mov rsi, r12
0x1006a53b1: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1006a53b6: mov qword ptr [rbp - 0x440], 0
0x1006a53c1: mov dword ptr [rbp - 0x438], 0xffffffff
0x1006a53cb: mov qword ptr [rbp - 0x618], rbx
0x1006a53d2: mov qword ptr [rbp - 0x4c8], r14
0x1006a53d9: lea rsi, [rip + 0x4bb626] ; 0x100b60a06 DEV
0x1006a53e0: mov edx, 8
0x1006a53e5: mov rdi, r12
0x1006a53e8: call 0x1007a56a0 ; 0x1007a56a0
0x1006a53ed: lea rbx, [rbp - 0x430]
0x1006a53f4: mov rdi, rbx
0x1006a53f7: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1006a53fc: lea rdi, [rbp - 0x618]
0x1006a5403: mov rsi, rbx
0x1006a5406: mov rdx, rax
0x1006a5409: call 0x100011930 ; 0x100011930
0x1006a540e: mov rax, qword ptr [rbp - 0x628]
0x1006a5415: mov qword ptr [rbp - 0x618], rax
0x1006a541c: mov qword ptr [rbp - 0x4c8], r14
0x1006a5423: mov rdi, r12
0x1006a5426: call 0x1007a58d0 ; 0x1007a58d0
0x1006a542b: lea rdi, [rbp - 0x618]
0x1006a5432: mov rsi, r15
0x1006a5435: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a543a: mov rdi, r13
0x1006a543d: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a5442: mov rax, qword ptr [rip + 0x56848f] ; 0x100c0d8d8
0x1006a5449: mov rax, qword ptr [rax]
0x1006a544c: cmp rax, qword ptr [rbp - 0x30]
0x1006a5450: jne 0x1006a5464
0x1006a5452: add rsp, 0x648
0x1006a5459: pop rbx
0x1006a545a: pop r12
0x1006a545c: pop r13
0x1006a545e: pop r14
0x1006a5460: pop r15
0x1006a5462: pop rbp
0x1006a5463: ret 
0x1006a5464: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1006a5469: mov qword ptr [rbp - 0x620], rax
0x1006a5470: mov rax, qword ptr [rbp - 0x628]
0x1006a5477: mov qword ptr [rbp - 0x618], rax
0x1006a547e: mov qword ptr [rbp - 0x4c8], r14
0x1006a5485: mov rdi, r12
0x1006a5488: call 0x1007a58d0 ; 0x1007a58d0
0x1006a548d: jmp 0x1006a5496 ; 0x1006a5496
0x1006a548f: mov qword ptr [rbp - 0x620], rax
0x1006a5496: lea rdi, [rbp - 0x618]
0x1006a549d: mov rsi, r15
0x1006a54a0: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a54a5: jmp 0x1006a54ae ; 0x1006a54ae
0x1006a54a7: mov qword ptr [rbp - 0x620], rax
0x1006a54ae: mov rdi, r13
0x1006a54b1: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a54b6: mov rdi, qword ptr [rbp - 0x620]
0x1006a54bd: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a54c2: jmp 0x1006a54e5 ; 0x1006a54e5
0x1006a54c4: jmp 0x1006a5530 ; 0x1006a5530
0x1006a54c6: mov qword ptr [rbp - 0x620], rax
0x1006a54cd: lea rdi, [rbp - 0x4c8]
0x1006a54d4: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a54d9: mov rdi, qword ptr [rbp - 0x620]
0x1006a54e0: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a54e5: mov qword ptr [rbp - 0x620], rax
0x1006a54ec: mov rax, qword ptr [rbp - 0x628]
0x1006a54f3: mov qword ptr [rbp - 0x618], rax
0x1006a54fa: mov qword ptr [rbp - 0x4c8], r14
0x1006a5501: mov rdi, r12
0x1006a5504: call 0x1007a58d0 ; 0x1007a58d0
0x1006a5509: lea rdi, [rbp - 0x618]
0x1006a5510: mov rsi, r15
0x1006a5513: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a5518: lea rdi, [rbp - 0x4c8]
0x1006a551f: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a5524: mov rdi, qword ptr [rbp - 0x620]
0x1006a552b: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a5530: mov qword ptr [rbp - 0x620], rax
0x1006a5537: lea rdi, [rbp - 0x618]
0x1006a553e: mov rsi, r15
0x1006a5541: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a5546: lea rdi, [rbp - 0x4c8]
0x1006a554d: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a5552: mov rdi, qword ptr [rbp - 0x620]
0x1006a5559: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a555e: mov qword ptr [rbp - 0x620], rax
0x1006a5565: lea rdi, [rbp - 0x4c8]
0x1006a556c: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a5571: mov rdi, qword ptr [rbp - 0x620]
0x1006a5578: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a557d: mov qword ptr [rbp - 0x620], rax
0x1006a5584: jmp 0x1006a5742 ; 0x1006a5742
0x1006a5589: mov qword ptr [rbp - 0x620], rax
0x1006a5590: lea rdi, [rbp - 0x2e0]
0x1006a5597: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a559c: mov rdi, qword ptr [rbp - 0x620]
0x1006a55a3: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a55a8: jmp 0x1006a5667 ; 0x1006a5667
0x1006a55ad: mov qword ptr [rbp - 0x620], rax
0x1006a55b4: lea rdi, [rbp - 0x2e0]
0x1006a55bb: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a55c0: mov rdi, qword ptr [rbp - 0x620]
0x1006a55c7: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a55cc: jmp 0x1006a5640 ; 0x1006a5640
0x1006a55ce: mov qword ptr [rbp - 0x620], rax
0x1006a55d5: mov rdi, r15
0x1006a55d8: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a55dd: mov rdi, qword ptr [rbp - 0x620]
0x1006a55e4: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a55e9: jmp 0x1006a5640 ; 0x1006a5640
0x1006a55eb: mov qword ptr [rbp - 0x620], rax
0x1006a55f2: mov rdi, r15
0x1006a55f5: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a55fa: mov rdi, qword ptr [rbp - 0x620]
0x1006a5601: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a5606: jmp 0x1006a5640 ; 0x1006a5640
0x1006a5608: mov qword ptr [rbp - 0x620], rax
0x1006a560f: mov rdi, r15
0x1006a5612: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a5617: mov rdi, qword ptr [rbp - 0x620]
0x1006a561e: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a5623: jmp 0x1006a5640 ; 0x1006a5640
0x1006a5625: mov qword ptr [rbp - 0x620], rax
0x1006a562c: mov rdi, r15
0x1006a562f: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a5634: mov rdi, qword ptr [rbp - 0x620]
0x1006a563b: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a5640: mov qword ptr [rbp - 0x620], rax
0x1006a5647: jmp 0x1006a56f7 ; 0x1006a56f7
0x1006a564c: mov qword ptr [rbp - 0x620], rax
0x1006a5653: mov rdi, r15
0x1006a5656: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a565b: mov rdi, qword ptr [rbp - 0x620]
0x1006a5662: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a5667: mov qword ptr [rbp - 0x620], rax
0x1006a566e: lea rdi, [rbp - 0x430]
0x1006a5675: mov rsi, qword ptr [rbp - 0x630]
0x1006a567c: jmp 0x1006a574c ; 0x1006a574c
0x1006a5681: mov qword ptr [rbp - 0x620], rax
0x1006a5688: lea rdi, [rbp - 0x2e0]
0x1006a568f: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a5694: mov rdi, qword ptr [rbp - 0x620]
0x1006a569b: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a56a0: mov qword ptr [rbp - 0x620], rax
0x1006a56a7: jmp 0x1006a578d ; 0x1006a578d
0x1006a56ac: mov qword ptr [rbp - 0x620], rax
0x1006a56b3: mov rdi, r12
0x1006a56b6: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a56bb: mov rdi, qword ptr [rbp - 0x620]
0x1006a56c2: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a56c7: jmp 0x1006a571e ; 0x1006a571e
0x1006a56c9: jmp 0x1006a571e ; 0x1006a571e
0x1006a56cb: jmp 0x1006a56d3 ; 0x1006a56d3
0x1006a56cd: jmp 0x1006a56d3 ; 0x1006a56d3
0x1006a56cf: jmp 0x1006a56d3 ; 0x1006a56d3
0x1006a56d1: jmp 0x1006a56d3 ; 0x1006a56d3
0x1006a56d3: mov qword ptr [rbp - 0x620], rax
0x1006a56da: mov rax, qword ptr [rbp - 0x628]
0x1006a56e1: mov qword ptr [rbp - 0x430], rax
0x1006a56e8: mov qword ptr [rbp - 0x2e0], r14
0x1006a56ef: mov rdi, r12
0x1006a56f2: call 0x1007a58d0 ; 0x1007a58d0
0x1006a56f7: lea rdi, [rbp - 0x430]
0x1006a56fe: mov rsi, qword ptr [rbp - 0x630]
0x1006a5705: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a570a: mov rdi, r15
0x1006a570d: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a5712: mov rdi, qword ptr [rbp - 0x620]
0x1006a5719: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a571e: mov qword ptr [rbp - 0x620], rax
0x1006a5725: mov rax, qword ptr [rbp - 0x628]
0x1006a572c: mov qword ptr [rbp - 0x430], rax
0x1006a5733: mov qword ptr [rbp - 0x2e0], r14
0x1006a573a: mov rdi, r12
0x1006a573d: call 0x1007a58d0 ; 0x1007a58d0
0x1006a5742: lea rdi, [rbp - 0x430]
0x1006a5749: mov rsi, r15
0x1006a574c: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a5751: lea rdi, [rbp - 0x2e0]
0x1006a5758: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a575d: mov rdi, qword ptr [rbp - 0x620]
0x1006a5764: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a5769: mov qword ptr [rbp - 0x620], rax
0x1006a5770: mov rax, qword ptr [rbp - 0x628]
0x1006a5777: mov qword ptr [rbp - 0x430], rax
0x1006a577e: mov qword ptr [rbp - 0x2e0], r14
0x1006a5785: mov rdi, rbx
0x1006a5788: call 0x1007a58d0 ; 0x1007a58d0
0x1006a578d: mov rsi, qword ptr [rip + 0x564dec] ; 0x100c0a580
0x1006a5794: add rsi, 8
0x1006a5798: lea rdi, [rbp - 0x430]
0x1006a579f: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1006a57a4: mov rdi, r12
0x1006a57a7: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1006a57ac: mov rdi, qword ptr [rbp - 0x620]
0x1006a57b3: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a57b8: nop dword ptr [rax + rax]
