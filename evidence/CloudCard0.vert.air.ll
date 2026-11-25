; ModuleID = 'CloudCard0.vert.osx.metallib'
source_filename = "CloudCard0.vert.osx.metallib"
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v16:16:16-v24:32:32-v32:32:32-v48:64:64-v64:64:64-v96:128:128-v128:128:128-v192:256:256-v256:256:256-v512:512:512-v1024:1024:1024-f80:128:128-n8:16:32"
target triple = "air64-apple-macosx10.11.0"

%struct.xlatMtlShaderOutput.packed = type <{ <4 x float>, <2 x float>, <3 x float>, <3 x half>, <3 x float>, <3 x half>, half, <2 x half> }>
%struct.xlatMtlShaderUniform = type { <3 x half>, <3 x half>, <3 x half>, <3 x half>, float, <4 x float>, <3 x float>, <4 x half>, <3 x float>, <3 x float>, float, <4 x half>, <4 x float>, half, %"class.metal::matrix", <3 x float>, <2 x float>, <3 x float>, <3 x float>, <3 x float> }
%"class.metal::matrix" = type { [4 x <4 x float>] }

; Function Attrs: noduplicate nounwind
define %struct.xlatMtlShaderOutput.packed @vsMain(<3 x float> %0, <4 x float> %1, <4 x float> %2, <4 x float> %3, <4 x float> %4, ptr addrspace(2) readonly %5, ptr addrspace(1) %6, ptr addrspace(2) readonly captures(none) %7, ptr addrspace(1) %8, ptr addrspace(2) readonly captures(none) %9, ptr addrspace(1) %10, ptr addrspace(2) readonly captures(none) %11, ptr addrspace(1) %12, ptr addrspace(2) readonly captures(none) %13, ptr addrspace(1) %14, ptr addrspace(2) readonly captures(none) %15) #0 {
  %17 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 15
  %18 = bitcast ptr addrspace(2) %17 to ptr addrspace(2)
  %19 = load <4 x float>, ptr addrspace(2) %18, align 16
  %20 = shufflevector <4 x float> %19, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %21 = fsub fast <3 x float> %20, %0
  %22 = tail call float @air.dot.v3f32(<3 x float> %21, <3 x float> %21) #4
  %23 = bitcast ptr addrspace(2) %5 to ptr addrspace(2)
  %24 = load <4 x half>, ptr addrspace(2) %23, align 16
  %25 = shufflevector <4 x half> %24, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %26 = shufflevector <4 x float> %2, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %27 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 4
  %28 = load float, ptr addrspace(2) %27, align 16, !tbaa !35
  %29 = insertelement <2 x float> undef, float %28, i32 0
  %30 = shufflevector <2 x float> %29, <2 x float> undef, <2 x i32> zeroinitializer
  %31 = fmul fast <2 x float> %30, <float 0x3FB99999A0000000, float 0.000000e+00>
  %32 = fadd fast <2 x float> %31, %26
  %33 = fmul fast <2 x float> %32, splat (float 0x3FC99999A0000000)
  %34 = fmul fast <2 x float> %26, splat (float 2.500000e-01)
  %35 = fmul fast <2 x float> %30, <float 0.000000e+00, float 0x3FA99999A0000000>
  %36 = fadd fast <2 x float> %35, %34
  %37 = fmul fast <2 x float> %36, splat (float 0x3FC99999A0000000)
  %38 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %14, ptr addrspace(2) captures(none) %15, <2 x float> %33, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00) #3
  %39 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %14, ptr addrspace(2) captures(none) %15, <2 x float> %37, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00) #3
  %40 = fadd fast <4 x half> %39, %38
  %41 = shufflevector <4 x half> %40, <4 x half> undef, <2 x i32> <i32 0, i32 1>
  %42 = fmul fast <2 x half> %41, <half 0xH211F, half 0xH191F>
  %43 = fadd fast <2 x half> %42, <half 0xHA11F, half 0xH991F>
  %44 = extractelement <2 x half> %43, i32 0
  %45 = fpext half %44 to float
  %46 = insertelement <2 x float> undef, float %45, i32 0
  %47 = extractelement <2 x half> %43, i32 1
  %48 = fpext half %47 to float
  %49 = insertelement <2 x float> %46, float %48, i32 1
  %50 = extractelement <4 x float> %1, i32 0
  %51 = fptrunc float %50 to half
  %52 = extractelement <4 x float> %1, i32 1
  %53 = fptrunc float %52 to half
  %54 = extractelement <4 x float> %1, i32 2
  %55 = fptrunc float %54 to half
  %56 = shufflevector <3 x float> %0, <3 x float> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 poison>
  %57 = extractelement <4 x float> %1, i32 3
  %58 = fmul fast float %57, 5.000000e-01
  %59 = fadd fast float %58, 5.000000e-01
  %60 = tail call float @air.fast_pow.f32(float %59, float 4.000000e+00) #4
  %61 = shufflevector <4 x float> <float undef, float undef, float undef, float 1.000000e+00>, <4 x float> %56, <4 x i32> <i32 4, i32 5, i32 6, i32 3>
  %62 = shufflevector <3 x float> %0, <3 x float> undef, <4 x i32> zeroinitializer
  %63 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 14, i32 0, i64 0
  %64 = load <4 x float>, ptr addrspace(2) %63, align 16, !tbaa !42
  %65 = fmul fast <4 x float> %64, %62
  br label %66

