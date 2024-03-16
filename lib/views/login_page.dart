// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/user_model.dart';
import 'package:megacosm_game_store/providers/user_provider.dart';
import 'package:provider/provider.dart';

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
    bool isValid(String email, String password) {
      passwordValidation = '';
      emailValidation = '';
      if(email.isEmpty){
        emailValidation = 'This Field Cannot be Empty.';
        return false;
      }else if(password.isEmpty){
        passwordValidation = 'This Field Cannot be Empty.';
        return false;
      }
      return users.any((user) {
        if (user.email.compareTo(email) == 0) {
          if (user.password == password) {
            context.read<UserProvider>().changeUser(user);
            return true;
          } else {
            passwordValidation = "Password is Wrong";
            return false;
          }
        } else {
          emailValidation = "Email not Found";
          return false;
        }
      });
    }

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
                Text(emailValidation,
                  style: TextStyle(color: Colors.red),),
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
                Text(passwordValidation,
                  style: TextStyle(color: Colors.red),),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (isValid(emailController.text, passwordController.text)) {
                  Navigator.pushReplacementNamed(context, 'homePage');
                }
              });
            },
            child: Container(
              color: Colors.blue,
              width: 200,
              height: 50,
            ),
          ),
          SizedBox(height: 50,),
          InkWell(
            onTap: () {
              setState(() {
                  Navigator.pushReplacementNamed(context, 'signInPage');
              });
            },
            child: Container(
              color: Colors.blue,
              width: 200,
              height: 50,
            ),
          ),
        ]),
      )),
    );
  }
}
