#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;

uniform mat3 normalMatrix;

uniform vec4 lightAmbient;  // similar a gl_LightSource[0].ambient
uniform vec4 lightDiffuse;  // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular; // similar a gl_LightSource[0].specular
uniform vec4 lightPosition; // similar a gl_LightSource[0].position; en eye space

uniform vec4 matAmbient;    // similar a gl_FrontMaterial.ambient 
uniform vec4 matDiffuse;    // similar a gl_FrontMaterial.diffuse 
uniform vec4 matSpecular;   // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess


vec4 bling_phong(vec3 N,vec3 H,vec3 L){
	vec4 KaIa = matAmbient*lightAmbient;
	vec4 KdIdNL = matDiffuse*lightDiffuse*max(0.0,dot(N,L));
	vec4 KsIsNH = matSpecular*lightSpecular*max(0.0,pow(dot(N,H),matShininess));
	return KaIa+KdIdNL+KsIsNH;
}
void main()
{
    vec3 N = normalize(normalMatrix * normal);
    vec3 P = (modelViewMatrix*vec4(vertex.xyz,1.0)).xyz;
    vec3 L = normalize(lightPosition.xyz-P);
    vec3 V = vec3(0.,0.,1.);//-P
    vec3 H = normalize(V + L);
    
    frontColor = bling_phong(N,H,L);
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
} 
