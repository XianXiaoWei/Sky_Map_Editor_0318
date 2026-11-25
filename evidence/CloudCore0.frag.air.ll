; ModuleID = 'CloudCore0.frag.osx.metallib'
source_filename = "CloudCore0.frag.osx.metallib"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-macosx10.11.0"

%struct.xlatMtlShaderOutput = type { <4 x half> }
%struct.xlatMtlShaderUniform = type { <2 x float> }

; Function Attrs: noduplicate nounwind
define %struct.xlatMtlShaderOutput @fsMain(<4 x float> %0, ptr addrspace(2) readonly captures(none) %1, ptr addrspace(1) %2, ptr addrspace(2) readonly captures(none) %3) #0 {
  %5 = shufflevector <4 x float> %0, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %6 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %1, i64 0, i32 0
  %7 = load <2 x float>, ptr addrspace(2) %6, align 8, !tbaa !16
  %8 = fdiv fast <2 x float> %5, %7, !fpmath !20
  %9 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %2, ptr addrspace(2) captures(none) %3, <2 x float> %8, i1 true, <2 x i32> zeroinitializer, i1 true, float 0.000000e+00) #2
  %10 = extractelement <4 x half> %9, i32 3
  %11 = fcmp ogt half %10, 0xH0000
  br i1 %11, label %12, label %17

12:                                               ; preds = %4
  %13 = shufflevector <4 x half> %9, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %14 = shufflevector <4 x half> %9, <4 x half> undef, <3 x i32> <i32 3, i32 3, i32 3>
  %15 = fdiv fast <3 x half> %13, %14
  %16 = shufflevector <3 x half> %15, <3 x half> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  br label %17

17:                                               ; preds = %12, %4
  %18 = phi <4 x half> [ %16, %12 ], [ <half 0xH0000, half 0xH0000, half 0xH0000, half undef>, %4 ]
  %19 = extractelement <4 x float> %0, i32 3
  %20 = fdiv fast float 1.000000e+00, %19, !fpmath !20
  %21 = tail call float @air.fast_fmin.f32(float 2.560000e+05, float %20) #3
  %22 = fmul fast float %21, 0x3FB99999A0000000
  %23 = fptrunc float %22 to half
  %24 = fsub fast half 0xH8000, %23
  %25 = insertelement <4 x half> %18, half %24, i32 3
  %26 = insertvalue %struct.xlatMtlShaderOutput undef, <4 x half> %25, 0
  ret %struct.xlatMtlShaderOutput %26
}

declare float @air.fast_fmin.f32(float, float) #1

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <2 x float>, i1, <2 x i32>, i1, float) #2

attributes #0 = { noduplicate nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #2 = { noduplicate nounwind memory(read) }
attributes #3 = { nounwind }

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
!7 = !{ptr @fsMain, !8, !10}
!8 = !{!9}
!9 = !{!"air.render_target", i32 0, !"air.arg_type_name", !"half4", !"air.arg_name", !"o_fragColor0"}
!10 = !{!11, !12, !14, !15}
!11 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"gl_FragCoord"}
!12 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 8, !"air.location_index", i32 9, i32 1, !"air.read", !"air.struct_type_info", !13, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"xlatMtlShaderUniform", !"air.arg_name", !"_mtl_u"}
!13 = !{i32 0, i32 8, i32 0, !"float2", !"u_viewportSize"}
!14 = !{i32 2, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<half, sample>", !"air.arg_name", !"u_cloudTex0"}
!15 = !{i32 3, !"air.sampler", !"air.location_index", i32 0, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudTex0"}
!16 = !{!17, !18, i64 0}
!17 = !{!"_ZTS20xlatMtlShaderUniform", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{float 2.500000e+00}
