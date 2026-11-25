; ModuleID = 'FlatCloud11244.vert.osx.metallib'
source_filename = "FlatCloud11244.vert.osx.metallib"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-macosx10.11.0"

%struct.xlatMtlShaderOutput.packed = type <{ <4 x float>, <4 x float>, half, half, float, half, <4 x half>, <2 x half>, half }>
%struct.xlatMtlShaderUniform = type { <3 x half>, <3 x half>, <3 x half>, <3 x half>, float, <4 x float>, <3 x float>, <4 x half>, <3 x float>, <3 x float>, float, <4 x half>, <4 x float>, half, %"class.metal::matrix", <3 x float>, <2 x float>, %"class.metal::matrix", %"class.metal::matrix", %"class.metal::matrix", half, half, <3 x float>, <3 x float>, <3 x float> }
%"class.metal::matrix" = type { [4 x <4 x float>] }

; Function Attrs: noduplicate nounwind
define %struct.xlatMtlShaderOutput.packed @vsMain(<3 x float> %0, <3 x float> %1, <4 x float> %2, <4 x float> %3, <4 x float> %4, <4 x float> %5, float %6, ptr addrspace(2) readonly %7, ptr addrspace(1) %8, ptr addrspace(2) readonly captures(none) %9, ptr addrspace(1) %10, ptr addrspace(2) readonly captures(none) %11, ptr addrspace(1) %12, ptr addrspace(2) readonly captures(none) %13, ptr addrspace(1) %14, ptr addrspace(2) readonly captures(none) %15, ptr addrspace(1) %16, ptr addrspace(2) readonly captures(none) %17, ptr addrspace(1) %18, ptr addrspace(2) readonly captures(none) %19, ptr addrspace(1) %20, ptr addrspace(2) readonly captures(none) %21) #0 {
  %23 = extractelement <4 x float> %4, i32 1
  %24 = extractelement <4 x float> %2, i32 3
  %25 = fptrunc float %24 to half
  %26 = extractelement <4 x float> %5, i32 3
  %27 = fptrunc float %26 to half
  %28 = fadd fast <4 x float> %3, splat (float 0x3F60100FE0000000)
  %29 = fmul fast <3 x float> %1, splat (float 6.000000e+00)
  %30 = fcmp ogt float %6, 0.000000e+00
  %31 = select i1 %30, float 1.000000e+00, float 0.000000e+00
  %32 = tail call float @air.fabs.f32(float %6) #1
  %33 = fcmp ogt float %32, 5.000000e-01
  %34 = select i1 %33, float 0.000000e+00, float 1.000000e+00
  %35 = insertelement <2 x float> undef, float %31, i32 0
  %36 = insertelement <2 x float> %35, float %34, i32 1
  %37 = shufflevector <2 x float> %36, <2 x float> undef, <4 x i32> <i32 poison, i32 poison, i32 0, i32 1>
  %38 = fptrunc float %23 to half
  %39 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 20
  %40 = load half, ptr addrspace(2) %39, align 16, !tbaa !42
  %41 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 21
  %42 = load half, ptr addrspace(2) %41, align 2, !tbaa !49
  %43 = fmul fast half %40, 0xH3BFE
  %44 = fmul fast half %43, %42
  %45 = tail call half @air.clamp.f16(half %38, half 0xHBC00, half %44) #4
  %46 = tail call half @air.fract.f16(half %45) #4
  %47 = load half, ptr addrspace(2) %39, align 16, !tbaa !42
  %48 = fdiv fast half %45, %47
  %49 = tail call half @air.floor.f16(half %48) #1
  %50 = fpext half %49 to float
  %51 = fdiv fast half 0xH3C00, %47
  %52 = load half, ptr addrspace(2) %41, align 2, !tbaa !49
  %53 = fdiv fast half 0xH3C00, %52
  %54 = shufflevector <4 x float> %28, <4 x float> undef, <2 x i32> <i32 2, i32 3>
  %55 = fpext half %51 to float
  %56 = insertelement <2 x float> undef, float %55, i32 0
  %57 = fpext half %53 to float
  %58 = insertelement <2 x float> %56, float %57, i32 1
  %59 = fmul fast <2 x float> %58, %54
  %60 = extractelement <2 x float> %59, i32 0
  %61 = fptrunc float %60 to half
  %62 = extractelement <2 x float> %59, i32 1
  %63 = fptrunc float %62 to half
  %64 = fpext half %61 to float
  %65 = insertelement <2 x float> undef, float %64, i32 0
  %66 = fpext half %63 to float
  %67 = insertelement <2 x float> %65, float %66, i32 1
  %68 = shufflevector <4 x float> %28, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %69 = fadd fast <2 x float> %36, splat (float -5.000000e-01)
  %70 = fcmp ult half %45, 0xH0000
  br i1 %70, label %88, label %71

71:                                               ; preds = %22
  %72 = fpext half %45 to float
  %73 = fpext half %47 to float
  %74 = fmul fast float %50, %73
  %75 = fsub fast float %72, %74
  %76 = tail call float @air.fast_floor.f32(float %75) #1
  %77 = insertelement <2 x float> undef, float %76, i32 0
  %78 = fadd fast float %50, 1.000000e+00
  %79 = insertelement <2 x float> %77, float %78, i32 1
  %80 = fmul fast <2 x float> %79, %67
  %81 = fsub fast float -0.000000e+00, %66
  %82 = insertelement <2 x float> %67, float %81, i32 1
  %83 = fmul fast <2 x float> %69, splat (float 0x3FEF5C2900000000)
  %84 = fadd fast <2 x float> %83, splat (float 5.000000e-01)
  %85 = fmul fast <2 x float> %82, %84
  %86 = fadd fast <2 x float> %85, %68
  %87 = fadd fast <2 x float> %86, %80
  br label %98

88:                                               ; preds = %22
  %89 = extractelement <4 x float> %28, i32 3
  %90 = insertelement <2 x float> <float 0.000000e+00, float undef>, float %89, i32 1
  %91 = extractelement <4 x float> %28, i32 2
  %92 = insertelement <2 x float> undef, float %91, i32 0
  %93 = fsub fast float -0.000000e+00, %89
  %94 = insertelement <2 x float> %92, float %93, i32 1
  %95 = fadd fast <2 x float> %90, %68
  %96 = fmul fast <2 x float> %36, %94
  %97 = fadd fast <2 x float> %95, %96
  br label %98

98:                                               ; preds = %88, %71
  %99 = phi <2 x float> [ %87, %71 ], [ %97, %88 ]
  %100 = shufflevector <2 x float> %99, <2 x float> undef, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %101 = shufflevector <3 x float> %0, <3 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %102 = shufflevector <4 x float> <float undef, float undef, float undef, float 1.000000e+00>, <4 x float> %101, <4 x i32> <i32 4, i32 5, i32 6, i32 3>
  %103 = shufflevector <3 x float> %0, <3 x float> undef, <4 x i32> zeroinitializer
  %104 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 14, i32 0, i64 0
  %105 = load <4 x float>, ptr addrspace(2) %104, align 16, !tbaa !50
  %106 = fmul fast <4 x float> %105, %103
  br label %107

