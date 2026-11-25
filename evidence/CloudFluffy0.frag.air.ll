; ModuleID = 'CloudFluffy0.frag.osx.metallib'
source_filename = "CloudFluffy0.frag.osx.metallib"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-macosx10.11.0"

%struct.xlatMtlShaderOutput = type { <4 x half>, <4 x half> }
%struct.xlatMtlShaderUniform = type <{ <3 x half>, <3 x half>, <3 x half>, <3 x half>, float, [12 x i8], <4 x float>, <3 x float>, <3 x float>, <3 x float>, <4 x half>, [8 x i8], <3 x float>, <3 x float>, float, [4 x i8], <4 x half>, <4 x float>, half, [14 x i8], <3 x float>, <2 x float>, [8 x i8], %"class.metal::matrix", <2 x float>, [8 x i8] }>
%"class.metal::matrix" = type { [4 x <4 x float>] }

@_ZL16_xlat_mtl_const3 = internal unnamed_addr addrspace(2) constant [5 x float] [float 1.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00], align 4
@_ZL16_xlat_mtl_const2 = internal unnamed_addr addrspace(2) constant [5 x float] [float 3.125000e-01, float 6.250000e-01, float 1.250000e+00, float 2.500000e+00, float 5.000000e+00], align 4
@_ZL16_xlat_mtl_const1 = internal unnamed_addr addrspace(2) constant [5 x float] [float 3.125000e-01, float 6.250000e-01, float 1.250000e+00, float 2.500000e+00, float 5.000000e+00], align 4

; Function Attrs: noduplicate nounwind
define %struct.xlatMtlShaderOutput @fsMain(<4 x float> %0, <4 x float> %1, <4 x float> %2, <4 x float> %3, ptr addrspace(2) readonly %4, ptr addrspace(1) %5, ptr addrspace(2) readonly captures(none) %6, ptr addrspace(1) %7, ptr addrspace(2) readonly captures(none) %8, ptr addrspace(1) %9, ptr addrspace(2) readonly captures(none) %10, ptr addrspace(1) %11, ptr addrspace(2) readonly captures(none) %12, ptr addrspace(1) %13, ptr addrspace(2) readonly captures(none) %14, ptr addrspace(1) %15, ptr addrspace(2) readonly captures(none) %16, ptr addrspace(1) %17, ptr addrspace(2) readonly captures(none) %18, ptr addrspace(1) %19, ptr addrspace(2) readonly captures(none) %20, ptr addrspace(1) %21, ptr addrspace(2) readonly captures(none) %22, ptr addrspace(1) %23, ptr addrspace(2) readonly captures(none) %24) #0 {
  %26 = shufflevector <4 x float> %2, <4 x float> %3, <2 x i32> <i32 3, i32 7>
  %27 = shufflevector <4 x float> %1, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %28 = tail call float @air.dot.v3f32(<3 x float> %27, <3 x float> %27) #4
  %29 = tail call float @air.fast_rsqrt.f32(float %28) #1
  %30 = insertelement <3 x float> undef, float %29, i32 0
  %31 = shufflevector <3 x float> %30, <3 x float> undef, <3 x i32> zeroinitializer
  %32 = fmul fast <3 x float> %31, %27
  %33 = fdiv fast <3 x float> splat (float 1.000000e+00), %32, !fpmath !38
  %34 = shufflevector <4 x float> %2, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %35 = fmul fast <3 x float> %33, %34
  %36 = shufflevector <4 x float> %3, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %37 = fmul fast <3 x float> %33, %36
  %38 = tail call <3 x float> @air.fast_fmin.v3f32(<3 x float> %35, <3 x float> %37) #4
  %39 = tail call <3 x float> @air.fast_fmax.v3f32(<3 x float> %35, <3 x float> %37) #4
  %40 = extractelement <3 x float> %39, i32 0
  %41 = extractelement <3 x float> %39, i32 1
  %42 = extractelement <3 x float> %39, i32 2
  %43 = tail call float @air.fast_fmin.f32(float %41, float %42) #4
  %44 = tail call float @air.fast_fmin.f32(float %40, float %43) #4
  %45 = tail call float @air.fast_fmax.f32(float 0.000000e+00, float %44) #4
  %46 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %23, ptr addrspace(2) captures(none) %24, <2 x float> %26, i1 true, <2 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %47 = extractelement <4 x half> %46, i32 0
  %48 = fpext half %47 to float
  %49 = extractelement <3 x float> %38, i32 0
  %50 = tail call float @air.fast_fmax.f32(float 0.000000e+00, float %49) #4
  %51 = extractelement <3 x float> %38, i32 1
  %52 = extractelement <3 x float> %38, i32 2
  %53 = tail call float @air.fast_fmax.f32(float %51, float %52) #4
  %54 = tail call float @air.fast_fmax.f32(float %53, float %48) #4
  %55 = tail call float @air.fast_fmax.f32(float %50, float %54) #4
  %56 = shufflevector <4 x float> %0, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %57 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 21
  %58 = load <2 x float>, ptr addrspace(2) %57, align 16, !tbaa !39
  %59 = fdiv fast <2 x float> %56, %58, !fpmath !38
  %60 = tail call <4 x float> @air.sample_texture_2d.v4f32(ptr addrspace(1) captures(none) %21, ptr addrspace(2) captures(none) %22, <2 x float> %59, i1 true, <2 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %61 = extractelement <4 x float> %60, i32 3
  %62 = fcmp olt float %61, 0.000000e+00
  %63 = tail call float @air.fabs.f32(float %61) #1
  %64 = fmul fast float %63, 1.000000e+01
  %65 = tail call float @air.fast_fmin.f32(float 2.560000e+05, float %64) #4
  %66 = fdiv fast float %65, %29
  %67 = select i1 %62, float 2.560000e+05, float %66
  br i1 %62, label %71, label %68

68:                                               ; preds = %25
  %69 = fadd fast float %67, 2.500000e+00
  %70 = tail call float @air.fast_fmin.f32(float %45, float %69) #4
  br label %71

71:                                               ; preds = %68, %25
  %72 = phi float [ %70, %68 ], [ %45, %25 ]
  %73 = fcmp ult float %55, %72
  %74 = fcmp ult float %55, %45
  %75 = and i1 %74, %73
  br i1 %75, label %76, label %1094

76:                                               ; preds = %71
  %77 = fdiv fast <2 x float> %56, splat (float 2.560000e+02), !fpmath !38
  %78 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 7
  %79 = load <3 x float>, ptr addrspace(2) %78, align 16
  %80 = shufflevector <3 x float> %79, <3 x float> undef, <2 x i32> <i32 0, i32 1>
  %81 = fadd fast <2 x float> %80, %77
  %82 = shufflevector <2 x float> %81, <2 x float> undef, <2 x i32> <i32 1, i32 0>
  %83 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %19, ptr addrspace(2) captures(none) %20, <2 x float> %82, i1 true, <2 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %84 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 16
  %85 = extractelement <4 x half> %83, i32 0
  %86 = fpext half %85 to float
  %87 = fsub fast float 1.000000e+00, %86
  %88 = fmul fast float %87, 0x3FECCCCCC0000000
  %89 = fadd fast float %88, 0x3FB99999A0000000
  %90 = load <4 x half>, ptr addrspace(2) %84, align 8
  %91 = extractelement <4 x half> %90, i32 2
  %92 = fpext half %91 to float
  %93 = fmul fast float %89, %92
  %94 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 20
  %95 = bitcast ptr addrspace(2) %94 to ptr addrspace(2)
  %96 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 18
  %97 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 4
  %98 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 17
  %99 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 12
  %100 = bitcast ptr addrspace(2) %99 to ptr addrspace(2)
  %101 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 13
  %102 = bitcast ptr addrspace(2) %101 to ptr addrspace(2)
  %103 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 6
  %104 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 9
  %105 = bitcast ptr addrspace(2) %104 to ptr addrspace(2)
  %106 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 14
  br label %107

107:                                              ; preds = %269, %76
  %108 = phi float [ %72, %76 ], [ %262, %269 ]
  %109 = phi float [ %93, %76 ], [ %261, %269 ]
  %110 = phi float [ %72, %76 ], [ %260, %269 ]
  %111 = phi float [ %55, %76 ], [ %270, %269 ]
  %112 = load <4 x float>, ptr addrspace(2) %95, align 16
  %113 = shufflevector <4 x float> %112, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %114 = insertelement <3 x float> undef, float %111, i32 0
  %115 = shufflevector <3 x float> %114, <3 x float> undef, <3 x i32> zeroinitializer
  %116 = fmul fast <3 x float> %115, %32
  %117 = fadd fast <3 x float> %113, %116
  %118 = shufflevector <3 x float> %117, <3 x float> undef, <2 x i32> <i32 0, i32 2>
  %119 = extractelement <3 x float> %117, i32 1
  %120 = load half, ptr addrspace(2) %96, align 16, !tbaa !46
  %121 = fpext half %120 to float
  %122 = load float, ptr addrspace(2) %97, align 16, !tbaa !47
  %123 = fmul fast float %122, 0x3FB7DF3B60000000
  %124 = extractelement <3 x float> %117, i32 0
  %125 = fmul fast float %124, 0x3FC99999A0000000
  %126 = fadd fast float %125, %119
  %127 = fmul fast float %126, 0x3FC0A3D700000000
  %128 = fadd fast float %127, %123
  %129 = tail call float @air.fast_sin.f32(float %128) #1
  %130 = fmul fast float %129, 2.500000e-01
  %131 = fmul fast float %122, 0x3FC7DF3B60000000
  %132 = extractelement <3 x float> %117, i32 2
  %133 = fmul fast float %119, 0x3FC99999A0000000
  %134 = fsub fast float %133, %132
  %135 = fmul fast float %134, 0x3FB0A3D700000000
  %136 = fadd fast float %135, %131
  %137 = tail call float @air.fast_sin.f32(float %136) #1
  %138 = fmul fast float %137, 5.000000e-01
  %139 = fmul fast float %122, 0x3FD7DF3B60000000
  %140 = fmul fast float %132, 0x3FC99999A0000000
  %141 = fsub fast float %140, %124
  %142 = fmul fast float %141, 0x3FA0A3D700000000
  %143 = fadd fast float %142, %139
  %144 = tail call float @air.fast_sin.f32(float %143) #1
  %145 = fadd fast float %130, -1.000000e+00
  %146 = fadd fast float %145, %138
  %147 = fadd fast float %146, %144
  %148 = fmul fast float %121, 2.000000e+00
  %149 = fmul fast float %148, %147
  %150 = fadd fast float %149, %119
  %151 = insertelement <3 x float> %117, float %150, i32 1
  %152 = load <4 x float>, ptr addrspace(2) %98, align 16
  %153 = extractelement <4 x float> %152, i32 0
  %154 = fmul fast float %153, 5.000000e-01
  %155 = insertelement <3 x float> undef, float %154, i32 0
  %156 = shufflevector <3 x float> %155, <3 x float> undef, <3 x i32> zeroinitializer
  %157 = fsub fast <3 x float> %151, %156
  %158 = load <4 x float>, ptr addrspace(2) %100, align 16
  %159 = shufflevector <4 x float> %158, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %160 = fsub fast <3 x float> %157, %159
  %161 = fdiv fast <3 x float> %160, splat (float 1.600000e+01), !fpmath !38
  %162 = tail call <3 x float> @air.fast_floor.v3f32(<3 x float> %161) #1
  %163 = fadd fast <3 x float> %162, splat (float 5.000000e-01)
  %164 = load <4 x float>, ptr addrspace(2) %102, align 16
  %165 = shufflevector <4 x float> %164, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %166 = fdiv fast <3 x float> splat (float 1.600000e+01), %165, !fpmath !38
  %167 = fmul fast <3 x float> %166, %163
  %168 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %17, ptr addrspace(2) captures(none) %18, <3 x float> %167, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %169 = extractelement <4 x float> %168, i32 0
  %170 = fcmp oeq float %169, 1.000000e+00
  br i1 %170, label %171, label %175

171:                                              ; preds = %107
  %172 = extractelement <4 x float> %168, i32 2
  %173 = fmul fast float %172, 1.100000e+02
  %174 = fadd fast float %173, -1.000000e+01
  br label %214

175:                                              ; preds = %107
  %176 = extractelement <4 x float> %152, i32 2
  %177 = fmul fast float %176, 5.000000e-01
  %178 = insertelement <3 x float> undef, float %177, i32 0
  %179 = shufflevector <3 x float> %178, <3 x float> undef, <3 x i32> zeroinitializer
  %180 = fsub fast float 1.000000e+00, %176
  %181 = insertelement <3 x float> undef, float %180, i32 0
  %182 = shufflevector <3 x float> %181, <3 x float> undef, <3 x i32> zeroinitializer
  %183 = fsub fast <3 x float> %161, %162
  %184 = fmul fast <3 x float> %183, %182
  %185 = fadd fast <3 x float> %184, %179
  %186 = load float, ptr addrspace(2) %106, align 16, !tbaa !48
  %187 = insertelement <2 x float> undef, float %186, i32 0
  %188 = shufflevector <2 x float> %187, <2 x float> undef, <2 x i32> zeroinitializer
  %189 = shufflevector <4 x float> %168, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %190 = fmul fast <2 x float> %189, splat (float 2.550000e+02)
  %191 = shufflevector <3 x float> %185, <3 x float> undef, <2 x i32> <i32 0, i32 1>
  %192 = fadd fast <2 x float> %191, %190
  %193 = fmul fast <2 x float> %188, %192
  %194 = shufflevector <2 x float> %193, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 poison>
  %195 = shufflevector <3 x float> %194, <3 x float> %185, <3 x i32> <i32 0, i32 1, i32 5>
  %196 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %7, ptr addrspace(2) captures(none) %8, <3 x float> %195, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %197 = extractelement <4 x float> %196, i32 0
  %198 = fmul fast float %197, 1.000000e+01
  %199 = fadd fast float %198, -6.000000e+00
  %200 = fmul fast half %120, 0xH34CD
  %201 = fpext half %200 to float
  %202 = fmul fast float %122, 0x3FF5A1CAC0000000
  %203 = extractelement <3 x float> %157, i32 1
  %204 = fmul fast float %203, 0x3FC99999A0000000
  %205 = fadd fast float %204, %202
  %206 = tail call float @air.fast_sin.f32(float %205) #1
  %207 = fmul fast float %206, %201
  %208 = fsub fast float %199, %207
  %209 = load <4 x half>, ptr addrspace(2) %84, align 8
  %210 = extractelement <4 x half> %209, i32 1
  %211 = fpext half %210 to float
  %212 = fsub fast float %211, %111
  %213 = tail call float @air.fast_fmax.f32(float %208, float %212) #4
  br label %214

214:                                              ; preds = %175, %171
  %215 = phi float [ %174, %171 ], [ %213, %175 ]
  %216 = fptrunc float %215 to half
  %217 = load <4 x float>, ptr addrspace(2) %103, align 16
  %218 = shufflevector <4 x float> %217, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %219 = fsub fast <2 x float> %118, %218
  %220 = shufflevector <4 x float> %217, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %221 = fmul fast <2 x float> %219, %220
  %222 = fcmp olt <2 x float> %221, zeroinitializer
  %223 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %222) #4
  br i1 %223, label %232, label %224