66:                                               ; preds = %66, %16
  %67 = phi i32 [ 1, %16 ], [ %77, %66 ]
  %68 = phi <4 x float> [ %65, %16 ], [ %76, %66 ]
  %69 = extractelement <4 x float> %61, i32 %67
  %70 = insertelement <4 x float> undef, float %69, i32 0
  %71 = shufflevector <4 x float> %70, <4 x float> undef, <4 x i32> zeroinitializer
  %72 = sext i32 %67 to i64
  %73 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 14, i32 0, i64 %72
  %74 = load <4 x float>, ptr addrspace(2) %73, align 16, !tbaa !42
  %75 = fmul fast <4 x float> %74, %71
  %76 = fadd fast <4 x float> %75, %68
  %77 = add nuw nsw i32 %67, 1
  %78 = icmp eq i32 %77, 4
  br i1 %78, label %79, label %66

79:                                               ; preds = %66
  %80 = tail call float @air.fast_sqrt.f32(float %22) #1
  %81 = fsub fast <3 x half> splat (half 0xH8000), %25
  %82 = fadd fast <2 x float> %49, %26
  %83 = insertelement <3 x half> undef, half %51, i32 0
  %84 = insertelement <3 x half> %83, half %53, i32 1
  %85 = insertelement <3 x half> %84, half %55, i32 2
  %86 = fptrunc float %60 to half
  %87 = shufflevector <4 x float> %76, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %88 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 16
  %89 = load <2 x float>, ptr addrspace(2) %88, align 16, !tbaa !43
  %90 = shufflevector <4 x float> %76, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %91 = fmul fast <2 x float> %90, splat (float 2.000000e+00)
  %92 = fmul fast <2 x float> %91, %89
  %93 = fsub fast <2 x float> %87, %92
  %94 = shufflevector <2 x float> %93, <2 x float> undef, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %95 = shufflevector <4 x float> %76, <4 x float> %94, <4 x i32> <i32 4, i32 5, i32 2, i32 3>
  %96 = shufflevector <4 x float> %95, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %97 = fdiv fast <2 x float> %96, %90, !fpmath !44
  %98 = fmul fast <2 x float> %97, splat (float 5.000000e-01)
  %99 = fadd fast <2 x float> %98, splat (float 5.000000e-01)
  %100 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 19
  %101 = bitcast ptr addrspace(2) %100 to ptr addrspace(2)
  %102 = load <4 x float>, ptr addrspace(2) %101, align 16
  %103 = shufflevector <4 x float> %102, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %104 = shufflevector <2 x float> %99, <2 x float> undef, <3 x i32> zeroinitializer
  %105 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 17
  %106 = bitcast ptr addrspace(2) %105 to ptr addrspace(2)
  %107 = load <4 x float>, ptr addrspace(2) %106, align 16
  %108 = shufflevector <4 x float> %107, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %109 = fmul fast <3 x float> %104, %108
  %110 = fadd fast <3 x float> %109, %103
  %111 = shufflevector <2 x float> %99, <2 x float> undef, <3 x i32> <i32 1, i32 1, i32 1>
  %112 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 18
  %113 = bitcast ptr addrspace(2) %112 to ptr addrspace(2)
  %114 = load <4 x float>, ptr addrspace(2) %113, align 16
  %115 = shufflevector <4 x float> %114, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %116 = fmul fast <3 x float> %111, %115
  %117 = fadd fast <3 x float> %110, %116
  %118 = tail call float @air.dot.v3f32(<3 x float> %117, <3 x float> %117) #4
  %119 = tail call float @air.fast_rsqrt.f32(float %118) #1
  %120 = insertelement <3 x float> undef, float %119, i32 0
  %121 = shufflevector <3 x float> %120, <3 x float> undef, <3 x i32> zeroinitializer
  %122 = fmul fast <3 x float> %117, %121
  %123 = extractelement <4 x float> %4, i32 1
  %124 = fmul fast float %123, %123
  %125 = fptrunc float %124 to half
  %126 = fmul fast <4 x float> %3, %3
  %127 = shufflevector <4 x float> %126, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %128 = shufflevector <4 x float> %3, <4 x float> undef, <3 x i32> <i32 3, i32 3, i32 3>
  %129 = fdiv fast <3 x float> %127, %128, !fpmath !44
  %130 = extractelement <3 x float> %129, i32 0
  %131 = fptrunc float %130 to half
  %132 = insertelement <3 x half> undef, half %131, i32 0
  %133 = extractelement <3 x float> %129, i32 1
  %134 = fptrunc float %133 to half
  %135 = insertelement <3 x half> %132, half %134, i32 1
  %136 = extractelement <3 x float> %129, i32 2
  %137 = fptrunc float %136 to half
  %138 = insertelement <3 x half> %135, half %137, i32 2
  %139 = extractelement <4 x float> %4, i32 0
  %140 = fptrunc float %139 to half
  %141 = extractelement <4 x float> %4, i32 3
  %142 = extractelement <4 x float> %4, i32 2
  %143 = fmul fast float %142, 2.550000e+02
  %144 = fadd fast float %143, -1.280000e+02
  %145 = tail call float @air.fast_exp2.f32(float %144) #1
  %146 = fmul fast float %145, %141
  %147 = fptrunc float %146 to half
  %148 = extractelement <3 x float> %122, i32 0
  %149 = fptrunc float %148 to half
  %150 = insertelement <3 x half> undef, half %149, i32 0
  %151 = extractelement <3 x float> %122, i32 1
  %152 = fptrunc float %151 to half
  %153 = insertelement <3 x half> %150, half %152, i32 1
  %154 = extractelement <3 x float> %122, i32 2
  %155 = fptrunc float %154 to half
  %156 = insertelement <3 x half> %153, half %155, i32 2
  %157 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 2
  %158 = bitcast ptr addrspace(2) %157 to ptr addrspace(2)
  %159 = load <4 x half>, ptr addrspace(2) %158, align 16
  %160 = shufflevector <4 x half> %159, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %161 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 1
  %162 = bitcast ptr addrspace(2) %161 to ptr addrspace(2)
  %163 = load <4 x half>, ptr addrspace(2) %162, align 8
  %164 = shufflevector <4 x half> %163, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %165 = insertelement <3 x half> undef, half %140, i32 0
  %166 = shufflevector <3 x half> %165, <3 x half> undef, <3 x i32> zeroinitializer
  %167 = tail call <3 x half> @air.mix.v3f16(<3 x half> %160, <3 x half> %164, <3 x half> %166) #4
  %168 = fmul fast <3 x half> %167, %138
  %169 = insertelement <3 x half> undef, half %147, i32 0
  %170 = shufflevector <3 x half> %169, <3 x half> undef, <3 x i32> zeroinitializer
  %171 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 3
  %172 = bitcast ptr addrspace(2) %171 to ptr addrspace(2)
  %173 = load <4 x half>, ptr addrspace(2) %172, align 8
  %174 = shufflevector <4 x half> %173, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %175 = fmul fast <3 x half> %174, %170
  %176 = fadd fast <3 x half> %175, %168
  %177 = load <4 x half>, ptr addrspace(2) %23, align 16
  %178 = shufflevector <4 x half> %177, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %179 = fmul fast <3 x half> %178, splat (half 0xH4100)
  %180 = extractelement <3 x half> %179, i32 0
  %181 = fpext half %180 to float
  %182 = insertelement <3 x float> undef, float %181, i32 0
  %183 = extractelement <3 x half> %179, i32 1
  %184 = fpext half %183 to float
  %185 = insertelement <3 x float> %182, float %184, i32 1
  %186 = extractelement <3 x half> %179, i32 2
  %187 = fpext half %186 to float
  %188 = insertelement <3 x float> %185, float %187, i32 2
  %189 = fsub fast <3 x float> %0, %188
  %190 = tail call half @air.dot.v3f16(<3 x half> %156, <3 x half> %178) #4
  %191 = shufflevector <3 x float> %189, <3 x float> undef, <2 x i32> <i32 0, i32 2>
  %192 = extractelement <3 x float> %189, i32 1
  %193 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 13
  %194 = load half, ptr addrspace(2) %193, align 16, !tbaa !45
  %195 = fpext half %194 to float
  %196 = load float, ptr addrspace(2) %27, align 16, !tbaa !35
  %197 = fmul fast float %196, 0x3FB7DF3B60000000
  %198 = extractelement <3 x float> %189, i32 0
  %199 = fmul fast float %198, 0x3FC99999A0000000
  %200 = fadd fast float %199, %192
  %201 = fmul fast float %200, 0x3FC0A3D700000000
  %202 = fadd fast float %201, %197
  %203 = tail call float @air.fast_sin.f32(float %202) #1
  %204 = fmul fast float %203, 2.500000e-01
  %205 = fmul fast float %196, 0x3FC7DF3B60000000
  %206 = extractelement <3 x float> %189, i32 2
  %207 = fmul fast float %192, 0x3FC99999A0000000
  %208 = fsub fast float %207, %206
  %209 = fmul fast float %208, 0x3FB0A3D700000000
  %210 = fadd fast float %209, %205
  %211 = tail call float @air.fast_sin.f32(float %210) #1
  %212 = fmul fast float %211, 5.000000e-01
  %213 = fmul fast float %196, 0x3FD7DF3B60000000
  %214 = fmul fast float %206, 0x3FC99999A0000000
  %215 = fsub fast float %214, %198
  %216 = fmul fast float %215, 0x3FA0A3D700000000
  %217 = fadd fast float %216, %213
  %218 = tail call float @air.fast_sin.f32(float %217) #1
  %219 = fadd fast float %204, -1.000000e+00
  %220 = fadd fast float %219, %212
  %221 = fadd fast float %220, %218
  %222 = fmul fast float %195, 2.000000e+00
  %223 = fmul fast float %222, %221
  %224 = fadd fast float %223, %192
  %225 = insertelement <3 x float> %189, float %224, i32 1
  %226 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 12
  %227 = load <4 x float>, ptr addrspace(2) %226, align 16
  %228 = extractelement <4 x float> %227, i32 0
  %229 = fmul fast float %228, 5.000000e-01
  %230 = insertelement <3 x float> undef, float %229, i32 0
  %231 = shufflevector <3 x float> %230, <3 x float> undef, <3 x i32> zeroinitializer
  %232 = fsub fast <3 x float> %225, %231
  %233 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 8
  %234 = bitcast ptr addrspace(2) %233 to ptr addrspace(2)
  %235 = load <4 x float>, ptr addrspace(2) %234, align 16
  %236 = shufflevector <4 x float> %235, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %237 = fsub fast <3 x float> %232, %236
  %238 = fdiv fast <3 x float> %237, splat (float 1.600000e+01), !fpmath !44
  %239 = tail call <3 x float> @air.fast_floor.v3f32(<3 x float> %238) #1
  %240 = fadd fast <3 x float> %239, splat (float 5.000000e-01)
  %241 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 9
  %242 = bitcast ptr addrspace(2) %241 to ptr addrspace(2)
  %243 = load <4 x float>, ptr addrspace(2) %242, align 16
  %244 = shufflevector <4 x float> %243, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %245 = fdiv fast <3 x float> splat (float 1.600000e+01), %244, !fpmath !44
  %246 = fmul fast <3 x float> %245, %240
  %247 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %12, ptr addrspace(2) captures(none) %13, <3 x float> %246, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %248 = extractelement <4 x float> %247, i32 0
  %249 = fcmp oeq float %248, 1.000000e+00
  br i1 %249, label %250, label %254

