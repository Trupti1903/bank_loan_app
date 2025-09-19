import 'package:flutter/material.dart';

class AboutBankScreen extends StatelessWidget {
  const AboutBankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About MyBank"),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Bank Logo Placeholder
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.purple.shade100,
              child: const Icon(
                Icons.account_balance,
                size: 60,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              "Welcome to MyBank",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 10),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "MyBank is committed to providing reliable and customer-friendly "
                  "financial services. From personal loans to business funding, "
                  "we aim to make banking easier, faster, and more transparent.",
                  style: TextStyle(fontSize: 16, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Vision & Mission
            Row(
              children: const [
                Icon(Icons.visibility, color: Colors.purple),
                SizedBox(width: 8),
                Text(
                  "Our Vision",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "To be the most trusted and innovative bank for every individual.",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),

            Row(
              children: const [
                Icon(Icons.flag, color: Colors.purple),
                SizedBox(width: 8),
                Text(
                  "Our Mission",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "To empower people by offering affordable loans and easy banking solutions.",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20),

            // Contact Info
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.purple),
                title: const Text("Customer Support"),
                subtitle: const Text("+91 1800-123-456"),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.purple),
                title: const Text("Email Us"),
                subtitle: const Text("support@mybank.com"),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.purple),
                title: const Text("Head Office"),
                subtitle: const Text("Rajkot, Gujarat, India"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
