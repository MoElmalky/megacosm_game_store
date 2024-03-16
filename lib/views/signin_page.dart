// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/user_model.dart';
import 'package:megacosm_game_store/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String usernameAlert = '';
  String firstNameAlert = '';
  String emailAlert = '';
  String passwordAlert = '';
  String confirmationAlert = '';
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool addUser(String firstName, String lastName, String username,
        String email, String password, String confirmation) {
      usernameAlert = '';
      emailAlert = '';
      passwordAlert = '';
      firstNameAlert = '';
      confirmationAlert = '';
      return users.any((user) {
        if (firstName.isEmpty) {
          firstNameAlert = 'This Field Is Required';
          return false;
        } else if (username.isEmpty) {
          usernameAlert = 'This Field Is Required';
          return false;
        } else if (email.isEmpty) {
          emailAlert = 'This Field Is Required';
          return false;
        } else if (password.length < 7) {
          passwordAlert = 'Password must be at least 6 letters long!';
          return false;
        }
        if (user.username.compareTo(username) == 0) {
          usernameAlert = 'Username not Available ,Try Something else!';
          return false;
        } else if (user.email.compareTo(email) == 0) {
          emailAlert = 'Email already exists ,Do you want to login?';
          return false;
        } else if (password.compareTo(confirmation) == 0) {
          users.add(User(
              firstName: firstName,
              lastName: lastName,
              username: username,
              email: email,
              password: password,
              ));
          context.read<UserProvider>().changeUser(users.last);
          return true;
        } else {
          confirmationAlert = 'Password doesn\'t Match.';
          return false;
        }
      });
    }

    return Scaffold(
      body: SafeArea(
          child: Container(
        child: ListView(children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: firstNameController,
                        decoration: InputDecoration(
                          labelText: "First Name",
                        ),
                      ),
                      Text(
                        firstNameAlert,
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      labelText: "Last Name",
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: Column(
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                  ),
                ),
                Text(
                  usernameAlert,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
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
                Text(
                  emailAlert,
                  style: TextStyle(color: Colors.red),
                ),
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
                Text(
                  passwordAlert,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Column(
              children: [
                TextFormField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                  ),
                ),
                Text(
                  confirmationAlert,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (addUser(
                    firstNameController.text,
                    lastNameController.text,
                    usernameController.text,
                    emailController.text,
                    passwordController.text,
                    confirmPasswordController.text)) {
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
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              setState(() {
                Navigator.pushReplacementNamed(context, 'loginPage');
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
