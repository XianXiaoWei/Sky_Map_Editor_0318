; ModuleID = 'FlatCloud11244.frag.osx.metallib'
source_filename = "FlatCloud11244.frag.osx.metallib"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-macosx10.11.0"

%struct.xlatMtlShaderOutput = type { <4 x half>, <4 x half> }
%struct.xlatMtlShaderUniform = type { <2 x float> }

; Function Attrs: noduplicate nounwind
define %struct.xlatMtlShaderOutput @fsMain(<4 x float> %0, <4 x float> %1, half %2, <4 x half> %3, half %4, float %5, half %6, <2 x half> %7, half %8, ptr addrspace(2) readonly captures(none) %9, ptr addrspace(1) %10, ptr addrspace(2) readonly captures(none) %11, ptr addrspace(1) %12, ptr addrspace(2) readonly captures(none) %13) #0 {
  %15 = insertelement <4 x half> undef, half %8, i32 0
  %16 = shufflevector <4 x half> %15, <4 x half> undef, <4 x i32> zeroinitializer
  %17 = fmul fast <4 x half> %16, %3
  %18 = extractelement <4 x float> %1, i32 0
  %19 = fptrunc float %18 to half
  %20 = extractelement <4 x float> %1, i32 1
  %21 = fptrunc float %20 to half
  %22 = fpext half %19 to float
  %23 = insertelement <2 x float> undef, float %22, i32 0
  %24 = fpext half %21 to float
  %25 = insertelement <2 x float> %23, float %24, i32 1
  %26 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %10, ptr addrspace(2) captures(none) %11, <2 x float> %25, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00) #3
  %27 = extractelement <4 x half> %26, i32 3
  %28 = extractelement <4 x half> %26, i32 2
  %29 = tail call half @air.mix.f16(half %27, half %28, half %2) #4
  %30 = extractelement <4 x half> %17, i32 3
  %31 = fmul fast half %29, %30
  %32 = shufflevector <4 x float> %0, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %33 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %9, i64 0, i32 0
  %34 = load <2 x float>, ptr addrspace(2) %33, align 8, !tbaa !27
  %35 = fdiv fast <2 x float> %32, %34, !fpmath !31
  %36 = extractelement <2 x float> %35, i32 0
  %37 = fptrunc float %36 to half
  %38 = extractelement <2 x float> %35, i32 1
  %39 = fptrunc float %38 to half
  %40 = fpext half %37 to float
  %41 = insertelement <2 x float> undef, float %40, i32 0
  %42 = fpext half %39 to float
  %43 = insertelement <2 x float> %41, float %42, i32 1
  %44 = tail call <4 x float> @air.sample_texture_2d.v4f32(ptr addrspace(1) captures(none) %12, ptr addrspace(2) captures(none) %13, <2 x float> %43, i1 true, <2 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %45 = extractelement <4 x float> %44, i32 3
  %46 = tail call float @air.fabs.f32(float %45) #1
  %47 = fmul fast float %46, 1.000000e+01
  %48 = tail call float @air.fast_fmin.f32(float 2.560000e+05, float %47) #4
  %49 = fmul fast half %29, %4
  %50 = fpext half %49 to float
  %51 = fsub fast float %50, %5
  %52 = fadd fast float %51, %48
  %53 = fpext half %6 to float
  %54 = fmul fast float %52, %53
  %55 = tail call float @air.fast_clamp.f32(float %54, float 0.000000e+00, float 1.000000e+00) #4
  %56 = tail call float @air.fast_clamp.f32(float %55, float 0.000000e+00, float 1.000000e+00) #4
  %57 = fmul fast float %56, 2.000000e+00
  %58 = fsub fast float 3.000000e+00, %57
  %59 = fmul fast float %56, %56
  %60 = fmul fast float %59, %58
  %61 = fptrunc float %60 to half
  %62 = fmul fast half %31, %61
  %63 = insertelement <4 x half> %17, half %62, i32 3
  %64 = extractelement <4 x float> %0, i32 3
  %65 = fdiv fast float 1.000000e+00, %64, !fpmath !31
  %66 = tail call float @air.fast_clamp.f32(float %65, float 0x3FF00418A0000000, float 2.560000e+05) #4
  %67 = tail call float @air.fast_log2.f32(float %66) #1
  %68 = fmul fast float %67, 2.560000e+02
  %69 = fptrunc float %68 to half
  %70 = insertelement <4 x half> undef, half %69, i32 0
  %71 = shufflevector <2 x half> %7, <2 x half> undef, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %72 = shufflevector <4 x half> %70, <4 x half> %71, <4 x i32> <i32 0, i32 4, i32 5, i32 poison>
  %73 = insertelement <4 x half> %72, half %62, i32 3
  %74 = insertvalue %struct.xlatMtlShaderOutput undef, <4 x half> %63, 0
  %75 = insertvalue %struct.xlatMtlShaderOutput %74, <4 x half> %73, 1
  ret %struct.xlatMtlShaderOutput %75
}

