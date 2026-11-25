#version 450
layout(location = 0) in vec3 position;
layout(location = 1) in vec4 color;
layout(location = 0) out vec4 vertexColor;
layout(push_constant) uniform Camera { mat4 viewProjection; uint mode; float exposure; } camera;
void main() {
    gl_Position = camera.viewProjection * vec4(position, 1.0);
    gl_Position.y = -gl_Position.y;
    gl_Position.z = (gl_Position.z + gl_Position.w) * 0.5;
    vertexColor = color;
}
