import 'package:flutter/material.dart';

class LoanFormScreen extends StatefulWidget {
  const LoanFormScreen({super.key});

  @override
  State<LoanFormScreen> createState() => _LoanFormScreenState();
}

class _LoanFormScreenState extends State<LoanFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String amount = '';
  String purpose = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Apply Loan")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Loan Amount"),
                keyboardType: TextInputType.number,
                onChanged: (val) => amount = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Purpose"),
                onChanged: (val) => purpose = val,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Loan Application Submitted!"),
                      ),
                    );
                  }
                },
                child: const Text("Submit Loan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
