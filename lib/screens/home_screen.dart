import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int cowQty = 0;
  int buffaloQty = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Row(
          children: [

            Image.asset(
              "assets/images/logo.png",
              height: 35,
            ),

            const SizedBox(width:8),

            const Text("CRUDO"),
          ],
        ),

        actions: [

          Stack(
            children: [

              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CartScreen(),
                    ),
                  );
                },
              ),

              if(CartService.cart.isNotEmpty)
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    CartService.cart.length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),

      body: SingleChildScrollView(

        child: Column(

          children: [

            const SizedBox(height:10),

            /// BANNERS
            SizedBox(
              height:170,
              child: PageView(
                children: [

                  banner("assets/images/banner1.png"),
                  banner("assets/images/banner2.png"),
                  banner("assets/images/banner3.png"),

                ],
              ),
            ),

            const SizedBox(height:25),

            /// PRODUCTS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                productCard(
                    "Cow Milk",
                    90,
                    "assets/images/cowmilk.png",
                    cowQty,
                        (){
                      setState(()=> cowQty++);
                      CartService.addItem("Cow Milk");
                    },
                        (){
                      if(cowQty>0){
                        setState(()=> cowQty--);
                        CartService.removeItem("Cow Milk");
                      }
                    }
                ),

                productCard(
                    "Buffalo Milk",
                    130,
                    "assets/images/buffalomilk.png",
                    buffaloQty,
                        (){
                      setState(()=> buffaloQty++);
                      CartService.addItem("Buffalo Milk");
                    },
                        (){
                      if(buffaloQty>0){
                        setState(()=> buffaloQty--);
                        CartService.removeItem("Buffalo Milk");
                      }
                    }
                ),

              ],
            ),

            const SizedBox(height:30),

          ],
        ),
      ),
    );
  }

  Widget banner(String img){

    return Container(
      margin: const EdgeInsets.symmetric(horizontal:16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget productCard(
      String name,
      int price,
      String image,
      int qty,
      VoidCallback add,
      VoidCallback remove){

    return Container(
      width:160,
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(

        children: [

          Image.asset(image,height:90),

          const SizedBox(height:8),

          Text(name,
              style: const TextStyle(fontWeight: FontWeight.bold)),

          const SizedBox(height:4),

          Text("₹$price",
              style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold)),

          const SizedBox(height:10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              IconButton(
                icon: const Icon(Icons.remove_circle,color:Colors.red),
                onPressed: remove,
              ),

              Text(qty.toString()),

              IconButton(
                icon: const Icon(Icons.add_circle,color:Colors.green),
                onPressed: add,
              ),

            ],
          )
        ],
      ),
    );
  }
}
