//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/rating_model.dart';

class Game {
  String name;
  String gameId;
  String developer;
  String publisher;
  String releaseDate;
  String metascore;
  String storage;
  String price;
  String sale;
  List<String> genres;
  List<String> genresId;
  String poster;
  List<String> screenShots;
  Color mainColor;
  String description;
  List<Rating>? ratings;
  int? totalRatings;
  Game({
    required this.name,
    required this.developer,
    required this.publisher,
    required this.gameId,
    required this.releaseDate,
    required this.metascore,
    this.storage = "60",
    required this.price,
    this.sale = "0",
    required this.genres,
    required this.genresId,
    required this.poster,
    required this.screenShots,
    this.mainColor =  const Color.fromRGBO(25, 118, 210, 1),
    this.description = "",
    this.ratings,
  });
}
