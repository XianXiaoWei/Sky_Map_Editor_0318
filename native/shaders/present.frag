#version 450
layout(binding=0) uniform sampler2D frameTexture;
layout(location=0) in vec2 uv;
layout(location=0) out vec4 outColor;
layout(push_constant) uniform Settings { vec2 texel; uint encodeSrgb; uint antialias; } settings;
float luma(vec3 c) { return dot(c, vec3(0.299, 0.587, 0.114)); }
void main() {
    vec3 center = texture(frameTexture, uv).rgb;
    vec3 rgb = center;
    if (settings.antialias != 0u) {
        vec3 nw = texture(frameTexture, uv + settings.texel * vec2(-1,-1)).rgb;
        vec3 ne = texture(frameTexture, uv + settings.texel * vec2(1,-1)).rgb;
        vec3 sw = texture(frameTexture, uv + settings.texel * vec2(-1,1)).rgb;
        vec3 se = texture(frameTexture, uv + settings.texel * vec2(1,1)).rgb;
        float lc=luma(center), lnw=luma(nw), lne=luma(ne), lsw=luma(sw), lse=luma(se);
        float low=min(lc,min(min(lnw,lne),min(lsw,lse)));
        float high=max(lc,max(max(lnw,lne),max(lsw,lse)));
        if (high-low > max(0.0312,high*0.125)) {
            vec2 dir=vec2(-((lnw+lne)-(lsw+lse)),(lnw+lsw)-(lne+lse));
            float reduce=max((lnw+lne+lsw+lse)*0.03125,0.0078125);
            dir=clamp(dir/(min(abs(dir.x),abs(dir.y))+reduce),vec2(-8),vec2(8))*settings.texel;
            vec3 a=0.5*(texture(frameTexture,uv-dir/6.0).rgb+texture(frameTexture,uv+dir/6.0).rgb);
            vec3 b=a*0.5+0.25*(texture(frameTexture,uv-dir*0.5).rgb+texture(frameTexture,uv+dir*0.5).rgb);
            float lb=luma(b);rgb=lb<low||lb>high?a:b;
        }
    }
    rgb=clamp(rgb,0.0,1.0);
    if(settings.encodeSrgb!=0u) rgb=mix(12.92*rgb,1.055*pow(rgb,vec3(1.0/2.4))-0.055,greaterThan(rgb,vec3(0.0031308)));
    outColor=vec4(rgb,1.0);
}