224:                                              ; preds = %214
  %225 = fcmp ogt <2 x float> %221, splat (float 1.000000e+00)
  %226 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %225) #4
  br i1 %226, label %232, label %227

227:                                              ; preds = %224
  %228 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %5, ptr addrspace(2) captures(none) %6, <2 x float> %221, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00) #3
  %229 = extractelement <4 x half> %228, i32 1
  %230 = fmul fast half %229, 0xH4400
  %231 = tail call half @air.clamp.f16(half %230, half 0xHBC00, half 0xH0000) #4
  br label %232

232:                                              ; preds = %227, %224, %214
  %233 = phi half [ %231, %227 ], [ 0xH0000, %214 ], [ 0xH0000, %224 ]
  %234 = load <4 x float>, ptr addrspace(2) %105, align 16
  %235 = shufflevector <4 x float> %234, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %236 = fsub fast <3 x float> %117, %235
  %237 = fmul fast <3 x float> %236, splat (float 4.687500e-02)
  %238 = load <4 x half>, ptr addrspace(2) %84, align 8
  %239 = extractelement <4 x half> %238, i32 0
  %240 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %15, ptr addrspace(2) captures(none) %16, <3 x float> %237, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %241 = extractelement <4 x half> %240, i32 0
  %242 = fadd fast half %233, 0xH3C00
  %243 = fmul fast half %239, %242
  %244 = fmul fast half %243, %241
  %245 = fsub fast half %216, %244
  %246 = fsub fast half %245, %233
  %247 = fpext half %246 to float
  %248 = fcmp ugt half %246, 0xH0000
  br i1 %248, label %258, label %249

249:                                              ; preds = %232
  %250 = fadd fast float %247, %111
  %251 = tail call float @air.fast_fmin.f32(float %108, float %250) #4
  %252 = fadd fast float %247, %109
  %253 = fadd fast float %252, %111
  %254 = fcmp ole float %252, 0.000000e+00
  %255 = fcmp ogt float %253, 1.000000e+02
  %256 = or i1 %254, %255
  %257 = select i1 %256, float %253, float %110
  br label %258

258:                                              ; preds = %249, %232
  %259 = phi float [ %111, %232 ], [ %253, %249 ]
  %260 = phi float [ %110, %232 ], [ %257, %249 ]
  %261 = phi float [ %109, %232 ], [ %252, %249 ]
  %262 = phi float [ %108, %232 ], [ %251, %249 ]
  %263 = fcmp ogt half %246, 0xH0000
  br i1 %263, label %264, label %269

264:                                              ; preds = %258
  %265 = fmul fast float %259, 0x3F847AE140000000
  %266 = tail call float @air.fast_clamp.f32(float %265, float 0x3FB99999A0000000, float 1.000000e+00) #4
  %267 = tail call float @air.fast_fmax.f32(float %266, float %247) #4
  %268 = fadd fast float %267, %259
  br label %269

269:                                              ; preds = %264, %258
  %270 = phi float [ %268, %264 ], [ %259, %258 ]
  %271 = fcmp ult float %270, %260
  br i1 %271, label %107, label %272

272:                                              ; preds = %269
  %273 = fcmp une float %262, %260
  %274 = fcmp ult float %262, %67
  %275 = and i1 %273, %274
  br i1 %275, label %276, label %1094

276:                                              ; preds = %272
  %277 = fcmp ogt half %246, 0xH0000
  %278 = select i1 %277, float %67, float %260
  %279 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 20
  %280 = bitcast ptr addrspace(2) %279 to ptr addrspace(2)
  %281 = load <4 x float>, ptr addrspace(2) %280, align 16
  %282 = shufflevector <4 x float> %281, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %283 = insertelement <3 x float> undef, float %262, i32 0
  %284 = shufflevector <3 x float> %283, <3 x float> undef, <3 x i32> zeroinitializer
  %285 = fmul fast <3 x float> %284, %32
  %286 = fadd fast <3 x float> %282, %285
  %287 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 8
  %288 = bitcast ptr addrspace(2) %287 to ptr addrspace(2)
  %289 = load <4 x float>, ptr addrspace(2) %288, align 16
  %290 = shufflevector <4 x float> %289, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %291 = fsub fast <3 x float> %286, %290
  %292 = shufflevector <3 x float> %291, <3 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %293 = shufflevector <4 x float> <float undef, float undef, float undef, float 1.000000e+00>, <4 x float> %292, <4 x i32> <i32 4, i32 5, i32 6, i32 3>
  %294 = shufflevector <3 x float> %291, <3 x float> undef, <4 x i32> zeroinitializer
  %295 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 23, i32 0, i64 0
  %296 = load <4 x float>, ptr addrspace(2) %295, align 16, !tbaa !49
  %297 = fmul fast <4 x float> %294, %296
  br label %298

