//import 'package:flutter/material.dart';

class Game {
  int? index;
  String name;
  String gameId;
  String developer;
  String publisher;
  String releaseDate;
  String metascore;
  String storage;
  String price;
  List<String> genres;
  List<String> genresId;
  String poster;
  List<String> screenShots;
  Game({
    required this.name,
    required this.developer,
    required this.publisher,
    required this.gameId,
    required this.releaseDate,
    required this.metascore,
    required this.storage,
    required this.price,
    required this.genres,
    required this.genresId,
    required this.poster,
    required this.screenShots,
    this.index,
  });
}

List<Game> games = [
  Game(
    name: "Red Dead Redemption 2",
    developer: "Rockstar Games",
    publisher: "Rockstar Games",
    gameId: "aa001",
    releaseDate: "2019-12-05",
    metascore: "93",
    storage: "150",
    price: "59.99 USD",
    poster: 'assets/rdr2/rdr2_poster.jpg',
    screenShots: [
      'assets/rdr2/rdr2_screenshot-1.jpg',
      'assets/rdr2/rdr2_screenshot-2.jpg',
      'assets/rdr2/rdr2_screenshot-3.jpg',
      'assets/rdr2/rdr2_screenshot-4.jpg',
      'assets/rdr2/rdr2_screenshot-5.jpg'
    ],
    genres: ["Action", "Adventure"],
    genresId: ["a1", "a2"],
    index: 0,
  ),
];
