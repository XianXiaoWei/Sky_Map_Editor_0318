; ModuleID = 'CloudFluffy54734.frag.osx.metallib'
source_filename = "CloudFluffy54734.frag.osx.metallib"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-macosx10.11.0"

%struct.xlatMtlShaderOutput = type { half }
%struct.xlatMtlShaderUniform = type { float, <3 x float>, <3 x float>, <3 x float>, float, <4 x half>, <4 x float>, half, <3 x float>, <2 x float>, <2 x float> }

; Function Attrs: noduplicate nounwind
define %struct.xlatMtlShaderOutput @fsMain(<4 x float> %0, <4 x float> %1, <4 x float> %2, <4 x float> %3, ptr addrspace(2) readonly captures(none) %4, ptr addrspace(1) %5, ptr addrspace(2) readonly captures(none) %6, ptr addrspace(1) %7, ptr addrspace(2) readonly captures(none) %8, ptr addrspace(1) %9, ptr addrspace(2) readonly captures(none) %10, ptr addrspace(1) %11, ptr addrspace(2) readonly captures(none) %12) #0 {
  %14 = shufflevector <4 x float> %1, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %15 = tail call float @air.dot.v3f32(<3 x float> %14, <3 x float> %14) #4
  %16 = tail call float @air.fast_rsqrt.f32(float %15) #3
  %17 = insertelement <3 x float> undef, float %16, i32 0
  %18 = shufflevector <3 x float> %17, <3 x float> undef, <3 x i32> zeroinitializer
  %19 = fmul fast <3 x float> %18, %14
  %20 = fdiv fast <3 x float> splat (float 1.000000e+00), %19, !fpmath !25
  %21 = shufflevector <4 x float> %2, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %22 = fmul fast <3 x float> %20, %21
  %23 = shufflevector <4 x float> %3, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %24 = fmul fast <3 x float> %20, %23
  %25 = tail call <3 x float> @air.fast_fmin.v3f32(<3 x float> %22, <3 x float> %24) #4
  %26 = tail call <3 x float> @air.fast_fmax.v3f32(<3 x float> %22, <3 x float> %24) #4
  %27 = extractelement <3 x float> %25, i32 0
  %28 = tail call float @air.fast_fmax.f32(float 0.000000e+00, float %27) #4
  %29 = extractelement <3 x float> %25, i32 1
  %30 = extractelement <3 x float> %25, i32 2
  %31 = tail call float @air.fast_fmax.f32(float %29, float %30) #4
  %32 = tail call float @air.fast_fmax.f32(float %28, float %31) #4
  %33 = shufflevector <4 x float> %0, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %34 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 9
  %35 = load <2 x float>, ptr addrspace(2) %34, align 16, !tbaa !26
  %36 = fdiv fast <2 x float> %33, %35, !fpmath !25
  %37 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 10
  %38 = load <2 x float>, ptr addrspace(2) %37, align 8, !tbaa !32
  %39 = tail call <2 x float> @air.fabs.v2f32(<2 x float> %38) #3
  %40 = fsub fast <2 x float> %36, %39
  %41 = tail call <4 x float> @air.sample_texture_2d.v4f32(ptr addrspace(1) captures(none) %11, ptr addrspace(2) captures(none) %12, <2 x float> %40, i1 true, <2 x i32> zeroinitializer, i1 true, float 0.000000e+00) #2
  %42 = extractelement <4 x float> %41, i32 1
  %43 = fptrunc float %42 to half
  %44 = tail call <4 x float> @air.sample_texture_2d.v4f32(ptr addrspace(1) captures(none) %11, ptr addrspace(2) captures(none) %12, <2 x float> %40, i1 true, <2 x i32> <i32 1, i32 0>, i1 true, float 0.000000e+00) #2
  %45 = extractelement <4 x float> %44, i32 1
  %46 = fptrunc float %45 to half
  %47 = tail call <4 x float> @air.sample_texture_2d.v4f32(ptr addrspace(1) captures(none) %11, ptr addrspace(2) captures(none) %12, <2 x float> %40, i1 true, <2 x i32> <i32 0, i32 1>, i1 true, float 0.000000e+00) #2
  %48 = extractelement <4 x float> %47, i32 1
  %49 = fptrunc float %48 to half
  %50 = tail call <4 x float> @air.sample_texture_2d.v4f32(ptr addrspace(1) captures(none) %11, ptr addrspace(2) captures(none) %12, <2 x float> %40, i1 true, <2 x i32> splat (i32 1), i1 true, float 0.000000e+00) #2
  %51 = extractelement <4 x float> %50, i32 1
  %52 = fptrunc float %51 to half
  %53 = tail call half @air.fmax.f16(half %43, half %46) #4
  %54 = tail call half @air.fmax.f16(half %49, half %52) #4
  %55 = tail call half @air.fmax.f16(half %53, half %54) #4
  %56 = fpext half %55 to float
  %57 = extractelement <3 x float> %26, i32 0
  %58 = extractelement <3 x float> %26, i32 1
  %59 = extractelement <3 x float> %26, i32 2
  %60 = tail call float @air.fast_fmin.f32(float %58, float %59) #4
  %61 = tail call float @air.fast_fmin.f32(float %57, float %60) #4
  %62 = tail call float @air.fast_fmax.f32(float 0.000000e+00, float %61) #4
  %63 = tail call float @air.fabs.f32(float %56) #3
  %64 = fmul fast float %63, 1.000000e+01
  %65 = tail call float @air.fast_fmin.f32(float 2.560000e+05, float %64) #4
  %66 = fdiv fast float %65, %16, !fpmath !25
  %67 = fadd fast float %66, 2.500000e+00
  %68 = tail call float @air.fast_fmin.f32(float %62, float %67) #4
  %69 = extractelement <4 x float> %1, i32 3
  %70 = fmul fast float %16, %69
  %71 = fcmp ult float %32, %68
  br i1 %71, label %72, label %223

