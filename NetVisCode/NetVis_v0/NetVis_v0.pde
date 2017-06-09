Network network;
float zoomFactor;
float tX, tY;


void setup() {
  size(1200, 700);
  network = new Network(70);
  background(100);
  zoomFactor = 1;
  tX = 0;
  tY = 0;
}

void draw() {
  background(100);
  pushMatrix();
  scale(zoomFactor);
  translate(tX, tY);
  network.update();
  popMatrix(); 
}

void keyPressed() {
  if (key == 'q') {//quits program
    exit();
  }
  if (key == 'r') {//returns to default view
    zoomFactor = 1;
    tX = 0;
    tY = 0;
  }
}


void mouseWheel(MouseEvent event) {
  println("mouse be wheeling");
  float e = event.getCount();
  zoomFactor += e / 100.0;
  tX = tX - e/100.0 * mouseX;
  tY = tY - e/100.0 * mouseY;
}