298:                                              ; preds = %298, %276
  %299 = phi i32 [ 1, %276 ], [ %309, %298 ]
  %300 = phi <4 x float> [ %297, %276 ], [ %308, %298 ]
  %301 = extractelement <4 x float> %293, i32 %299
  %302 = insertelement <4 x float> undef, float %301, i32 0
  %303 = shufflevector <4 x float> %302, <4 x float> undef, <4 x i32> zeroinitializer
  %304 = sext i32 %299 to i64
  %305 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 23, i32 0, i64 %304
  %306 = load <4 x float>, ptr addrspace(2) %305, align 16, !tbaa !49
  %307 = fmul fast <4 x float> %306, %303
  %308 = fadd fast <4 x float> %307, %300
  %309 = add nuw nsw i32 %299, 1
  %310 = icmp eq i32 %309, 4
  br i1 %310, label %311, label %298

311:                                              ; preds = %298
  %312 = fsub fast float -0.000000e+00, %278
  %313 = shufflevector <4 x float> %308, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %314 = shufflevector <4 x float> %308, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %315 = fdiv fast <2 x float> %313, %314, !fpmath !38
  %316 = fmul fast <2 x float> %315, splat (float -5.000000e-01)
  %317 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 24
  %318 = load <2 x float>, ptr addrspace(2) %317, align 16, !tbaa !50
  %319 = fadd fast <2 x float> %26, splat (float -5.000000e-01)
  %320 = fadd fast <2 x float> %319, %316
  %321 = fsub fast <2 x float> %320, %318
  %322 = fcmp ugt half %246, 0xH0000
  br i1 %322, label %1077, label %323

323:                                              ; preds = %311
  %324 = insertelement <3 x float> undef, float %278, i32 0
  %325 = shufflevector <3 x float> %324, <3 x float> undef, <3 x i32> zeroinitializer
  %326 = fmul fast <3 x float> %325, %32
  %327 = fadd fast <3 x float> %282, %326
  %328 = extractelement <3 x float> %32, i32 0
  %329 = fptrunc float %328 to half
  %330 = insertelement <3 x half> undef, half %329, i32 0
  %331 = extractelement <3 x float> %32, i32 1
  %332 = fptrunc float %331 to half
  %333 = insertelement <3 x half> %330, half %332, i32 1
  %334 = extractelement <3 x float> %32, i32 2
  %335 = fptrunc float %334 to half
  %336 = insertelement <3 x half> %333, half %335, i32 2
  %337 = bitcast ptr addrspace(2) %4 to ptr addrspace(2)
  %338 = load <4 x half>, ptr addrspace(2) %337, align 16
  %339 = shufflevector <4 x half> %338, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %340 = fsub fast <3 x half> splat (half 0xH8000), %339
  %341 = tail call half @air.dot.v3f16(<3 x half> %336, <3 x half> %340) #4
  %342 = fpext half %341 to float
  %343 = shufflevector <3 x float> %327, <3 x float> undef, <2 x i32> <i32 0, i32 2>
  %344 = extractelement <3 x float> %327, i32 1
  %345 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 18
  %346 = load half, ptr addrspace(2) %345, align 16, !tbaa !46
  %347 = fpext half %346 to float
  %348 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 4
  %349 = load float, ptr addrspace(2) %348, align 16, !tbaa !47
  %350 = fmul fast float %349, 0x3FB7DF3B60000000
  %351 = extractelement <3 x float> %327, i32 0
  %352 = fmul fast float %351, 0x3FC99999A0000000
  %353 = fadd fast float %352, %344
  %354 = fmul fast float %353, 0x3FC0A3D700000000
  %355 = fadd fast float %354, %350
  %356 = tail call float @air.fast_sin.f32(float %355) #1
  %357 = fmul fast float %356, 2.500000e-01
  %358 = fmul fast float %349, 0x3FC7DF3B60000000
  %359 = extractelement <3 x float> %327, i32 2
  %360 = fmul fast float %344, 0x3FC99999A0000000
  %361 = fsub fast float %360, %359
  %362 = fmul fast float %361, 0x3FB0A3D700000000
  %363 = fadd fast float %362, %358
  %364 = tail call float @air.fast_sin.f32(float %363) #1
  %365 = fmul fast float %364, 5.000000e-01
  %366 = fmul fast float %349, 0x3FD7DF3B60000000
  %367 = fmul fast float %359, 0x3FC99999A0000000
  %368 = fsub fast float %367, %351
  %369 = fmul fast float %368, 0x3FA0A3D700000000
  %370 = fadd fast float %369, %366
  %371 = tail call float @air.fast_sin.f32(float %370) #1
  %372 = fadd fast float %357, -1.000000e+00
  %373 = fadd fast float %372, %365
  %374 = fadd fast float %373, %371
  %375 = fmul fast float %347, 2.000000e+00
  %376 = fmul fast float %375, %374
  %377 = fadd fast float %376, %344
  %378 = insertelement <3 x float> %327, float %377, i32 1
  %379 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 17
  %380 = load <4 x float>, ptr addrspace(2) %379, align 16
  %381 = extractelement <4 x float> %380, i32 0
  %382 = fmul fast float %381, 5.000000e-01
  %383 = insertelement <3 x float> undef, float %382, i32 0
  %384 = shufflevector <3 x float> %383, <3 x float> undef, <3 x i32> zeroinitializer
  %385 = fsub fast <3 x float> %378, %384
  %386 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 12
  %387 = bitcast ptr addrspace(2) %386 to ptr addrspace(2)
  %388 = load <4 x float>, ptr addrspace(2) %387, align 16
  %389 = shufflevector <4 x float> %388, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %390 = fsub fast <3 x float> %385, %389
  %391 = fdiv fast <3 x float> %390, splat (float 1.600000e+01), !fpmath !38
  %392 = tail call <3 x float> @air.fast_floor.v3f32(<3 x float> %391) #1
  %393 = fadd fast <3 x float> %392, splat (float 5.000000e-01)
  %394 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 13
  %395 = bitcast ptr addrspace(2) %394 to ptr addrspace(2)
  %396 = load <4 x float>, ptr addrspace(2) %395, align 16
  %397 = shufflevector <4 x float> %396, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %398 = fdiv fast <3 x float> splat (float 1.600000e+01), %397, !fpmath !38
  %399 = fmul fast <3 x float> %398, %393
  %400 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %17, ptr addrspace(2) captures(none) %18, <3 x float> %399, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %401 = extractelement <4 x float> %400, i32 0
  %402 = fcmp oeq float %401, 1.000000e+00
  br i1 %402, label %403, label %407

403:                                              ; preds = %323
  %404 = extractelement <4 x float> %400, i32 2
  %405 = fmul fast float %404, 1.100000e+02
  %406 = fadd fast float %405, -1.000000e+01
  br label %452

407:                                              ; preds = %323
  %408 = extractelement <4 x float> %380, i32 2
  %409 = fmul fast float %408, 5.000000e-01
  %410 = insertelement <3 x float> undef, float %409, i32 0
  %411 = shufflevector <3 x float> %410, <3 x float> undef, <3 x i32> zeroinitializer
  %412 = fsub fast float 1.000000e+00, %408
  %413 = insertelement <3 x float> undef, float %412, i32 0
  %414 = shufflevector <3 x float> %413, <3 x float> undef, <3 x i32> zeroinitializer
  %415 = fsub fast <3 x float> %391, %392
  %416 = fmul fast <3 x float> %415, %414
  %417 = fadd fast <3 x float> %416, %411
  %418 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 14
  %419 = load float, ptr addrspace(2) %418, align 16, !tbaa !48
  %420 = insertelement <2 x float> undef, float %419, i32 0
  %421 = shufflevector <2 x float> %420, <2 x float> undef, <2 x i32> zeroinitializer
  %422 = shufflevector <4 x float> %400, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %423 = fmul fast <2 x float> %422, splat (float 2.550000e+02)
  %424 = shufflevector <3 x float> %417, <3 x float> undef, <2 x i32> <i32 0, i32 1>
  %425 = fadd fast <2 x float> %424, %423
  %426 = fmul fast <2 x float> %421, %425
  %427 = shufflevector <2 x float> %426, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 poison>
  %428 = shufflevector <3 x float> %427, <3 x float> %417, <3 x i32> <i32 0, i32 1, i32 5>
  %429 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %7, ptr addrspace(2) captures(none) %8, <3 x float> %428, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %430 = extractelement <4 x float> %429, i32 0
  %431 = fmul fast float %430, 1.000000e+01
  %432 = fadd fast float %431, -6.000000e+00
  %433 = fmul fast half %346, 0xH34CD
  %434 = fpext half %433 to float
  %435 = fmul fast float %349, 0x3FF5A1CAC0000000
  %436 = extractelement <3 x float> %385, i32 1
  %437 = fmul fast float %436, 0x3FC99999A0000000
  %438 = fadd fast float %437, %435
  %439 = tail call float @air.fast_sin.f32(float %438) #1
  %440 = fmul fast float %439, %434
  %441 = fsub fast float %432, %440
  %442 = load <4 x half>, ptr addrspace(2) %84, align 8
  %443 = extractelement <4 x half> %442, i32 1
  %444 = fpext half %443 to float
  %445 = fsub fast float %444, %278
  %446 = tail call float @air.fast_fmax.f32(float %441, float %445) #4
  %447 = load half, ptr addrspace(2) %345, align 16, !tbaa !46
  %448 = load float, ptr addrspace(2) %348, align 16, !tbaa !47
  %449 = load <4 x float>, ptr addrspace(2) %379, align 16
  %450 = load <4 x float>, ptr addrspace(2) %387, align 16
  %451 = load <4 x float>, ptr addrspace(2) %395, align 16
  br label %452