72:                                               ; preds = %13
  %73 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 8
  %74 = bitcast ptr addrspace(2) %73 to ptr addrspace(2)
  %75 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 7
  %76 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 0
  %77 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 6
  %78 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 2
  %79 = bitcast ptr addrspace(2) %78 to ptr addrspace(2)
  %80 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 3
  %81 = bitcast ptr addrspace(2) %80 to ptr addrspace(2)
  %82 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 1
  %83 = bitcast ptr addrspace(2) %82 to ptr addrspace(2)
  %84 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 5
  %85 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 4
  br label %86

86:                                               ; preds = %213, %72
  %87 = phi float [ 1.000000e+00, %72 ], [ %216, %213 ]
  %88 = phi float [ %32, %72 ], [ %214, %213 ]
  %89 = phi float [ %68, %72 ], [ %215, %213 ]
  %90 = phi float [ %32, %72 ], [ %221, %213 ]
  %91 = load <4 x float>, ptr addrspace(2) %74, align 16
  %92 = shufflevector <4 x float> %91, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %93 = insertelement <3 x float> undef, float %90, i32 0
  %94 = shufflevector <3 x float> %93, <3 x float> undef, <3 x i32> zeroinitializer
  %95 = fmul fast <3 x float> %94, %19
  %96 = fadd fast <3 x float> %92, %95
  %97 = extractelement <3 x float> %96, i32 1
  %98 = load half, ptr addrspace(2) %75, align 16, !tbaa !33
  %99 = fpext half %98 to float
  %100 = load float, ptr addrspace(2) %76, align 16, !tbaa !34
  %101 = fmul fast float %100, 0x3FB7DF3B60000000
  %102 = extractelement <3 x float> %96, i32 0
  %103 = fmul fast float %102, 0x3FC99999A0000000
  %104 = fadd fast float %103, %97
  %105 = fmul fast float %104, 0x3FC0A3D700000000
  %106 = fadd fast float %105, %101
  %107 = tail call float @air.fast_sin.f32(float %106) #3
  %108 = fmul fast float %107, 2.500000e-01
  %109 = fmul fast float %100, 0x3FC7DF3B60000000
  %110 = extractelement <3 x float> %96, i32 2
  %111 = fmul fast float %97, 0x3FC99999A0000000
  %112 = fsub fast float %111, %110
  %113 = fmul fast float %112, 0x3FB0A3D700000000
  %114 = fadd fast float %113, %109
  %115 = tail call float @air.fast_sin.f32(float %114) #3
  %116 = fmul fast float %115, 5.000000e-01
  %117 = fmul fast float %100, 0x3FD7DF3B60000000
  %118 = fmul fast float %110, 0x3FC99999A0000000
  %119 = fsub fast float %118, %102
  %120 = fmul fast float %119, 0x3FA0A3D700000000
  %121 = fadd fast float %120, %117
  %122 = tail call float @air.fast_sin.f32(float %121) #3
  %123 = fadd fast float %108, -1.000000e+00
  %124 = fadd fast float %123, %116
  %125 = fadd fast float %124, %122
  %126 = fmul fast float %99, 2.000000e+00
  %127 = fmul fast float %126, %125
  %128 = fadd fast float %127, %97
  %129 = insertelement <3 x float> %96, float %128, i32 1
  %130 = load <4 x float>, ptr addrspace(2) %77, align 16
  %131 = extractelement <4 x float> %130, i32 0
  %132 = fmul fast float %131, 5.000000e-01
  %133 = insertelement <3 x float> undef, float %132, i32 0
  %134 = shufflevector <3 x float> %133, <3 x float> undef, <3 x i32> zeroinitializer
  %135 = fsub fast <3 x float> %129, %134
  %136 = load <4 x float>, ptr addrspace(2) %79, align 16
  %137 = shufflevector <4 x float> %136, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %138 = fsub fast <3 x float> %135, %137
  %139 = fdiv fast <3 x float> %138, splat (float 1.600000e+01), !fpmath !25
  %140 = tail call <3 x float> @air.fast_floor.v3f32(<3 x float> %139) #3
  %141 = fadd fast <3 x float> %140, splat (float 5.000000e-01)
  %142 = load <4 x float>, ptr addrspace(2) %81, align 16
  %143 = shufflevector <4 x float> %142, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %144 = fdiv fast <3 x float> splat (float 1.600000e+01), %143, !fpmath !25
  %145 = fmul fast <3 x float> %144, %141
  %146 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %9, ptr addrspace(2) captures(none) %10, <3 x float> %145, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #2
  %147 = extractelement <4 x float> %146, i32 0
  %148 = fcmp oeq float %147, 1.000000e+00
  br i1 %148, label %149, label %153

