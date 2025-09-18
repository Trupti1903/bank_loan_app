import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Name: Demo User", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Email: demo@bank.com", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Education: Graduate", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
