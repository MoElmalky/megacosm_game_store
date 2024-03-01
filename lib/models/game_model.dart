//import 'package:flutter/material.dart';
class Game {
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
  });
}
