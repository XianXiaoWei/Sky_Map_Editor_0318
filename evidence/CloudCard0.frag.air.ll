; ModuleID = 'CloudCard0.frag.osx.metallib'
source_filename = "CloudCard0.frag.osx.metallib"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-macosx10.11.0"

%struct.xlatMtlShaderOutput = type { <4 x half>, <4 x half> }
%struct.xlatMtlShaderUniform = type { <3 x float>, <3 x float>, <4 x half>, <2 x float>, <2 x float>, %"class.metal::matrix" }
%"class.metal::matrix" = type { [4 x <4 x float>] }

; Function Attrs: noduplicate nounwind
define %struct.xlatMtlShaderOutput @fsMain(<4 x float> %0, <3 x half> %1, <2 x float> %2, <3 x float> %3, <3 x half> %4, <3 x float> %5, half %6, <2 x half> %7, ptr addrspace(2) readonly captures(none) %8, ptr addrspace(1) %9, ptr addrspace(2) readonly captures(none) %10, ptr addrspace(1) %11, ptr addrspace(2) readonly captures(none) %12, ptr addrspace(1) %13, ptr addrspace(2) readonly captures(none) %14) #0 {
  %16 = shufflevector <4 x float> %0, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %17 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %8, i64 0, i32 3
  %18 = load <2 x float>, ptr addrspace(2) %17, align 8, !tbaa !28
  %19 = fdiv fast <2 x float> %16, %18, !fpmath !33
  %20 = extractelement <4 x float> %0, i32 3
  %21 = fdiv fast float 1.000000e+00, %20, !fpmath !33
  %22 = tail call <4 x float> @air.sample_texture_2d.v4f32(ptr addrspace(1) captures(none) %13, ptr addrspace(2) captures(none) %14, <2 x float> %19, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00) #3
  %23 = extractelement <4 x float> %22, i32 3
  %24 = tail call float @air.fabs.f32(float %23) #1
  %25 = fmul fast float %24, 1.000000e+01
  %26 = tail call float @air.fast_fmin.f32(float 2.560000e+05, float %25) #4
  %27 = fsub fast float %26, %21
  %28 = tail call float @air.fast_fmax.f32(float 0.000000e+00, float %27) #4
  %29 = fmul fast float %28, -2.000000e+00
  %30 = tail call float @air.fast_exp2.f32(float %29) #1
  %31 = fsub fast float 1.000000e+00, %30
  %32 = fcmp ogt float %31, 0x3F50624DE0000000
  br i1 %32, label %33, label %144

33:                                               ; preds = %15
  %34 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %11, ptr addrspace(2) captures(none) %12, <2 x float> %2, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00) #3
  %35 = extractelement <4 x half> %34, i32 3
  %36 = fmul fast half %35, %6
  %37 = fpext half %36 to float
  %38 = extractelement <2 x half> %7, i32 0
  %39 = fmul fast half %38, 0xH4500
  %40 = fadd fast half %39, 0xH3C00
  %41 = fpext half %40 to float
  %42 = extractelement <3 x half> %4, i32 0
  %43 = fpext half %42 to float
  %44 = insertelement <3 x float> undef, float %43, i32 0
  %45 = extractelement <3 x half> %4, i32 1
  %46 = fpext half %45 to float
  %47 = insertelement <3 x float> %44, float %46, i32 1
  %48 = extractelement <3 x half> %4, i32 2
  %49 = fpext half %48 to float
  %50 = insertelement <3 x float> %47, float %49, i32 2
  %51 = tail call float @air.dot.v3f32(<3 x float> %3, <3 x float> %3) #4
  %52 = tail call float @air.fast_rsqrt.f32(float %51) #1
  %53 = insertelement <3 x float> undef, float %52, i32 0
  %54 = shufflevector <3 x float> %53, <3 x float> undef, <3 x i32> zeroinitializer
  %55 = fmul fast <3 x float> %54, %3
  %56 = tail call float @air.dot.v3f32(<3 x float> %50, <3 x float> %55) #4
  %57 = tail call float @air.fabs.f32(float %56) #1
  %58 = fadd fast float %21, -2.000000e+00
  %59 = tail call float @air.fast_clamp.f32(float %58, float 0.000000e+00, float 1.000000e+01) #4
  %60 = fmul fast float %41, 0x3FB99999A0000000
  %61 = fmul fast float %60, %31
  %62 = fmul fast float %61, %37
  %63 = fmul fast float %62, %57
  %64 = fmul fast float %63, %59
  %65 = fcmp ogt float %64, 0x3F50624DE0000000
  br i1 %65, label %66, label %144

