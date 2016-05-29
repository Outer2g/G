#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 Norm[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float time;
uniform float speed = 1.2f;
uniform float angSpeed = 8.0f;

void main( void )
{
  vec3 N=speed*time*(Norm[0]+Norm[1]+Norm[2])/3;
	vec3 BT=(gl_in[0].gl_Position.xyz+
          gl_in[1].gl_Position.xyz+
          gl_in[2].gl_Position.xyz)/3;
  // matriu rotacio
  float a=time*angSpeed;
  mat3 Rz=mat3(vec3(cos(a), sin(a), 0),
              vec3(-sin(a), cos(a), 0), 
              vec3(0, 0, 1));
  for (int i=0; i<3; ++i) { 
    gfrontColor=vfrontColor[i];
    vec3 V=gl_in[i].gl_Position.xyz-BT;   // portar al centre
    V=Rz*V;                               // rotar sobre eix Z
    V+=BT+N;                              // traslladar al desti
    gl_Position=modelViewProjectionMatrix*vec4(V, 1);
    EmitVertex();
    }
}
