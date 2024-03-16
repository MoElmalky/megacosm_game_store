import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';
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
  void removeGameFromWishlist(Game game)async{
    user!.wishlist!.remove(game);
    notifyListeners();
  }
  void removeGameFromCart(Game game)async{
    user!.cart!.remove(game);
    notifyListeners();
  }

  void addGameToWishlist(Game game)async{
    user!.wishlist!.add(game);
    notifyListeners();
  }
  void addGameToCart(Game game)async{
    user!.cart!.add(game);
    notifyListeners();
  }


}