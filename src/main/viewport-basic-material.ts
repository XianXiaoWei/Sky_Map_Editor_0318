/** Explicit low-cost editor graphics. Original geometry, indices and render
 * groups stay intact; these shaders are not original material parity. */
export function viewportBasicMaterialSources(model:boolean,transparent:boolean){
 const vertex=`#version 450
layout(location=0) in vec3 a_position;
layout(location=1) in vec4 a_normal;
${model?'layout(location=2) in vec4 a_color;':'layout(location=2) in vec4 a_material0;layout(location=3) in vec4 a_material1;'}
layout(location=0) out vec4 tint;
layout(location=1) out vec3 world;
uniform mat4 u_viewProj,u_model;
uniform vec4 u_color;
uniform float u_materialId;
uniform bool u_opaque;
void main(){vec4 p=u_model*vec4(a_position,1);world=p.xyz;gl_Position=u_viewProj*p;gl_Position.y=-gl_Position.y;gl_Position.z=(gl_Position.z+gl_Position.w)*.5;vec3 normal=mat3(u_model)*a_normal.xyz;
float lighting=.55+.45*abs(normal.y)/(max(length(normal),.00001));
${model?'tint=u_color*a_color;':'float alpha=dot(vec4(equal(ivec4(a_material0*256),ivec4(int(u_materialId)))),a_material1);tint=vec4(u_color.rgb,u_opaque?1:alpha);'}
tint.rgb*=lighting;}`;
 const fragment=`#version 450
layout(location=0) in vec4 tint;layout(location=1) in vec3 world;uniform vec3 u_eyePos;
layout(location=0) out vec4 color;
${transparent?'layout(location=1) out vec4 depth;':''}
void main(){if(tint.a<=0)discard;float distance=max(length(world-u_eyePos),.00001);
${transparent?'color=tint;depth=vec4(log2(distance)*256,0,0,tint.a);':'color=vec4(tint.rgb,distance);'}}`;
 return [{stage:'vert' as const,format:'vulkan450' as const,text:vertex},{stage:'frag' as const,format:'vulkan450' as const,text:fragment}];
}
