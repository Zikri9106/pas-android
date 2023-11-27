import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pas-android/utils/colors.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text("Profile", style:24,
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}