250:                                              ; preds = %79
  %251 = extractelement <4 x float> %247, i32 2
  %252 = fmul fast float %251, 1.100000e+02
  %253 = fadd fast float %252, -1.000000e+01
  br label %298

254:                                              ; preds = %79
  %255 = fmul fast half %190, 0xH4100
  %256 = fpext half %255 to float
  %257 = extractelement <4 x float> %227, i32 2
  %258 = fmul fast float %257, 5.000000e-01
  %259 = insertelement <3 x float> undef, float %258, i32 0
  %260 = shufflevector <3 x float> %259, <3 x float> undef, <3 x i32> zeroinitializer
  %261 = fsub fast float 1.000000e+00, %257
  %262 = insertelement <3 x float> undef, float %261, i32 0
  %263 = shufflevector <3 x float> %262, <3 x float> undef, <3 x i32> zeroinitializer
  %264 = fsub fast <3 x float> %238, %239
  %265 = fmul fast <3 x float> %264, %263
  %266 = fadd fast <3 x float> %265, %260
  %267 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 10
  %268 = load float, ptr addrspace(2) %267, align 16, !tbaa !46
  %269 = insertelement <2 x float> undef, float %268, i32 0
  %270 = shufflevector <2 x float> %269, <2 x float> undef, <2 x i32> zeroinitializer
  %271 = shufflevector <4 x float> %247, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %272 = fmul fast <2 x float> %271, splat (float 2.550000e+02)
  %273 = shufflevector <3 x float> %266, <3 x float> undef, <2 x i32> <i32 0, i32 1>
  %274 = fadd fast <2 x float> %273, %272
  %275 = fmul fast <2 x float> %270, %274
  %276 = shufflevector <2 x float> %275, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 poison>
  %277 = shufflevector <3 x float> %276, <3 x float> %266, <3 x i32> <i32 0, i32 1, i32 5>
  %278 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %8, ptr addrspace(2) captures(none) %9, <3 x float> %277, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %279 = extractelement <4 x float> %278, i32 0
  %280 = fmul fast float %279, 1.000000e+01
  %281 = fadd fast float %280, -6.000000e+00
  %282 = fmul fast half %194, 0xH34CD
  %283 = fpext half %282 to float
  %284 = fmul fast float %196, 0x3FF5A1CAC0000000
  %285 = extractelement <3 x float> %232, i32 1
  %286 = fmul fast float %285, 0x3FC99999A0000000
  %287 = fadd fast float %286, %284
  %288 = tail call float @air.fast_sin.f32(float %287) #1
  %289 = fmul fast float %288, %283
  %290 = fsub fast float %281, %289
  %291 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 11
  %292 = load <4 x half>, ptr addrspace(2) %291, align 8
  %293 = extractelement <4 x half> %292, i32 1
  %294 = fpext half %293 to float
  %295 = fsub fast float %256, %80
  %296 = fadd fast float %295, %294
  %297 = tail call float @air.fast_fmax.f32(float %290, float %296) #4
  br label %298

