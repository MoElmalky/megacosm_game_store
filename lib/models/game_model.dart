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
  String header;
  List<String> screenShots;
  Color mainColor;
  String description;
  List<Rating> ratings;
  double totalRatings =0;
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
    this.header = 'assets/blackRay/blackray_placeholder.jpg',
    required this.screenShots,
    this.mainColor = const Color.fromRGBO(25, 118, 210, 1),
    this.description = "",
    required this.ratings,
  }) {
    if(ratings.isEmpty){
      totalRatings =0;
    }
    else{
      for (var e in ratings) {
      totalRatings = totalRatings + e.rating;
    }
    totalRatings =
        double.parse((totalRatings / ratings.length).toStringAsFixed(1));
    }
  }
}
