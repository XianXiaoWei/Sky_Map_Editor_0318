/** Restore native 3D filtering on hardware. The generated AIR reference uses
 * explicit float32 interpolation to avoid a software driver's UNORM8 lerp
 * truncation. That workaround costs eight fetches per linear sample and must
 * not be imposed on hardware. Keep its exact nearest-grid addressing. */
export function hardwareCloudSampling(source:string){
 const start=source.indexOf('vec4 air_sample3d(');if(start<0)return source;
 const open=source.indexOf('{',start);let depth=1,end=open+1;
 for(;depth&&end<source.length;end++){if(source[end]==='{')depth++;else if(source[end]==='}')depth--;}
 const reference=source.slice(open+1,end-1);
 if(depth||!reference.includes('air_texel_coord')||(reference.match(/texelFetch\(/g)??[]).length!==9)throw new Error('原云软件采样适配器版本不符');
 const native=`vec4 air_sample3d(sampler3D image,vec3 uv,ivec3 offset,bool linear,bool repeat) {
  ivec3 size=textureSize(image,0);
  if(!linear){
    precise vec3 p=uv*vec3(size)+vec3(offset);
    return texelFetch(image,air_texel_coord(ivec3(floor(p)),size,repeat),0);
  }
  // Original textures retain their recovered clamp/repeat and linear sampler.
  // Cloud resources have one mip level; the original AIR samples LOD zero.
  return textureLod(image,uv+vec3(offset)/vec3(size),0.0);
}`;
 return source.slice(0,start)+native+source.slice(end);
}