149:                                              ; preds = %86
  %150 = extractelement <4 x float> %146, i32 2
  %151 = fmul fast float %150, 1.100000e+02
  %152 = fadd fast float %151, -1.000000e+01
  br label %192

153:                                              ; preds = %86
  %154 = extractelement <4 x float> %130, i32 2
  %155 = fmul fast float %154, 5.000000e-01
  %156 = insertelement <3 x float> undef, float %155, i32 0
  %157 = shufflevector <3 x float> %156, <3 x float> undef, <3 x i32> zeroinitializer
  %158 = fsub fast float 1.000000e+00, %154
  %159 = insertelement <3 x float> undef, float %158, i32 0
  %160 = shufflevector <3 x float> %159, <3 x float> undef, <3 x i32> zeroinitializer
  %161 = fsub fast <3 x float> %139, %140
  %162 = fmul fast <3 x float> %161, %160
  %163 = fadd fast <3 x float> %162, %157
  %164 = load float, ptr addrspace(2) %85, align 16, !tbaa !35
  %165 = insertelement <2 x float> undef, float %164, i32 0
  %166 = shufflevector <2 x float> %165, <2 x float> undef, <2 x i32> zeroinitializer
  %167 = shufflevector <4 x float> %146, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %168 = fmul fast <2 x float> %167, splat (float 2.550000e+02)
  %169 = shufflevector <3 x float> %163, <3 x float> undef, <2 x i32> <i32 0, i32 1>
  %170 = fadd fast <2 x float> %169, %168
  %171 = fmul fast <2 x float> %166, %170
  %172 = shufflevector <2 x float> %171, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 poison>
  %173 = shufflevector <3 x float> %172, <3 x float> %163, <3 x i32> <i32 0, i32 1, i32 5>
  %174 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %5, ptr addrspace(2) captures(none) %6, <3 x float> %173, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #2
  %175 = extractelement <4 x float> %174, i32 0
  %176 = fmul fast float %175, 1.000000e+01
  %177 = fadd fast float %176, -6.000000e+00
  %178 = fmul fast half %98, 0xH34CD
  %179 = fpext half %178 to float
  %180 = fmul fast float %100, 0x3FF5A1CAC0000000
  %181 = extractelement <3 x float> %135, i32 1
  %182 = fmul fast float %181, 0x3FC99999A0000000
  %183 = fadd fast float %182, %180
  %184 = tail call float @air.fast_sin.f32(float %183) #3
  %185 = fmul fast float %184, %179
  %186 = fsub fast float %177, %185
  %187 = load <4 x half>, ptr addrspace(2) %84, align 8
  %188 = extractelement <4 x half> %187, i32 1
  %189 = fpext half %188 to float
  %190 = fsub fast float %189, %90
  %191 = tail call float @air.fast_fmax.f32(float %186, float %190) #4
  br label %192

