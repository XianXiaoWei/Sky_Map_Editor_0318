; ModuleID = 'CloudCore0.vert.osx.metallib'
source_filename = "CloudCore0.vert.osx.metallib"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-macosx10.11.0"

%struct.xlatMtlShaderOutput = type { <4 x float> }
%struct.xlatMtlShaderUniform = type { float, <3 x float>, half, %"class.metal::matrix" }
%"class.metal::matrix" = type { [4 x <4 x float>] }

; Function Attrs: nounwind
define %struct.xlatMtlShaderOutput @vsMain(<3 x float> %0, <4 x float> %1, ptr addrspace(2) readonly captures(none) %2) #0 {
  %4 = extractelement <3 x float> %0, i32 1
  %5 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %2, i64 0, i32 2
  %6 = load half, ptr addrspace(2) %5, align 16, !tbaa !15
  %7 = fpext half %6 to float
  %8 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %2, i64 0, i32 0
  %9 = load float, ptr addrspace(2) %8, align 16, !tbaa !22
  %10 = fmul fast float %9, 0x3FB7DF3B60000000
  %11 = extractelement <3 x float> %0, i32 0
  %12 = fmul fast float %11, 0x3FC99999A0000000
  %13 = fadd fast float %12, %4
  %14 = fmul fast float %13, 0x3FC0A3D700000000
  %15 = fadd fast float %10, %14
  %16 = tail call float @air.fast_sin.f32(float %15) #1
  %17 = fmul fast float %16, 2.500000e-01
  %18 = fmul fast float %9, 0x3FC7DF3B60000000
  %19 = extractelement <3 x float> %0, i32 2
  %20 = fmul fast float %4, 0x3FC99999A0000000
  %21 = fsub fast float %20, %19
  %22 = fmul fast float %21, 0x3FB0A3D700000000
  %23 = fadd fast float %18, %22
  %24 = tail call float @air.fast_sin.f32(float %23) #1
  %25 = fmul fast float %24, 5.000000e-01
  %26 = fmul fast float %9, 0x3FD7DF3B60000000
  %27 = fmul fast float %19, 0x3FC99999A0000000
  %28 = fsub fast float %27, %11
  %29 = fmul fast float %28, 0x3FA0A3D700000000
  %30 = fadd fast float %26, %29
  %31 = tail call float @air.fast_sin.f32(float %30) #1
  %32 = fadd fast float %17, -1.000000e+00
  %33 = fadd fast float %32, %25
  %34 = fadd fast float %33, %31
  %35 = fmul fast float %7, 2.000000e+00
  %36 = fmul fast float %35, %34
  %37 = fsub fast float %4, %36
  %38 = insertelement <3 x float> %0, float %37, i32 1
  %39 = shufflevector <3 x float> %38, <3 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %40 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %2, i64 0, i32 1
  %41 = bitcast ptr addrspace(2) %40 to ptr addrspace(2)
  %42 = load <4 x float>, ptr addrspace(2) %41, align 16
  %43 = fsub fast <4 x float> %42, %39
  %44 = shufflevector <4 x float> %43, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %45 = tail call float @air.dot.v3f32(<3 x float> %44, <3 x float> %44) #3
  %46 = fmul fast float %45, 0x3F899999A0000000
  %47 = fsub fast float 1.000000e+00, %46
  %48 = tail call float @air.fast_fmax.f32(float 5.000000e-01, float %47) #3
  %49 = fmul fast float %48, 4.000000e+00
  %50 = insertelement <3 x float> undef, float %49, i32 0
  %51 = shufflevector <3 x float> %50, <3 x float> undef, <3 x i32> zeroinitializer
  %52 = shufflevector <4 x float> %1, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %53 = tail call float @air.dot.v3f32(<3 x float> %52, <3 x float> %52) #3
  %54 = tail call float @air.fast_rsqrt.f32(float %53) #1
  %55 = insertelement <3 x float> undef, float %54, i32 0
  %56 = shufflevector <3 x float> %55, <3 x float> undef, <3 x i32> zeroinitializer
  %57 = fmul fast <3 x float> %51, %52
  %58 = fmul fast <3 x float> %57, %56
  %59 = fsub fast <3 x float> %38, %58
  %60 = shufflevector <3 x float> %59, <3 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %61 = shufflevector <4 x float> <float undef, float undef, float undef, float 1.000000e+00>, <4 x float> %60, <4 x i32> <i32 4, i32 5, i32 6, i32 3>
  %62 = shufflevector <3 x float> %59, <3 x float> undef, <4 x i32> zeroinitializer
  %63 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %2, i64 0, i32 3, i32 0, i64 0
  %64 = load <4 x float>, ptr addrspace(2) %63, align 16, !tbaa !23
  %65 = fmul fast <4 x float> %62, %64
  br label %66

