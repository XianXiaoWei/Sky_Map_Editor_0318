import type {VulkanShaderSource} from './vulkan-shaders';

// Vulkan blit float32 -> float16 is allowed to round differently from the
// preview's original F16C RTE conversion. Convert the bits explicitly on GPU,
// then store already representable values in the half attachment.
export const vulkanHalfStorageSources:VulkanShaderSource[]=[{stage:'vert',format:'vulkan450',text:`#version 450
void main(){vec2 p=vec2((gl_VertexIndex<<1)&2,gl_VertexIndex&2);gl_Position=vec4(p*2.0-1.0,0,1);}
`},{stage:'frag',format:'vulkan450',text:`#version 450
layout(set=0,binding=1) uniform sampler2D u_source;
layout(location=0) out vec4 color;
uint roundEven(uint v,uint shift){uint whole=v>>shift,mask=(1u<<shift)-1u,rem=v&mask,mid=1u<<(shift-1u);return whole+uint(rem>mid||(rem==mid&&(whole&1u)!=0u));}
float halfRte(float value){
 uint bits=floatBitsToUint(value),exponent=(bits>>23)&255u,mantissa=bits&0x7fffffu,sign=(bits>>16)&0x8000u,h;
 if(exponent==255u)h=sign|0x7c00u|(mantissa!=0u?(mantissa>>13)|0x200u:0u);
 else if(exponent>=143u)h=sign|0x7c00u;
 else if(exponent>=113u)h=sign|(((exponent-112u)<<10)+roundEven(mantissa,13u));
 else if(exponent>=102u)h=sign|roundEven(0x800000u+mantissa,126u-exponent);
 else h=sign;
 return unpackHalf2x16(h).x;
}
void main(){vec4 v=texelFetch(u_source,ivec2(gl_FragCoord.xy),0);color=vec4(halfRte(v.x),halfRte(v.y),halfRte(v.z),halfRte(v.w));}
`}];
