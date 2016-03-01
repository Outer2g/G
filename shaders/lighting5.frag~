#version 330 core

in vec3 N;
in vec3 P;
out vec4 fragColor;


uniform vec4 lightAmbient;  // similar a gl_LightSource[0].ambient
uniform vec4 lightDiffuse;  // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular; // similar a gl_LightSource[0].specular
uniform vec4 lightPosition; // similar a gl_LightSource[0].position; en eye space

uniform vec4 matAmbient;    // similar a gl_FrontMaterial.ambient 
uniform vec4 matDiffuse;    // similar a gl_FrontMaterial.diffuse 
uniform vec4 matSpecular;   // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess

uniform bool world;

uniform mat4 viewMatrixInverse;

vec4 phong(vec3 N, vec3 V, vec3 L){
	V = normalize(V);
	L = normalize(L);
	vec3 R = normalize(2*dot(N,L)*N-L);
	vec4 KaIa = matAmbient*lightAmbient;
	vec4 KdId = matDiffuse*lightDiffuse*max(0.0,dot(N,L));
	vec4 KsIs = matSpecular*lightSpecular*pow(max(0.0,dot(R,V)),matShininess);
	return KaIa+KdId+KsIs;
}


void main()
{
	vec3 L;
	vec3 N2 = normalize(N);
    if (!world) L = (lightPosition.xyz-P);
    else L = (viewMatrixInverse*lightPosition).xyz-P;
    vec3 V = -P;
    fragColor = phong(N,V,L);
}