107:                                              ; preds = %107, %98
  %108 = phi i32 [ 1, %98 ], [ %118, %107 ]
  %109 = phi <4 x float> [ %106, %98 ], [ %117, %107 ]
  %110 = extractelement <4 x float> %102, i32 %108
  %111 = insertelement <4 x float> undef, float %110, i32 0
  %112 = shufflevector <4 x float> %111, <4 x float> undef, <4 x i32> zeroinitializer
  %113 = sext i32 %108 to i64
  %114 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 14, i32 0, i64 %113
  %115 = load <4 x float>, ptr addrspace(2) %114, align 16, !tbaa !50
  %116 = fmul fast <4 x float> %115, %112
  %117 = fadd fast <4 x float> %116, %109
  %118 = add nuw nsw i32 %108, 1
  %119 = icmp eq i32 %118, 4
  br i1 %119, label %120, label %107

120:                                              ; preds = %107
  %121 = shufflevector <4 x float> %37, <4 x float> %100, <4 x i32> <i32 4, i32 5, i32 2, i32 3>
  %122 = fsub fast <3 x float> %0, %29
  %123 = shufflevector <3 x float> %122, <3 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %124 = shufflevector <4 x float> <float undef, float undef, float undef, float 1.000000e+00>, <4 x float> %123, <4 x i32> <i32 4, i32 5, i32 6, i32 3>
  %125 = shufflevector <3 x float> %122, <3 x float> undef, <4 x i32> zeroinitializer
  %126 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 19, i32 0, i64 0
  %127 = load <4 x float>, ptr addrspace(2) %126, align 16, !tbaa !50
  %128 = fmul fast <4 x float> %127, %125
  br label %129

129:                                              ; preds = %129, %120
  %130 = phi i32 [ 1, %120 ], [ %140, %129 ]
  %131 = phi <4 x float> [ %128, %120 ], [ %139, %129 ]
  %132 = extractelement <4 x float> %124, i32 %130
  %133 = insertelement <4 x float> undef, float %132, i32 0
  %134 = shufflevector <4 x float> %133, <4 x float> undef, <4 x i32> zeroinitializer
  %135 = sext i32 %130 to i64
  %136 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 19, i32 0, i64 %135
  %137 = load <4 x float>, ptr addrspace(2) %136, align 16, !tbaa !50
  %138 = fmul fast <4 x float> %137, %134
  %139 = fadd fast <4 x float> %138, %131
  %140 = add nuw nsw i32 %130, 1
  %141 = icmp eq i32 %140, 4
  br i1 %141, label %142, label %129

142:                                              ; preds = %129
  %143 = fadd fast <4 x float> %139, %117
  %144 = fmul fast <4 x float> %143, splat (float 5.000000e-01)
  %145 = fsub fast <4 x float> %117, %144
  %146 = fadd fast <4 x float> %145, %139
  %147 = fadd fast <4 x float> %145, %117
  %148 = fsub fast <4 x float> %146, %147
  %149 = fmul fast <4 x float> %148, splat (float 2.500000e-01)
  %150 = fsub fast <4 x float> %146, %149
  %151 = fadd fast <4 x float> %149, %147
  %152 = shufflevector <4 x float> %151, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %153 = shufflevector <4 x float> %151, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %154 = fdiv fast <2 x float> %152, %153, !fpmath !51
  %155 = shufflevector <4 x float> %150, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %156 = shufflevector <4 x float> %150, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %157 = fdiv fast <2 x float> %155, %156, !fpmath !51
  %158 = fsub fast <2 x float> %154, %157
  %159 = tail call float @air.dot.v2f32(<2 x float> %158, <2 x float> %158) #4
  %160 = tail call float @air.fast_sqrt.f32(float %159) #1
  %161 = fcmp olt float %160, 0x3F50624DE0000000
  br i1 %161, label %166, label %162

162:                                              ; preds = %142
  %163 = insertelement <2 x float> undef, float %160, i32 0
  %164 = shufflevector <2 x float> %163, <2 x float> undef, <2 x i32> zeroinitializer
  %165 = fdiv fast <2 x float> %158, %164, !fpmath !51
  br label %166

166:                                              ; preds = %162, %142
  %167 = phi <2 x float> [ %165, %162 ], [ zeroinitializer, %142 ]
  %168 = extractelement <4 x float> %4, i32 3
  %169 = tail call float @air.fast_cos.f32(float %168) #1
  %170 = insertelement <2 x float> undef, float %169, i32 0
  %171 = tail call float @air.fast_sin.f32(float %168) #1
  %172 = insertelement <2 x float> %170, float %171, i32 1
  %173 = fsub fast float -0.000000e+00, %171
  %174 = insertelement <2 x float> undef, float %173, i32 0
  %175 = insertelement <2 x float> %174, float %169, i32 1
  %176 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 17, i32 0, i64 0
  %177 = load <4 x float>, ptr addrspace(2) %176, align 16
  %178 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 17, i32 0, i64 1
  %179 = load <4 x float>, ptr addrspace(2) %178, align 16
  %180 = shufflevector <4 x float> %177, <4 x float> %179, <2 x i32> <i32 0, i32 5>
  %181 = shufflevector <4 x float> %4, <4 x float> undef, <2 x i32> zeroinitializer
  %182 = shufflevector <2 x float> %69, <2 x float> undef, <2 x i32> zeroinitializer
  %183 = fmul fast <2 x float> %172, %182
  %184 = shufflevector <2 x float> %69, <2 x float> undef, <2 x i32> <i32 1, i32 1>
  %185 = fmul fast <2 x float> %175, %184
  %186 = fadd fast <2 x float> %185, %183
  %187 = extractelement <4 x float> %177, i32 0
  %188 = extractelement <4 x float> %4, i32 0
  %189 = fmul fast <2 x float> %180, %181
  %190 = fmul fast <2 x float> %189, %186
  %191 = shufflevector <2 x float> %190, <2 x float> undef, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %192 = shufflevector <4 x float> <float undef, float undef, float 0.000000e+00, float 0.000000e+00>, <4 x float> %191, <4 x i32> <i32 4, i32 5, i32 2, i32 3>
  %193 = fadd fast <4 x float> %192, %150
  %194 = fadd fast <4 x float> %192, %151
  %195 = fmul fast <2 x float> %69, splat (float 0x3FF6A09EE0000000)
  %196 = tail call float @air.dot.v2f32(<2 x float> %167, <2 x float> %195) #4
  %197 = fmul fast float %196, 5.000000e-01
  %198 = fadd fast float %197, 5.000000e-01
  %199 = insertelement <4 x float> undef, float %198, i32 0
  %200 = shufflevector <4 x float> %199, <4 x float> undef, <4 x i32> zeroinitializer
  %201 = tail call <4 x float> @air.mix.v4f32(<4 x float> %193, <4 x float> %194, <4 x float> %200) #4
  %202 = shufflevector <4 x float> %201, <4 x float> undef, <4 x i32> zeroinitializer
  %203 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 18, i32 0, i64 0
  %204 = load <4 x float>, ptr addrspace(2) %203, align 16, !tbaa !50
  %205 = fmul fast <4 x float> %202, %204
  br label %206

