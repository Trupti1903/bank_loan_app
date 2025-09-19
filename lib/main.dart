import 'package:bank_loan_app/screens/loan_form_screen.dart';
import 'package:bank_loan_app/screens/my_loans_screen.dart';
import 'package:flutter/material.dart';
import 'package:bank_loan_app/screens/splash_screen.dart';
import 'package:bank_loan_app/screens/welcome_screen.dart';
import 'package:bank_loan_app/screens/login_screen.dart';
import 'package:bank_loan_app/screens/register_screen.dart';
import 'package:bank_loan_app/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank Loan App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const SplashScreen(),

      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/apply-loan': (context) => const LoanFormScreen(),
        '/my-loans': (context) => const MyLoansScreen(),
      },
    );
  }
}
