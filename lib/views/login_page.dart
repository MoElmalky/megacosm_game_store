// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String emailValidation = "";
  String passwordValidation = "";
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(children: [
          SizedBox(
            height: 100,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
                Text(emailValidation),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Column(
              children: [
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
                Text(passwordValidation),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              setState(() {
                if(isValid(emailController.text, passwordController.text)){
                  Navigator.pushReplacementNamed(context,'homePage');
                }
              });
            },
            child: Container(
              color: Colors.blue,
              width: 200,
              height: 50,
            ),
          )
        ]),
      )),
    );
  }

  bool isValid(String email, String password) {
    passwordValidation = '';
    emailValidation = '';
    bool isPasswordCorrect = false;
    users.any((element) {
      if (element.email.compareTo(email) == 0) {
        if (element.password == password) {
          isPasswordCorrect = true;
        } else {
          passwordValidation = "Password is Wrong";
        }
        return true;
      } else {
        emailValidation = "Email not Found";
        return false;
      }
    });
    return isPasswordCorrect;
  }
}