66:                                               ; preds = %33
  %67 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %8, i64 0, i32 1
  %68 = bitcast ptr addrspace(2) %67 to ptr addrspace(2)
  %69 = load <4 x float>, ptr addrspace(2) %68, align 16
  %70 = shufflevector <4 x float> %69, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %71 = fsub fast <3 x float> %5, %70
  %72 = fmul fast <3 x float> %71, splat (float 2.343750e-02)
  %73 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %8, i64 0, i32 2
  %74 = load <4 x half>, ptr addrspace(2) %73, align 16
  %75 = extractelement <4 x half> %74, i32 0
  %76 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %9, ptr addrspace(2) captures(none) %10, <3 x float> %72, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %77 = extractelement <4 x half> %76, i32 0
  %78 = fmul fast half %77, %75
  %79 = fdiv fast half %78, %75
  %80 = extractelement <2 x half> %7, i32 1
  %81 = tail call half @air.mix.f16(half 0xH3C00, half %79, half %80) #4
  %82 = fpext half %81 to float
  %83 = fmul fast float %64, -3.000000e+00
  %84 = fmul fast float %83, %82
  %85 = tail call float @air.fast_exp2.f32(float %84) #1
  %86 = bitcast ptr addrspace(2) %8 to ptr addrspace(2)
  %87 = load <4 x float>, ptr addrspace(2) %86, align 16
  %88 = shufflevector <4 x float> %87, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %89 = fsub fast <3 x float> %5, %88
  %90 = shufflevector <3 x float> %89, <3 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %91 = shufflevector <4 x float> <float undef, float undef, float undef, float 1.000000e+00>, <4 x float> %90, <4 x i32> <i32 4, i32 5, i32 6, i32 3>
  %92 = shufflevector <3 x float> %89, <3 x float> undef, <4 x i32> zeroinitializer
  %93 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %8, i64 0, i32 5, i32 0, i64 0
  %94 = load <4 x float>, ptr addrspace(2) %93, align 16, !tbaa !34
  %95 = fmul fast <4 x float> %92, %94
  br label %96

96:                                               ; preds = %96, %66
  %97 = phi i32 [ 1, %66 ], [ %107, %96 ]
  %98 = phi <4 x float> [ %95, %66 ], [ %106, %96 ]
  %99 = extractelement <4 x float> %91, i32 %97
  %100 = insertelement <4 x float> undef, float %99, i32 0
  %101 = shufflevector <4 x float> %100, <4 x float> undef, <4 x i32> zeroinitializer
  %102 = sext i32 %97 to i64
  %103 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %8, i64 0, i32 5, i32 0, i64 %102
  %104 = load <4 x float>, ptr addrspace(2) %103, align 16, !tbaa !34
  %105 = fmul fast <4 x float> %104, %101
  %106 = fadd fast <4 x float> %105, %98
  %107 = add nuw nsw i32 %97, 1
  %108 = icmp eq i32 %107, 4
  br i1 %108, label %109, label %96

109:                                              ; preds = %96
  %110 = fsub fast float 1.000000e+00, %85
  %111 = extractelement <3 x half> %1, i32 0
  %112 = extractelement <3 x half> %1, i32 1
  %113 = extractelement <3 x half> %1, i32 2
  %114 = insertelement <4 x half> undef, half %111, i32 0
  %115 = insertelement <4 x half> %114, half %112, i32 1
  %116 = insertelement <4 x half> %115, half %113, i32 2
  %117 = fptrunc float %110 to half
  %118 = insertelement <4 x half> %116, half %117, i32 3
  %119 = tail call float @air.fast_clamp.f32(float %21, float 0x3FF00418A0000000, float 2.560000e+05) #4
  %120 = tail call float @air.fast_log2.f32(float %119) #1
  %121 = fmul fast float %120, 2.560000e+02
  %122 = fptrunc float %121 to half
  %123 = shufflevector <4 x float> %106, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %124 = shufflevector <4 x float> %106, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %125 = fdiv fast <2 x float> %123, %124, !fpmath !33
  %126 = fmul fast <2 x float> %125, splat (float -5.000000e-01)
  %127 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %8, i64 0, i32 4
  %128 = load <2 x float>, ptr addrspace(2) %127, align 16, !tbaa !35
  %129 = fadd fast <2 x float> %19, splat (float -5.000000e-01)
  %130 = fadd fast <2 x float> %129, %126
  %131 = fsub fast <2 x float> %130, %128
  %132 = insertelement <2 x float> undef, float %110, i32 0
  %133 = shufflevector <2 x float> %132, <2 x float> undef, <2 x i32> zeroinitializer
  %134 = fmul fast <2 x float> %133, splat (float 1.024000e+03)
  %135 = fmul fast <2 x float> %134, %131
  %136 = insertelement <4 x half> undef, half %122, i32 0
  %137 = extractelement <2 x float> %135, i32 0
  %138 = fptrunc float %137 to half
  %139 = insertelement <4 x half> %136, half %138, i32 1
  %140 = extractelement <2 x float> %135, i32 1
  %141 = fptrunc float %140 to half
  %142 = insertelement <4 x half> %139, half %141, i32 2
  %143 = insertelement <4 x half> %142, half %117, i32 3
  br label %144

