; ModuleID = 'CloudFluffy62865.frag.osx.metallib'
source_filename = "CloudFluffy62865.frag.osx.metallib"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-macosx10.11.0"

%struct.xlatMtlShaderOutput = type { half }
%struct.xlatMtlShaderUniform = type { float, <4 x float>, <3 x float>, <3 x float>, <3 x float>, float, <4 x half>, <4 x float>, half, <3 x float> }

; Function Attrs: noduplicate nounwind
define %struct.xlatMtlShaderOutput @fsMain(<4 x float> %0, <4 x float> %1, <4 x float> %2, ptr addrspace(2) readonly captures(none) %3, ptr addrspace(1) %4, ptr addrspace(2) readonly captures(none) %5, ptr addrspace(1) %6, ptr addrspace(2) readonly captures(none) %7, ptr addrspace(1) %8, ptr addrspace(2) readonly captures(none) %9, ptr addrspace(1) %10, ptr addrspace(2) readonly captures(none) %11, ptr addrspace(1) %12, ptr addrspace(2) readonly captures(none) %13, ptr addrspace(1) %14, ptr addrspace(2) readonly captures(none) %15) #0 {
  %17 = shufflevector <4 x float> %0, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %18 = tail call float @air.dot.v3f32(<3 x float> %17, <3 x float> %17) #4
  %19 = tail call float @air.fast_rsqrt.f32(float %18) #3
  %20 = insertelement <3 x float> undef, float %19, i32 0
  %21 = shufflevector <3 x float> %20, <3 x float> undef, <3 x i32> zeroinitializer
  %22 = fmul fast <3 x float> %21, %17
  %23 = fdiv fast <3 x float> splat (float 1.000000e+00), %22, !fpmath !28
  %24 = shufflevector <4 x float> %1, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %25 = fmul fast <3 x float> %23, %24
  %26 = shufflevector <4 x float> %2, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %27 = fmul fast <3 x float> %23, %26
  %28 = tail call <3 x float> @air.fast_fmin.v3f32(<3 x float> %25, <3 x float> %27) #4
  %29 = tail call <3 x float> @air.fast_fmax.v3f32(<3 x float> %25, <3 x float> %27) #4
  %30 = shufflevector <4 x float> %1, <4 x float> %2, <2 x i32> <i32 3, i32 7>
  %31 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %14, ptr addrspace(2) captures(none) %15, <2 x float> %30, i1 true, <2 x i32> zeroinitializer, i1 true, float 0.000000e+00) #2
  %32 = extractelement <4 x half> %31, i32 0
  %33 = fpext half %32 to float
  %34 = extractelement <3 x float> %28, i32 0
  %35 = tail call float @air.fast_fmax.f32(float 0.000000e+00, float %34) #4
  %36 = extractelement <3 x float> %28, i32 1
  %37 = extractelement <3 x float> %28, i32 2
  %38 = tail call float @air.fast_fmax.f32(float %36, float %37) #4
  %39 = tail call float @air.fast_fmax.f32(float %35, float %38) #4
  %40 = tail call float @air.fabs.f32(float %33) #3
  %41 = tail call float @air.fast_fmax.f32(float %39, float %40) #4
  %42 = extractelement <3 x float> %29, i32 0
  %43 = extractelement <3 x float> %29, i32 1
  %44 = extractelement <3 x float> %29, i32 2
  %45 = tail call float @air.fast_fmin.f32(float %43, float %44) #4
  %46 = tail call float @air.fast_fmin.f32(float %42, float %45) #4
  %47 = tail call float @air.fast_fmax.f32(float 0.000000e+00, float %46) #4
  %48 = tail call <4 x float> @air.sample_texture_2d.v4f32(ptr addrspace(1) captures(none) %12, ptr addrspace(2) captures(none) %13, <2 x float> %30, i1 true, <2 x i32> zeroinitializer, i1 true, float 0.000000e+00) #2
  %49 = extractelement <4 x float> %48, i32 1
  %50 = tail call float @air.fabs.f32(float %49) #3
  %51 = fmul fast float %50, 1.000000e+01
  %52 = tail call float @air.fast_fmin.f32(float 2.560000e+05, float %51) #4
  %53 = fdiv fast float %52, %19, !fpmath !28
  %54 = fadd fast float %53, 2.500000e+00
  %55 = tail call float @air.fast_fmin.f32(float %47, float %54) #4
  %56 = extractelement <4 x float> %0, i32 3
  %57 = fmul fast float %19, %56
  %58 = fcmp ult float %41, %55
  br i1 %58, label %59, label %222

