#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMin; // cantonada minima de la capsa englobant 
uniform vec3 boundingBoxMax; // cantonada maxima de la capsa englobant

uniform vec4 red = vec4(1.0,0.0,0.0,1.0);
uniform vec4 yellow = vec4(1.0,1.0,0.0,1.0);
uniform vec4 green = vec4(0.0,1.0,0.0,1.0);
uniform vec4 cian = vec4(0.0,1.0,1.0,1.0);
uniform vec4 blue = vec4(0.0,0.0,1.0,1.0);

void main()
{
    vec3 N = normalize(normalMatrix * normal);
	float dist = boundingBoxMax.y - boundingBoxMin.y;
	float slice = dist/4;
	float percent = mod(vertex.y/slice,1.0);
	if  (vertex.y <= boundingBoxMin.y+slice) frontColor = mix(red,yellow,percent);
	else if (vertex.y <= boundingBoxMin.y+slice*2) frontColor = mix(yellow,green,percent);
	else if (vertex.y <= boundingBoxMin.y+slice*3) frontColor = mix(green,cian,percent);
	else frontColor = mix(cian,blue,percent);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
