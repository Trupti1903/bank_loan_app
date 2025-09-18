import 'package:flutter/material.dart';

class MyLoansScreen extends StatefulWidget {
  const MyLoansScreen({super.key});

  @override
  State<MyLoansScreen> createState() => _MyLoansScreenState();
}

class _MyLoansScreenState extends State<MyLoansScreen> {
  // Demo loan list
  final List<Map<String, String>> loans = [
    {"title": "Personal Loan", "status": "Approved"},
    {"title": "Car Loan", "status": "Pending"},
    {"title": "Business Loan", "status": "Approved"},
    {"title": "Education Loan", "status": "Rejected"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Loans"),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: loans.length,
        itemBuilder: (context, index) {
          final loan = loans[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: ListTile(
              leading: const Icon(Icons.account_balance),
              title: Text(loan["title"]!),
              subtitle: Text("Status: ${loan["status"]}"),
            ),
          );
        },
      ),
    );
  }

  // Expose stats for dashboard
  Map<String, int> getLoanStats() {
    int total = loans.length;
    int approved = loans.where((l) => l["status"] == "Approved").length;
    int pending = loans.where((l) => l["status"] == "Pending").length;
    int rejected = loans.where((l) => l["status"] == "Rejected").length;

    return {
      "total": total,
      "approved": approved,
      "pending": pending,
      "rejected": rejected,
    };
  }
}
