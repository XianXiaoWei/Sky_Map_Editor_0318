; ModuleID = 'DepthDownsample5322.frag.osx.metallib'
source_filename = "DepthDownsample5322.frag.osx.metallib"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-macosx10.11.0"

%struct.xlatMtlShaderOutput = type { <2 x half> }

; Function Attrs: noduplicate nounwind
define %struct.xlatMtlShaderOutput @fsMain(<2 x float> %0, ptr addrspace(2) readnone captures(none) %1, ptr addrspace(1) %2, ptr addrspace(2) readonly captures(none) %3) #0 {
  %5 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %2, ptr addrspace(2) captures(none) %3, <2 x float> %0, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00) #3
  %6 = tail call <4 x half> @air.fabs.v4f16(<4 x half> %5) #2
  %7 = extractelement <4 x half> %6, i32 0
  %8 = extractelement <4 x half> %6, i32 1
  %9 = tail call half @air.fmin.f16(half %7, half %8) #4
  %10 = extractelement <4 x half> %6, i32 2
  %11 = extractelement <4 x half> %6, i32 3
  %12 = tail call half @air.fmin.f16(half %10, half %11) #4
  %13 = tail call half @air.fmin.f16(half %9, half %12) #4
  %14 = insertelement <2 x half> undef, half %13, i32 0
  %15 = tail call half @air.fmax.f16(half %7, half %8) #4
  %16 = tail call half @air.fmax.f16(half %10, half %11) #4
  %17 = tail call half @air.fmax.f16(half %15, half %16) #4
  %18 = insertelement <2 x half> %14, half %17, i32 1
  %19 = insertvalue %struct.xlatMtlShaderOutput undef, <2 x half> %18, 0
  ret %struct.xlatMtlShaderOutput %19
}

declare half @air.fmax.f16(half, half) #1

declare half @air.fmin.f16(half, half) #1

; Function Attrs: nounwind memory(none)
declare <4 x half> @air.fabs.v4f16(<4 x half>) #2

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <2 x float>, i1, <2 x i32>, i1, float) #3

attributes #0 = { noduplicate nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #2 = { nounwind memory(none) }
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
!7 = !{ptr @fsMain, !8, !10}
!8 = !{!9}
!9 = !{!"air.render_target", i32 0, !"air.arg_type_name", !"half2", !"air.arg_name", !"o_depths"}
!10 = !{!11, !12, !14, !15}
!11 = !{i32 0, !"air.fragment_input", !"generated(4v_uvDv2_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float2", !"air.arg_name", !"v_uv"}
!12 = !{i32 1, !"air.buffer", !"air.buffer_size", i32 1, !"air.location_index", i32 9, i32 1, !"air.read", !"air.struct_type_info", !13, !"air.arg_type_size", i32 1, !"air.arg_type_align_size", i32 1, !"air.arg_type_name", !"xlatMtlShaderUniform", !"air.arg_name", !"_mtl_u"}
!13 = !{}
!14 = !{i32 2, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<half, sample>", !"air.arg_name", !"u_depthHalfTex"}
!15 = !{i32 3, !"air.sampler", !"air.location_index", i32 0, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_depthHalfTex"}
