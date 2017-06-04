String[] protInteract; //pairs of protein interactions
Node[] nodes; //all instances of nodes
Network network;

void setup() {
  size(1200, 700);
  background(0);
  network = new Network(fileName);
}


void force() {
  //call repel on each node
}