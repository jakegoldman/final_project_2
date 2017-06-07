class Network{
  
  Node[] nodes;
  Edge[] edges;
  float Kr;
  float Ks;
  float restLength;
 
  
  Network(String filename){
    // load file, initialize the stuff
  }
  
  
  void setRepForce(){
    for( Node applyTo : nodes ){
    PVector repForce = new PVector(0,0);
    for( Node toApply : nodes ){
      if( toApply != applyTo ){ // make sure not to apply a rep force to itself
          repForce.add( toApply.repel(applyTo) );
        }
      }
      applyTo.repForce = repForce;
    }
  }
  
  
  void setSpringForce(){
    for( Edge e : edges ){
    e.calcSpringForce();
  }
  
  
  void update(){
    setRepForce();
    setSpringForce();
    for( Node n : nodes ){
      n.update();
    }
  
    for( Edge e : edges ){
      e.update();
    }
  }
  
}