59:                                               ; preds = %16
  %60 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %3, i64 0, i32 9
  %61 = bitcast ptr addrspace(2) %60 to ptr addrspace(2)
  %62 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %3, i64 0, i32 8
  %63 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %3, i64 0, i32 0
  %64 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %3, i64 0, i32 7
  %65 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %3, i64 0, i32 3
  %66 = bitcast ptr addrspace(2) %65 to ptr addrspace(2)
  %67 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %3, i64 0, i32 4
  %68 = bitcast ptr addrspace(2) %67 to ptr addrspace(2)
  %69 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %3, i64 0, i32 1
  %70 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %3, i64 0, i32 2
  %71 = bitcast ptr addrspace(2) %70 to ptr addrspace(2)
  %72 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %3, i64 0, i32 6
  %73 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %3, i64 0, i32 5
  br label %74

74:                                               ; preds = %198, %59
  %75 = phi float [ %41, %59 ], [ %77, %198 ]
  %76 = phi float [ %55, %59 ], [ %216, %198 ]
  %77 = phi float [ %41, %59 ], [ %220, %198 ]
  %78 = load <4 x float>, ptr addrspace(2) %61, align 16
  %79 = shufflevector <4 x float> %78, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %80 = insertelement <3 x float> undef, float %77, i32 0
  %81 = shufflevector <3 x float> %80, <3 x float> undef, <3 x i32> zeroinitializer
  %82 = fmul fast <3 x float> %81, %22
  %83 = fadd fast <3 x float> %79, %82
  %84 = shufflevector <3 x float> %83, <3 x float> undef, <2 x i32> <i32 0, i32 2>
  %85 = extractelement <3 x float> %83, i32 1
  %86 = load half, ptr addrspace(2) %62, align 16, !tbaa !29
  %87 = fpext half %86 to float
  %88 = load float, ptr addrspace(2) %63, align 16, !tbaa !35
  %89 = fmul fast float %88, 0x3FB7DF3B60000000
  %90 = extractelement <3 x float> %83, i32 0
  %91 = fmul fast float %90, 0x3FC99999A0000000
  %92 = fadd fast float %91, %85
  %93 = fmul fast float %92, 0x3FC0A3D700000000
  %94 = fadd fast float %93, %89
  %95 = tail call float @air.fast_sin.f32(float %94) #3
  %96 = fmul fast float %95, 2.500000e-01
  %97 = fmul fast float %88, 0x3FC7DF3B60000000
  %98 = extractelement <3 x float> %83, i32 2
  %99 = fmul fast float %85, 0x3FC99999A0000000
  %100 = fsub fast float %99, %98
  %101 = fmul fast float %100, 0x3FB0A3D700000000
  %102 = fadd fast float %101, %97
  %103 = tail call float @air.fast_sin.f32(float %102) #3
  %104 = fmul fast float %103, 5.000000e-01
  %105 = fmul fast float %88, 0x3FD7DF3B60000000
  %106 = fmul fast float %98, 0x3FC99999A0000000
  %107 = fsub fast float %106, %90
  %108 = fmul fast float %107, 0x3FA0A3D700000000
  %109 = fadd fast float %108, %105
  %110 = tail call float @air.fast_sin.f32(float %109) #3
  %111 = fadd fast float %96, -1.000000e+00
  %112 = fadd fast float %111, %104
  %113 = fadd fast float %112, %110
  %114 = fmul fast float %87, 2.000000e+00
  %115 = fmul fast float %114, %113
  %116 = fadd fast float %115, %85
  %117 = insertelement <3 x float> %83, float %116, i32 1
  %118 = load <4 x float>, ptr addrspace(2) %64, align 16
  %119 = extractelement <4 x float> %118, i32 0
  %120 = fmul fast float %119, 5.000000e-01
  %121 = insertelement <3 x float> undef, float %120, i32 0
  %122 = shufflevector <3 x float> %121, <3 x float> undef, <3 x i32> zeroinitializer
  %123 = fsub fast <3 x float> %117, %122
  %124 = load <4 x float>, ptr addrspace(2) %66, align 16
  %125 = shufflevector <4 x float> %124, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %126 = fsub fast <3 x float> %123, %125
  %127 = fdiv fast <3 x float> %126, splat (float 1.600000e+01), !fpmath !28
  %128 = tail call <3 x float> @air.fast_floor.v3f32(<3 x float> %127) #3
  %129 = fadd fast <3 x float> %128, splat (float 5.000000e-01)
  %130 = load <4 x float>, ptr addrspace(2) %68, align 16
  %131 = shufflevector <4 x float> %130, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %132 = fdiv fast <3 x float> splat (float 1.600000e+01), %131, !fpmath !28
  %133 = fmul fast <3 x float> %132, %129
  %134 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %10, ptr addrspace(2) captures(none) %11, <3 x float> %133, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #2
  %135 = extractelement <4 x float> %134, i32 0
  %136 = fcmp oeq float %135, 1.000000e+00
  br i1 %136, label %137, label %141

