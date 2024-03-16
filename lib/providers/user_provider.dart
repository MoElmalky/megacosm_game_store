import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/user_model.dart';

class UserProvider extends ChangeNotifier{
  User? user;

  UserProvider({this.user}){
    user ??= User(firstName: 'default', lastName: 'name', username: 'username', email: 'email', password: 'password');
  }

  void changeUser(User newUser)async{
    user = newUser;
    notifyListeners();
  }


}