import 'package:flutter/material.dart';

import '../utils/colors.dart';

class AccountPage extends StatelessWidget {
  final String name;
  final String email;

  const AccountPage({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Displaying user information
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            email,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Implement profile settings logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
            ),
            child: Text("Profile Settings"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Implement logout logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