298:                                              ; preds = %254, %250
  %299 = phi float [ %253, %250 ], [ %297, %254 ]
  %300 = fptrunc float %299 to half
  %301 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 5
  %302 = load <4 x float>, ptr addrspace(2) %301, align 16
  %303 = shufflevector <4 x float> %302, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %304 = fsub fast <2 x float> %191, %303
  %305 = shufflevector <4 x float> %302, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %306 = fmul fast <2 x float> %304, %305
  %307 = fcmp olt <2 x float> %306, zeroinitializer
  %308 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %307) #4
  br i1 %308, label %317, label %309

309:                                              ; preds = %298
  %310 = fcmp ogt <2 x float> %306, splat (float 1.000000e+00)
  %311 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %310) #4
  br i1 %311, label %317, label %312

312:                                              ; preds = %309
  %313 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %6, ptr addrspace(2) captures(none) %7, <2 x float> %306, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00) #3
  %314 = extractelement <4 x half> %313, i32 1
  %315 = fmul fast half %314, 0xH4400
  %316 = tail call half @air.clamp.f16(half %315, half 0xHBC00, half 0xH0000) #4
  br label %317

317:                                              ; preds = %312, %309, %298
  %318 = phi half [ %316, %312 ], [ 0xH0000, %298 ], [ 0xH0000, %309 ]
  %319 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 6
  %320 = bitcast ptr addrspace(2) %319 to ptr addrspace(2)
  %321 = load <4 x float>, ptr addrspace(2) %320, align 16
  %322 = shufflevector <4 x float> %321, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %323 = fsub fast <3 x float> %189, %322
  %324 = fmul fast <3 x float> %323, splat (float 4.687500e-02)
  %325 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 11
  %326 = load <4 x half>, ptr addrspace(2) %325, align 8
  %327 = extractelement <4 x half> %326, i32 0
  %328 = tail call <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none) %10, ptr addrspace(2) captures(none) %11, <3 x float> %324, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %329 = extractelement <4 x half> %328, i32 0
  %330 = fadd fast half %318, 0xH3C00
  %331 = fmul fast half %327, %330
  %332 = fmul fast half %331, %329
  %333 = fsub fast half %300, %318
  %334 = fsub fast half %333, %332
  %335 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 7
  %336 = load <4 x half>, ptr addrspace(2) %335, align 16
  %337 = extractelement <4 x half> %336, i32 3
  %338 = fmul fast half %337, 0xH3266
  %339 = fpext half %338 to float
  %340 = fmul fast half %334, 0xH4700
  %341 = fpext half %340 to float
  %342 = fsub fast float 2.500000e-01, %341
  %343 = tail call float @air.fast_fmax.f32(float 0.000000e+00, float %342) #4
  %344 = fmul fast float %339, %343
  %345 = shufflevector <3 x float> %0, <3 x float> undef, <2 x i32> <i32 0, i32 2>
  %346 = load <4 x float>, ptr addrspace(2) %301, align 16
  %347 = shufflevector <4 x float> %346, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %348 = fsub fast <2 x float> %345, %347
  %349 = shufflevector <4 x float> %346, <4 x float> undef, <2 x i32> <i32 3, i32 3>
  %350 = fmul fast <2 x float> %348, %349
  %351 = fcmp olt <2 x float> %350, zeroinitializer
  %352 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %351) #4
  br i1 %352, label %366, label %353

