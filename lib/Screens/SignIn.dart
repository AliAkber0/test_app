import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Controller/AuthController.dart';

class Login extends GetWidget<AuthController> {
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
              SizedBox(height: 0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  controller.login(
                      emailController.text, passwordController.text);
                },
                child: Container(
                  color: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/SignUpPage');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: Text(
                    'SignUp',
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
