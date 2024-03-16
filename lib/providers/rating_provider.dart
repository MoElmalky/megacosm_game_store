import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';
import 'package:megacosm_game_store/models/rating_model.dart';

class RatingProvider extends ChangeNotifier{
  void addRating(Game game,Rating rating){
    game.ratings!.insert(0,rating);
    notifyListeners();
  }
}