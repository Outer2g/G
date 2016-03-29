#version 330 core

in vec4 frontColor;
in vec3 NDC;
out vec4 fragColor;

uniform vec4 colorr = vec4(0.,0.,1.,1.);
uniform float time;
uniform float animation = 1.0;
void main()
{
	if((time/animation) >= NDC.x +1) fragColor = colorr;
	else discard;
}
