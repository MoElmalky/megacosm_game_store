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
      this.library}){
        cart ??= [];
        wishlist ??= [];
        library ??=[];
      }
}

List<User> users = [
  User(
    firstName: 'Quick',
    lastName: 'Access',
    username: 'dev_1',
    email: '1',
    password: '1',
  ),
  User(
    firstName: 'Quick',
    lastName: 'Access',
    username: 'dev_2',
    email: '2',
    password: '2',
  ),
  User(
    firstName: 'Quick',
    lastName: 'Access',
    username: 'dev_3',
    email: '3',
    password: '3',
  ),
  User(
    firstName: 'Quick',
    lastName: 'Access',
    username: 'dev_4',
    email: '4',
    password: '4',
  ),
  User(
    firstName: 'Quick',
    lastName: 'Access',
    username: 'dev_5',
    email: '5',
    password: '5',
  ),
  User(
    firstName: 'Quick',
    lastName: 'Access',
    username: 'dev_6',
    email: '6',
    password: '6',
  ),
  User(
    firstName: 'Mohamed',
    lastName: 'Elmalky',
    username: 'Mo_Elmalky',
    email: 'elmalky@gmail.com',
    password: '123456789',
  ),
];