; Function Attrs: nounwind memory(none)
declare float @air.fast_log2.f32(float) #1

declare float @air.fast_clamp.f32(float, float, float) #2

declare float @air.fast_fmin.f32(float, float) #2

; Function Attrs: nounwind memory(none)
declare float @air.fabs.f32(float) #1

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x float> @air.sample_texture_2d.v4f32(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <2 x float>, i1, <2 x i32>, i1, float) #3

declare half @air.mix.f16(half, half, half) #2

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <2 x float>, i1, <2 x i32>, i1, float) #3

attributes #0 = { noduplicate nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { nounwind memory(none) }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #3 = { noduplicate nounwind memory(read) }
attributes #4 = { nounwind }

!llvm.ident = !{!0}
!air.version = !{!1}
!air.language_version = !{!2}
!air.compile_options = !{!3, !4, !5, !6}
!air.fragment = !{!7}

!0 = !{!"Apple LLVM version 802.1 (metalfe-802.1.34)"}
!1 = !{i32 1, i32 8, i32 0}
!2 = !{!"Metal", i32 1, i32 1, i32 0}
!3 = !{!"air.compile.denorms_disable"}
!4 = !{!"air.compile.fast_math_enable"}
!5 = !{!"air.compile.framebuffer_fetch_disable"}
!6 = !{!"air.compile.native_double_disable"}
!7 = !{ptr @fsMain, !8, !11}
!8 = !{!9, !10}
!9 = !{!"air.render_target", i32 0, !"air.arg_type_name", !"half4", !"air.arg_name", !"o_fragColor0"}
!10 = !{!"air.render_target", i32 1, !"air.arg_type_name", !"half4", !"air.arg_name", !"o_fragColor1"}
!11 = !{!12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !23, !24, !25, !26}
!12 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"gl_FragCoord"}
!13 = !{i32 1, !"air.fragment_input", !"generated(4v_uvDv4_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"v_uv"}
!14 = !{i32 2, !"air.fragment_input", !"generated(14v_frame2WeightDh)", !"air.center", !"air.perspective", !"air.arg_type_name", !"half", !"air.arg_name", !"v_frame2Weight"}
!15 = !{i32 3, !"air.fragment_input", !"generated(7v_colorDv4_Dh)", !"air.center", !"air.perspective", !"air.arg_type_name", !"half4", !"air.arg_name", !"v_color"}
!16 = !{i32 4, !"air.fragment_input", !"generated(8v_radiusDh)", !"air.center", !"air.perspective", !"air.arg_type_name", !"half", !"air.arg_name", !"v_radius"}
!17 = !{i32 5, !"air.fragment_input", !"generated(11v_fragDepthf)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float", !"air.arg_name", !"v_fragDepth"}
!18 = !{i32 6, !"air.fragment_input", !"generated(19v_softParticleScaleDh)", !"air.center", !"air.perspective", !"air.arg_type_name", !"half", !"air.arg_name", !"v_softParticleScale"}
!19 = !{i32 7, !"air.fragment_input", !"generated(7v_uvVelDv2_Dh)", !"air.center", !"air.perspective", !"air.arg_type_name", !"half2", !"air.arg_name", !"v_uvVel"}
!20 = !{i32 8, !"air.fragment_input", !"generated(18v_externalLightingDh)", !"air.center", !"air.perspective", !"air.arg_type_name", !"half", !"air.arg_name", !"v_externalLighting"}
!21 = !{i32 9, !"air.buffer", !"air.buffer_size", i32 8, !"air.location_index", i32 9, i32 1, !"air.read", !"air.struct_type_info", !22, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"xlatMtlShaderUniform", !"air.arg_name", !"_mtl_u"}
!22 = !{i32 0, i32 8, i32 0, !"float2", !"u_viewportSize"}
!23 = !{i32 10, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<half, sample>", !"air.arg_name", !"u_texture"}
!24 = !{i32 11, !"air.sampler", !"air.location_index", i32 0, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_texture"}
!25 = !{i32 12, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"u_depthHalfTex"}
!26 = !{i32 13, !"air.sampler", !"air.location_index", i32 1, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_depthHalfTex"}
!27 = !{!28, !29, i64 0}
!28 = !{!"_ZTS20xlatMtlShaderUniform", !29, i64 0}
!29 = !{!"omnipotent char", !30, i64 0}
!30 = !{!"Simple C++ TBAA"}
!31 = !{float 2.500000e+00}
