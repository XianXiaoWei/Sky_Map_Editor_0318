; ModuleID = 'Fullscreen3593.vert.osx.metallib'
source_filename = "Fullscreen3593.vert.osx.metallib"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-macosx10.11.0"

%struct.xlatMtlShaderOutput.packed = type <{ <4 x float>, <2 x float> }>
%struct.xlatMtlShaderUniform = type { <2 x half> }

; Function Attrs: nounwind
define %struct.xlatMtlShaderOutput.packed @vsMain(ptr addrspace(2) readonly captures(none) %0, i32 %1) #0 {
  %3 = shl i32 %1, 16
  %4 = ashr exact i32 %3, 16
  switch i32 %4, label %5 [
    i32 0, label %6
    i32 3, label %6
  ]

5:                                                ; preds = %2
  br label %6

6:                                                ; preds = %5, %2, %2
  %7 = phi half [ 0xH3C00, %5 ], [ 0xHBC00, %2 ], [ 0xHBC00, %2 ]
  %8 = icmp slt i32 %3, 131072
  %9 = select i1 %8, half 0xH3C00, half 0xHBC00
  %10 = insertelement <2 x half> undef, half %7, i32 0
  %11 = insertelement <2 x half> %10, half %9, i32 1
  %12 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %0, i64 0, i32 0
  %13 = load <2 x half>, ptr addrspace(2) %12, align 4, !tbaa !15
  %14 = fmul fast <2 x half> %13, splat (half 0xH4400)
  %15 = fsub fast <2 x half> %11, %14
  %16 = tail call <2 x half> @air.fmin.v2f16(<2 x half> %11, <2 x half> %15) #2
  %17 = extractelement <2 x half> %16, i32 0
  %18 = fpext half %17 to float
  %19 = insertelement <2 x float> undef, float %18, i32 0
  %20 = extractelement <2 x half> %16, i32 1
  %21 = fpext half %20 to float
  %22 = insertelement <2 x float> %19, float %21, i32 1
  %23 = fmul fast <2 x half> %11, splat (half 0xH4000)
  %24 = fadd fast <2 x half> %23, splat (half 0xHBC00)
  %25 = extractelement <2 x half> %24, i32 0
  %26 = fpext half %25 to float
  %27 = insertelement <4 x float> undef, float %26, i32 0
  %28 = extractelement <2 x half> %24, i32 1
  %29 = fpext half %28 to float
  %30 = insertelement <4 x float> %27, float 1.000000e+00, i32 3
  %31 = fsub fast float -0.000000e+00, %29
  %32 = insertelement <4 x float> %30, float %31, i32 1
  %33 = insertelement <4 x float> %32, float 5.000000e-01, i32 2
  %34 = insertvalue %struct.xlatMtlShaderOutput.packed undef, <4 x float> %33, 0
  %35 = insertvalue %struct.xlatMtlShaderOutput.packed %34, <2 x float> %22, 1
  ret %struct.xlatMtlShaderOutput.packed %35
}

declare <2 x half> @air.fmin.v2f16(<2 x half>, <2 x half>) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #2 = { nounwind }

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
!7 = !{ptr @vsMain, !8, !11}
!8 = !{!9, !10}
!9 = !{!"air.position", !"air.arg_type_name", !"float4", !"air.arg_name", !"gl_Position"}
!10 = !{!"air.vertex_output", !"generated(4v_uvDv2_f)", !"air.arg_type_name", !"float2", !"air.arg_name", !"v_uv"}
!11 = !{!12, !14}
!12 = !{i32 0, !"air.buffer", !"air.buffer_size", i32 4, !"air.location_index", i32 9, i32 1, !"air.read", !"air.struct_type_info", !13, !"air.arg_type_size", i32 4, !"air.arg_type_align_size", i32 4, !"air.arg_type_name", !"xlatMtlShaderUniform", !"air.arg_name", !"_mtl_u"}
!13 = !{i32 0, i32 4, i32 0, !"half2", !"u_jitterHalf"}
!14 = !{i32 1, !"air.vertex_id", !"air.arg_type_name", !"uint", !"air.arg_name", !"gl_VertexID"}
!15 = !{!16, !17, i64 0}
!16 = !{!"_ZTS20xlatMtlShaderUniform", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
