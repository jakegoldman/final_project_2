Network network;

void setup() {
  size(1200, 700);
  network = new Network(1320);
  background(100);
}

void draw() {
  
  network.update();
  
}