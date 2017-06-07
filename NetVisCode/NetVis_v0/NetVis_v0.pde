Network network;

void setup() {
  size(1200, 700);
  background(0);
  network = new Network("cluster.csv", "1");
  
  
  
}


void draw() {
  
  network.update();
  
}



void zoom(int x, int y) {
  //zooms on point (x,y)
  
}