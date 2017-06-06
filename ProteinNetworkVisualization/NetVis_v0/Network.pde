import java.util.Scanner;

class Network{
  
  Node[] nodes;
  Edge[] edges;
  float Kr;
  float Ks;
  float restLength;
 
  
  Network(String filename){
    Scanner sc;
    try {
      sc = new Scanner(new File(filename));
    }
    catch (FileNotFoundException e) {
      System.out.println("Error 404: File not found");
      System.exit(0);
    }
      
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