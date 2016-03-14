#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;
uniform vec4 black = vec4(0.,0.,0.,1.0);
uniform vec4 grey = vec4(0.1,0.1,0.1,1.0);   

void main()
{
	if (vtexCoord.s >0.5) fragColor =
    fragColor = frontColor;
}
