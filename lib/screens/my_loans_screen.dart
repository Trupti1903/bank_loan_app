import 'package:flutter/material.dart';
import '../data/loan_data.dart';
import '../models/loan.dart';

class MyLoansScreen extends StatelessWidget {
  const MyLoansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Loan> loans = LoanData.getLoans();

    return Scaffold(
      appBar: AppBar(title: const Text("My Loans")),
      body: loans.isEmpty
          ? const Center(child: Text("No loans taken yet"))
          : ListView.builder(
              itemCount: loans.length,
              itemBuilder: (context, index) {
                final loan = loans[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text("${loan.loanType} - ₹${loan.amount}"),
                    subtitle: Text(
                      "Duration: ${loan.duration} months\nDate: ${loan.date.toLocal()}",
                    ),
                  ),
                );
              },
            ),
    );
  }
}
