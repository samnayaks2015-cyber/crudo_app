import 'package:flutter/material.dart';

void main() {
  runApp(const CrudoApp());
}

class CrudoApp extends StatelessWidget {
  const CrudoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crudo Milk',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUDO MILK'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            productCard("Cow Milk", "₹60 / litre"),
            productCard("Buffalo Milk", "₹70 / litre"),
            productCard("Curd", "₹50 / kg"),
          ],
        ),
      ),
    );
  }

  Widget productCard(String name, String price) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: const Icon(Icons.local_drink, color: Colors.green),
        title: Text(name),
        subtitle: Text(price),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Text("Buy"),
        ),
      ),
    );
  }
}
