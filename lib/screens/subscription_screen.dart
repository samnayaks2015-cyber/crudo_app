import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String selectedPlan = "Daily";
  double qty = 1;

  // ✅ change this to your real prices later
  double pricePerLiter = 90;

  int get deliveryDays => selectedPlan == "Daily" ? 30 : 15;

  double get monthlyTotal => deliveryDays * qty * pricePerLiter;

  String get nextDeliveryText {
    if (selectedPlan == "Daily") {
      return "Delivery: Every morning before 8 AM";
    } else {
      return "Delivery: Alternate days before 8 AM";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Milk Subscription"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ✅ PLAN TITLE
            const Text(
              "Select Plan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // ✅ PLAN OPTIONS
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                    value: "Daily",
                    groupValue: selectedPlan,
                    title: const Text("Daily"),
                    onChanged: (v) {
                      setState(() => selectedPlan = v.toString());
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    value: "Alternate",
                    groupValue: selectedPlan,
                    title: const Text("Alternate"),
                    onChanged: (v) {
                      setState(() => selectedPlan = v.toString());
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ✅ QUANTITY
            const Text(
              "Quantity (Liters)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Slider(
              value: qty,
              min: 0.5,
              max: 5,
              divisions: 9,
              label: qty.toString(),
              onChanged: (v) {
                setState(() => qty = v);
              },
            ),

            Text(
              "$qty Liter per delivery",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 20),

            // ✅ DELIVERY INFO
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.local_shipping, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(child: Text(nextDeliveryText)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ✅ MONTHLY ESTIMATE
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    "Estimated Monthly Cost",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "₹${monthlyTotal.toStringAsFixed(0)}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // ✅ SUBSCRIBE BUTTON
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Subscription Saved")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 52),
              ),
              child: const Text("Start Subscription"),
            ),
          ],
        ),
      ),
    );
  }
}
