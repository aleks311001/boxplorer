/*
Pinhole camera shader 1.0 by Rrrola

The screen is covered by a single rectangle.

The vertex shader computes the view ray (eye position and direction) for all
four vertices ot the rectangle. These are linearly interpolated and passed
to the fragment shader.
*/

varying vec3 eye, dir;

uniform float fov_x, fov_y;  // Field of vision.

float fov2scale(float fov) { return tan(radians(fov/2.0)); }

// Draw an untransformed rectangle covering the whole screen.
// Get camera position and interpolated directions from the modelview matrix.
void main() {
  gl_Position = gl_Vertex;
  eye = vec3(gl_ModelViewMatrix[3]);
  dir = vec3(gl_ModelViewMatrix * vec4(
    fov2scale(fov_x)*gl_Vertex.x, fov2scale(fov_y)*gl_Vertex.y, 1, 0) );
}
