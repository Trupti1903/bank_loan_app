import 'package:flutter/material.dart';
import '../data/user_data.dart';
import '../models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = UserData.getUser();

    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      body: user == null
          ? const Center(
              child: Text(
                "No user data available. Please register or login.",
                style: TextStyle(fontSize: 16),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    child: Icon(Icons.person, size: 50),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Name: ${user.name}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Email: ${user.email}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Education: ${user.education}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Optional: Clear user data on logout
                        UserData.clearUser();
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      child: const Text("Logout"),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
