class BinarySearchTree {

  class Value {
  
    Node data;
    Value left;
    Value right;
  
    Value(Node data){
      this.data = data;
    }
  }
  
  
  Value root;


  BinarySearchTree() {
  }
  
  

  public void add(Node prot){
    Value toAdd = new Value( prot );
    if( root==null ){
      root = toAdd;
      return;
    }
    
    Value current = root;
    Value parent = null;
    
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
    Value current = root;
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