206:                                              ; preds = %206, %166
  %207 = phi i32 [ 1, %166 ], [ %217, %206 ]
  %208 = phi <4 x float> [ %205, %166 ], [ %216, %206 ]
  %209 = extractelement <4 x float> %201, i32 %207
  %210 = insertelement <4 x float> undef, float %209, i32 0
  %211 = shufflevector <4 x float> %210, <4 x float> undef, <4 x i32> zeroinitializer
  %212 = sext i32 %207 to i64
  %213 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 18, i32 0, i64 %212
  %214 = load <4 x float>, ptr addrspace(2) %213, align 16, !tbaa !50
  %215 = fmul fast <4 x float> %214, %211
  %216 = fadd fast <4 x float> %215, %208
  %217 = add nuw nsw i32 %207, 1
  %218 = icmp eq i32 %217, 4
  br i1 %218, label %219, label %206

219:                                              ; preds = %206
  %220 = fmul fast float %188, 0x3FF6A09EE0000000
  %221 = fmul fast float %220, %187
  %222 = extractelement <4 x float> %201, i32 3
  %223 = fdiv fast float %221, %222, !fpmath !51
  %224 = fcmp olt float %223, 0x3F50624DE0000000
  br i1 %224, label %228, label %225

225:                                              ; preds = %219
  %226 = fadd fast float %223, %160
  %227 = fdiv fast float %223, %226, !fpmath !51
  br label %228

228:                                              ; preds = %225, %219
  %229 = phi float [ %227, %225 ], [ 0.000000e+00, %219 ]
  %230 = fpext half %25 to float
  %231 = fmul fast float %229, %229
  %232 = fmul fast float %231, %230
  %233 = fptrunc float %232 to half
  %234 = shufflevector <4 x float> %201, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %235 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 16
  %236 = load <2 x float>, ptr addrspace(2) %235, align 16, !tbaa !52
  %237 = shufflevector <4 x float> %201, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %238 = fmul fast <2 x float> %237, splat (float 2.000000e+00)
  %239 = fmul fast <2 x float> %238, %236
  %240 = fsub fast <2 x float> %234, %239
  %241 = shufflevector <2 x float> %240, <2 x float> undef, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %242 = shufflevector <4 x float> %201, <4 x float> %241, <4 x i32> <i32 4, i32 5, i32 2, i32 3>
  %243 = extractelement <4 x float> %201, i32 2
  %244 = tail call float @air.fast_clamp.f32(float %243, float 0.000000e+00, float 1.000000e+00) #4
  %245 = fmul fast float %244, 2.000000e+00
  %246 = fsub fast float 3.000000e+00, %245
  %247 = fmul fast float %244, %244
  %248 = fmul fast float %247, %246
  %249 = fpext half %233 to float
  %250 = fmul fast float %248, %249
  %251 = fptrunc float %250 to half
  %252 = insertelement <4 x half> undef, half %251, i32 3
  %253 = tail call float @air.fast_sqrt.f32(float %188) #1
  %254 = fdiv fast float 1.000000e+00, %253, !fpmath !51
  %255 = fptrunc float %254 to half
  %256 = extractelement <4 x float> %201, i32 3
  %257 = fmul fast float %188, 5.000000e-01
  %258 = fptrunc float %257 to half
  %259 = shufflevector <4 x float> %242, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %260 = fdiv fast <2 x float> %259, %237, !fpmath !51
  %261 = fmul fast <2 x float> %260, splat (float 5.000000e-01)
  %262 = fadd fast <2 x float> %261, splat (float 5.000000e-01)
  %263 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 24
  %264 = bitcast ptr addrspace(2) %263 to ptr addrspace(2)
  %265 = load <4 x float>, ptr addrspace(2) %264, align 16
  %266 = shufflevector <4 x float> %265, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %267 = shufflevector <2 x float> %262, <2 x float> undef, <3 x i32> zeroinitializer
  %268 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 22
  %269 = bitcast ptr addrspace(2) %268 to ptr addrspace(2)
  %270 = load <4 x float>, ptr addrspace(2) %269, align 16
  %271 = shufflevector <4 x float> %270, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %272 = fmul fast <3 x float> %267, %271
  %273 = fadd fast <3 x float> %272, %266
  %274 = shufflevector <2 x float> %262, <2 x float> undef, <3 x i32> <i32 1, i32 1, i32 1>
  %275 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 23
  %276 = bitcast ptr addrspace(2) %275 to ptr addrspace(2)
  %277 = load <4 x float>, ptr addrspace(2) %276, align 16
  %278 = shufflevector <4 x float> %277, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %279 = fmul fast <3 x float> %274, %278
  %280 = fadd fast <3 x float> %273, %279
  %281 = tail call float @air.dot.v3f32(<3 x float> %280, <3 x float> %280) #4
  %282 = tail call float @air.fast_rsqrt.f32(float %281) #1
  %283 = insertelement <3 x float> undef, float %282, i32 0
  %284 = shufflevector <3 x float> %283, <3 x float> undef, <3 x i32> zeroinitializer
  %285 = fmul fast <3 x float> %280, %284
  %286 = shufflevector <4 x float> %216, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %287 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 12
  %288 = load <4 x float>, ptr addrspace(2) %287, align 16
  %289 = extractelement <4 x float> %288, i32 0
  %290 = fmul fast float %289, 5.000000e-01
  %291 = insertelement <3 x float> undef, float %290, i32 0
  %292 = shufflevector <3 x float> %291, <3 x float> undef, <3 x i32> zeroinitializer
  %293 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 8
  %294 = bitcast ptr addrspace(2) %293 to ptr addrspace(2)
  %295 = load <4 x float>, ptr addrspace(2) %294, align 16
  %296 = fsub fast <4 x float> %216, %295
  %297 = shufflevector <4 x float> %296, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %298 = fsub fast <3 x float> %297, %292
  %299 = fdiv fast <3 x float> %298, splat (float 1.600000e+01), !fpmath !51
  %300 = tail call <3 x float> @air.fast_floor.v3f32(<3 x float> %299) #1
  %301 = fadd fast <3 x float> %300, splat (float 5.000000e-01)
  %302 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 9
  %303 = bitcast ptr addrspace(2) %302 to ptr addrspace(2)
  %304 = load <4 x float>, ptr addrspace(2) %303, align 16
  %305 = shufflevector <4 x float> %304, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %306 = fdiv fast <3 x float> splat (float 1.600000e+01), %305, !fpmath !51
  %307 = fmul fast <3 x float> %306, %301
  %308 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %20, ptr addrspace(2) captures(none) %21, <3 x float> %307, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %309 = extractelement <4 x float> %308, i32 0
  %310 = fcmp une float %309, 1.000000e+00
  br i1 %310, label %311, label %354