452:                                              ; preds = %407, %403
  %453 = phi <4 x float> [ %396, %403 ], [ %451, %407 ]
  %454 = phi <4 x float> [ %388, %403 ], [ %450, %407 ]
  %455 = phi <4 x float> [ %380, %403 ], [ %449, %407 ]
  %456 = phi float [ %349, %403 ], [ %448, %407 ]
  %457 = phi half [ %346, %403 ], [ %447, %407 ]
  %458 = phi float [ %406, %403 ], [ %446, %407 ]
  %459 = fptrunc float %458 to half
  %460 = fpext half %329 to float
  %461 = insertelement <3 x float> undef, float %460, i32 0
  %462 = fpext half %332 to float
  %463 = insertelement <3 x float> %461, float %462, i32 1
  %464 = fpext half %335 to float
  %465 = insertelement <3 x float> %463, float %464, i32 2
  %466 = fadd fast <3 x float> %327, %465
  %467 = extractelement <3 x float> %466, i32 1
  %468 = fpext half %457 to float
  %469 = fmul fast float %456, 0x3FB7DF3B60000000
  %470 = extractelement <3 x float> %466, i32 0
  %471 = fmul fast float %470, 0x3FC99999A0000000
  %472 = fadd fast float %471, %467
  %473 = fmul fast float %472, 0x3FC0A3D700000000
  %474 = fadd fast float %469, %473
  %475 = tail call float @air.fast_sin.f32(float %474) #1
  %476 = fmul fast float %475, 2.500000e-01
  %477 = fmul fast float %456, 0x3FC7DF3B60000000
  %478 = extractelement <3 x float> %466, i32 2
  %479 = fmul fast float %467, 0x3FC99999A0000000
  %480 = fsub fast float %479, %478
  %481 = fmul fast float %480, 0x3FB0A3D700000000
  %482 = fadd fast float %477, %481
  %483 = tail call float @air.fast_sin.f32(float %482) #1
  %484 = fmul fast float %483, 5.000000e-01
  %485 = fmul fast float %456, 0x3FD7DF3B60000000
  %486 = fmul fast float %478, 0x3FC99999A0000000
  %487 = fsub fast float %486, %470
  %488 = fmul fast float %487, 0x3FA0A3D700000000
  %489 = fadd fast float %485, %488
  %490 = tail call float @air.fast_sin.f32(float %489) #1
  %491 = fadd fast float %476, -1.000000e+00
  %492 = fadd fast float %491, %484
  %493 = fadd fast float %492, %490
  %494 = fmul fast float %468, 2.000000e+00
  %495 = fmul fast float %494, %493
  %496 = fadd fast float %495, %467
  %497 = insertelement <3 x float> %466, float %496, i32 1
  %498 = extractelement <4 x float> %455, i32 0
  %499 = fmul fast float %498, 5.000000e-01
  %500 = insertelement <3 x float> undef, float %499, i32 0
  %501 = shufflevector <3 x float> %500, <3 x float> undef, <3 x i32> zeroinitializer
  %502 = fsub fast <3 x float> %497, %501
  %503 = shufflevector <4 x float> %454, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %504 = fsub fast <3 x float> %502, %503
  %505 = fdiv fast <3 x float> %504, splat (float 1.600000e+01), !fpmath !38
  %506 = tail call <3 x float> @air.fast_floor.v3f32(<3 x float> %505) #1
  %507 = fadd fast <3 x float> %506, splat (float 5.000000e-01)
  %508 = shufflevector <4 x float> %453, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %509 = fdiv fast <3 x float> splat (float 1.600000e+01), %508, !fpmath !38
  %510 = fmul fast <3 x float> %509, %507
  %511 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %17, ptr addrspace(2) captures(none) %18, <3 x float> %510, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %512 = extractelement <4 x float> %511, i32 0
  %513 = fcmp oeq float %512, 1.000000e+00
  br i1 %513, label %514, label %519

514:                                              ; preds = %452
  %515 = extractelement <4 x float> %511, i32 2
  %516 = fmul fast float %515, 1.100000e+02
  %517 = fadd fast float %516, -1.000000e+01
  %518 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 14
  br label %560

519:                                              ; preds = %452
  %520 = extractelement <4 x float> %455, i32 2
  %521 = fmul fast float %520, 5.000000e-01
  %522 = insertelement <3 x float> undef, float %521, i32 0
  %523 = shufflevector <3 x float> %522, <3 x float> undef, <3 x i32> zeroinitializer
  %524 = fsub fast float 1.000000e+00, %520
  %525 = insertelement <3 x float> undef, float %524, i32 0
  %526 = shufflevector <3 x float> %525, <3 x float> undef, <3 x i32> zeroinitializer
  %527 = fsub fast <3 x float> %505, %506
  %528 = fmul fast <3 x float> %527, %526
  %529 = fadd fast <3 x float> %528, %523
  %530 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 14
  %531 = load float, ptr addrspace(2) %530, align 16, !tbaa !48
  %532 = insertelement <2 x float> undef, float %531, i32 0
  %533 = shufflevector <2 x float> %532, <2 x float> undef, <2 x i32> zeroinitializer
  %534 = shufflevector <4 x float> %511, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %535 = fmul fast <2 x float> %534, splat (float 2.550000e+02)
  %536 = shufflevector <3 x float> %529, <3 x float> undef, <2 x i32> <i32 0, i32 1>
  %537 = fadd fast <2 x float> %536, %535
  %538 = fmul fast <2 x float> %533, %537
  %539 = shufflevector <2 x float> %538, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 poison>
  %540 = shufflevector <3 x float> %539, <3 x float> %529, <3 x i32> <i32 0, i32 1, i32 5>
  %541 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %7, ptr addrspace(2) captures(none) %8, <3 x float> %540, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %542 = extractelement <4 x float> %541, i32 0
  %543 = fmul fast float %542, 1.000000e+01
  %544 = fadd fast float %543, -6.000000e+00
  %545 = fmul fast half %457, 0xH34CD
  %546 = fpext half %545 to float
  %547 = fmul fast float %456, 0x3FF5A1CAC0000000
  %548 = extractelement <3 x float> %502, i32 1
  %549 = fmul fast float %548, 0x3FC99999A0000000
  %550 = fadd fast float %549, %547
  %551 = tail call float @air.fast_sin.f32(float %550) #1
  %552 = fmul fast float %551, %546
  %553 = fsub fast float %544, %552
  %554 = load <4 x half>, ptr addrspace(2) %84, align 8
  %555 = extractelement <4 x half> %554, i32 1
  %556 = fpext half %555 to float
  %557 = fsub fast float -1.000000e+00, %278
  %558 = fadd fast float %557, %556
  %559 = tail call float @air.fast_fmax.f32(float %553, float %558) #4
  br label %560

560:                                              ; preds = %519, %514
  %561 = phi ptr addrspace(2) [ %530, %519 ], [ %518, %514 ]
  %562 = phi float [ %559, %519 ], [ %517, %514 ]
  %563 = fptrunc float %562 to half
  %564 = fmul fast <3 x float> %465, splat (float 1.250000e-01)
  %565 = fadd fast <3 x float> %327, %564
  %566 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 9
  %567 = bitcast ptr addrspace(2) %566 to ptr addrspace(2)
  %568 = load <4 x float>, ptr addrspace(2) %567, align 16
  %569 = shufflevector <4 x float> %568, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %570 = fsub fast <3 x float> %565, %569
  %571 = fmul fast <3 x float> %570, splat (float 4.687500e-02)
  %572 = fpext half %459 to float
  %573 = fpext half %563 to float
  %574 = tail call float @air.mix.f32(float %572, float %573, float 1.250000e-01) #4
  %575 = fptrunc float %574 to half
  %576 = load <4 x half>, ptr addrspace(2) %84, align 8
  %577 = extractelement <4 x half> %576, i32 0
  %578 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %15, ptr addrspace(2) captures(none) %16, <3 x float> %571, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %579 = extractelement <4 x half> %578, i32 0
  %580 = fmul fast half %579, %577
  %581 = fsub fast half %580, %575
  %582 = tail call half @air.fmax.f16(half 0xH0000, half %581) #4
  %583 = fmul fast <3 x float> %465, splat (float 2.500000e-01)
  %584 = fadd fast <3 x float> %327, %583
  %585 = load <4 x float>, ptr addrspace(2) %567, align 16
  %586 = shufflevector <4 x float> %585, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %587 = fsub fast <3 x float> %584, %586
  %588 = fmul fast <3 x float> %587, splat (float 4.687500e-02)
  %589 = tail call float @air.mix.f32(float %572, float %573, float 2.500000e-01) #4
  %590 = fptrunc float %589 to half
  %591 = fpext half %582 to float
  %592 = load <4 x half>, ptr addrspace(2) %84, align 8
  %593 = extractelement <4 x half> %592, i32 0
  %594 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %15, ptr addrspace(2) captures(none) %16, <3 x float> %588, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %595 = extractelement <4 x half> %594, i32 0
  %596 = fmul fast half %595, %593
  %597 = fsub fast half %596, %590
  %598 = tail call half @air.fmax.f16(half 0xH0000, half %597) #4
  %599 = fpext half %598 to float
  %600 = fmul fast float %599, 2.000000e+00
  %601 = fadd fast float %600, %591
  %602 = fptrunc float %601 to half
  %603 = fmul fast <3 x float> %465, splat (float 5.000000e-01)
  %604 = fadd fast <3 x float> %327, %603
  %605 = load <4 x float>, ptr addrspace(2) %567, align 16
  %606 = shufflevector <4 x float> %605, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %607 = fsub fast <3 x float> %604, %606
  %608 = fmul fast <3 x float> %607, splat (float 4.687500e-02)
  %609 = tail call float @air.mix.f32(float %572, float %573, float 5.000000e-01) #4
  %610 = fptrunc float %609 to half
  %611 = fpext half %602 to float
  %612 = load <4 x half>, ptr addrspace(2) %84, align 8
  %613 = extractelement <4 x half> %612, i32 0
  %614 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %15, ptr addrspace(2) captures(none) %16, <3 x float> %608, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %615 = extractelement <4 x half> %614, i32 0
  %616 = fmul fast half %615, %613
  %617 = fsub fast half %616, %610
  %618 = tail call half @air.fmax.f16(half 0xH0000, half %617) #4
  %619 = fpext half %618 to float
  %620 = fmul fast float %619, 2.000000e+00
  %621 = fadd fast float %620, %611
  %622 = load <4 x float>, ptr addrspace(2) %567, align 16
  %623 = shufflevector <4 x float> %622, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %624 = fsub fast <3 x float> %466, %623
  %625 = fmul fast <3 x float> %624, splat (float 4.687500e-02)
  %626 = load <4 x half>, ptr addrspace(2) %84, align 8
  %627 = extractelement <4 x half> %626, i32 0
  %628 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %15, ptr addrspace(2) captures(none) %16, <3 x float> %625, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %629 = extractelement <4 x half> %628, i32 0
  %630 = fmul fast half %629, %627
  %631 = fsub fast half %630, %563
  %632 = tail call half @air.fmax.f16(half 0xH0000, half %631) #4
  %633 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 6
  %634 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 10
  br label %635

