import '../models/product.dart';

class CartService {

  static List<Product> cartItems = [];

  static void add(Product product){
    cartItems.add(product);
  }

  static void remove(Product product){
    cartItems.remove(product);
  }

  static int get count => cartItems.length;

}