311:                                              ; preds = %228
  %312 = extractelement <4 x float> %288, i32 3
  %313 = fmul fast float %312, 5.000000e-01
  %314 = insertelement <3 x float> undef, float %313, i32 0
  %315 = shufflevector <3 x float> %314, <3 x float> undef, <3 x i32> zeroinitializer
  %316 = fsub fast float 1.000000e+00, %312
  %317 = insertelement <3 x float> undef, float %316, i32 0
  %318 = shufflevector <3 x float> %317, <3 x float> undef, <3 x i32> zeroinitializer
  %319 = fsub fast <3 x float> %299, %300
  %320 = fmul fast <3 x float> %319, %318
  %321 = fadd fast <3 x float> %320, %315
  %322 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 10
  %323 = load float, ptr addrspace(2) %322, align 16, !tbaa !53
  %324 = insertelement <2 x float> undef, float %323, i32 0
  %325 = shufflevector <2 x float> %324, <2 x float> undef, <2 x i32> zeroinitializer
  %326 = shufflevector <4 x float> %308, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %327 = fmul fast <2 x float> %326, splat (float 2.550000e+02)
  %328 = shufflevector <3 x float> %321, <3 x float> undef, <2 x i32> <i32 0, i32 1>
  %329 = fadd fast <2 x float> %328, %327
  %330 = fmul fast <2 x float> %325, %329
  %331 = shufflevector <2 x float> %330, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 poison>
  %332 = shufflevector <3 x float> %331, <3 x float> %321, <3 x i32> <i32 0, i32 1, i32 5>
  %333 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %16, ptr addrspace(2) captures(none) %17, <3 x float> %332, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %334 = extractelement <4 x half> %333, i32 0
  %335 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %12, ptr addrspace(2) captures(none) %13, <3 x float> %332, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %336 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %14, ptr addrspace(2) captures(none) %15, <3 x float> %332, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %337 = extractelement <4 x half> %336, i32 1
  %338 = fmul fast half %337, %337
  %339 = fmul fast <4 x half> %335, %335
  %340 = shufflevector <4 x half> %339, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %341 = shufflevector <4 x half> %335, <4 x half> undef, <3 x i32> <i32 3, i32 3, i32 3>
  %342 = fdiv fast <3 x half> %340, %341
  %343 = shufflevector <3 x half> %342, <3 x half> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %344 = extractelement <4 x half> %336, i32 0
  %345 = extractelement <4 x half> %336, i32 3
  %346 = extractelement <4 x half> %336, i32 2
  %347 = fmul fast half %346, 0xH5BF8
  %348 = fadd fast half %347, 0xHD800
  %349 = tail call half @air.exp2.f16(half %348) #1
  %350 = fmul fast half %345, %349
  %351 = fpext half %338 to float
  %352 = fpext half %344 to float
  %353 = fpext half %334 to float
  br label %354

