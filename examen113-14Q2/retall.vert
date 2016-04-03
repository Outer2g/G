#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrixInverse;

uniform vec4 lightPosition;

uniform float offset = 0;
void main()
{
    vec4 N = modelViewMatrixInverse * lightPosition;
    vec3 perpen = vec3(N.y,-N.x,N.z);
    vec3 perpen2 = cross(N.xyz,perpen);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
}
