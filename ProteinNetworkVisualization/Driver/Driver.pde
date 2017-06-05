Node[] nodes;
Edge[] edges;
float Kr;
float Ks;
float restLength;

void setup() {
  size(1200, 700);
  background(0);
  
  
  // load the file
  // initialize nodes
  // initialize edges
  
}


void draw() {
  
  // calculate the rep forces
  for( Node applyTo : nodes ){
    PVector repForce = new PVector(0,0);
    for( Node toApply : nodes ){
      if( toApply != applyTo ){ // make sure not to apply a rep force to itself
        repForce.add( toApply.repel(applyTo) );
      }
    }
    applyTo.repForce = repForce;
  }
    
  // calculate the spring forces
  for( Edge e : edges ){
    e.calcSpringForce();
  }
  
  
  
  for( Node n : nodes ){
    n.update();
  }
  
  for( Edge e : edges ){
    e.update();
  }
  
}



void zoom(int x, int y) {
  //zooms on point (x,y)
  
}