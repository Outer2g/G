#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform float r =0.2;
uniform vec4 red = vec4(1.0,0.,0.,1.);
uniform vec4 white = vec4(1.,1.,1.,1.);
uniform vec2 center = vec2(0.5,0.5);
void main()
{
	float d = distance(vtexCoord,center);
	//if (step(r,d) == 1.) fragColor = white;
	//else fragColor = red;
	//para tests, pasa con step
	fragColor = mix(red, white, step(r,d));
	/*amb antialiasing
	float width = 0.5* length(vec2(dFdx(d),dFdy(d)));
	fragColor = mix(red, white, smoothstep(r-width, r+width,  d));
	*/
}
