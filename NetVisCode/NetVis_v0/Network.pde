import java.util.Random;
import java.util.Arrays;
import java.util.Scanner;
import java.io.FileNotFoundException;

class Network{
  
  ArrayList<Node> nodes;
  ArrayList<Edge> edges;
  float Kr;
  float Ks;
  float restLength;
 
  
  Network(String filename, String cluster){
    Scanner sc = new Scanner("");
    try {
      sc = new Scanner(new File(filename));
    }
    catch ( FileNotFoundException e ) {
      System.out.println("Error 404: File not found");
      System.exit(0);
    }
    
    BinarySearchTree bst = new BinarySearchTree();
    sc.nextLine();
    sc.useDelimiter(",");
    while( sc.hasNextLine() ){
      if( sc.next().equals( cluster ) ){
        Random random = new Random();
        Node p1 = new Node( sc.next(), 350 + random.nextInt(501), 100 + random.nextInt(501), Kr);
        Node p2 = new Node( sc.next(), 350 + random.nextInt(501), 100 + random.nextInt(501), Kr);
        if( !bst.find( p1.protein ) ){
          nodes.add(p1);
          bst.add(p1.protein);
        }
        if( !bst.find( p2.protein ) ){
          nodes.add(p2);
          bst.add(p1.protein);
        }
        edges.add( new Edge( p1, p2, Ks, restLength ) );
        
      }
    }
       
       
  }
  
  
  
  void setRepForce(){ //check if for-each works in this case?
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
  }
  
  
  void update(){
    setRepForce();
    setSpringForce();
    for( Node n : nodes ){
      n.update();
    }
  
    //for( Edge e : edges ){
      //e.update();
    //}
  }
  
}