144:                                              ; preds = %109, %33, %15
  %145 = phi <4 x half> [ %118, %109 ], [ zeroinitializer, %33 ], [ zeroinitializer, %15 ]
  %146 = phi <4 x half> [ %143, %109 ], [ zeroinitializer, %33 ], [ zeroinitializer, %15 ]
  %147 = insertvalue %struct.xlatMtlShaderOutput undef, <4 x half> %145, 0
  %148 = insertvalue %struct.xlatMtlShaderOutput %147, <4 x half> %146, 1
  ret %struct.xlatMtlShaderOutput %148
}

; Function Attrs: nounwind memory(none)
declare float @air.fast_log2.f32(float) #1

declare float @air.fast_clamp.f32(float, float, float) #2

; Function Attrs: nounwind memory(none)
declare float @air.fast_exp2.f32(float) #1

declare half @air.mix.f16(half, half, half) #2

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <3 x float>, i1, <3 x i32>, i1, float) #3

; Function Attrs: nounwind memory(none)
declare float @air.fabs.f32(float) #1

declare float @air.dot.v3f32(<3 x float>, <3 x float>) #2

; Function Attrs: nounwind memory(none)
declare float @air.fast_rsqrt.f32(float) #1

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <2 x float>, i1, <2 x i32>, i1, float) #3

declare float @air.fast_fmax.f32(float, float) #2

declare float @air.fast_fmin.f32(float, float) #2

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x float> @air.sample_texture_2d.v4f32(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <2 x float>, i1, <2 x i32>, i1, float) #3

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
!11 = !{!12, !13, !14, !15, !16, !17, !18, !19, !20, !22, !23, !24, !25, !26, !27}
!12 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"gl_FragCoord"}
!13 = !{i32 1, !"air.fragment_input", !"generated(7v_colorDv3_Dh)", !"air.center", !"air.perspective", !"air.arg_type_name", !"half3", !"air.arg_name", !"v_color"}
!14 = !{i32 2, !"air.fragment_input", !"generated(4v_uvDv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"v_uv"}
!15 = !{i32 3, !"air.fragment_input", !"generated(5v_eyeDv3_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float3", !"air.arg_name", !"v_eye"}
!16 = !{i32 4, !"air.fragment_input", !"generated(6v_normDv3_Dh)", !"air.center", !"air.perspective", !"air.arg_type_name", !"half3", !"air.arg_name", !"v_norm"}
!17 = !{i32 5, !"air.fragment_input", !"generated(10v_worldPosDv3_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float3", !"air.arg_name", !"v_worldPos"}
!18 = !{i32 6, !"air.fragment_input", !"generated(11v_alphaMultDh)", !"air.center", !"air.perspective", !"air.arg_type_name", !"half", !"air.arg_name", !"v_alphaMult"}
!19 = !{i32 7, !"air.fragment_input", !"generated(20v_closenessToSurfaceDv2_Dh)", !"air.center", !"air.perspective", !"air.arg_type_name", !"half2", !"air.arg_name", !"v_closenessToSurface"}
!20 = !{i32 8, !"air.buffer", !"air.buffer_size", i32 128, !"air.location_index", i32 9, i32 1, !"air.read", !"air.struct_type_info", !21, !"air.arg_type_size", i32 128, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"xlatMtlShaderUniform", !"air.arg_name", !"_mtl_u"}
!21 = !{i32 0, i32 16, i32 0, !"float3", !"u_cloudWindMove", i32 16, i32 16, i32 0, !"float3", !"u_cloudWindScroll", i32 32, i32 8, i32 0, !"half4", !"u_cloudNoiseTweaks", i32 40, i32 8, i32 0, !"float2", !"u_viewportSize", i32 48, i32 8, i32 0, !"float2", !"u_jitter", i32 64, i32 64, i32 0, !"float4x4", !"u_viewProjOld"}
!22 = !{i32 9, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<half, sample>", !"air.arg_name", !"u_cloudNoise3D"}
!23 = !{i32 10, !"air.sampler", !"air.location_index", i32 0, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudNoise3D"}
!24 = !{i32 11, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<half, sample>", !"air.arg_name", !"u_alphaTex"}
!25 = !{i32 12, !"air.sampler", !"air.location_index", i32 1, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_alphaTex"}
!26 = !{i32 13, !"air.texture", !"air.location_index", i32 2, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"u_depthHalfTex"}
!27 = !{i32 14, !"air.sampler", !"air.location_index", i32 2, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_depthHalfTex"}
!28 = !{!29, !30, i64 40}
!29 = !{!"_ZTS20xlatMtlShaderUniform", !30, i64 0, !30, i64 16, !30, i64 32, !30, i64 40, !30, i64 48, !32, i64 64}
!30 = !{!"omnipotent char", !31, i64 0}
!31 = !{!"Simple C++ TBAA"}
!32 = !{!"_ZTSN5metal6matrixIfLi4ELi4EEE", !30, i64 0}
!33 = !{float 2.500000e+00}
!34 = !{!30, !30, i64 0}
!35 = !{!29, !30, i64 48}
