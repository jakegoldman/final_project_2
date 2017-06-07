class Node {
  
  String protein;
  PVector pos; //position
  PVector repForce; // sum of repelling force from all other nodes
  float Kr; // constant for the repForce
  PVector springForce; // spring force to act on it
  
  Node[] neighbors; //nodes it is connected to
  boolean highlighted; //if selected
  
  
  Node(String name, int x, int y, float Kr) {
    pos = new PVector (x, y);
    pos.x = 0;
    pos.y = 0;
    protein = name;
    this.Kr = Kr;
    repForce = new PVector(0,0);
  }
  
  
  void display() {
    fill(128,0,128);//color purple
    ellipse(pos.x, pos.y, 10, 10); //10 is the size
  }
  
  void update() {
    pos = pos.add(repForce);
    pos = pos.add(springForce);
  }
  
  PVector repel(Node other) {//calculates repel force
    PVector ans = new PVector(0,0);
    ans.x = Kr / ( ( pos.x - other.pos.x ) * ( pos.x - other.pos.x ) );
    ans.y = Kr / ( ( pos.y - other.pos.y ) * ( pos.y - other.pos.y ) );
    return ans;
    //Fr = Kr/d^2
  }
  
  
  
  String toString(){
    return protein;
  }
  
  float getDist(Node other) {
    return pos.dist( other.pos );
  }
 
  int getDegree() {
    //return numConnections
    return 0;
  }
  
  void highlight() {
    //change color + other stuff
  }
  
  
  
}