354:                                              ; preds = %311, %228
  %355 = phi float [ %353, %311 ], [ 1.000000e+00, %228 ]
  %356 = phi half [ %350, %311 ], [ 0xH0000, %228 ]
  %357 = phi float [ %351, %311 ], [ 1.000000e+00, %228 ]
  %358 = phi float [ %352, %311 ], [ 5.000000e-01, %228 ]
  %359 = phi <4 x half> [ %343, %311 ], [ <half 0xH3400, half 0xH3800, half 0xH3C00, half undef>, %228 ]
  %360 = fmul fast float %34, 0x3FE3333340000000
  %361 = fadd fast float %360, 0x3FE99999A0000000
  %362 = fmul fast float %357, %361
  %363 = fptrunc float %362 to half
  %364 = extractelement <4 x half> %359, i32 0
  %365 = fpext half %364 to float
  %366 = insertelement <3 x float> undef, float %365, i32 0
  %367 = extractelement <4 x half> %359, i32 1
  %368 = fpext half %367 to float
  %369 = insertelement <3 x float> %366, float %368, i32 1
  %370 = extractelement <4 x half> %359, i32 2
  %371 = fpext half %370 to float
  %372 = insertelement <3 x float> %369, float %371, i32 2
  %373 = fmul fast float %34, 5.000000e-01
  %374 = fadd fast float %373, 0x3FE6666660000000
  %375 = insertelement <3 x float> undef, float %374, i32 0
  %376 = shufflevector <3 x float> %375, <3 x float> undef, <3 x i32> zeroinitializer
  %377 = fmul fast <3 x float> %372, %376
  %378 = extractelement <3 x float> %377, i32 0
  %379 = fptrunc float %378 to half
  %380 = insertelement <3 x half> undef, half %379, i32 0
  %381 = extractelement <3 x float> %377, i32 1
  %382 = fptrunc float %381 to half
  %383 = insertelement <3 x half> %380, half %382, i32 1
  %384 = extractelement <3 x float> %377, i32 2
  %385 = fptrunc float %384 to half
  %386 = insertelement <3 x half> %383, half %385, i32 2
  %387 = fmul fast float %358, %374
  %388 = fptrunc float %387 to half
  %389 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 15
  %390 = bitcast ptr addrspace(2) %389 to ptr addrspace(2)
  %391 = load <4 x float>, ptr addrspace(2) %390, align 16
  %392 = fsub fast <4 x float> %216, %391
  %393 = extractelement <3 x float> %285, i32 0
  %394 = fptrunc float %393 to half
  %395 = insertelement <3 x half> undef, half %394, i32 0
  %396 = extractelement <3 x float> %285, i32 1
  %397 = fptrunc float %396 to half
  %398 = insertelement <3 x half> %395, half %397, i32 1
  %399 = extractelement <3 x float> %285, i32 2
  %400 = fptrunc float %399 to half
  %401 = insertelement <3 x half> %398, half %400, i32 2
  %402 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 2
  %403 = bitcast ptr addrspace(2) %402 to ptr addrspace(2)
  %404 = load <4 x half>, ptr addrspace(2) %403, align 16
  %405 = shufflevector <4 x half> %404, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %406 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 1
  %407 = bitcast ptr addrspace(2) %406 to ptr addrspace(2)
  %408 = load <4 x half>, ptr addrspace(2) %407, align 8
  %409 = shufflevector <4 x half> %408, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %410 = insertelement <3 x half> undef, half %388, i32 0
  %411 = shufflevector <3 x half> %410, <3 x half> undef, <3 x i32> zeroinitializer
  %412 = tail call <3 x half> @air.mix.v3f16(<3 x half> %405, <3 x half> %409, <3 x half> %411) #4
  %413 = fmul fast <3 x half> %386, %412
  %414 = insertelement <3 x half> undef, half %356, i32 0
  %415 = shufflevector <3 x half> %414, <3 x half> undef, <3 x i32> zeroinitializer
  %416 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 3
  %417 = bitcast ptr addrspace(2) %416 to ptr addrspace(2)
  %418 = load <4 x half>, ptr addrspace(2) %417, align 8
  %419 = shufflevector <4 x half> %418, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %420 = fmul fast <3 x half> %419, %415
  %421 = fadd fast <3 x half> %413, %420
  %422 = bitcast ptr addrspace(2) %7 to ptr addrspace(2)
  %423 = load <4 x half>, ptr addrspace(2) %422, align 16
  %424 = shufflevector <4 x half> %423, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %425 = fmul fast <3 x half> %424, splat (half 0xH4100)
  %426 = extractelement <3 x half> %425, i32 0
  %427 = fpext half %426 to float
  %428 = insertelement <3 x float> undef, float %427, i32 0
  %429 = extractelement <3 x half> %425, i32 1
  %430 = fpext half %429 to float
  %431 = insertelement <3 x float> %428, float %430, i32 1
  %432 = extractelement <3 x half> %425, i32 2
  %433 = fpext half %432 to float
  %434 = insertelement <3 x float> %431, float %433, i32 2
  %435 = fsub fast <3 x float> %286, %434
  %436 = tail call half @air.dot.v3f16(<3 x half> %401, <3 x half> %424) #4
  %437 = shufflevector <3 x float> %435, <3 x float> undef, <2 x i32> <i32 0, i32 2>
  %438 = shufflevector <4 x float> %392, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %439 = tail call float @air.dot.v3f32(<3 x float> %438, <3 x float> %438) #4
  %440 = extractelement <3 x float> %435, i32 1
  %441 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 13
  %442 = load half, ptr addrspace(2) %441, align 16, !tbaa !54
  %443 = fpext half %442 to float
  %444 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 4
  %445 = load float, ptr addrspace(2) %444, align 16, !tbaa !55
  %446 = fmul fast float %445, 0x3FB7DF3B60000000
  %447 = extractelement <3 x float> %435, i32 0
  %448 = fmul fast float %447, 0x3FC99999A0000000
  %449 = fadd fast float %448, %440
  %450 = fmul fast float %449, 0x3FC0A3D700000000
  %451 = fadd fast float %450, %446
  %452 = tail call float @air.fast_sin.f32(float %451) #1
  %453 = fmul fast float %452, 2.500000e-01
  %454 = fmul fast float %445, 0x3FC7DF3B60000000
  %455 = extractelement <3 x float> %435, i32 2
  %456 = fmul fast float %440, 0x3FC99999A0000000
  %457 = fsub fast float %456, %455
  %458 = fmul fast float %457, 0x3FB0A3D700000000
  %459 = fadd fast float %458, %454
  %460 = tail call float @air.fast_sin.f32(float %459) #1
  %461 = fmul fast float %460, 5.000000e-01
  %462 = fmul fast float %445, 0x3FD7DF3B60000000
  %463 = fmul fast float %455, 0x3FC99999A0000000
  %464 = fsub fast float %463, %447
  %465 = fmul fast float %464, 0x3FA0A3D700000000
  %466 = fadd fast float %465, %462
  %467 = tail call float @air.fast_sin.f32(float %466) #1
  %468 = fadd fast float %453, -1.000000e+00
  %469 = fadd fast float %468, %461
  %470 = fadd fast float %469, %467
  %471 = fmul fast float %443, 2.000000e+00
  %472 = fmul fast float %471, %470
  %473 = fadd fast float %472, %440
  %474 = insertelement <3 x float> %435, float %473, i32 1
  %475 = load <4 x float>, ptr addrspace(2) %287, align 16
  %476 = extractelement <4 x float> %475, i32 0
  %477 = fmul fast float %476, 5.000000e-01
  %478 = insertelement <3 x float> undef, float %477, i32 0
  %479 = shufflevector <3 x float> %478, <3 x float> undef, <3 x i32> zeroinitializer
  %480 = fsub fast <3 x float> %474, %479
  %481 = load <4 x float>, ptr addrspace(2) %294, align 16
  %482 = shufflevector <4 x float> %481, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %483 = fsub fast <3 x float> %480, %482
  %484 = fdiv fast <3 x float> %483, splat (float 1.600000e+01), !fpmath !51
  %485 = tail call <3 x float> @air.fast_floor.v3f32(<3 x float> %484) #1
  %486 = fadd fast <3 x float> %485, splat (float 5.000000e-01)
  %487 = load <4 x float>, ptr addrspace(2) %303, align 16
  %488 = shufflevector <4 x float> %487, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %489 = fdiv fast <3 x float> splat (float 1.600000e+01), %488, !fpmath !51
  %490 = fmul fast <3 x float> %489, %486
  %491 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %20, ptr addrspace(2) captures(none) %21, <3 x float> %490, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %492 = extractelement <4 x float> %491, i32 0
  %493 = fcmp oeq float %492, 1.000000e+00
  br i1 %493, label %494, label %498

494:                                              ; preds = %354
  %495 = extractelement <4 x float> %491, i32 2
  %496 = fmul fast float %495, 1.100000e+02
  %497 = fadd fast float %496, -1.000000e+01
  br label %543

498:                                              ; preds = %354
  %499 = tail call float @air.fast_sqrt.f32(float %439) #1
  %500 = fmul fast half %436, 0xH4100
  %501 = fpext half %500 to float
  %502 = extractelement <4 x float> %475, i32 2
  %503 = fmul fast float %502, 5.000000e-01
  %504 = insertelement <3 x float> undef, float %503, i32 0
  %505 = shufflevector <3 x float> %504, <3 x float> undef, <3 x i32> zeroinitializer
  %506 = fsub fast float 1.000000e+00, %502
  %507 = insertelement <3 x float> undef, float %506, i32 0
  %508 = shufflevector <3 x float> %507, <3 x float> undef, <3 x i32> zeroinitializer
  %509 = fsub fast <3 x float> %484, %485
  %510 = fmul fast <3 x float> %509, %508
  %511 = fadd fast <3 x float> %510, %505
  %512 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 10
  %513 = load float, ptr addrspace(2) %512, align 16, !tbaa !53
  %514 = insertelement <2 x float> undef, float %513, i32 0
  %515 = shufflevector <2 x float> %514, <2 x float> undef, <2 x i32> zeroinitializer
  %516 = shufflevector <4 x float> %491, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %517 = fmul fast <2 x float> %516, splat (float 2.550000e+02)
  %518 = shufflevector <3 x float> %511, <3 x float> undef, <2 x i32> <i32 0, i32 1>
  %519 = fadd fast <2 x float> %518, %517
  %520 = fmul fast <2 x float> %515, %519
  %521 = shufflevector <2 x float> %520, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 poison>
  %522 = shufflevector <3 x float> %521, <3 x float> %511, <3 x i32> <i32 0, i32 1, i32 5>
  %523 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %10, ptr addrspace(2) captures(none) %11, <3 x float> %522, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %524 = extractelement <4 x float> %523, i32 0
  %525 = fmul fast float %524, 1.000000e+01
  %526 = fadd fast float %525, -6.000000e+00
  %527 = fmul fast half %442, 0xH34CD
  %528 = fpext half %527 to float
  %529 = fmul fast float %445, 0x3FF5A1CAC0000000
  %530 = extractelement <3 x float> %480, i32 1
  %531 = fmul fast float %530, 0x3FC99999A0000000
  %532 = fadd fast float %531, %529
  %533 = tail call float @air.fast_sin.f32(float %532) #1
  %534 = fmul fast float %533, %528
  %535 = fsub fast float %526, %534
  %536 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 11
  %537 = load <4 x half>, ptr addrspace(2) %536, align 8
  %538 = extractelement <4 x half> %537, i32 1
  %539 = fpext half %538 to float
  %540 = fsub fast float %501, %499
  %541 = fadd fast float %540, %539
  %542 = tail call float @air.fast_fmax.f32(float %535, float %541) #4
  br label %543

