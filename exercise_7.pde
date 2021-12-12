import gifAnimation.*;
Gif spidy;
PShader shader_thresh; 

void setup() {
  size(500, 208, P2D);
  
  spidy = new Gif(this, "spiderman.gif");//https://co.pinterest.com/pin/715650197012833942/?amp_client_id=CLIENT_ID(_)&mweb_unauth_id=&simplified=true
  spidy.loop();
  
  shader_thresh = loadShader("shaders/thresh.glsl");
  shader_thresh.set("resolution", float(width), float(height), 5.0);
}

void draw() {
  background(0);
  
  shader_thresh.set("threshold", 100 * ((float) mouseX / (float) width)); 
  shader_thresh.set("tex0", spidy);
  filter(shader_thresh);
  
  surface.setTitle("" + frameRate);
}