192:                                              ; preds = %153, %149
  %193 = phi float [ %152, %149 ], [ %191, %153 ]
  %194 = fptrunc float %193 to half
  %195 = load <4 x float>, ptr addrspace(2) %83, align 16
  %196 = shufflevector <4 x float> %195, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %197 = fsub fast <3 x float> %96, %196
  %198 = fmul fast <3 x float> %197, splat (float 4.687500e-02)
  %199 = load <4 x half>, ptr addrspace(2) %84, align 8
  %200 = extractelement <4 x half> %199, i32 0
  %201 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %7, ptr addrspace(2) captures(none) %8, <3 x float> %198, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #2
  %202 = extractelement <4 x half> %201, i32 0
  %203 = fmul fast half %202, %200
  %204 = fsub fast half %194, %203
  %205 = fpext half %204 to float
  %206 = fmul fast float %70, %90
  %207 = fcmp olt float %205, %206
  br i1 %207, label %208, label %213

208:                                              ; preds = %192
  %209 = fcmp olt float %87, 1.000000e+00
  %210 = select i1 %209, float %90, float %88
  %211 = select i1 %209, float %88, float %89
  %212 = select i1 %209, float %87, float 0x3FD54FDF40000000
  br label %213

213:                                              ; preds = %208, %192
  %214 = phi float [ %90, %192 ], [ %210, %208 ]
  %215 = phi float [ %89, %192 ], [ %211, %208 ]
  %216 = phi float [ %87, %192 ], [ %212, %208 ]
  %217 = fmul fast float %214, 0x3F847AE140000000
  %218 = tail call float @air.fast_clamp.f32(float %217, float 0x3FB99999A0000000, float 1.000000e+00) #4
  %219 = fmul fast float %216, %205
  %220 = tail call float @air.fast_fmax.f32(float %218, float %219) #4
  %221 = fadd fast float %220, %214
  %222 = fcmp ult float %221, %215
  br i1 %222, label %86, label %223

223:                                              ; preds = %213, %13
  %224 = phi float [ %68, %13 ], [ %215, %213 ]
  %225 = fptrunc float %224 to half
  %226 = insertvalue %struct.xlatMtlShaderOutput undef, half %225, 0
  ret %struct.xlatMtlShaderOutput %226
}

declare float @air.fast_fmax.f32(float, float) #1

declare float @air.fast_clamp.f32(float, float, float) #1

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <3 x float>, i1, <3 x i32>, i1, float) #2

; Function Attrs: nounwind memory(none)
declare float @air.fast_sin.f32(float) #3

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <3 x float>, i1, <3 x i32>, i1, float) #2

; Function Attrs: nounwind memory(none)
declare <3 x float> @air.fast_floor.v3f32(<3 x float>) #3

declare float @air.fast_fmin.f32(float, float) #1

; Function Attrs: nounwind memory(none)
declare float @air.fabs.f32(float) #3

declare half @air.fmax.f16(half, half) #1

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x float> @air.sample_texture_2d.v4f32(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <2 x float>, i1, <2 x i32>, i1, float) #2

