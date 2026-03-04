import 'package:flutter/material.dart';

void main() {
  runApp(const CrudoApp());
}

class Product {
  final String name;
  final int price;
  final String image;
  int qty;

  Product(this.name, this.price, this.image, {this.qty = 0});
}

class CrudoApp extends StatelessWidget {
  const CrudoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CRUDO",
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Product> products = [
    Product("Cow Milk", 90, "assets/images/cow_milk.png"),
    Product("Buffalo Milk", 130, "assets/images/buffalo_milk.png"),
  ];

  int get cartCount {
    int count = 0;
    for (var p in products) {
      count += p.qty;
    }
    return count;
  }

  int get totalPrice {
    int t = 0;
    for (var p in products) {
      t += p.price * p.qty;
    }
    return t;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset("assets/images/logo.png", height: 32),
            const SizedBox(width: 10),
            const Text(
              "CRUDO",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [

          Stack(
            children: [

              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CartScreen(products),
                    ),
                  ).then((_) => setState(() {}));
                },
              ),

              if (cartCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.red,
                    child: Text(
                      cartCount.toString(),
                      style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white),
                    ),
                  ),
                )

            ],
          )

        ],
      ),

      body: ListView(

        children: [

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("assets/images/banner.jpg"),
            ),
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: .8
            ),
            itemBuilder: (context, index) {

              final p = products[index];

              return Container(

                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),

                padding: const EdgeInsets.all(12),

                child: Column(

                  children: [

                    Expanded(child: Image.asset(p.image)),

                    const SizedBox(height: 6),

                    Text(
                      p.name,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),

                    Text(
                      "₹${p.price}",
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.green),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            setState(() {
                              if (p.qty > 0) p.qty--;
                            });
                          },
                        ),

                        Text(
                          p.qty.toString(),
                          style: const TextStyle(fontSize: 18),
                        ),

                        IconButton(
                          icon: const Icon(Icons.add_circle),
                          onPressed: () {
                            setState(() {
                              p.qty++;
                            });
                          },
                        ),

                      ],
                    )

                  ],
                ),
              );

            },
          ),

        ],
      ),
    );
  }
}

class CartScreen extends StatefulWidget {

  final List<Product> products;

  const CartScreen(this.products, {super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int get total {

    int t = 0;

    for (var p in widget.products) {
      t += p.qty * p.price;
    }

    return t;
  }

  @override
  Widget build(BuildContext context) {

    final items = widget.products.where((p) => p.qty > 0).toList();

    return Scaffold(

      appBar: AppBar(title: const Text("Cart")),

      body: items.isEmpty
          ? const Center(child: Text("Cart Empty"))
          : Column(

        children: [

          Expanded(

            child: ListView.builder(

              itemCount: items.length,

              itemBuilder: (context, i) {

                final p = items[i];

                return ListTile(

                  leading: Image.asset(p.image, width: 40),

                  title: Text(p.name),

                  subtitle: Text("₹${p.price} x ${p.qty}"),

                );

              },

            ),

          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Total ₹$total",
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          )

        ],

      ),
    );
  }
}