353:                                              ; preds = %317
  %354 = fcmp ogt <2 x float> %350, splat (float 1.000000e+00)
  %355 = tail call zeroext i1 @air.any.v2i1(<2 x i1> %354) #4
  br i1 %355, label %366, label %356

356:                                              ; preds = %353
  %357 = tail call <4 x half> @air.sample_texture_2d.v4f16(ptr addrspace(1) captures(none) %6, ptr addrspace(2) captures(none) %7, <2 x float> %350, i1 true, <2 x i32> zeroinitializer, i1 false, float 0.000000e+00) #3
  %358 = extractelement <4 x half> %357, i32 1
  %359 = fmul fast half %358, 0xH4400
  %360 = tail call half @air.clamp.f16(half %359, half 0xHBC00, half 0xH0000) #4
  %361 = insertelement <2 x half> undef, half %360, i32 0
  %362 = extractelement <4 x half> %357, i32 3
  %363 = fmul fast half %362, %362
  %364 = fmul fast half %363, %362
  %365 = insertelement <2 x half> %361, half %364, i32 1
  br label %366

366:                                              ; preds = %356, %353, %317
  %367 = phi <2 x half> [ %365, %356 ], [ zeroinitializer, %317 ], [ zeroinitializer, %353 ]
  %368 = extractelement <2 x half> %367, i32 0
  %369 = fadd fast half %368, 0xH3C00
  %370 = fpext half %369 to float
  %371 = tail call float @air.fast_sqrt.f32(float %344) #1
  %372 = fmul fast float %371, -2.750000e+00
  %373 = tail call float @air.fast_exp2.f32(float %372) #1
  %374 = fmul fast float %370, %373
  %375 = fptrunc float %374 to half
  %376 = tail call half @air.dot.v3f16(<3 x half> %156, <3 x half> %81) #4
  %377 = fpext half %376 to float
  %378 = fmul fast half %375, %125
  %379 = tail call half @air.clamp.f16(half %378, half 0xH0000, half 0xH3C00) #4
  %380 = tail call half @air.mix.f16(half 0xH3266, half 0xH1D1F, half %379) #4
  %381 = fpext half %380 to float
  %382 = fsub fast float 1.000000e+00, %377
  %383 = fadd fast float %382, %381
  %384 = fdiv fast float 2.000000e+00, %381, !fpmath !44
  %385 = fadd fast float %384, 1.000000e+00
  %386 = tail call float @air.fast_log.f32(float %385) #1
  %387 = fmul fast float %381, %386
  %388 = fmul fast float %387, %383
  %389 = fdiv fast float %381, %388
  %390 = fpext half %375 to float
  %391 = fmul fast float %390, 8.000000e+00
  %392 = fmul fast float %391, %389
  %393 = fptrunc float %392 to half
  %394 = load <4 x half>, ptr addrspace(2) %335, align 16
  %395 = shufflevector <4 x half> %394, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %396 = load <4 x half>, ptr addrspace(2) %162, align 8
  %397 = shufflevector <4 x half> %396, <4 x half> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %398 = insertelement <3 x half> undef, half %125, i32 0
  %399 = shufflevector <3 x half> %398, <3 x half> undef, <3 x i32> zeroinitializer
  %400 = fmul fast <3 x half> %397, %399
  %401 = fmul fast half %375, 0xH399A
  %402 = fmul fast half %125, 0xH3800
  %403 = fadd fast half %402, 0xH3800
  %404 = fmul fast half %393, %403
  %405 = fadd fast half %404, %401
  %406 = insertelement <3 x half> undef, half %405, i32 0
  %407 = shufflevector <3 x half> %406, <3 x half> undef, <3 x i32> zeroinitializer
  %408 = fmul fast <3 x half> %400, %407
  %409 = fmul fast <3 x half> %176, splat (half 0xH3A00)
  %410 = fmul fast half %140, 0xH3800
  %411 = fmul fast half %410, %375
  %412 = insertelement <3 x half> undef, half %411, i32 0
  %413 = shufflevector <3 x half> %412, <3 x half> undef, <3 x i32> zeroinitializer
  %414 = fmul fast <3 x half> %397, %413
  %415 = fadd fast <3 x half> %414, splat (half 0xH3D0D)
  %416 = fmul fast <3 x half> %409, %415
  %417 = fadd fast <3 x half> %408, %416
  %418 = fmul fast <3 x half> %417, %395
  %419 = shufflevector <2 x half> %367, <2 x half> undef, <3 x i32> <i32 1, i32 1, i32 1>
  %420 = fmul fast <3 x half> %419, <half 0xH4200, half 0xH3666, half 0xH2E66>
  %421 = fmul fast <3 x half> %420, %418
  %422 = fadd fast <3 x half> %421, %418
  %423 = load <4 x float>, ptr addrspace(2) %234, align 16
  %424 = shufflevector <4 x float> %423, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %425 = fsub fast <3 x float> %0, %424
  %426 = load <4 x float>, ptr addrspace(2) %242, align 16
  %427 = shufflevector <4 x float> %426, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %428 = fdiv fast <3 x float> %425, %427, !fpmath !44
  %429 = tail call <3 x float> @air.fast_clamp.v3f32(<3 x float> %428, <3 x float> zeroinitializer, <3 x float> splat (float 1.000000e+00)) #4
  %430 = fcmp oeq <3 x float> %428, %429
  %431 = tail call zeroext i1 @air.all.v3i1(<3 x i1> %430) #4
  br i1 %431, label %432, label %529

