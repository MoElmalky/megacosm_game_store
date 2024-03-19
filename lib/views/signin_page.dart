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
  var formField = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool passwordToggle = true;
  bool confirmToggle = true;
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
            Image.asset('assets/blackRay/blackRay_logo_white.png',width: 100,fit: BoxFit.cover,),
            SizedBox(height: 10,),
            Image.asset('assets/blackRay/blackRay_white.png',width: 200,fit: BoxFit.cover,),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 180,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    controller: firstNameController,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: "First Name",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This Field Is Required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 180,
                  child: TextFormField(
                    cursorColor: Colors.white,
                    controller: lastNameController,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: "Last Name (Optional)",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: Colors.white,
                controller: usernameController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: "Username",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                validator: (value) {
                  bool usernameExisted = users.any((user) {
                    if (user.username.compareTo(value!) == 0) {
                      return true;
                    } else {
                      return false;
                    }
                  });
                  if (value!.isEmpty) {
                    return 'This Field Is Required';
                  } else if (usernameExisted) {
                    return 'Username not Available ,Try Something else!';
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
                cursorColor: Colors.white,
                controller: emailController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                validator: (value) {
                  bool emailValidation =
                      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                          .hasMatch(value!);

                  bool emailExisted = users.any((user) {
                    if (user.email.compareTo(value) == 0) {
                      return true;
                    } else {
                      return false;
                    }
                  });
                  if (value.isEmpty) {
                    return 'This Field Is Required';
                  } else if (emailExisted) {
                    return 'Email already exists ,Do you want to login?';
                  } else if (!emailValidation) {
                    return 'Please, Enter A Valid Email.';
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
                    border: OutlineInputBorder(),
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
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Password must be at least 6 letters long';
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
                obscureText: confirmToggle,
                cursorColor: Colors.white,
                controller: confirmPasswordController,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(),
                    suffixIcon: InkWell(
                      splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            confirmToggle = !confirmToggle;
                          });
                        },
                        child: Icon(confirmToggle
                            ? Icons.visibility_sharp
                            : Icons.visibility_off_sharp)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white))),
                validator: (value) {
                  if (value!.compareTo(passwordController.text) != 0) {
                    return 'Password doesn\'t Match';
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
                    users.add(User(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      username: usernameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    ));
                    context.read<UserProvider>().changeUser(users.last);
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
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 15,),
                Text(
                  'Already Have An Account?',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'loginPage');
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue
                      ),
                    ))
              ],
            )
          ]),
        ),
      )),
    );
  }
}
