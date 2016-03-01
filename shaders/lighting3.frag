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

vec4 bling_phong(vec3 N,vec3 H,vec3 L){
	vec4 KaIa = matAmbient*lightAmbient;
	vec4 KdIdNL = matDiffuse*lightDiffuse*max(0.0,dot(N,L));
	vec4 KsIsNH = matSpecular*lightSpecular*max(0.0,pow(dot(N,H),matShininess));
	return KaIa+KdIdNL+KsIsNH;
}

void main()
{
	vec3 N2 = normalize(N);
    vec3 L = normalize(lightPosition.xyz-P);
    vec3 V = vec3(0.,0.,1.);//-P
    vec3 H = normalize(V + L);
    fragColor = bling_phong(N2,H,L);
}
