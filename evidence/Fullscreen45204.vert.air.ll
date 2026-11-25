; ModuleID = 'Fullscreen45204.vert.osx.metallib'
source_filename = "Fullscreen45204.vert.osx.metallib"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-macosx10.11.0"

%struct.xlatMtlShaderOutput.packed = type <{ <4 x float>, <2 x float> }>
%struct.xlatMtlShaderUniform = type { <2 x float> }

; Function Attrs: nounwind memory(read)
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
  %10 = insertelement <4 x half> undef, half %7, i32 0
  %11 = insertelement <4 x half> %10, half %9, i32 1
  %12 = fpext half %7 to float
  %13 = insertelement <2 x float> undef, float %12, i32 0
  %14 = fpext half %9 to float
  %15 = insertelement <2 x float> %13, float %14, i32 1
  %16 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %0, i64 0, i32 0
  %17 = load <2 x float>, ptr addrspace(2) %16, align 8, !tbaa !15
  %18 = fdiv fast <2 x float> splat (float 2.500000e-01), %17, !fpmath !19
  %19 = fsub fast <2 x float> %15, %18
  %20 = fmul fast <4 x half> %11, <half 0xH4000, half 0xH4000, half undef, half undef>
  %21 = fadd fast <4 x half> %20, <half 0xHBC00, half 0xHBC00, half undef, half undef>
  %22 = extractelement <4 x half> %21, i32 0
  %23 = fpext half %22 to float
  %24 = insertelement <4 x float> undef, float %23, i32 0
  %25 = extractelement <4 x half> %21, i32 1
  %26 = fpext half %25 to float
  %27 = insertelement <4 x float> %24, float 1.000000e+00, i32 3
  %28 = fsub fast float -0.000000e+00, %26
  %29 = insertelement <4 x float> %27, float %28, i32 1
  %30 = insertelement <4 x float> %29, float 5.000000e-01, i32 2
  %31 = insertvalue %struct.xlatMtlShaderOutput.packed undef, <4 x float> %30, 0
  %32 = insertvalue %struct.xlatMtlShaderOutput.packed %31, <2 x float> %19, 1
  ret %struct.xlatMtlShaderOutput.packed %32
}

attributes #0 = { nounwind memory(read) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }

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
!12 = !{i32 0, !"air.buffer", !"air.buffer_size", i32 8, !"air.location_index", i32 9, i32 1, !"air.read", !"air.struct_type_info", !13, !"air.arg_type_size", i32 8, !"air.arg_type_align_size", i32 8, !"air.arg_type_name", !"xlatMtlShaderUniform", !"air.arg_name", !"_mtl_u"}
!13 = !{i32 0, i32 8, i32 0, !"float2", !"u_texSizeHalf"}
!14 = !{i32 1, !"air.vertex_id", !"air.arg_type_name", !"uint", !"air.arg_name", !"gl_VertexID"}
!15 = !{!16, !17, i64 0}
!16 = !{!"_ZTS20xlatMtlShaderUniform", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
!19 = !{float 2.500000e+00}