635:                                              ; preds = %773, %560
  %636 = phi i32 [ 0, %560 ], [ %802, %773 ]
  %637 = phi half [ 0xH0000, %560 ], [ %801, %773 ]
  %638 = sext i32 %636 to i64
  %639 = getelementptr inbounds [5 x float], ptr addrspace(2) @_ZL16_xlat_mtl_const1, i64 0, i64 %638
  %640 = load float, ptr addrspace(2) %639, align 4, !tbaa !51
  %641 = insertelement <3 x float> undef, float %640, i32 0
  %642 = shufflevector <3 x float> %641, <3 x float> undef, <3 x i32> zeroinitializer
  %643 = load <4 x half>, ptr addrspace(2) %337, align 16
  %644 = extractelement <4 x half> %643, i32 0
  %645 = fpext half %644 to float
  %646 = insertelement <3 x float> undef, float %645, i32 0
  %647 = extractelement <4 x half> %643, i32 1
  %648 = fpext half %647 to float
  %649 = insertelement <3 x float> %646, float %648, i32 1
  %650 = extractelement <4 x half> %643, i32 2
  %651 = fpext half %650 to float
  %652 = insertelement <3 x float> %649, float %651, i32 2
  %653 = fmul fast <3 x float> %652, %642
  %654 = fsub fast <3 x float> %327, %653
  %655 = shufflevector <3 x float> %654, <3 x float> undef, <2 x i32> <i32 0, i32 2>
  %656 = extractelement <3 x float> %654, i32 1
  %657 = load half, ptr addrspace(2) %345, align 16, !tbaa !46
  %658 = fpext half %657 to float
  %659 = load float, ptr addrspace(2) %348, align 16, !tbaa !47
  %660 = fmul fast float %659, 0x3FB7DF3B60000000
  %661 = extractelement <3 x float> %654, i32 0
  %662 = fmul fast float %661, 0x3FC99999A0000000
  %663 = fadd fast float %662, %656
  %664 = fmul fast float %663, 0x3FC0A3D700000000
  %665 = fadd fast float %664, %660
  %666 = tail call float @air.fast_sin.f32(float %665) #1
  %667 = fmul fast float %666, 2.500000e-01
  %668 = fmul fast float %659, 0x3FC7DF3B60000000
  %669 = extractelement <3 x float> %654, i32 2
  %670 = fmul fast float %656, 0x3FC99999A0000000
  %671 = fsub fast float %670, %669
  %672 = fmul fast float %671, 0x3FB0A3D700000000
  %673 = fadd fast float %672, %668
  %674 = tail call float @air.fast_sin.f32(float %673) #1
  %675 = fmul fast float %674, 5.000000e-01
  %676 = fmul fast float %659, 0x3FD7DF3B60000000
  %677 = fmul fast float %669, 0x3FC99999A0000000
  %678 = fsub fast float %677, %661
  %679 = fmul fast float %678, 0x3FA0A3D700000000
  %680 = fadd fast float %679, %676
  %681 = tail call float @air.fast_sin.f32(float %680) #1
  %682 = fadd fast float %667, -1.000000e+00
  %683 = fadd fast float %682, %675
  %684 = fadd fast float %683, %681
  %685 = fmul fast float %658, 2.000000e+00
  %686 = fmul fast float %685, %684
  %687 = fadd fast float %686, %656
  %688 = insertelement <3 x float> %654, float %687, i32 1
  %689 = load <4 x float>, ptr addrspace(2) %379, align 16
  %690 = extractelement <4 x float> %689, i32 0
  %691 = fmul fast float %690, 5.000000e-01
  %692 = insertelement <3 x float> undef, float %691, i32 0
  %693 = shufflevector <3 x float> %692, <3 x float> undef, <3 x i32> zeroinitializer
  %694 = fsub fast <3 x float> %688, %693
  %695 = load <4 x float>, ptr addrspace(2) %387, align 16
  %696 = shufflevector <4 x float> %695, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %697 = fsub fast <3 x float> %694, %696
  %698 = fdiv fast <3 x float> %697, splat (float 1.600000e+01), !fpmath !38
  %699 = tail call <3 x float> @air.fast_floor.v3f32(<3 x float> %698) #1
  %700 = fadd fast <3 x float> %699, splat (float 5.000000e-01)
  %701 = load <4 x float>, ptr addrspace(2) %395, align 16
  %702 = shufflevector <4 x float> %701, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %703 = fdiv fast <3 x float> splat (float 1.600000e+01), %702, !fpmath !38
  %704 = fmul fast <3 x float> %703, %700
  %705 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %17, ptr addrspace(2) captures(none) %18, <3 x float> %704, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %706 = extractelement <4 x float> %705, i32 0
  %707 = fcmp oeq float %706, 1.000000e+00
  br i1 %707, label %708, label %712

708:                                              ; preds = %635
  %709 = extractelement <4 x float> %705, i32 2
  %710 = fmul fast float %709, 1.100000e+02
  %711 = fadd fast float %710, -1.000000e+01
  br label %755

712:                                              ; preds = %635
  %713 = getelementptr inbounds [5 x float], ptr addrspace(2) @_ZL16_xlat_mtl_const2, i64 0, i64 %638
  %714 = load float, ptr addrspace(2) %713, align 4, !tbaa !51
  %715 = fmul fast float %714, %342
  %716 = extractelement <4 x float> %689, i32 2
  %717 = fmul fast float %716, 5.000000e-01
  %718 = insertelement <3 x float> undef, float %717, i32 0
  %719 = shufflevector <3 x float> %718, <3 x float> undef, <3 x i32> zeroinitializer
  %720 = fsub fast float 1.000000e+00, %716
  %721 = insertelement <3 x float> undef, float %720, i32 0
  %722 = shufflevector <3 x float> %721, <3 x float> undef, <3 x i32> zeroinitializer
  %723 = fsub fast <3 x float> %698, %699
  %724 = fmul fast <3 x float> %723, %722
  %725 = fadd fast <3 x float> %724, %719
  %726 = load float, ptr addrspace(2) %561, align 16, !tbaa !48
  %727 = insertelement <2 x float> undef, float %726, i32 0
  %728 = shufflevector <2 x float> %727, <2 x float> undef, <2 x i32> zeroinitializer
  %729 = shufflevector <4 x float> %705, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %730 = fmul fast <2 x float> %729, splat (float 2.550000e+02)
  %731 = shufflevector <3 x float> %725, <3 x float> undef, <2 x i32> <i32 0, i32 1>
  %732 = fadd fast <2 x float> %731, %730
  %733 = fmul fast <2 x float> %728, %732
  %734 = shufflevector <2 x float> %733, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 poison>
  %735 = shufflevector <3 x float> %734, <3 x float> %725, <3 x i32> <i32 0, i32 1, i32 5>
  %736 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %7, ptr addrspace(2) captures(none) %8, <3 x float> %735, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %737 = extractelement <4 x float> %736, i32 0
  %738 = fmul fast float %737, 1.000000e+01
  %739 = fadd fast float %738, -6.000000e+00
  %740 = fmul fast half %657, 0xH34CD
  %741 = fpext half %740 to float
  %742 = fmul fast float %659, 0x3FF5A1CAC0000000
  %743 = extractelement <3 x float> %694, i32 1
  %744 = fmul fast float %743, 0x3FC99999A0000000
  %745 = fadd fast float %744, %742
  %746 = tail call float @air.fast_sin.f32(float %745) #1
  %747 = fmul fast float %746, %741
  %748 = fsub fast float %739, %747
  %749 = load <4 x half>, ptr addrspace(2) %84, align 8
  %750 = extractelement <4 x half> %749, i32 1
  %751 = fpext half %750 to float
  %752 = fsub fast float %312, %715
  %753 = fadd fast float %752, %751
  %754 = tail call float @air.fast_fmax.f32(float %748, float %753) #4
  br label %755

755:                                              ; preds = %712, %708
  %756 = phi float [ %711, %708 ], [ %754, %712 ]
  %757 = fptrunc float %756 to half
  %758 = load <4 x float>, ptr addrspace(2) %633, align 16
  %759 = shufflevector <4 x float> %758, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %760 = fsub fast <2 x float> %655, %759
  %761 = shufflevector <4 x float> %758, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %762 = fmul fast <2 x float> %760, %761
  %763 = fcmp olt <2 x float> %762, zeroinitializer
  %764 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %763) #4
  br i1 %764, label %773, label %765

765:                                              ; preds = %755
  %766 = fcmp ogt <2 x float> %762, splat (float 1.000000e+00)
  %767 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %766) #4
  br i1 %767, label %773, label %768

768:                                              ; preds = %765
  %769 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %5, ptr addrspace(2) captures(none) %6, <2 x float> %762, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00) #3
  %770 = extractelement <4 x half> %769, i32 1
  %771 = fmul fast half %770, 0xH4400
  %772 = tail call half @air.clamp.f16(half %771, half 0xHBC00, half 0xH0000) #4
  br label %773

