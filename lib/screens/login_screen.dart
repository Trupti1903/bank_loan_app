import 'package:flutter/material.dart';
import '../data/user_data.dart';
import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),

            /// 🔹 App Logo or Icon
            Icon(Icons.lock_outline, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 16),

            /// 🔹 Welcome Text
            Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[700],
              ),
            ),
            const SizedBox(height: 40),

            /// 🔹 Login Form
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      /// Email Field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: (val) => email = val,
                        validator: (val) => val!.isEmpty ? "Enter email" : null,
                      ),
                      const SizedBox(height: 16),

                      /// Password Field
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: (val) => password = val,
                        validator: (val) =>
                            val!.isEmpty ? "Enter password" : null,
                      ),

                      const SizedBox(height: 24),

                      /// Login Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 3,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // ✅ Simulate successful login
                              UserData.setUser(
                                User(
                                  name: "Demo User",
                                  email: email,
                                  education: "Not provided",
                                  phone: '',
                                ),
                              );
                              Navigator.pushReplacementNamed(
                                context,
                                '/dashboard',
                              );
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// Forgot Password
                      TextButton(
                        onPressed: () {
                          // Future: Add Forgot Password flow
                        },
                        child: const Text("Forgot Password?"),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// 🔹 Sign Up Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don’t have an account? "),
                GestureDetector(
                  onTap: () {
                    // Future: Navigate to Register
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
