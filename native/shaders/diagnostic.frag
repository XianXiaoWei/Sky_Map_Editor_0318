#version 450
layout(location = 0) in vec4 vertexColor;
layout(location = 0) out vec4 outputColor;
layout(push_constant) uniform Camera { mat4 viewProjection; uint mode; float exposure; } camera;
void main() {
    if ((camera.mode & 1u) != 0u) {
        outputColor = vec4(vertexColor.a > 0.0 ? vertexColor.rgb * vertexColor.rgb / vertexColor.a : vec3(1.0, 0.0, 1.0), 1.0);
    } else {
        if (vertexColor.a <= 0.0) discard;
        outputColor = vertexColor;
    }
    // Keep editor helper/attribute colors readable under the preview display
    // curve. Programmable terrain shaders write unmodified linear radiance.
    if ((camera.mode & 2u) != 0u) {
        vec3 c=clamp(outputColor.rgb,vec3(0),vec3(.9999));
        vec3 linear=mix(c/12.92,pow((c+.055)/1.055,vec3(2.4)),greaterThan(c,vec3(.04045)));
        outputColor.rgb=linear/(1.-linear)/camera.exposure;
    }
    // Generic opaque editor models join the original RGBDepth composition.
    // Mesh shaders store positive view distance * 0.1 in alpha; using opacity
    // here makes all model surfaces appear ten units away to fog and clouds.
    if ((camera.mode & 4u) != 0u) {
        outputColor.a = min(256000.0, 1.0 / gl_FragCoord.w) * 0.1;
    }
}
