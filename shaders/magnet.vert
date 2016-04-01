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

uniform float n=4.0;


void main()
{
    vec3 N = normalize(normalMatrix * normal);
    vec4 F = modelViewMatrixInverse * lightPosition; // eye space to object space
    float d = distance(vertex,F.xyz);
	float w = clamp(1.0/pow(d,n),0.0,1.0);
	vec3 nVertex = (1.0 - w)*vertex + w*F.xyz;
    gl_Position = modelViewProjectionMatrix * vec4(nVertex, 1.0);
    frontColor = vec4(1.,1.,1.,1.0) * N.z;
}