773:                                              ; preds = %768, %765, %755
  %774 = phi half [ %772, %768 ], [ 0xH0000, %755 ], [ 0xH0000, %765 ]
  %775 = load <4 x float>, ptr addrspace(2) %567, align 16
  %776 = shufflevector <4 x float> %775, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %777 = fsub fast <3 x float> %654, %776
  %778 = fmul fast <3 x float> %777, splat (float 4.687500e-02)
  %779 = load <4 x half>, ptr addrspace(2) %84, align 8
  %780 = extractelement <4 x half> %779, i32 0
  %781 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %15, ptr addrspace(2) captures(none) %16, <3 x float> %778, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %782 = extractelement <4 x half> %781, i32 0
  %783 = fadd fast half %774, 0xH3C00
  %784 = fmul fast half %780, %783
  %785 = fmul fast half %784, %782
  %786 = fsub fast half %757, %774
  %787 = fsub fast half %786, %785
  %788 = getelementptr inbounds [5 x float], ptr addrspace(2) @_ZL16_xlat_mtl_const3, i64 0, i64 %638
  %789 = load float, ptr addrspace(2) %788, align 4, !tbaa !51
  %790 = fmul fast float %789, 0x3FD6666660000000
  %791 = fpext half %787 to float
  %792 = fmul fast float %790, %791
  %793 = fsub fast float 0x3FA99999A0000000, %792
  %794 = tail call float @air.fast_fmax.f32(float 0.000000e+00, float %793) #4
  %795 = fpext half %637 to float
  %796 = load <4 x half>, ptr addrspace(2) %634, align 16
  %797 = extractelement <4 x half> %796, i32 3
  %798 = fpext half %797 to float
  %799 = fmul fast float %798, %794
  %800 = fadd fast float %799, %795
  %801 = fptrunc float %800 to half
  %802 = add nuw nsw i32 %636, 1
  %803 = icmp eq i32 %802, 5
  br i1 %803, label %804, label %635

804:                                              ; preds = %773
  %805 = fptrunc float %621 to half
  %806 = fadd fast half %805, %632
  %807 = load <4 x float>, ptr addrspace(2) %379, align 16
  %808 = extractelement <4 x float> %807, i32 0
  %809 = fmul fast float %808, 5.000000e-01
  %810 = insertelement <3 x float> undef, float %809, i32 0
  %811 = shufflevector <3 x float> %810, <3 x float> undef, <3 x i32> zeroinitializer
  %812 = load <4 x float>, ptr addrspace(2) %387, align 16
  %813 = shufflevector <4 x float> %812, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %814 = fsub fast <3 x float> %327, %813
  %815 = fsub fast <3 x float> %814, %811
  %816 = fdiv fast <3 x float> %815, splat (float 1.600000e+01), !fpmath !38
  %817 = tail call <3 x float> @air.fast_floor.v3f32(<3 x float> %816) #1
  %818 = fadd fast <3 x float> %817, splat (float 5.000000e-01)
  %819 = load <4 x float>, ptr addrspace(2) %395, align 16
  %820 = shufflevector <4 x float> %819, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %821 = fdiv fast <3 x float> splat (float 1.600000e+01), %820, !fpmath !38
  %822 = fmul fast <3 x float> %821, %818
  %823 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %17, ptr addrspace(2) captures(none) %18, <3 x float> %822, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %824 = extractelement <4 x float> %823, i32 0
  %825 = fcmp une float %824, 1.000000e+00
  br i1 %825, label %826, label %865

826:                                              ; preds = %804
  %827 = extractelement <4 x float> %807, i32 3
  %828 = fmul fast float %827, 5.000000e-01
  %829 = insertelement <3 x float> undef, float %828, i32 0
  %830 = shufflevector <3 x float> %829, <3 x float> undef, <3 x i32> zeroinitializer
  %831 = fsub fast float 1.000000e+00, %827
  %832 = insertelement <3 x float> undef, float %831, i32 0
  %833 = shufflevector <3 x float> %832, <3 x float> undef, <3 x i32> zeroinitializer
  %834 = fsub fast <3 x float> %816, %817
  %835 = fmul fast <3 x float> %834, %833
  %836 = fadd fast <3 x float> %835, %830
  %837 = load float, ptr addrspace(2) %561, align 16, !tbaa !48
  %838 = insertelement <2 x float> undef, float %837, i32 0
  %839 = shufflevector <2 x float> %838, <2 x float> undef, <2 x i32> zeroinitializer
  %840 = shufflevector <4 x float> %823, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %841 = fmul fast <2 x float> %840, splat (float 2.550000e+02)
  %842 = shufflevector <3 x float> %836, <3 x float> undef, <2 x i32> <i32 0, i32 1>
  %843 = fadd fast <2 x float> %842, %841
  %844 = fmul fast <2 x float> %839, %843
  %845 = shufflevector <2 x float> %844, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 poison>
  %846 = shufflevector <3 x float> %845, <3 x float> %836, <3 x i32> <i32 0, i32 1, i32 5>
  %847 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %13, ptr addrspace(2) captures(none) %14, <3 x float> %846, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %848 = extractelement <4 x half> %847, i32 0
  %849 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %9, ptr addrspace(2) captures(none) %10, <3 x float> %846, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %850 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %11, ptr addrspace(2) captures(none) %12, <3 x float> %846, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %851 = extractelement <4 x half> %850, i32 1
  %852 = fmul fast half %851, %851
  %853 = fmul fast <4 x half> %849, %849
  %854 = shufflevector <4 x half> %853, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %855 = shufflevector <4 x half> %849, <4 x half> undef, <3 x i32> <i32 3, i32 3, i32 3>
  %856 = fdiv fast <3 x half> %854, %855
  %857 = shufflevector <3 x half> %856, <3 x half> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %858 = extractelement <4 x half> %850, i32 0
  %859 = extractelement <4 x half> %850, i32 3
  %860 = extractelement <4 x half> %850, i32 2
  %861 = fmul fast half %860, 0xH5BF8
  %862 = fadd fast half %861, 0xHD800
  %863 = tail call half @air.exp2.f16(half %862) #1
  %864 = fmul fast half %859, %863
  br label %865

865:                                              ; preds = %826, %804
  %866 = phi <4 x half> [ %857, %826 ], [ <half 0xH3C00, half 0xH3C00, half 0xH3C00, half undef>, %804 ]
  %867 = phi half [ %858, %826 ], [ 0xH3C00, %804 ]
  %868 = phi half [ %852, %826 ], [ 0xH3C00, %804 ]
  %869 = phi half [ %864, %826 ], [ 0xH0000, %804 ]
  %870 = phi half [ %848, %826 ], [ 0xH3C00, %804 ]
  %871 = shufflevector <4 x half> %866, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %872 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 2
  %873 = bitcast ptr addrspace(2) %872 to ptr addrspace(2)
  %874 = load <4 x half>, ptr addrspace(2) %873, align 16
  %875 = shufflevector <4 x half> %874, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %876 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 1
  %877 = bitcast ptr addrspace(2) %876 to ptr addrspace(2)
  %878 = load <4 x half>, ptr addrspace(2) %877, align 8
  %879 = shufflevector <4 x half> %878, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %880 = insertelement <3 x half> undef, half %867, i32 0
  %881 = shufflevector <3 x half> %880, <3 x half> undef, <3 x i32> zeroinitializer
  %882 = tail call <3 x half> @air.mix.v3f16(<3 x half> %875, <3 x half> %879, <3 x half> %881) #4
  %883 = fmul fast <3 x half> %882, %871
  %884 = insertelement <3 x half> undef, half %869, i32 0
  %885 = shufflevector <3 x half> %884, <3 x half> undef, <3 x i32> zeroinitializer
  %886 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %4, i64 0, i32 3
  %887 = bitcast ptr addrspace(2) %886 to ptr addrspace(2)
  %888 = load <4 x half>, ptr addrspace(2) %887, align 8
  %889 = shufflevector <4 x half> %888, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %890 = fmul fast <3 x half> %889, %885
  %891 = fadd fast <3 x half> %890, %883
  %892 = load <4 x float>, ptr addrspace(2) %633, align 16
  %893 = shufflevector <4 x float> %892, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %894 = fsub fast <2 x float> %343, %893
  %895 = shufflevector <4 x float> %892, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %896 = fmul fast <2 x float> %894, %895
  %897 = fcmp olt <2 x float> %896, zeroinitializer
  %898 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %897) #4
  br i1 %898, label %912, label %899

899:                                              ; preds = %865
  %900 = fcmp ogt <2 x float> %896, splat (float 1.000000e+00)
  %901 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %900) #4
  br i1 %901, label %912, label %902

902:                                              ; preds = %899
  %903 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %5, ptr addrspace(2) captures(none) %6, <2 x float> %896, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00) #3
  %904 = extractelement <4 x half> %903, i32 1
  %905 = fmul fast half %904, 0xH4400
  %906 = tail call half @air.clamp.f16(half %905, half 0xHBC00, half 0xH0000) #4
  %907 = insertelement <2 x half> undef, half %906, i32 0
  %908 = extractelement <4 x half> %903, i32 3
  %909 = fmul fast half %908, %908
  %910 = fmul fast half %909, %908
  %911 = insertelement <2 x half> %907, half %910, i32 1
  br label %912

