import 'package:flutter/material.dart';

class LoanHistoryScreen extends StatelessWidget {
  const LoanHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Loan History")),
      body: const Center(
        child: Text(
          "Your loan history will appear here.",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