137:                                              ; preds = %74
  %138 = extractelement <4 x float> %134, i32 2
  %139 = fmul fast float %138, 1.100000e+02
  %140 = fadd fast float %139, -1.000000e+01
  br label %180

141:                                              ; preds = %74
  %142 = extractelement <4 x float> %118, i32 2
  %143 = fmul fast float %142, 5.000000e-01
  %144 = insertelement <3 x float> undef, float %143, i32 0
  %145 = shufflevector <3 x float> %144, <3 x float> undef, <3 x i32> zeroinitializer
  %146 = fsub fast float 1.000000e+00, %142
  %147 = insertelement <3 x float> undef, float %146, i32 0
  %148 = shufflevector <3 x float> %147, <3 x float> undef, <3 x i32> zeroinitializer
  %149 = fsub fast <3 x float> %127, %128
  %150 = fmul fast <3 x float> %149, %148
  %151 = fadd fast <3 x float> %150, %145
  %152 = load float, ptr addrspace(2) %73, align 16, !tbaa !36
  %153 = insertelement <2 x float> undef, float %152, i32 0
  %154 = shufflevector <2 x float> %153, <2 x float> undef, <2 x i32> zeroinitializer
  %155 = shufflevector <4 x float> %134, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %156 = fmul fast <2 x float> %155, splat (float 2.550000e+02)
  %157 = shufflevector <3 x float> %151, <3 x float> undef, <2 x i32> <i32 0, i32 1>
  %158 = fadd fast <2 x float> %157, %156
  %159 = fmul fast <2 x float> %154, %158
  %160 = shufflevector <2 x float> %159, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 poison>
  %161 = shufflevector <3 x float> %160, <3 x float> %151, <3 x i32> <i32 0, i32 1, i32 5>
  %162 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %6, ptr addrspace(2) captures(none) %7, <3 x float> %161, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #2
  %163 = extractelement <4 x float> %162, i32 0
  %164 = fmul fast float %163, 1.000000e+01
  %165 = fadd fast float %164, -6.000000e+00
  %166 = fmul fast half %86, 0xH34CD
  %167 = fpext half %166 to float
  %168 = fmul fast float %88, 0x3FF5A1CAC0000000
  %169 = extractelement <3 x float> %123, i32 1
  %170 = fmul fast float %169, 0x3FC99999A0000000
  %171 = fadd fast float %170, %168
  %172 = tail call float @air.fast_sin.f32(float %171) #3
  %173 = fmul fast float %172, %167
  %174 = fsub fast float %165, %173
  %175 = load <4 x half>, ptr addrspace(2) %72, align 8
  %176 = extractelement <4 x half> %175, i32 1
  %177 = fpext half %176 to float
  %178 = fsub fast float %177, %77
  %179 = tail call float @air.fast_fmax.f32(float %174, float %178) #4
  br label %180

