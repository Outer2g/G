#version 330 core

in vec4 frontColor;
in vec3 N;
out vec4 fragColor;

void main()
{
	vec3 normal = normalize(N);
    fragColor = frontColor*normal.z;
}