912:                                              ; preds = %902, %899, %865
  %913 = phi <2 x half> [ %911, %902 ], [ zeroinitializer, %865 ], [ zeroinitializer, %899 ]
  %914 = load <4 x float>, ptr addrspace(2) %567, align 16
  %915 = shufflevector <4 x float> %914, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %916 = fsub fast <3 x float> %327, %915
  %917 = fmul fast <3 x float> %916, splat (float 4.687500e-02)
  %918 = load <4 x half>, ptr addrspace(2) %84, align 8
  %919 = extractelement <4 x half> %918, i32 0
  %920 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %15, ptr addrspace(2) captures(none) %16, <3 x float> %917, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %921 = extractelement <4 x half> %920, i32 0
  %922 = fmul fast half %921, %919
  %923 = fdiv fast half %922, %919
  %924 = tail call half @air.mix.f16(half 0xH3C00, half %923, half %870) #4
  %925 = fmul fast half %870, %801
  %926 = fmul fast half %806, 0xHB933
  %927 = tail call half @air.exp2.f16(half %926) #1
  %928 = fadd fast half %927, 0xH3C00
  %929 = fmul fast half %928, 0xHC200
  %930 = fmul fast half %924, 0xH3800
  %931 = fadd fast half %930, 0xH3800
  %932 = fmul fast half %929, %931
  %933 = tail call half @air.exp2.f16(half %932) #1
  %934 = fmul fast half %933, 0xH4500
  %935 = extractelement <2 x half> %913, i32 0
  %936 = fadd fast half %935, 0xH3C00
  %937 = tail call half @air.sqrt.f16(half %925) #1
  %938 = fmul fast half %937, 0xHC180
  %939 = tail call half @air.exp2.f16(half %938) #1
  %940 = fmul fast half %939, %936
  %941 = fmul fast half %940, %868
  %942 = tail call half @air.mix.f16(half 0xH3266, half 0xH1D1F, half %941) #4
  %943 = fpext half %942 to float
  %944 = fsub fast float 1.000000e+00, %342
  %945 = fadd fast float %944, %943
  %946 = fdiv fast float 2.000000e+00, %943, !fpmath !38
  %947 = fadd fast float %946, 1.000000e+00
  %948 = tail call float @air.fast_log.f32(float %947) #1
  %949 = fmul fast float %943, %948
  %950 = fmul fast float %949, %945
  %951 = fdiv fast float %943, %950
  %952 = fpext half %940 to float
  %953 = fmul fast float %952, 5.000000e+00
  %954 = fmul fast float %953, %951
  %955 = fptrunc float %954 to half
  %956 = load <4 x half>, ptr addrspace(2) %634, align 16
  %957 = shufflevector <4 x half> %956, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %958 = load <4 x half>, ptr addrspace(2) %877, align 8
  %959 = shufflevector <4 x half> %958, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %960 = insertelement <3 x half> undef, half %868, i32 0
  %961 = shufflevector <3 x half> %960, <3 x half> undef, <3 x i32> zeroinitializer
  %962 = fmul fast <3 x half> %959, %961
  %963 = fmul fast half %940, %934
  %964 = fmul fast half %868, 0xH3800
  %965 = fadd fast half %964, 0xH3800
  %966 = fmul fast half %955, %965
  %967 = fadd fast half %966, %963
  %968 = insertelement <3 x half> undef, half %967, i32 0
  %969 = shufflevector <3 x half> %968, <3 x half> undef, <3 x i32> zeroinitializer
  %970 = fmul fast <3 x half> %962, %969
  %971 = fmul fast half %868, 0xH3A66
  %972 = fadd fast half %971, 0xH3266
  %973 = tail call half @air.mix.f16(half 0xH3A00, half %931, half %972) #4
  %974 = insertelement <3 x half> undef, half %973, i32 0
  %975 = shufflevector <3 x half> %974, <3 x half> undef, <3 x i32> zeroinitializer
  %976 = fmul fast <3 x half> %975, %891
  %977 = fmul fast half %927, 0xH3E00
  %978 = fmul fast half %977, %934
  %979 = fadd fast half %978, 0xH3C00
  %980 = insertelement <3 x half> undef, half %979, i32 0
  %981 = shufflevector <3 x half> %980, <3 x half> undef, <3 x i32> zeroinitializer
  %982 = fmul fast half %867, 0xH3800
  %983 = fmul fast half %982, %940
  %984 = insertelement <3 x half> undef, half %983, i32 0
  %985 = shufflevector <3 x half> %984, <3 x half> undef, <3 x i32> zeroinitializer
  %986 = load <4 x half>, ptr addrspace(2) %877, align 8
  %987 = shufflevector <4 x half> %986, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %988 = fmul fast <3 x half> %987, %985
  %989 = fadd fast <3 x half> %988, %981
  %990 = fmul fast <3 x half> %976, %989
  %991 = fadd fast <3 x half> %970, %990
  %992 = fmul fast <3 x half> %991, %957
  %993 = shufflevector <2 x half> %913, <2 x half> undef, <3 x i32> <i32 1, i32 1, i32 1>
  %994 = fmul fast <3 x half> %993, <half 0xH4200, half 0xH3666, half 0xH2E66>
  %995 = fmul fast <3 x half> %994, %992
  %996 = fadd fast <3 x half> %995, %992
  %997 = shufflevector <3 x half> %996, <3 x half> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %998 = load <4 x half>, ptr addrspace(2) %84, align 8
  %999 = extractelement <4 x half> %998, i32 3
  %1000 = fcmp ogt half %999, 0xH0000
  br i1 %1000, label %1001, label %1077

1001:                                             ; preds = %912
  %1002 = load <3 x float>, ptr addrspace(2) %78, align 16
  %1003 = shufflevector <3 x float> %1002, <3 x float> undef, <2 x i32> <i32 0, i32 1>
  %1004 = fadd fast <2 x float> %1003, %56
  %1005 = shufflevector <2 x float> %1004, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 poison>
  %1006 = shufflevector <3 x float> %1005, <3 x float> %1002, <3 x i32> <i32 0, i32 1, i32 5>
  %1007 = fmul fast <3 x float> %1006, <float 0x407BBE5A20000000, float 0x407B96C4A0000000, float 0x407B531EC0000000>
  %1008 = tail call <3 x float> @air.fast_fract.v3f32(<3 x float> %1007) #4
  %1009 = fadd fast <3 x float> %1008, splat (float 0x403330A3E0000000)
  %1010 = shufflevector <3 x float> %1009, <3 x float> undef, <3 x i32> <i32 1, i32 0, i32 2>
  %1011 = tail call float @air.dot.v3f32(<3 x float> %1008, <3 x float> %1010) #4
  %1012 = insertelement <3 x float> undef, float %1011, i32 0
  %1013 = shufflevector <3 x float> %1012, <3 x float> undef, <3 x i32> zeroinitializer
  %1014 = fadd fast <3 x float> %1013, %1008
  %1015 = shufflevector <3 x float> %1014, <3 x float> undef, <3 x i32> <i32 0, i32 0, i32 1>
  %1016 = shufflevector <3 x float> %1014, <3 x float> undef, <3 x i32> <i32 1, i32 0, i32 0>
  %1017 = fadd fast <3 x float> %1015, %1016
  %1018 = shufflevector <3 x float> %1014, <3 x float> undef, <3 x i32> <i32 2, i32 1, i32 0>
  %1019 = fmul fast <3 x float> %1017, %1018
  %1020 = tail call <3 x float> @air.fast_fract.v3f32(<3 x float> %1019) #4
  %1021 = extractelement <3 x float> %1020, i32 2
  %1022 = load <4 x half>, ptr addrspace(2) %84, align 8
  %1023 = extractelement <4 x half> %1022, i32 3
  %1024 = fmul fast half %1023, %1023
  %1025 = fmul fast half %1024, 0xH2A66
  %1026 = fpext half %1025 to float
  %1027 = fcmp olt float %1021, %1026
  br i1 %1027, label %1028, label %1077

1028:                                             ; preds = %1001
  %1029 = tail call float @air.fast_fmax.f32(float 4.000000e+00, float %278) #4
  %1030 = extractelement <3 x half> %996, i32 0
  %1031 = fpext half %1030 to float
  %1032 = insertelement <3 x float> undef, float %1031, i32 0
  %1033 = extractelement <3 x half> %996, i32 1
  %1034 = fpext half %1033 to float
  %1035 = insertelement <3 x float> %1032, float %1034, i32 1
  %1036 = extractelement <3 x half> %996, i32 2
  %1037 = fpext half %1036 to float
  %1038 = insertelement <3 x float> %1035, float %1037, i32 2
  %1039 = fadd fast <3 x float> %1020, splat (float 5.000000e-01)
  %1040 = fmul fast <3 x float> %1039, splat (float 5.000000e+01)
  %1041 = shufflevector <3 x float> %1040, <3 x float> undef, <3 x i32> <i32 2, i32 1, i32 0>
  %1042 = insertelement <3 x float> undef, float %1029, i32 0
  %1043 = shufflevector <3 x float> %1042, <3 x float> undef, <3 x i32> zeroinitializer
  %1044 = fdiv fast <3 x float> %1041, %1043, !fpmath !38
  %1045 = fmul fast half %955, %941
  %1046 = insertelement <3 x half> undef, half %1045, i32 0
  %1047 = shufflevector <3 x half> %1046, <3 x half> undef, <3 x i32> zeroinitializer
  %1048 = load <4 x half>, ptr addrspace(2) %877, align 8
  %1049 = shufflevector <4 x half> %1048, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %1050 = fmul fast <3 x half> %1049, %1047
  %1051 = fmul fast half %927, %927
  %1052 = fmul fast half %1051, 0xH4000
  %1053 = insertelement <3 x half> undef, half %1052, i32 0
  %1054 = shufflevector <3 x half> %1053, <3 x half> undef, <3 x i32> zeroinitializer
  %1055 = fmul fast <3 x half> %1054, %891
  %1056 = fadd fast <3 x half> %1050, %1055
  %1057 = extractelement <3 x half> %1056, i32 0
  %1058 = fpext half %1057 to float
  %1059 = insertelement <3 x float> undef, float %1058, i32 0
  %1060 = extractelement <3 x half> %1056, i32 1
  %1061 = fpext half %1060 to float
  %1062 = insertelement <3 x float> %1059, float %1061, i32 1
  %1063 = extractelement <3 x half> %1056, i32 2
  %1064 = fpext half %1063 to float
  %1065 = insertelement <3 x float> %1062, float %1064, i32 2
  %1066 = fmul fast <3 x float> %1065, %1044
  %1067 = fadd fast <3 x float> %1066, %1038
  %1068 = extractelement <3 x float> %1067, i32 0
  %1069 = fptrunc float %1068 to half
  %1070 = insertelement <4 x half> undef, half %1069, i32 0
  %1071 = extractelement <3 x float> %1067, i32 1
  %1072 = fptrunc float %1071 to half
  %1073 = insertelement <4 x half> %1070, half %1072, i32 1
  %1074 = extractelement <3 x float> %1067, i32 2
  %1075 = fptrunc float %1074 to half
  %1076 = insertelement <4 x half> %1073, half %1075, i32 2
  br label %1077

