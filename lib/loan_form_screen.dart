import 'package:bank_loan_app/screens/dashboard_screen.dart';
import 'package:bank_loan_app/screens/loan_form_screen.dart';
import 'package:bank_loan_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank Loan Management',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/loanForm': (context) => const LoanFormScreen(),
      },
    );
  }
}
