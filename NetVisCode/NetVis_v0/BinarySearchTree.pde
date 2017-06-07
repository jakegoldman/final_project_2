class BinarySearchTree {

  class Nodule {
  
    String data;
    Nodule left;
    Nodule right;
  
    Nodule(String data){
      this.data = data;
    }
  }
  
  
  Nodule root;


  BinarySearchTree() {
  }
  
  
  public void add(String prot){
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
  
  
}