432:                                              ; preds = %366
  %433 = extractelement <3 x float> %0, i32 1
  %434 = load half, ptr addrspace(2) %193, align 16, !tbaa !45
  %435 = fpext half %434 to float
  %436 = load float, ptr addrspace(2) %27, align 16, !tbaa !35
  %437 = fmul fast float %436, 0x3FB7DF3B60000000
  %438 = extractelement <3 x float> %0, i32 0
  %439 = fmul fast float %438, 0x3FC99999A0000000
  %440 = fadd fast float %439, %433
  %441 = fmul fast float %440, 0x3FC0A3D700000000
  %442 = fadd fast float %437, %441
  %443 = tail call float @air.fast_sin.f32(float %442) #1
  %444 = fmul fast float %443, 2.500000e-01
  %445 = fmul fast float %436, 0x3FC7DF3B60000000
  %446 = extractelement <3 x float> %0, i32 2
  %447 = fmul fast float %433, 0x3FC99999A0000000
  %448 = fsub fast float %447, %446
  %449 = fmul fast float %448, 0x3FB0A3D700000000
  %450 = fadd fast float %445, %449
  %451 = tail call float @air.fast_sin.f32(float %450) #1
  %452 = fmul fast float %451, 5.000000e-01
  %453 = fmul fast float %436, 0x3FD7DF3B60000000
  %454 = fmul fast float %446, 0x3FC99999A0000000
  %455 = fsub fast float %454, %438
  %456 = fmul fast float %455, 0x3FA0A3D700000000
  %457 = fadd fast float %453, %456
  %458 = tail call float @air.fast_sin.f32(float %457) #1
  %459 = fadd fast float %444, -1.000000e+00
  %460 = fadd fast float %459, %452
  %461 = fadd fast float %460, %458
  %462 = fmul fast float %435, 2.000000e+00
  %463 = fmul fast float %462, %461
  %464 = fadd fast float %463, %433
  %465 = insertelement <3 x float> %0, float %464, i32 1
  %466 = load <4 x float>, ptr addrspace(2) %226, align 16
  %467 = extractelement <4 x float> %466, i32 0
  %468 = fmul fast float %467, 5.000000e-01
  %469 = insertelement <3 x float> undef, float %468, i32 0
  %470 = shufflevector <3 x float> %469, <3 x float> undef, <3 x i32> zeroinitializer
  %471 = fsub fast <3 x float> %465, %470
  %472 = load <4 x float>, ptr addrspace(2) %234, align 16
  %473 = shufflevector <4 x float> %472, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %474 = fsub fast <3 x float> %471, %473
  %475 = fdiv fast <3 x float> %474, splat (float 1.600000e+01), !fpmath !44
  %476 = tail call <3 x float> @air.fast_floor.v3f32(<3 x float> %475) #1
  %477 = fadd fast <3 x float> %476, splat (float 5.000000e-01)
  %478 = load <4 x float>, ptr addrspace(2) %242, align 16
  %479 = shufflevector <4 x float> %478, <4 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %480 = fdiv fast <3 x float> splat (float 1.600000e+01), %479, !fpmath !44
  %481 = fmul fast <3 x float> %480, %477
  %482 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %12, ptr addrspace(2) captures(none) %13, <3 x float> %481, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %483 = extractelement <4 x float> %482, i32 0
  %484 = fcmp oeq float %483, 1.000000e+00
  br i1 %484, label %485, label %489

485:                                              ; preds = %432
  %486 = extractelement <4 x float> %482, i32 2
  %487 = fmul fast float %486, 1.100000e+02
  %488 = fadd fast float %487, -1.000000e+01
  br label %529

489:                                              ; preds = %432
  %490 = extractelement <4 x float> %466, i32 2
  %491 = fmul fast float %490, 5.000000e-01
  %492 = insertelement <3 x float> undef, float %491, i32 0
  %493 = shufflevector <3 x float> %492, <3 x float> undef, <3 x i32> zeroinitializer
  %494 = fsub fast float 1.000000e+00, %490
  %495 = insertelement <3 x float> undef, float %494, i32 0
  %496 = shufflevector <3 x float> %495, <3 x float> undef, <3 x i32> zeroinitializer
  %497 = fsub fast <3 x float> %475, %476
  %498 = fmul fast <3 x float> %497, %496
  %499 = fadd fast <3 x float> %498, %493
  %500 = getelementptr inbounds %struct.xlatMtlShaderUniform, ptr addrspace(2) %5, i64 0, i32 10
  %501 = load float, ptr addrspace(2) %500, align 16, !tbaa !46
  %502 = insertelement <2 x float> undef, float %501, i32 0
  %503 = shufflevector <2 x float> %502, <2 x float> undef, <2 x i32> zeroinitializer
  %504 = shufflevector <4 x float> %482, <4 x float> undef, <2 x i32> <i32 0, i32 1>
  %505 = fmul fast <2 x float> %504, splat (float 2.550000e+02)
  %506 = shufflevector <3 x float> %499, <3 x float> undef, <2 x i32> <i32 0, i32 1>
  %507 = fadd fast <2 x float> %506, %505
  %508 = fmul fast <2 x float> %503, %507
  %509 = shufflevector <2 x float> %508, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 poison>
  %510 = shufflevector <3 x float> %509, <3 x float> %499, <3 x i32> <i32 0, i32 1, i32 5>
  %511 = tail call <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none) %8, ptr addrspace(2) captures(none) %9, <3 x float> %510, i1 true, <3 x i32> zeroinitializer, i1 true, float 0.000000e+00) #3
  %512 = extractelement <4 x float> %511, i32 0
  %513 = fmul fast float %512, 1.000000e+01
  %514 = fadd fast float %513, -6.000000e+00
  %515 = fmul fast half %434, 0xH34CD
  %516 = fpext half %515 to float
  %517 = fmul fast float %436, 0x3FF5A1CAC0000000
  %518 = extractelement <3 x float> %471, i32 1
  %519 = fmul fast float %518, 0x3FC99999A0000000
  %520 = fadd fast float %519, %517
  %521 = tail call float @air.fast_sin.f32(float %520) #1
  %522 = fmul fast float %521, %516
  %523 = fsub fast float %514, %522
  %524 = load <4 x half>, ptr addrspace(2) %325, align 8
  %525 = extractelement <4 x half> %524, i32 1
  %526 = fpext half %525 to float
  %527 = fsub fast float %526, %80
  %528 = tail call float @air.fast_fmax.f32(float %523, float %527) #4
  br label %529