180:                                              ; preds = %141, %137
  %181 = phi float [ %140, %137 ], [ %179, %141 ]
  %182 = fptrunc float %181 to half
  %183 = load <4 x float>, ptr addrspace(2) %69, align 16
  %184 = shufflevector <4 x float> %183, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %185 = fsub fast <2 x float> %84, %184
  %186 = shufflevector <4 x float> %183, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %187 = fmul fast <2 x float> %185, %186
  %188 = fcmp olt <2 x float> %187, zeroinitializer
  %189 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %188) #4
  br i1 %189, label %198, label %190

190:                                              ; preds = %180
  %191 = fcmp ogt <2 x float> %187, splat (float 1.000000e+00)
  %192 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %191) #4
  br i1 %192, label %198, label %193

193:                                              ; preds = %190
  %194 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %4, ptr addrspace(2) captures(none) %5, <2 x float> %187, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00) #2
  %195 = extractelement <4 x half> %194, i32 1
  %196 = fmul fast half %195, 0xH4400
  %197 = tail call half @air.clamp.f16(half %196, half 0xHBC00, half 0xH0000) #4
  br label %198

198:                                              ; preds = %193, %190, %180
  %199 = phi half [ %197, %193 ], [ 0xH0000, %180 ], [ 0xH0000, %190 ]
  %200 = load <4 x float>, ptr addrspace(2) %71, align 16
  %201 = shufflevector <4 x float> %200, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %202 = fsub fast <3 x float> %83, %201
  %203 = fmul fast <3 x float> %202, splat (float 4.687500e-02)
  %204 = load <4 x half>, ptr addrspace(2) %72, align 8
  %205 = extractelement <4 x half> %204, i32 0
  %206 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %8, ptr addrspace(2) captures(none) %9, <3 x float> %203, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #2
  %207 = extractelement <4 x half> %206, i32 0
  %208 = fadd fast half %199, 0xH3C00
  %209 = fmul fast half %205, %208
  %210 = fmul fast half %209, %207
  %211 = fsub fast half %182, %199
  %212 = fsub fast half %211, %210
  %213 = fpext half %212 to float
  %214 = fmul fast float %57, %77
  %215 = fcmp olt float %213, %214
  %216 = select i1 %215, float %75, float %76
  %217 = fmul fast float %77, 0x3F847AE140000000
  %218 = tail call float @air.fast_clamp.f32(float %217, float 0x3FB99999A0000000, float 1.000000e+00) #4
  %219 = tail call float @air.fast_fmax.f32(float %218, float %213) #4
  %220 = fadd fast float %219, %77
  %221 = fcmp ult float %220, %216
  br i1 %221, label %74, label %222

222:                                              ; preds = %198, %16
  %223 = phi float [ %55, %16 ], [ %216, %198 ]
  %224 = fptrunc float %223 to half
  %225 = insertvalue %struct.xlatMtlShaderOutput undef, half %224, 0
  ret %struct.xlatMtlShaderOutput %225
}

declare float @air.fast_fmax.f32(float, float) #1

declare float @air.fast_clamp.f32(float, float, float) #1

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <3 x float>, i1, <3 x i32>, i1, float) #2

declare half @air.clamp.f16(half, half, half) #1

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <2 x float>, i1, <2 x i32>, i1, float) #2

declare zeroext i1 @air.any.v2i1(<2 x i1>) #1

; Function Attrs: nounwind memory(none)
declare float @air.fast_sin.f32(float) #3

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <3 x float>, i1, <3 x i32>, i1, float) #2

