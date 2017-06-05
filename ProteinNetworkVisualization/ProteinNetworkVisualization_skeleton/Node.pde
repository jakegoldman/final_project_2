class Node {
  
  PVector pos; //position
  PVector repForce; // sum of repelling force from all other nodes
  float Kr;
  Node[] neighbors; //nodes it is connected to
  String protein;
  boolean highlighted; //if selected
  
  Node(String name, int x, int y, float Kr) {
    pos = new PVector (x, y);
    pos.x = 0;
    pos.y = 0;
    protein = name;
    this.Kr = Kr;
  }
  
  PVector repel(Node other) {
    PVector ans = new PVector(0,0);
    ans.x = Kr / ( pos.x - other.pos.x );
    ans.y = Kr / ( pos.y - other.pos.y );
    return ans;
    //Fr = Kr/d^2
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