529:                                              ; preds = %489, %485, %366
  %530 = phi float [ %488, %485 ], [ %528, %489 ], [ 1.000000e+03, %366 ]
  %531 = fmul fast float %530, 5.000000e-01
  %532 = fsub fast float 2.000000e+00, %531
  %533 = tail call float @air.fast_clamp.f32(float %532, float 0.000000e+00, float 1.000000e+00) #4
  %534 = fptrunc float %533 to half
  %535 = fcmp olt float %530, 6.000000e+00
  %536 = tail call float @air.convert.f.f32.u.i1(i1 %535)
  %537 = insertelement <2 x half> undef, half %534, i32 0
  %538 = fptrunc float %536 to half
  %539 = insertelement <2 x half> %537, half %538, i32 1
  %540 = extractelement <2 x float> %93, i32 1
  %541 = fsub fast float -0.000000e+00, %540
  %542 = insertelement <4 x float> %95, float %541, i32 1
  %543 = extractelement <4 x float> %76, i32 2
  %544 = extractelement <4 x float> %76, i32 3
  %545 = fadd fast float %543, %544
  %546 = fmul fast float %545, 5.000000e-01
  %547 = insertelement <4 x float> %542, float %546, i32 2
  %548 = insertvalue %struct.xlatMtlShaderOutput.packed undef, <4 x float> %547, 0
  %549 = insertvalue %struct.xlatMtlShaderOutput.packed %548, <2 x float> %82, 1
  %550 = insertvalue %struct.xlatMtlShaderOutput.packed %549, <3 x float> %21, 2
  %551 = insertvalue %struct.xlatMtlShaderOutput.packed %550, <3 x half> %85, 3
  %552 = insertvalue %struct.xlatMtlShaderOutput.packed %551, <3 x float> %0, 4
  %553 = insertvalue %struct.xlatMtlShaderOutput.packed %552, <3 x half> %422, 5
  %554 = insertvalue %struct.xlatMtlShaderOutput.packed %553, half %86, 6
  %555 = insertvalue %struct.xlatMtlShaderOutput.packed %554, <2 x half> %539, 7
  ret %struct.xlatMtlShaderOutput.packed %555
}

; Function Attrs: nounwind memory(none)
declare float @air.convert.f.f32.u.i1(i1) #1

declare float @air.fast_clamp.f32(float, float, float) #2

declare float @air.fast_fmax.f32(float, float) #2

; Function Attrs: nounwind memory(none)
declare float @air.fast_sin.f32(float) #1

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x float> @air.sample_texture_3d.v4f32(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <3 x float>, i1, <3 x i32>, i1, float) #3

; Function Attrs: nounwind memory(none)
declare <3 x float> @air.fast_floor.v3f32(<3 x float>) #1

declare zeroext i1 @air.all.v3i1(<3 x i1>) #2

declare <3 x float> @air.fast_clamp.v3f32(<3 x float>, <3 x float>, <3 x float>) #2

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

; Function Attrs: noduplicate nounwind memory(read)
declare <4 x half> @air.sample_texture_3d.v4f16(ptr addrspace(1) captures(none), ptr addrspace(2) captures(none), <3 x float>, i1, <3 x i32>, i1, float) #3

declare <3 x half> @air.mix.v3f16(<3 x half>, <3 x half>, <3 x half>) #2

; Function Attrs: nounwind memory(none)
declare float @air.fast_rsqrt.f32(float) #1

declare float @air.dot.v3f32(<3 x float>, <3 x float>) #2

