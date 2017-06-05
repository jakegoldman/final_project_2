class Edge{
  
  Node n1, n2; // two nodes for the edge
  float Ks; // spring constant
  float springL;
  PVector springForce; // current force between the nodes
  
  Edge(Node a, Node b, float Ks, float springL){
    n1 = a;
    n2 = b;
    this.Ks = Ks;
    this.springL = springL;
    calcSpringForce();
  }
  
  
  void calcSpringForce(){
    // calculates the force between n1 and n2
    // updates springForce instance variable
  }
  
  
  void applySpringForce(){
    n1.pos.x += springForce.x;
    n1.pos.y += springForce.y;
    
    n2.pos.x -= springForce.x;
    n2.pos.y -= springForce.y;
  }
  
}