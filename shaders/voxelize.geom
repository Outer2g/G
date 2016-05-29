#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices=36) out;

out vec4 gfrontColor;
in vec4 vfrontColor[];

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform float step=0.2;

const vec4 GREY=vec4(vec3(0.8), 1);

void cubeVertex(float x, float y, float z, vec3 BT) {
  gfrontColor=vfrontColor[0];
  vec3 V=vec3(x, y, z)*step;
  gl_Position=modelViewProjectionMatrix*vec4(V+BT, 1);
  EmitVertex();
}
void paintCube(vec3 BT) {
  // front
  cubeVertex(0, 0, 1, BT);
  cubeVertex(1, 0, 0, BT);
  cubeVertex(0, 1, 1, BT);
  cubeVertex(1, 1, 1, BT);
  EndPrimitive();
  // back
  cubeVertex(0, 1, 0, BT);
  cubeVertex(1, 1, 0, BT);
  cubeVertex(0, 0, 0, BT);
  cubeVertex(1, 0, 0, BT);
  EndPrimitive();
  // left
  cubeVertex(0, 0, 0, BT);
  cubeVertex(0, 0, 1, BT);
  cubeVertex(0, 1, 0, BT);
  cubeVertex(0, 1, 1, BT);
  EndPrimitive();
  // right
  cubeVertex(1, 1, 0, BT);
  cubeVertex(1, 1, 1, BT);
  cubeVertex(1, 0, 0, BT);
  cubeVertex(1, 0, 1, BT);
  EndPrimitive();
  // top
  cubeVertex(0, 1, 1, BT);
  cubeVertex(1, 1, 1, BT);
  cubeVertex(0, 1, 0, BT);
  cubeVertex(1, 1, 0, BT);
  EndPrimitive();
  // bottom
  cubeVertex(1, 0, 0, BT);
  cubeVertex(1, 0, 1, BT);
  cubeVertex(0, 0, 0, BT);
  cubeVertex(0, 0, 1, BT);
  EndPrimitive();
}

void main(void) {
  // baricentro triangulo -(i, j, k) enteros
  vec3 BT=(gl_in[0].gl_Position.xyz+
          gl_in[1].gl_Position.xyz+
          gl_in[2].gl_Position.xyz)/3;
  BT/=step;
  BT.x=int(BT.x);
  BT.y=int(BT.y);
  BT.z=int(BT.z);
  BT*=step;
  paintCube(BT);
}
