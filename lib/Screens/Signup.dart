import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Controller/AuthController.dart';

class SignUp extends GetWidget<AuthController> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Enter the User Data"),
              SizedBox(height: 50),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(hintText: 'Username'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  controller.createuser(
                    usernameController.text,
                    passwordController.text,
                    emailController.text,
                    idController.text,
                  );
                },
                child: Container(
                  color: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
