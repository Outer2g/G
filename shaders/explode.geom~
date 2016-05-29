#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 Norm[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;
uniform float speed = 1.2f;

void main( void )
{
  vec3 N=speed*time*(Norm[0]+Norm[1]+Norm[2])/3;
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
    	vec3 V=gl_in[i].gl_Position.xyz+N;
    	gl_Position=modelViewProjectionMatrix*vec4(V, 1);
		EmitVertex();
	}
    EndPrimitive();
}
