; ModuleID = 'CloudFluffy54734.vert.osx.metallib'
source_filename = "CloudFluffy54734.vert.osx.metallib"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-macosx10.11.0"

%struct.xlatMtlShaderOutput = type { <4 x float>, <4 x float>, <4 x float>, <4 x float> }
%struct.xlatMtlShaderUniform = type { <3 x float>, <3 x float>, <4 x float>, <2 x float>, <2 x float>, <2 x float>, <3 x float>, <3 x float>, <3 x float>, <3 x float> }

; Function Attrs: nounwind
define %struct.xlatMtlShaderOutput @vsMain(<2 x float> %0, <2 x float> %1, ptr addrspace(2) readonly captures(none) %2) #0 {
  %4 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %2, i64 0, i32 3
  %5 = load <2 x float>, ptr addrspace(2) %4, align 16, !tbaa !18
  %6 = fadd fast <2 x float> %5, %1
  %7 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %2, i64 0, i32 4
  %8 = load <2 x float>, ptr addrspace(2) %7, align 8, !tbaa !22
  %9 = fadd fast <2 x float> %6, %8
  %10 = shufflevector <2 x float> %9, <2 x float> undef, <4 x i32> <i32 poison, i32 poison, i32 poison, i32 0>
  %11 = shufflevector <2 x float> %9, <2 x float> undef, <4 x i32> <i32 poison, i32 poison, i32 poison, i32 1>
  %12 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %2, i64 0, i32 8
  %13 = bitcast ptr addrspace(2) %12 to ptr addrspace(2)
  %14 = load <4 x float>, ptr addrspace(2) %13, align 16
  %15 = shufflevector <4 x float> %14, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %16 = shufflevector <2 x float> %9, <2 x float> undef, <3 x i32> zeroinitializer
  %17 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %2, i64 0, i32 6
  %18 = bitcast ptr addrspace(2) %17 to ptr addrspace(2)
  %19 = load <4 x float>, ptr addrspace(2) %18, align 16
  %20 = shufflevector <4 x float> %19, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %21 = fmul fast <3 x float> %20, %16
  %22 = fadd fast <3 x float> %21, %15
  %23 = shufflevector <2 x float> %9, <2 x float> undef, <3 x i32> <i32 1, i32 1, i32 1>
  %24 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %2, i64 0, i32 7
  %25 = bitcast ptr addrspace(2) %24 to ptr addrspace(2)
  %26 = load <4 x float>, ptr addrspace(2) %25, align 16
  %27 = shufflevector <4 x float> %26, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %28 = fmul fast <3 x float> %27, %23
  %29 = fadd fast <3 x float> %22, %28
  %30 = shufflevector <3 x float> %29, <3 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %31 = tail call float @air.dot.v3f32(<3 x float> %20, <3 x float> %20) #3
  %32 = tail call float @air.fast_sqrt.f32(float %31) #1
  %33 = fmul fast float %32, 5.000000e-01
  %34 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %2, i64 0, i32 5
  %35 = load <2 x float>, ptr addrspace(2) %34, align 16
  %36 = extractelement <2 x float> %35, i32 0
  %37 = fdiv fast float %33, %36, !fpmath !23
  %38 = fmul fast float %37, 0x3FF0F876A0000000
  %39 = insertelement <4 x float> %30, float %38, i32 3
  %40 = bitcast ptr addrspace(2) %2 to ptr addrspace(2)
  %41 = load <4 x float>, ptr addrspace(2) %40, align 16
  %42 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %2, i64 0, i32 2
  %43 = load <4 x float>, ptr addrspace(2) %42, align 16
  %44 = extractelement <4 x float> %43, i32 0
  %45 = fmul fast float %44, 5.000000e-01
  %46 = insertelement <3 x float> undef, float %45, i32 0
  %47 = shufflevector <3 x float> %46, <3 x float> undef, <3 x i32> zeroinitializer
  %48 = fmul fast <3 x float> %47, splat (float 0x3FF028F5C0000000)
  %49 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %2, i64 0, i32 9
  %50 = bitcast ptr addrspace(2) %49 to ptr addrspace(2)
  %51 = load <4 x float>, ptr addrspace(2) %50, align 16
  %52 = fsub fast <4 x float> %41, %51
  %53 = shufflevector <4 x float> %52, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %54 = fadd fast <3 x float> %53, %48
  %55 = shufflevector <3 x float> %54, <3 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %56 = shufflevector <4 x float> %10, <4 x float> %55, <4 x i32> <i32 4, i32 5, i32 6, i32 3>
  %57 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %2, i64 0, i32 1
  %58 = bitcast ptr addrspace(2) %57 to ptr addrspace(2)
  %59 = load <4 x float>, ptr addrspace(2) %58, align 16
  %60 = fadd fast <4 x float> %52, %59
  %61 = shufflevector <4 x float> %11, <4 x float> %60, <4 x i32> <i32 4, i32 5, i32 6, i32 3>
  %62 = shufflevector <2 x float> %0, <2 x float> undef, <4 x i32> <i32 0, i32 poison, i32 poison, i32 poison>
  %63 = shufflevector <4 x float> <float undef, float undef, float undef, float 1.000000e+00>, <4 x float> %62, <4 x i32> <i32 4, i32 poison, i32 poison, i32 3>
  %64 = extractelement <2 x float> %0, i32 1
  %65 = fsub fast float -0.000000e+00, %64
  %66 = insertelement <4 x float> %63, float %65, i32 1
  %67 = insertelement <4 x float> %66, float 5.000000e-01, i32 2
  %68 = insertvalue %struct.xlatMtlShaderOutput undef, <4 x float> %67, 0
  %69 = insertvalue %struct.xlatMtlShaderOutput %68, <4 x float> %39, 1
  %70 = insertvalue %struct.xlatMtlShaderOutput %69, <4 x float> %56, 2
  %71 = insertvalue %struct.xlatMtlShaderOutput %70, <4 x float> %61, 3
  ret %struct.xlatMtlShaderOutput %71
}