declare float @air.fast_pow.f32(float, float) #2

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
!7 = !{ptr @vsMain, !8, !17}
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16}
!9 = !{!"air.position", !"air.arg_type_name", !"float4", !"air.arg_name", !"gl_Position"}
!10 = !{!"air.vertex_output", !"generated(4v_uvDv2_f)", !"air.arg_type_name", !"float2", !"air.arg_name", !"v_uv"}
!11 = !{!"air.vertex_output", !"generated(5v_eyeDv3_f)", !"air.arg_type_name", !"float3", !"air.arg_name", !"v_eye"}
!12 = !{!"air.vertex_output", !"generated(6v_normDv3_Dh)", !"air.arg_type_name", !"half3", !"air.arg_name", !"v_norm"}
!13 = !{!"air.vertex_output", !"generated(10v_worldPosDv3_f)", !"air.arg_type_name", !"float3", !"air.arg_name", !"v_worldPos"}
!14 = !{!"air.vertex_output", !"generated(7v_colorDv3_Dh)", !"air.arg_type_name", !"half3", !"air.arg_name", !"v_color"}
!15 = !{!"air.vertex_output", !"generated(11v_alphaMultDh)", !"air.arg_type_name", !"half", !"air.arg_name", !"v_alphaMult"}
!16 = !{!"air.vertex_output", !"generated(20v_closenessToSurfaceDv2_Dh)", !"air.arg_type_name", !"half2", !"air.arg_name", !"v_closenessToSurface"}
!17 = !{!18, !19, !20, !21, !22, !23, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34}
!18 = !{i32 0, !"air.vertex_input", !"air.location_index", i32 0, i32 1, !"generated(10a_positionDv3_f)", !"air.arg_type_name", !"float3", !"air.arg_name", !"a_position"}
!19 = !{i32 1, !"air.vertex_input", !"air.location_index", i32 1, i32 1, !"generated(8a_normalDv4_f)", !"air.arg_type_name", !"float4", !"air.arg_name", !"a_normal"}
!20 = !{i32 2, !"air.vertex_input", !"air.location_index", i32 2, i32 1, !"generated(4a_uvDv4_f)", !"air.arg_type_name", !"float4", !"air.arg_name", !"a_uv"}
!21 = !{i32 3, !"air.vertex_input", !"air.location_index", i32 3, i32 1, !"generated(8a_light0Dv4_f)", !"air.arg_type_name", !"float4", !"air.arg_name", !"a_light0"}
!22 = !{i32 4, !"air.vertex_input", !"air.location_index", i32 4, i32 1, !"generated(8a_light1Dv4_f)", !"air.arg_type_name", !"float4", !"air.arg_name", !"a_light1"}
!23 = !{i32 5, !"air.buffer", !"air.buffer_size", i32 320, !"air.location_index", i32 9, i32 1, !"air.read", !"air.struct_type_info", !24, !"air.arg_type_size", i32 320, !"air.arg_type_align_size", i32 16, !"air.arg_type_name", !"xlatMtlShaderUniform", !"air.arg_name", !"_mtl_u"}
!24 = !{i32 0, i32 8, i32 0, !"half3", !"u_sunDir", i32 8, i32 8, i32 0, !"half3", !"u_sunColor", i32 16, i32 8, i32 0, !"half3", !"u_averageSkyColor", i32 24, i32 8, i32 0, !"half3", !"u_pointLight", i32 32, i32 4, i32 0, !"float", !"u_time", i32 48, i32 16, i32 0, !"float4", !"u_waterSimTerms", i32 64, i32 16, i32 0, !"float3", !"u_cloudWindScroll", i32 80, i32 8, i32 0, !"half4", !"u_cloudMat", i32 96, i32 16, i32 0, !"float3", !"u_cloudBinMinWorld", i32 112, i32 16, i32 0, !"float3", !"u_cloudBinRangeWorld", i32 128, i32 4, i32 0, !"float", !"u_cloudPackedBinDimInv", i32 136, i32 8, i32 0, !"half4", !"u_cloudNoiseTweaks", i32 144, i32 16, i32 0, !"float4", !"u_cloudVoxelScales", i32 160, i32 2, i32 0, !"half", !"u_cloudUndulationScale", i32 176, i32 64, i32 0, !"float4x4", !"u_viewProj", i32 240, i32 16, i32 0, !"float3", !"u_eyePos", i32 256, i32 8, i32 0, !"float2", !"u_jitterHalf", i32 272, i32 16, i32 0, !"float3", !"u_projPlaneU", i32 288, i32 16, i32 0, !"float3", !"u_projPlaneV", i32 304, i32 16, i32 0, !"float3", !"u_projPlaneOrigin"}
!25 = !{i32 6, !"air.texture", !"air.location_index", i32 0, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<half, sample>", !"air.arg_name", !"u_waterSim"}
!26 = !{i32 7, !"air.sampler", !"air.location_index", i32 0, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_waterSim"}
!27 = !{i32 8, !"air.texture", !"air.location_index", i32 1, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<float, sample>", !"air.arg_name", !"u_cloudDist"}
!28 = !{i32 9, !"air.sampler", !"air.location_index", i32 1, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudDist"}
!29 = !{i32 10, !"air.texture", !"air.location_index", i32 2, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<half, sample>", !"air.arg_name", !"u_cloudNoise3D"}
!30 = !{i32 11, !"air.sampler", !"air.location_index", i32 2, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudNoise3D"}
!31 = !{i32 12, !"air.texture", !"air.location_index", i32 3, i32 1, !"air.sample", !"air.arg_type_name", !"texture3d<float, sample>", !"air.arg_name", !"u_cloudSparse"}
!32 = !{i32 13, !"air.sampler", !"air.location_index", i32 3, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_cloudSparse"}
!33 = !{i32 14, !"air.texture", !"air.location_index", i32 4, i32 1, !"air.sample", !"air.arg_type_name", !"texture2d<half, sample>", !"air.arg_name", !"u_texPerturb"}
!34 = !{i32 15, !"air.sampler", !"air.location_index", i32 4, i32 1, !"air.arg_type_name", !"sampler", !"air.arg_name", !"_mtlsmp_u_texPerturb"}
!35 = !{!36, !39, i64 32}
!36 = !{!"_ZTS20xlatMtlShaderUniform", !37, i64 0, !37, i64 8, !37, i64 16, !37, i64 24, !39, i64 32, !37, i64 48, !37, i64 64, !37, i64 80, !37, i64 96, !37, i64 112, !39, i64 128, !37, i64 136, !37, i64 144, !40, i64 160, !41, i64 176, !37, i64 240, !37, i64 256, !37, i64 272, !37, i64 288, !37, i64 304}
!37 = !{!"omnipotent char", !38, i64 0}
!38 = !{!"Simple C++ TBAA"}
!39 = !{!"float", !37, i64 0}
!40 = !{!"half", !37, i64 0}
!41 = !{!"_ZTSN5metal6matrixIfLi4ELi4EEE", !37, i64 0}
!42 = !{!37, !37, i64 0}
!43 = !{!36, !37, i64 256}
!44 = !{float 2.500000e+00}
!45 = !{!36, !40, i64 160}
!46 = !{!36, !39, i64 128}
