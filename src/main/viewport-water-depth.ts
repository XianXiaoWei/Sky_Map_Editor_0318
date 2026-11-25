/** The viewport sky marks empty depth with zero, as consumed by the original
 * FogUpsample branch. Ocean variants use abs(depth)*10 without that branch;
 * their opaque input needs the equivalent far distance to keep transmission
 * weights in range. Specialize only that sampler, retaining actual surfaces.
 * This is an editor texture-boundary adapter, not original shader recovery. */
export function viewportWaterDepthFragment(source:string):string {
 const samples=/texture\s*\(\s*u_opaqueTexRGBDepth\s*,\s*(\w+)\s*\)/g;
 if(!samples.test(source))return source;
 samples.lastIndex=0;
 const adapted=source.replace(samples,'viewportWaterOpaque($1)');
 return adapted.replace(/void\s+main\s*\(/,`highp vec4 viewportWaterOpaque(highp vec2 uv) {
 highp vec4 value=texture(u_opaqueTexRGBDepth,uv);
 if(value.w==0.0)value.w=25600.0;
 return value;
}
void main (`);
}