543:                                              ; preds = %498, %494
  %544 = phi float [ %497, %494 ], [ %542, %498 ]
  %545 = fptrunc float %544 to half
  %546 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 5
  %547 = load <4 x float>, ptr addrspace(2) %546, align 16
  %548 = shufflevector <4 x float> %547, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %549 = fsub fast <2 x float> %437, %548
  %550 = shufflevector <4 x float> %547, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %551 = fmul fast <2 x float> %549, %550
  %552 = fcmp olt <2 x float> %551, zeroinitializer
  %553 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %552) #4
  br i1 %553, label %562, label %554

554:                                              ; preds = %543
  %555 = fcmp ogt <2 x float> %551, splat (float 1.000000e+00)
  %556 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %555) #4
  br i1 %556, label %562, label %557

557:                                              ; preds = %554
  %558 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %8, ptr addrspace(2) captures(none) %9, <2 x float> %551, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00) #3
  %559 = extractelement <4 x half> %558, i32 1
  %560 = fmul fast half %559, 0xH4400
  %561 = tail call half @air.clamp.f16(half %560, half 0xHBC00, half 0xH0000) #4
  br label %562

562:                                              ; preds = %557, %554, %543
  %563 = phi half [ %561, %557 ], [ 0xH0000, %543 ], [ 0xH0000, %554 ]
  %564 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 6
  %565 = bitcast ptr addrspace(2) %564 to ptr addrspace(2)
  %566 = load <4 x float>, ptr addrspace(2) %565, align 16
  %567 = shufflevector <4 x float> %566, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %568 = fsub fast <3 x float> %435, %567
  %569 = fmul fast <3 x float> %568, splat (float 4.687500e-02)
  %570 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 11
  %571 = load <4 x half>, ptr addrspace(2) %570, align 8
  %572 = extractelement <4 x half> %571, i32 0
  %573 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %18, ptr addrspace(2) captures(none) %19, <3 x float> %569, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %574 = extractelement <4 x half> %573, i32 0
  %575 = fadd fast half %563, 0xH3C00
  %576 = fmul fast half %572, %575
  %577 = fmul fast half %576, %574
  %578 = fsub fast half %545, %563
  %579 = fsub fast half %578, %577
  %580 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %7, i64 0, i32 7
  %581 = load <4 x half>, ptr addrspace(2) %580, align 16
  %582 = extractelement <4 x half> %581, i32 3
  %583 = fmul fast half %582, 0xH3266
  %584 = fpext half %583 to float
  %585 = fmul fast half %579, 0xH4700
  %586 = fpext half %585 to float
  %587 = fsub fast float 2.500000e-01, %586
  %588 = tail call float @air.fast_fmax.f32(float 0.000000e+00, float %587) #4
  %589 = fmul fast float %588, %355
  %590 = fmul fast float %589, %584
  %591 = shufflevector <4 x float> %216, <4 x float> undef, <2 x i32> <i32 0, i32 2>
  %592 = load <4 x float>, ptr addrspace(2) %546, align 16
  %593 = shufflevector <4 x float> %592, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %594 = fsub fast <2 x float> %591, %593
  %595 = shufflevector <4 x float> %592, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %596 = fmul fast <2 x float> %594, %595
  %597 = fcmp olt <2 x float> %596, zeroinitializer
  %598 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %597) #4
  br i1 %598, label %612, label %599

599:                                              ; preds = %562
  %600 = fcmp ogt <2 x float> %596, splat (float 1.000000e+00)
  %601 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %600) #4
  br i1 %601, label %612, label %602

602:                                              ; preds = %599
  %603 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %8, ptr addrspace(2) captures(none) %9, <2 x float> %596, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00) #3
  %604 = extractelement <4 x half> %603, i32 1
  %605 = fmul fast half %604, 0xH4400
  %606 = tail call half @air.clamp.f16(half %605, half 0xHBC00, half 0xH0000) #4
  %607 = insertelement <2 x half> undef, half %606, i32 0
  %608 = extractelement <4 x half> %603, i32 3
  %609 = fmul fast half %608, %608
  %610 = fmul fast half %609, %608
  %611 = insertelement <2 x half> %607, half %610, i32 1
  br label %612

