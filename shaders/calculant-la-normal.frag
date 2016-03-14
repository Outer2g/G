#version 330 core

in vec4 frontColor;
in vec3 vvertex;
out vec4 fragColor;

uniform mat3 normalMatrix;

void main()
{
	vec3 fx = dFdx(vvertex);
	vec3 fy = dFdy(vvertex);
	vec3 N = normalize(normalMatrix * cross(fx,fy));
    fragColor = frontColor*N.z;
}
