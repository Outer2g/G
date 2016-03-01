#version 330 core

in vec3 N;
in vec3 P;
out vec4 fragColor;


uniform vec4 lightAmbient;  // similar a gl_LightSource[0].ambient
vec4 lightDiffuse;  // similar a gl_LightSource[0].diffuse
uniform vec4 lightSpecular; // similar a gl_LightSource[0].specular
uniform vec4 lightPosition; // similar a gl_LightSource[0].position; en eye space

uniform vec4 matAmbient;    // similar a gl_FrontMaterial.ambient 
uniform vec4 matDiffuse;    // similar a gl_FrontMaterial.diffuse 
uniform vec4 matSpecular;   // similar a gl_FrontMaterial.specular
uniform float matShininess; // similar a gl_FrontMaterial.shininess


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
    vec3 posLlum0 = vec3(0,10,0);
    vec4 colLlum0 = vec4(0,1,0,1);
    vec3 posLlum1 = vec3(0,-10,0);
    vec4 colLlum1 = vec4(1,1,0,1);
    vec3 posLlum2 = vec3(10,0,0);
    vec4 colLlum2 = vec4(0,0,1,1);
    vec3 posLlum3 = vec3(-10,0,0);
    vec4 colLlum3 = vec4(1,0,0,1);
    vec3 L;
	vec3 N2 = normalize(N);
    vec3 V = -P;
	//calculem per cada llum phong y despres sumem tot
	vec4 sumColor;
	// llum 0:
	L = (posLlum0-P);
	lightDiffuse = colLlum0;
	sumColor = phong(N,V,L);
	//llum 1:
	L = (posLlum1-P);
	lightDiffuse = colLlum1;
	sumColor += phong(N,V,L);
	//llum 2:
	L = (posLlum2-P);
	lightDiffuse = colLlum2;
	sumColor += phong(N,V,L);
	//llum 3:
	L = (posLlum2-P);
	lightDiffuse = colLlum3;
	sumColor += phong(N,V,L);
    
    fragColor = sumColor;
}