612:                                              ; preds = %602, %599, %562
  %613 = phi <2 x half> [ %611, %602 ], [ zeroinitializer, %562 ], [ zeroinitializer, %599 ]
  %614 = extractelement <2 x half> %613, i32 0
  %615 = fadd fast half %614, 0xH3C00
  %616 = fpext half %615 to float
  %617 = tail call float @air.fast_sqrt.f32(float %590) #1
  %618 = fmul fast float %617, -2.750000e+00
  %619 = tail call float @air.fast_exp2.f32(float %618) #1
  %620 = fmul fast float %616, %619
  %621 = fptrunc float %620 to half
  %622 = load <4 x half>, ptr addrspace(2) %422, align 16
  %623 = shufflevector <4 x half> %622, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %624 = fsub fast <3 x half> splat (half 0xH8000), %623
  %625 = tail call half @air.dot.v3f16(<3 x half> %401, <3 x half> %624) #4
  %626 = fpext half %625 to float
  %627 = fmul fast half %621, %363
  %628 = tail call half @air.clamp.f16(half %627, half 0xH0000, half 0xH3C00) #4
  %629 = tail call half @air.mix.f16(half 0xH3266, half 0xH1D1F, half %628) #4
  %630 = fpext half %629 to float
  %631 = fsub fast float 1.000000e+00, %626
  %632 = fadd fast float %631, %630
  %633 = fdiv fast float 2.000000e+00, %630, !fpmath !51
  %634 = fadd fast float %633, 1.000000e+00
  %635 = tail call float @air.fast_log.f32(float %634) #1
  %636 = fmul fast float %630, %635
  %637 = fmul fast float %636, %632
  %638 = fdiv fast float %630, %637
  %639 = fpext half %621 to float
  %640 = fmul fast float %639, 8.000000e+00
  %641 = fmul fast float %640, %638
  %642 = fptrunc float %641 to half
  %643 = load <4 x half>, ptr addrspace(2) %580, align 16
  %644 = shufflevector <4 x half> %643, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %645 = load <4 x half>, ptr addrspace(2) %407, align 8
  %646 = shufflevector <4 x half> %645, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %647 = insertelement <3 x half> undef, half %363, i32 0
  %648 = shufflevector <3 x half> %647, <3 x half> undef, <3 x i32> zeroinitializer
  %649 = fmul fast <3 x half> %646, %648
  %650 = fmul fast half %621, 0xH399A
  %651 = fmul fast half %363, 0xH3800
  %652 = fadd fast half %651, 0xH3800
  %653 = fmul fast half %642, %652
  %654 = fadd fast half %653, %650
  %655 = insertelement <3 x half> undef, half %654, i32 0
  %656 = shufflevector <3 x half> %655, <3 x half> undef, <3 x i32> zeroinitializer
  %657 = fmul fast <3 x half> %649, %656
  %658 = fmul fast <3 x half> %421, splat (half 0xH3A00)
  %659 = fmul fast half %388, 0xH3800
  %660 = fmul fast half %659, %621
  %661 = insertelement <3 x half> undef, half %660, i32 0
  %662 = shufflevector <3 x half> %661, <3 x half> undef, <3 x i32> zeroinitializer
  %663 = fmul fast <3 x half> %646, %662
  %664 = fadd fast <3 x half> %663, splat (half 0xH3D0D)
  %665 = fmul fast <3 x half> %658, %664
  %666 = fadd fast <3 x half> %657, %665
  %667 = fmul fast <3 x half> %666, %644
  %668 = shufflevector <2 x half> %613, <2 x half> undef, <3 x i32> <i32 1, i32 1, i32 1>
  %669 = fmul fast <3 x half> %668, <half 0xH4200, half 0xH3666, half 0xH2E66>
  %670 = fmul fast <3 x half> %669, %667
  %671 = fadd fast <3 x half> %670, %667
  %672 = shufflevector <3 x half> %671, <3 x half> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %673 = shufflevector <4 x half> %252, <4 x half> %672, <4 x i32> <i32 4, i32 5, i32 6, i32 3>
  %674 = extractelement <2 x float> %240, i32 1
  %675 = fsub fast float -0.000000e+00, %674
  %676 = insertelement <4 x float> %242, float %675, i32 1
  %677 = extractelement <4 x float> %201, i32 2
  %678 = fadd fast float %677, %256
  %679 = fmul fast float %678, 5.000000e-01
  %680 = insertelement <4 x float> %676, float %679, i32 2
  %681 = insertvalue %struct.xlatMtlShaderOutput.packed undef, <4 x float> %680, 0
  %682 = insertvalue %struct.xlatMtlShaderOutput.packed %681, <4 x float> %121, 1
  %683 = insertvalue %struct.xlatMtlShaderOutput.packed %682, half %46, 2
  %684 = insertvalue %struct.xlatMtlShaderOutput.packed %683, half %258, 3
  %685 = insertvalue %struct.xlatMtlShaderOutput.packed %684, float %256, 4
  %686 = insertvalue %struct.xlatMtlShaderOutput.packed %685, half %255, 5
  %687 = insertvalue %struct.xlatMtlShaderOutput.packed %686, <4 x half> %673, 6
  %688 = insertvalue %struct.xlatMtlShaderOutput.packed %687, <2 x half> zeroinitializer, 7
  %689 = insertvalue %struct.xlatMtlShaderOutput.packed %688, half %27, 8
  ret %struct.xlatMtlShaderOutput.packed %689
}

; Function Attrs: nounwind memory(none)
declare float @air.fast_log.f32(float) #1

declare half @air.mix.f16(half, half, half) #2

declare half @air.clamp.f16(half, half, half) #2

declare half @air.dot.v3f16(<3 x half>, <3 x half>) #2

; Function Attrs: nounwind memory(none)
declare float @air.fast_exp2.f32(float) #1

; Function Attrs: nounwind memory(none)
declare float @air.fast_sqrt.f32(float) #1

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <2 x float>, i1, <2 x i32>, i1, float) #3

declare zeroext i1 @air.any.v2i1(<2 x i1>) #2

declare float @air.fast_fmax.f32(float, float) #2

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <3 x float>, i1, <3 x i32>, i1, float) #3

; Function Attrs: nounwind memory(none)
declare float @air.fast_sin.f32(float) #1

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <3 x float>, i1, <3 x i32>, i1, float) #3

; Function Attrs: nounwind memory(none)
declare <3 x float> @air.fast_floor.v3f32(<3 x float>) #1

declare float @air.dot.v3f32(<3 x float>, <3 x float>) #2

declare <3 x half> @air.mix.v3f16(<3 x half>, <3 x half>, <3 x half>) #2

; Function Attrs: nounwind memory(none)
declare half @air.exp2.f16(half) #1

; Function Attrs: nounwind memory(none)
declare float @air.fast_rsqrt.f32(float) #1

declare float @air.fast_clamp.f32(float, float, float) #2

declare <4 x float> @air.mix.v4f32(<4 x float>, <4 x float>, <4 x float>) #2

declare float @air.dot.v2f32(<2 x float>, <2 x float>) #2

; Function Attrs: nounwind memory(none)
declare float @air.fast_cos.f32(float) #1

; Function Attrs: nounwind memory(none)
declare float @air.fast_floor.f32(float) #1

; Function Attrs: nounwind memory(none)
declare half @air.floor.f16(half) #1

declare half @air.fract.f16(half) #2

; Function Attrs: nounwind memory(none)
declare float @air.fabs.f32(float) #1

