import 'dart:math';
import 'package:flutter/material.dart';
import '../models/loan.dart';
import '../data/loan_data.dart';

class LoanFormScreen extends StatefulWidget {
  const LoanFormScreen({super.key});

  @override
  State<LoanFormScreen> createState() => _LoanFormScreenState();
}

class _LoanFormScreenState extends State<LoanFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Predefined loan types & interest rates
  final Map<String, double> _loanTypes = {
    "Home Loan": 8.5,
    "Car Loan": 9.0,
    "Education Loan": 7.0,
    "Personal Loan": 12.5,
    "Business Loan": 11.0,
  };

  String? _selectedLoanType;
  double _amount = 100000;
  int _duration = 12;

  // EMI calculation
  double get _interestRate => _loanTypes[_selectedLoanType] ?? 10.0;

  double get _monthlyEMI {
    double monthlyRate = _interestRate / 1200;
    int n = _duration;
    double numerator = _amount * monthlyRate * pow(1 + monthlyRate, n);
    double denominator = pow(1 + monthlyRate, n) - 1;
    return denominator != 0 ? (numerator / denominator) : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Apply Loan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Loan Type",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Loan type choice chips
              Wrap(
                spacing: 10,
                children: _loanTypes.keys.map((type) {
                  return ChoiceChip(
                    label: Text(type),
                    selected: _selectedLoanType == type,
                    onSelected: (_) {
                      setState(() => _selectedLoanType = type);
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),
              Text("Loan Amount: ₹${_amount.toStringAsFixed(0)}"),
              Slider(
                value: _amount,
                min: 50000,
                max: 2000000,
                divisions: 100,
                label: "₹${_amount.toStringAsFixed(0)}",
                onChanged: (val) => setState(() => _amount = val),
              ),

              const SizedBox(height: 20),
              Text("Duration: $_duration months"),
              Slider(
                value: _duration.toDouble(),
                min: 6,
                max: 120,
                divisions: 19,
                label: "$_duration months",
                onChanged: (val) => setState(() => _duration = val.toInt()),
              ),

              const SizedBox(height: 20),
              if (_selectedLoanType != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Interest Rate: $_interestRate%"),
                    Text(
                      "Estimated EMI: ₹${_monthlyEMI.toStringAsFixed(2)} / month",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

              const Spacer(),

              ElevatedButton(
                onPressed: _selectedLoanType == null
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          // Save Loan
                          LoanData.addLoan(
                            Loan(
                              loanType: _selectedLoanType!,
                              amount: _amount,
                              duration: _duration,
                              date: DateTime.now(),
                            ),
                          );

                          // Go back to My Loans
                          Navigator.pushReplacementNamed(context, '/my-loans');
                        }
                      },
                child: const Text("Submit Loan Application"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
