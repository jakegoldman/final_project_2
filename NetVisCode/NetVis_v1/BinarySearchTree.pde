class BinarySearchTree {

  class Nodule {
  
    Node data;
    Nodule left;
    Nodule right;
  
    Nodule(Node data){
      this.data = data;
    }
  }
  
  
  Nodule root;


  BinarySearchTree() {
  }
  
  

  public void add(Node prot){
    Nodule toAdd = new Nodule( prot );
    if( root==null ){
      root = toAdd;
      return;
    }
    
    Nodule current = root;
    Nodule parent = null;
    
    while(true){
      parent = current;
      if( prot.compareTo( current.data ) < 0 ){        
        current = current.left;
        if( current == null ){
          parent.left = toAdd;
          return;
        }
      } else {
        current = current.right;
        if( current == null ){
          parent.right = toAdd;
          return;
        }
      }
    }
  }
  
  

  public Node find(Node prot){
    Nodule current = root;
    while( current!=null ) {
      if( current.data.protein.equals(prot.protein) ) {
        return current.data;
      } else if( current.data.compareTo( prot ) > 0 ) {
        current = current.left;
      } else {
        current = current.right;
      }
    }
    return null;
  }
  
  
}