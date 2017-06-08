Network network;

void setup() {
  size(1200, 700);
  network = new Network("/Users/Jake/github/final_project_2/NetVisCode/clusterNew.txt", 1320);
  background(100);
}

void draw() {
  
  network.update();
  
}