; Function Attrs: nounwind memory(none)
declare <2 x float> @air.fabs.v2f32(<2 x float>) #3

declare <3 x float> @air.fast_fmax.v3f32(<3 x float>, <3 x float>) #1

declare <3 x float> @air.fast_fmin.v3f32(<3 x float>, <3 x float>) #1

; Function Attrs: nounwind memory(none)
declare float @air.fast_rsqrt.f32(float) #3

declare float @air.dot.v3f32(<3 x float>, <3 x float>) #1

attributes #0 = { noduplicate nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #2 = { noduplicate nounwind memory(read) }
attributes #3 = { nounwind memory(none) }
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
!9 = !{!"air.render_target", i32 0, !"air.arg_type_name", !"half", !"air.arg_name", !"o_t"}
!10 = !{!11, !12, !13, !14, !15, !17, !18, !19, !20, !21, !22, !23, !24}
!11 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"gl_FragCoord"}
!12 = !{i32 1, !"air.fragment_input", !"generated(12v_rayVecSizeDv4_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"v_rayVecSize"}
!13 = !{i32 2, !"air.fragment_input", !"generated(7v_bMinUDv4_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"v_bMinU"}
!14 = !{i32 3, !"air.fragment_input", !"generated(7v_bMaxVDv4_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"v_bMaxV"}
!15 = !{i32 4, !"air.buffer", !"air.buffer_size", i32 144, !"air.location_index", i32 9, i32 1, !"air.read", !"air.struct_type_info", !16, !"air.arg_type_size", i32 144, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"xlatMtlShaderUniform", !"air.arg_name", !"_mtl_u"}
!16 = !{i32 0, i32 4, i32 0, !"float", !"u_time", i32 16, i32 16, i32 0, !"float3", !"u_cloudWindScroll", i32 32, i32 16, i32 0, !"float3", !"u_cloudBinMinWorld", i32 48, i32 16, i32 0, !"float3", !"u_cloudBinRangeWorld", i32 64, i32 4, i32 0, !"float", !"u_cloudPackedBinDimInv", i32 72, i32 8, i32 0, !"half4", !"u_cloudNoiseTweaks", i32 80, i32 16, i32 0, !"float4", !"u_cloudVoxelScales", i32 96, i32 2, i32 0, !"half", !"u_cloudUndulationScale", i32 112, i32 16, i32 0, !"float3", !"u_eyePos", i32 128, i32 8, i32 0, !"float2", !"u_viewportSize", i32 136, i32 8, i32 0, !"float2", !"u_jitterHalf"}
!17 = !{i32 5, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<float, sample>", !"air.arg_name", !"u_cloudDist"}
!18 = !{i32 6, !"air.sampler", !"air.location_index", i32 0, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudDist"}
!19 = !{i32 7, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<half, sample>", !"air.arg_name", !"u_cloudNoise3D"}
!20 = !{i32 8, !"air.sampler", !"air.location_index", i32 1, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudNoise3D"}
!21 = !{i32 9, !"air.texture", !"air.location_index", i32 2, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<float, sample>", !"air.arg_name", !"u_cloudSparse"}
!22 = !{i32 10, !"air.sampler", !"air.location_index", i32 2, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudSparse"}
!23 = !{i32 11, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"u_depthQuarterTex"}
!24 = !{i32 12, !"air.sampler", !"air.location_index", i32 3, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_depthQuarterTex"}
!25 = !{float 2.500000e+00}
!26 = !{!27, !29, i64 128}
!27 = !{!"_ZTS20xlatMtlShaderUniform", !28, i64 0, !29, i64 16, !29, i64 32, !29, i64 48, !28, i64 64, !29, i64 72, !29, i64 80, !31, i64 96, !29, i64 112, !29, i64 128, !29, i64 136}
!28 = !{!"float", !29, i64 0}
!29 = !{!"omnipotent char", !30, i64 0}
!30 = !{!"Simple C++ TBAA"}
!31 = !{!"half", !29, i64 0}
!32 = !{!27, !29, i64 136}
!33 = !{!27, !31, i64 96}
!34 = !{!27, !28, i64 0}
!35 = !{!27, !28, i64 64}