66:                                               ; preds = %66, %3
  %67 = phi i32 [ 1, %3 ], [ %77, %66 ]
  %68 = phi <4 x float> [ %65, %3 ], [ %76, %66 ]
  %69 = extractelement <4 x float> %61, i32 %67
  %70 = insertelement <4 x float> undef, float %69, i32 0
  %71 = shufflevector <4 x float> %70, <4 x float> undef, <4 x i32> zeroinitializer
  %72 = sext i32 %67 to i64
  %73 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %2, i64 0, i32 3, i32 0, i64 %72
  %74 = load <4 x float>, ptr addrspace(2) %73, align 16, !tbaa !23
  %75 = fmul fast <4 x float> %74, %71
  %76 = fadd fast <4 x float> %75, %68
  %77 = add nuw nsw i32 %67, 1
  %78 = icmp eq i32 %77, 4
  br i1 %78, label %79, label %66

79:                                               ; preds = %66
  %80 = extractelement <4 x float> %76, i32 1
  %81 = fsub fast float -0.000000e+00, %80
  %82 = insertelement <4 x float> %76, float %81, i32 1
  %83 = extractelement <4 x float> %76, i32 2
  %84 = extractelement <4 x float> %76, i32 3
  %85 = fadd fast float %83, %84
  %86 = fmul fast float %85, 5.000000e-01
  %87 = insertelement <4 x float> %82, float %86, i32 2
  %88 = insertvalue %struct.xlatMtlShaderOutput undef, <4 x float> %87, 0
  ret %struct.xlatMtlShaderOutput %88
}

; Function Attrs: nounwind memory(none)
declare float @air.fast_rsqrt.f32(float) #1

declare float @air.dot.v3f32(<3 x float>, <3 x float>) #2

declare float @air.fast_fmax.f32(float, float) #2

; Function Attrs: nounwind memory(none)
declare float @air.fast_sin.f32(float) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { nounwind memory(none) }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}
!air.version = !{!1}
!air.language_version = !{!2}
!air.compile_options = !{!3, !4, !5, !6}
!air.vertex = !{!7}

!0 = !{!"Apple LLVM version 802.1 (metalfe-802.1.34)"}
!1 = !{i32 1, i32 8, i32 0}
!2 = !{!"Metal", i32 1, i32 1, i32 0}
!3 = !{!"air.compile.denorms_disable"}
!4 = !{!"air.compile.fast_math_enable"}
!5 = !{!"air.compile.framebuffer_fetch_disable"}
!6 = !{!"air.compile.native_double_disable"}
!7 = !{ptr @vsMain, !8, !10}
!8 = !{!9}
!9 = !{!"air.position", !"air.arg_type_name", !"float4", !"air.arg_name", !"gl_Position"}
!10 = !{!11, !12, !13}
!11 = !{i32 0, !"air.vertex_input", !"air.location_index", i32 0, i32 1, !"generated(10a_positionDv3_f)", !"air.arg_type_name", !"float3", !"air.arg_name", !"a_position"}
!12 = !{i32 1, !"air.vertex_input", !"air.location_index", i32 1, i32 1, !"generated(8a_normalDv4_f)", !"air.arg_type_name", !"float4", !"air.arg_name", !"a_normal"}
!13 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 112, !"air.location_index", i32 9, i32 1, !"air.read", !"air.struct_type_info", !14, !"air.arg_type_size", i32 112, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"xlatMtlShaderUniform", !"air.arg_name", !"_mtl_u"}
!14 = !{i32 0, i32 4, i32 0, !"float", !"u_time", i32 16, i32 16, i32 0, !"float3", !"u_localAvatarPos", i32 32, i32 2, i32 0, !"half", !"u_cloudUndulationScale", i32 48, i32 64, i32 0, !"float4x4", !"u_viewProj"}
!15 = !{!16, !20, i64 32}
!16 = !{!"_ZTS20xlatMtlShaderUniform", !17, i64 0, !18, i64 16, !20, i64 32, !21, i64 48}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!"half", !18, i64 0}
!21 = !{!"_ZTSN5metal6matrixIfLi4ELi4EEE", !18, i64 0}
!22 = !{!16, !17, i64 0}
!23 = !{!18, !18, i64 0}
