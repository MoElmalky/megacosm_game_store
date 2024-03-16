import 'package:megacosm_game_store/models/game_model.dart';

class User {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;
  List<Game>? cart;
  List<Game>? wishlist;
  List<Game>? library;

  User(
      {required this.firstName,
      required this.lastName,
      required this.username,
      required this.email,
      required this.password,
      this.cart,
      this.wishlist,
      this.library});
}

List<User> users = [
  User(
    firstName: 'Mohamed',
    lastName: 'Elmalky',
    username: 'Mo_Elmalky',
    email: 'elmalkymohamed@gmail.com',
    password: '123456789',
  )
];