; Function Attrs: nounwind memory(none)
declare float @air.fast_sqrt.f32(float) #1

declare float @air.dot.v3f32(<3 x float>, <3 x float>) #2

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
!7 = !{ptr @vsMain, !8, !13}
!8 = !{!9, !10, !11, !12}
!9 = !{!"air.position", !"air.arg_type_name", !"float4", !"air.arg_name", !"gl_Position"}
!10 = !{!"air.vertex_output", !"generated(12v_rayVecSizeDv4_f)", !"air.arg_type_name", !"float4", !"air.arg_name", !"v_rayVecSize"}
!11 = !{!"air.vertex_output", !"generated(7v_bMinUDv4_f)", !"air.arg_type_name", !"float4", !"air.arg_name", !"v_bMinU"}
!12 = !{!"air.vertex_output", !"generated(7v_bMaxVDv4_f)", !"air.arg_type_name", !"float4", !"air.arg_name", !"v_bMaxV"}
!13 = !{!14, !15, !16}
!14 = !{i32 0, !"air.vertex_input", !"air.location_index", i32 0, i32 1, !"generated(10a_positionDv2_f)", !"air.arg_type_name", !"float2", !"air.arg_name", !"a_position"}
!15 = !{i32 1, !"air.vertex_input", !"air.location_index", i32 1, i32 1, !"generated(4a_uvDv2_f)", !"air.arg_type_name", !"float2", !"air.arg_name", !"a_uv"}
!16 = !{i32 2, !"air.buffer", !"air.buffer_size", i32 144, !"air.location_index", i32 9, i32 1, !"air.read", !"air.struct_type_info", !17, !"air.arg_type_size", i32 144, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"xlatMtlShaderUniform", !"air.arg_name", !"_mtl_u"}
!17 = !{i32 0, i32 16, i32 0, !"float3", !"u_cloudBinMinWorld", i32 16, i32 16, i32 0, !"float3", !"u_cloudBinRangeWorld", i32 32, i32 16, i32 0, !"float4", !"u_cloudVoxelScales", i32 48, i32 8, i32 0, !"float2", !"u_jitter", i32 56, i32 8, i32 0, !"float2", !"u_jitterHalf", i32 64, i32 8, i32 0, !"float2", !"u_viewportSize", i32 80, i32 16, i32 0, !"float3", !"u_projPlaneU", i32 96, i32 16, i32 0, !"float3", !"u_projPlaneV", i32 112, i32 16, i32 0, !"float3", !"u_projPlaneOrigin", i32 128, i32 16, i32 0, !"float3", !"u_eyePos"}
!18 = !{!19, !20, i64 48}
!19 = !{!"_ZTS20xlatMtlShaderUniform", !20, i64 0, !20, i64 16, !20, i64 32, !20, i64 48, !20, i64 56, !20, i64 64, !20, i64 80, !20, i64 96, !20, i64 112, !20, i64 128}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = !{!19, !20, i64 56}
!23 = !{float 2.500000e+00}
