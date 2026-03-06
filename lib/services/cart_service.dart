class CartService {

  static Map<String,int> cart = {};

  static void addItem(String name){

    if(cart.containsKey(name)){
      cart[name] = cart[name]! + 1;
    }else{
      cart[name] = 1;
    }

  }

  static void removeItem(String name){

    if(cart.containsKey(name) && cart[name]! > 0){
      cart[name] = cart[name]! - 1;
    }

  }

}
