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
  String usernameAvailability = '';
  String emailExistence = '';
  String passwordMatching = '';
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
      usernameAvailability = '';
      emailExistence = '';
      passwordMatching = '';
      return users.any((user) {
        if (user.username.compareTo(username) == 0) {
          usernameAvailability = 'Username not Available ,Try Something else!';
          return false;
        } else if (user.email.compareTo(email) == 0) {
          emailExistence = 'Email already exists ,Do you want to login?';
          return false;
        } else if (password.compareTo(confirmation) == 0) {
          users.add(User(
              firstName: firstName,
              lastName: lastName,
              username: username,
              email: email,
              password: password));
          context.read<UserProvider>().changeUser(users.last);
          return true;
        } else {
          passwordMatching = 'Password does not Match.';
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
                  child: TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      labelText: "First Name",
                    ),
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
                Text(usernameAvailability),
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
                Text(emailExistence),
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
                Text(passwordMatching),
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
        ]),
      )),
    );
  }
}
