import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),

      body: ListView(

        children: [

          const SizedBox(height: 20),

          // Profile Header
          Column(
            children: [

              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 40,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Customer Name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "+91 9876543210",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

            ],
          ),

          const SizedBox(height: 30),

          profileTile(
            icon: Icons.shopping_bag,
            title: "My Orders",
          ),

          profileTile(
            icon: Icons.repeat,
            title: "My Subscriptions",
          ),

          profileTile(
            icon: Icons.location_on,
            title: "Delivery Address",
          ),

          profileTile(
            icon: Icons.account_balance_wallet,
            title: "Wallet",
          ),

          profileTile(
            icon: Icons.support_agent,
            title: "Support",
          ),

          profileTile(
            icon: Icons.info,
            title: "About CRUDO",
          ),

          const SizedBox(height: 20),

          // Logout Button
          Padding(
            padding: const EdgeInsets.all(20),

            child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),

              onPressed: () {

                Navigator.pushReplacementNamed(context, "/login");

              },

              child: const Text(
                "Logout",
                style: TextStyle(fontSize: 16),
              ),

            ),
          )

        ],

      ),

    );
  }

  Widget profileTile({
    required IconData icon,
    required String title,
  }) {

    return ListTile(

      leading: Icon(icon, color: Colors.green),

      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),

      trailing: const Icon(Icons.arrow_forward_ios, size: 16),

      onTap: () {},

    );
  }
}
