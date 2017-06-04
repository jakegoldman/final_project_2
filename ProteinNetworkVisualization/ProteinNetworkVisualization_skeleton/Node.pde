class Node {
  PVector pos; //position
  Node[] neighbors; //nodes it is connected to
  String protein;
  boolean highlighted; //if selected
  
    Node(String name, int x, int y) {
    pos = new PVector (x, y);
    pos.x = 0;
    pos.y = 0;
    protein = name;
  }
  
  void repel(Node other) {
    //repel force
    //Fr = Kr/d^2
  }
  
  void spring(Node other) {
    //spring force
    //iterate through neighbors
    //Fs = Ks(d - L);
    
  }
  
  float getDist(Node other) {
    //returns distance formula
    return 0; //place holder
  }
  
  int getDegree() {
    //return numConnections
  }
  
  void highlight() {
    //change color + other stuff
  }
  
  
  
}