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
  var formField = GlobalKey<FormState>();
  User user = users.first;
  bool passwordToggle = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formField,
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/blackRay/blackRay_all_white.png',
              width: 240,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: Colors.white,
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "Username/Email",
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                validator: (value) {
                  bool emailFound = users.any((user) {
                    if (user.email.compareTo(value!) == 0) {
                      this.user = user;
                      return true;
                    } else if (user.username.compareTo(value) == 0) {
                      this.user = user;
                      return true;
                    } else {
                      return false;
                    }
                  });

                  if (value!.isEmpty) {
                    return 'Please, Enter Your Username Or Email.';
                  } else if (!emailFound) {
                    return 'Username or Email Not Found';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                obscureText: passwordToggle,
                cursorColor: Colors.white,
                controller: passwordController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: "Password",
                    suffixIcon: InkWell(
                      splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            passwordToggle = !passwordToggle;
                          });
                        },
                        child: Icon(passwordToggle
                            ? Icons.visibility_sharp
                            : Icons.visibility_off_sharp)),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                validator: (value) {
                  if (user.password != value) {
                    return 'Wrong Password!';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  if (formField.currentState!.validate()) {
                    context.read<UserProvider>().changeUser(user);
                    Navigator.pushReplacementNamed(context, 'homePage');
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 180,
                height: 50,
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'New To Black Ray?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'signInPage');
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ))
              ],
            )
          ]),
        ),
      )),
    );
  }
}
