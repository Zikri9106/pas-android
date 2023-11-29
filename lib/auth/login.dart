import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Navigation.dart';
import '../utils/colors.dart';
import '../utils/dimensions.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight * 0.05),
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage("assets/image/mishop1.png"),
                ),
              ),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                // Implement email validation logic
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: Dimensions.height20),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.password_sharp),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
                return null;
              },
            ),
            SizedBox(height: Dimensions.height20),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name",
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                // Implement name validation logic
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: Dimensions.height20),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "Phone",
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                // Implement phone validation logic
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),
            SizedBox(height: Dimensions.height20),
            ElevatedButton(
              onPressed: () {
                if (validateForm()) {
                  String userEmail = emailController.text;
                  String userName = nameController.text;

                  Get.to(Navigation(email: userEmail, name: userName));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                ),
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: Dimensions.font20 + Dimensions.font20 / 2,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Dimensions.height10),
            RichText(
              text: TextSpan(
                text: "Have an account already?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font20,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.back();
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateForm() {
    return true;
  }
}