1077:                                             ; preds = %1028, %1001, %912, %311
  %1078 = phi <4 x half> [ <half 0xH0000, half 0xH0000, half 0xH0000, half undef>, %311 ], [ %1076, %1028 ], [ %997, %1001 ], [ %997, %912 ]
  %1079 = fmul fast float %278, %29
  %1080 = tail call float @air.fast_clamp.f32(float %1079, float 0x3FF00418A0000000, float 2.560000e+05) #4
  %1081 = tail call float @air.fast_log2.f32(float %1080) #1
  %1082 = fmul fast float %1081, 2.560000e+02
  %1083 = fptrunc float %1082 to half
  %1084 = shufflevector <4 x half> <half undef, half undef, half undef, half 0xH3C00>, <4 x half> %1078, <4 x i32> <i32 4, i32 5, i32 6, i32 3>
  %1085 = fmul fast <2 x float> %321, splat (float 1.024000e+03)
  %1086 = insertelement <4 x half> undef, half %1083, i32 0
  %1087 = extractelement <2 x float> %1085, i32 0
  %1088 = fptrunc float %1087 to half
  %1089 = insertelement <4 x half> %1086, half %1088, i32 1
  %1090 = extractelement <2 x float> %1085, i32 1
  %1091 = fptrunc float %1090 to half
  %1092 = insertelement <4 x half> %1089, half %1091, i32 2
  %1093 = insertelement <4 x half> %1092, half 0xH3C00, i32 3
  br label %1094

1094:                                             ; preds = %1077, %272, %71
  %1095 = phi <4 x half> [ zeroinitializer, %71 ], [ zeroinitializer, %272 ], [ %1084, %1077 ]
  %1096 = phi <4 x half> [ zeroinitializer, %71 ], [ zeroinitializer, %272 ], [ %1093, %1077 ]
  %1097 = insertvalue %struct.xlatMtlShaderOutput undef, <4 x half> %1095, 0
  %1098 = insertvalue %struct.xlatMtlShaderOutput %1097, <4 x half> %1096, 1
  ret %struct.xlatMtlShaderOutput %1098
}

; Function Attrs: nounwind memory(none)
declare float @air.fast_log2.f32(float) #1

declare float @air.fast_clamp.f32(float, float, float) #2

declare float @air.fast_fmax.f32(float, float) #2

declare <3 x float> @air.fast_fract.v3f32(<3 x float>) #2

declare float @air.dot.v3f32(<3 x float>, <3 x float>) #2

declare half @air.mix.f16(half, half, half) #2

; Function Attrs: nounwind memory(none)
declare float @air.fast_log.f32(float) #1

; Function Attrs: nounwind memory(none)
declare half @air.exp2.f16(half) #1

; Function Attrs: nounwind memory(none)
declare half @air.sqrt.f16(half) #1

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <3 x float>, i1, <3 x i32>, i1, float) #3

declare half @air.clamp.f16(half, half, half) #2

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <2 x float>, i1, <2 x i32>, i1, float) #3

declare zeroext i1 @air.any.v2i1(<2 x i1>) #2

declare <3 x half> @air.mix.v3f16(<3 x half>, <3 x half>, <3 x half>) #2

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <3 x float>, i1, <3 x i32>, i1, float) #3

; Function Attrs: nounwind memory(none)
declare <3 x float> @air.fast_floor.v3f32(<3 x float>) #1

; Function Attrs: nounwind memory(none)
declare float @air.fast_sin.f32(float) #1

declare half @air.fmax.f16(half, half) #2

declare float @air.mix.f32(float, float, float) #2

declare half @air.dot.v3f16(<3 x half>, <3 x half>) #2

declare float @air.fast_fmin.f32(float, float) #2

; Function Attrs: nounwind memory(none)
declare float @air.fabs.f32(float) #1

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x float> @air.sample_texture_2d.v4f32(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <2 x float>, i1, <2 x i32>, i1, float) #3

declare <3 x float> @air.fast_fmax.v3f32(<3 x float>, <3 x float>) #2

declare <3 x float> @air.fast_fmin.v3f32(<3 x float>, <3 x float>) #2

; Function Attrs: nounwind memory(none)
declare float @air.fast_rsqrt.f32(float) #1

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
!11 = !{!12, !13, !14, !15, !16, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37}
!12 = !{i32 0, !"air.position", !"air.center", !"air.no_perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"gl_FragCoord"}
!13 = !{i32 1, !"air.fragment_input", !"generated(12v_rayVecSizeDv4_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"v_rayVecSize"}
!14 = !{i32 2, !"air.fragment_input", !"generated(7v_bMinUDv4_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"v_bMinU"}
!15 = !{i32 3, !"air.fragment_input", !"generated(7v_bMaxVDv4_f)", !"air.center", !"air.perspective", !"air.arg_type_name", !"float4", !"air.arg_name", !"v_bMaxV"}
!16 = !{i32 4, !"air.buffer", !"air.buffer_size", i32 320, !"air.location_index", i32 9, i32 1, !"air.read", !"air.struct_type_info", !17, !"air.arg_type_size", i32 320, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"xlatMtlShaderUniform", !"air.arg_name", !"_mtl_u"}
!17 = !{i32 0, i32 8, i32 0, !"half3", !"u_sunDir", i32 8, i32 8, i32 0, !"half3", !"u_sunColor", i32 16, i32 8, i32 0, !"half3", !"u_averageSkyColor", i32 24, i32 8, i32 0, !"half3", !"u_pointLight", i32 32, i32 4, i32 0, !"float", !"u_time", i32 48, i32 16, i32 0, !"float4", !"u_waterSimTerms", i32 64, i32 16, i32 0, !"float3", !"u_randomOffset", i32 80, i32 16, i32 0, !"float3", !"u_cloudWindMove", i32 96, i32 16, i32 0, !"float3", !"u_cloudWindScroll", i32 112, i32 8, i32 0, !"half4", !"u_cloudMat", i32 128, i32 16, i32 0, !"float3", !"u_cloudBinMinWorld", i32 144, i32 16, i32 0, !"float3", !"u_cloudBinRangeWorld", i32 160, i32 4, i32 0, !"float", !"u_cloudPackedBinDimInv", i32 168, i32 8, i32 0, !"half4", !"u_cloudNoiseTweaks", i32 176, i32 16, i32 0, !"float4", !"u_cloudVoxelScales", i32 192, i32 2, i32 0, !"half", !"u_cloudUndulationScale", i32 208, i32 16, i32 0, !"float3", !"u_eyePos", i32 224, i32 8, i32 0, !"float2", !"u_viewportSize", i32 240, i32 64, i32 0, !"float4x4", !"u_viewProjOld", i32 304, i32 8, i32 0, !"float2", !"u_jitter"}
!18 = !{i32 5, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<half, sample>", !"air.arg_name", !"u_waterSim"}
!19 = !{i32 6, !"air.sampler", !"air.location_index", i32 0, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_waterSim"}
!20 = !{i32 7, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<float, sample>", !"air.arg_name", !"u_cloudDist"}
!21 = !{i32 8, !"air.sampler", !"air.location_index", i32 1, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudDist"}
!22 = !{i32 9, !"air.texture", !"air.location_index", i32 2, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<half, sample>", !"air.arg_name", !"u_cloudAmb0"}
!23 = !{i32 10, !"air.sampler", !"air.location_index", i32 2, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudAmb0"}
!24 = !{i32 11, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<half, sample>", !"air.arg_name", !"u_cloudAmb1"}
!25 = !{i32 12, !"air.sampler", !"air.location_index", i32 3, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudAmb1"}
!26 = !{i32 13, !"air.texture", !"air.location_index", i32 4, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<half, sample>", !"air.arg_name", !"u_cloudAmb2"}
!27 = !{i32 14, !"air.sampler", !"air.location_index", i32 4, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudAmb2"}
!28 = !{i32 15, !"air.texture", !"air.location_index", i32 5, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<half, sample>", !"air.arg_name", !"u_cloudNoise3D"}
!29 = !{i32 16, !"air.sampler", !"air.location_index", i32 5, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudNoise3D"}
!30 = !{i32 17, !"air.texture", !"air.location_index", i32 6, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<float, sample>", !"air.arg_name", !"u_cloudSparse"}
!31 = !{i32 18, !"air.sampler", !"air.location_index", i32 6, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudSparse"}
!32 = !{i32 19, !"air.texture", !"air.location_index", i32 7, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<half, sample>", !"air.arg_name", !"u_texBlueNoise"}
!33 = !{i32 20, !"air.sampler", !"air.location_index", i32 7, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_texBlueNoise"}
!34 = !{i32 21, !"air.texture", !"air.location_index", i32 8, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<float, sample>", !"air.arg_name", !"u_depthHalfTex"}
!35 = !{i32 22, !"air.sampler", !"air.location_index", i32 8, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_depthHalfTex"}
!36 = !{i32 23, !"air.texture", !"air.location_index", i32 9, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<half, sample>", !"air.arg_name", !"u_cloudTTex"}
!37 = !{i32 24, !"air.sampler", !"air.location_index", i32 9, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudTTex"}
!38 = !{float 2.500000e+00}
!39 = !{!40, !41, i64 224}
!40 = !{!"_ZTS20xlatMtlShaderUniform", !41, i64 0, !41, i64 8, !41, i64 16, !41, i64 24, !43, i64 32, !41, i64 48, !41, i64 64, !41, i64 80, !41, i64 96, !41, i64 112, !41, i64 128, !41, i64 144, !43, i64 160, !41, i64 168, !41, i64 176, !44, i64 192, !41, i64 208, !41, i64 224, !45, i64 240, !41, i64 304}
!41 = !{!"omnipotent char", !42, i64 0}
!42 = !{!"Simple C++ TBAA"}
!43 = !{!"float", !41, i64 0}
!44 = !{!"half", !41, i64 0}
!45 = !{!"_ZTSN5metal6matrixIfLi4ELi4EEE", !41, i64 0}
!46 = !{!40, !44, i64 192}
!47 = !{!40, !43, i64 32}
!48 = !{!40, !43, i64 160}
!49 = !{!41, !41, i64 0}
!50 = !{!40, !41, i64 304}
!51 = !{!43, !43, i64 0}
