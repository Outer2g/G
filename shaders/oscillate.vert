#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 modelViewMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

uniform float time;
uniform bool eyespace = false;
uniform float M_PI = 3.1416;

void main()
{
	float r = distance(boundingBoxMin.x,boundingBoxMax.y)/2.0;
	float d ;
	if (eyespace) {
		vec3 eyeVertex = modelViewMatrix * vertex;
		d = (r/10) * eyeVertex.y;
		}
	else d = (r/10) * vertex.y;
	vec3 N = normalize(normalMatrix * normal);
	vec3 vvertex = vertex + N * d * sin(2*M_PI*time);
    frontColor = vec4(color,1.0);
    gl_Position = modelViewProjectionMatrix * vec4(vvertex.xyz, 1.0);
}
