Network network;

void setup() {
  size(1200, 700);
  network = new Network("clusterNew.txt", 300);
  background(100);
}

void draw() {
  
  network.update();
  
}