; Function Attrs: nounwind memory(none)
declare <3 x float> @air.fast_floor.v3f32(<3 x float>) #3

declare float @air.fast_fmin.f32(float, float) #1

; Function Attrs: nounwind memory(none)
declare float @air.fabs.f32(float) #3

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x float> @air.sample_texture_2d.v4f32(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <2 x float>, i1, <2 x i32>, i1, float) #2

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
!10 = !{!11, !12, !13, !14, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27}
!11 = !{i32 0, !"air.fragment_input", !"generated(12v_rayVecSizeDv4_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"v_rayVecSize"}
!12 = !{i32 1, !"air.fragment_input", !"generated(7v_bMinUDv4_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"v_bMinU"}
!13 = !{i32 2, !"air.fragment_input", !"generated(7v_bMaxVDv4_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"v_bMaxV"}
!14 = !{i32 3, !"air.buffer", !"air.buffer_size", i32 144, !"air.location_index", i32 9, i32 1, !"air.read", !"air.struct_type_info", !15, !"air.arg_type_size", i32 144, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"xlatMtlShaderUniform", !"air.arg_name", !"_mtl_u"}
!15 = !{i32 0, i32 4, i32 0, !"float", !"u_time", i32 16, i32 16, i32 0, !"float4", !"u_waterSimTerms", i32 32, i32 16, i32 0, !"float3", !"u_cloudWindScroll", i32 48, i32 16, i32 0, !"float3", !"u_cloudBinMinWorld", i32 64, i32 16, i32 0, !"float3", !"u_cloudBinRangeWorld", i32 80, i32 4, i32 0, !"float", !"u_cloudPackedBinDimInv", i32 88, i32 8, i32 0, !"half4", !"u_cloudNoiseTweaks", i32 96, i32 16, i32 0, !"float4", !"u_cloudVoxelScales", i32 112, i32 2, i32 0, !"half", !"u_cloudUndulationScale", i32 128, i32 16, i32 0, !"float3", !"u_eyePos"}
!16 = !{i32 4, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<half, sample>", !"air.arg_name", !"u_waterSim"}
!17 = !{i32 5, !"air.sampler", !"air.location_index", i32 0, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_waterSim"}
!18 = !{i32 6, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<float, sample>", !"air.arg_name", !"u_cloudDist"}
!19 = !{i32 7, !"air.sampler", !"air.location_index", i32 1, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudDist"}
!20 = !{i32 8, !"air.texture", !"air.location_index", i32 2, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<half, sample>", !"air.arg_name", !"u_cloudNoise3D"}
!21 = !{i32 9, !"air.sampler", !"air.location_index", i32 2, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudNoise3D"}
!22 = !{i32 10, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<float, sample>", !"air.arg_name", !"u_cloudSparse"}
!23 = !{i32 11, !"air.sampler", !"air.location_index", i32 3, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudSparse"}
!24 = !{i32 12, !"air.texture", !"air.location_index", i32 4, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"u_depthQuarterTex"}
!25 = !{i32 13, !"air.sampler", !"air.location_index", i32 4, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_depthQuarterTex"}
!26 = !{i32 14, !"air.texture", !"air.location_index", i32 5, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<half, sample>", !"air.arg_name", !"u_cloudCoarseTTex"}
!27 = !{i32 15, !"air.sampler", !"air.location_index", i32 5, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudCoarseTTex"}
!28 = !{float 2.500000e+00}
!29 = !{!30, !34, i64 112}
!30 = !{!"_ZTS20xlatMtlShaderUniform", !31, i64 0, !32, i64 16, !32, i64 32, !32, i64 48, !32, i64 64, !31, i64 80, !32, i64 88, !32, i64 96, !34, i64 112, !32, i64 128}
!31 = !{!"float", !32, i64 0}
!32 = !{!"omnipotent char", !33, i64 0}
!33 = !{!"Simple C++ TBAA"}
!34 = !{!"half", !32, i64 0}
!35 = !{!30, !31, i64 0}
!36 = !{!30, !31, i64 80}
