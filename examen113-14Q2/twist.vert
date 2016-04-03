#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time;
void main()
{
    float angle = 0.4 * vertex.y * sin(time);
    vec3 col1 = vec3(cos(angle),0.0,-sin(angle));
    vec3 col2 = vec3(0.0,1.0,0.0);
    vec3 col3 = vec3(sin(angle),0,cos(angle));
    mat3 rotate = mat3(col1,col2,col3);
    vec3 vvertex = inverse(rotate)* vertex;
    frontColor = vec4(color,1.0);
    gl_Position = modelViewProjectionMatrix * vec4(vvertex.xyz, 1.0);
}