attributes #0 = { noduplicate nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { nounwind memory(none) }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="true" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="-fp16" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #3 = { noduplicate nounwind memory(read) }
attributes #4 = { nounwind }

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
!7 = !{ptr @vsMain, !8, !18}
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16, !17}
!9 = !{!"air.position", !"air.arg_type_name", !"float4", !"air.arg_name", !"gl_Position"}
!10 = !{!"air.vertex_output", !"generated(4v_uvDv4_f)", !"air.arg_type_name", !"float4", !"air.arg_name", !"v_uv"}
!11 = !{!"air.vertex_output", !"generated(14v_frame2WeightDh)", !"air.arg_type_name", !"half", !"air.arg_name", !"v_frame2Weight"}
!12 = !{!"air.vertex_output", !"generated(8v_radiusDh)", !"air.arg_type_name", !"half", !"air.arg_name", !"v_radius"}
!13 = !{!"air.vertex_output", !"generated(11v_fragDepthf)", !"air.arg_type_name", !"float", !"air.arg_name", !"v_fragDepth"}
!14 = !{!"air.vertex_output", !"generated(19v_softParticleScaleDh)", !"air.arg_type_name", !"half", !"air.arg_name", !"v_softParticleScale"}
!15 = !{!"air.vertex_output", !"generated(7v_colorDv4_Dh)", !"air.arg_type_name", !"half4", !"air.arg_name", !"v_color"}
!16 = !{!"air.vertex_output", !"generated(7v_uvVelDv2_Dh)", !"air.arg_type_name", !"half2", !"air.arg_name", !"v_uvVel"}
!17 = !{!"air.vertex_output", !"generated(18v_externalLightingDh)", !"air.arg_type_name", !"half", !"air.arg_name", !"v_externalLighting"}
!18 = !{!19, !20, !21, !22, !23, !24, !25, !26, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41}
!19 = !{i32 0, !"air.vertex_input", !"air.location_index", i32 0, i32 1, !"generated(10a_positionDv3_f)", !"air.arg_type_name", !"float3", !"air.arg_name", !"a_position"}
!20 = !{i32 1, !"air.vertex_input", !"air.location_index", i32 1, i32 1, !"generated(11a_userdata0Dv3_f)", !"air.arg_type_name", !"float3", !"air.arg_name", !"a_userdata0"}
!21 = !{i32 2, !"air.vertex_input", !"air.location_index", i32 2, i32 1, !"generated(7a_colorDv4_f)", !"air.arg_type_name", !"float4", !"air.arg_name", !"a_color"}
!22 = !{i32 3, !"air.vertex_input", !"air.location_index", i32 3, i32 1, !"generated(5a_uv0Dv4_f)", !"air.arg_type_name", !"float4", !"air.arg_name", !"a_uv0"}
!23 = !{i32 4, !"air.vertex_input", !"air.location_index", i32 4, i32 1, !"generated(5a_uv1Dv4_f)", !"air.arg_type_name", !"float4", !"air.arg_name", !"a_uv1"}
!24 = !{i32 5, !"air.vertex_input", !"air.location_index", i32 5, i32 1, !"generated(5a_uv2Dv4_f)", !"air.arg_type_name", !"float4", !"air.arg_name", !"a_uv2"}
!25 = !{i32 6, !"air.vertex_input", !"air.location_index", i32 6, i32 1, !"generated(11a_userdata3f)", !"air.arg_type_name", !"float", !"air.arg_name", !"a_userdata3"}
!26 = !{i32 7, !"air.buffer", !"air.buffer_size", i32 528, !"air.location_index", i32 9, i32 1, !"air.read", !"air.struct_type_info", !27, !"air.arg_type_size", i32 528, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"xlatMtlShaderUniform", !"air.arg_name", !"_mtl_u"}
!27 = !{i32 0, i32 8, i32 0, !"half3", !"u_sunDir", i32 8, i32 8, i32 0, !"half3", !"u_sunColor", i32 16, i32 8, i32 0, !"half3", !"u_averageSkyColor", i32 24, i32 8, i32 0, !"half3", !"u_pointLight", i32 32, i32 4, i32 0, !"float", !"u_time", i32 48, i32 16, i32 0, !"float4", !"u_waterSimTerms", i32 64, i32 16, i32 0, !"float3", !"u_cloudWindScroll", i32 80, i32 8, i32 0, !"half4", !"u_cloudMat", i32 96, i32 16, i32 0, !"float3", !"u_cloudBinMinWorld", i32 112, i32 16, i32 0, !"float3", !"u_cloudBinRangeWorld", i32 128, i32 4, i32 0, !"float", !"u_cloudPackedBinDimInv", i32 136, i32 8, i32 0, !"half4", !"u_cloudNoiseTweaks", i32 144, i32 16, i32 0, !"float4", !"u_cloudVoxelScales", i32 160, i32 2, i32 0, !"half", !"u_cloudUndulationScale", i32 176, i32 64, i32 0, !"float4x4", !"u_viewProj", i32 240, i32 16, i32 0, !"float3", !"u_eyePos", i32 256, i32 8, i32 0, !"float2", !"u_jitterHalf", i32 272, i32 64, i32 0, !"float4x4", !"u_proj", i32 336, i32 64, i32 0, !"float4x4", !"u_viewProjInv", i32 400, i32 64, i32 0, !"float4x4", !"u_viewProjOld", i32 464, i32 2, i32 0, !"half", !"u_animCellsX", i32 466, i32 2, i32 0, !"half", !"u_animCellsY", i32 480, i32 16, i32 0, !"float3", !"u_projPlaneU", i32 496, i32 16, i32 0, !"float3", !"u_projPlaneV", i32 512, i32 16, i32 0, !"float3", !"u_projPlaneOrigin"}
!28 = !{i32 8, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<half, sample>", !"air.arg_name", !"u_waterSim"}
!29 = !{i32 9, !"air.sampler", !"air.location_index", i32 0, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_waterSim"}
!30 = !{i32 10, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<float, sample>", !"air.arg_name", !"u_cloudDist"}
!31 = !{i32 11, !"air.sampler", !"air.location_index", i32 1, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudDist"}
!32 = !{i32 12, !"air.texture", !"air.location_index", i32 2, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<half, sample>", !"air.arg_name", !"u_cloudAmb0"}
!33 = !{i32 13, !"air.sampler", !"air.location_index", i32 2, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudAmb0"}
!34 = !{i32 14, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<half, sample>", !"air.arg_name", !"u_cloudAmb1"}
!35 = !{i32 15, !"air.sampler", !"air.location_index", i32 3, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudAmb1"}
!36 = !{i32 16, !"air.texture", !"air.location_index", i32 4, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<half, sample>", !"air.arg_name", !"u_cloudAmb2"}
!37 = !{i32 17, !"air.sampler", !"air.location_index", i32 4, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudAmb2"}
!38 = !{i32 18, !"air.texture", !"air.location_index", i32 5, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<half, sample>", !"air.arg_name", !"u_cloudNoise3D"}
!39 = !{i32 19, !"air.sampler", !"air.location_index", i32 5, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudNoise3D"}
!40 = !{i32 20, !"air.texture", !"air.location_index", i32 6, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<float, sample>", !"air.arg_name", !"u_cloudSparse"}
!41 = !{i32 21, !"air.sampler", !"air.location_index", i32 6, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudSparse"}
!42 = !{!43, !47, i64 464}
!43 = !{!"_ZTS20xlatMtlShaderUniform", !44, i64 0, !44, i64 8, !44, i64 16, !44, i64 24, !46, i64 32, !44, i64 48, !44, i64 64, !44, i64 80, !44, i64 96, !44, i64 112, !46, i64 128, !44, i64 136, !44, i64 144, !47, i64 160, !48, i64 176, !44, i64 240, !44, i64 256, !48, i64 272, !48, i64 336, !48, i64 400, !47, i64 464, !47, i64 466, !44, i64 480, !44, i64 496, !44, i64 512}
!44 = !{!"omnipotent char", !45, i64 0}
!45 = !{!"Simple C++ TBAA"}
!46 = !{!"float", !44, i64 0}
!47 = !{!"half", !44, i64 0}
!48 = !{!"_ZTSN5metal6matrixIfLi4ELi4EEE", !44, i64 0}
!49 = !{!43, !47, i64 466}
!50 = !{!44, !44, i64 0}
!51 = !{float 2.500000e+00}
!52 = !{!43, !44, i64 256}
!53 = !{!43, !46, i64 128}
!54 = !{!43, !47, i64 160}
!55 = !{!43, !46, i64 32}
