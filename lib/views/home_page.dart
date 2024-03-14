import 'package:flutter/material.dart';
import 'package:megacosm_game_store/data/games_data.dart';
import 'package:megacosm_game_store/widgets/auto_carousel_game_slider.dart';
import 'package:megacosm_game_store/widgets/game_card.dart';
import 'package:megacosm_game_store/widgets/vertical_game_viewer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color mainBlack = const Color.fromRGBO(16, 16, 16, 1);
    return Scaffold(
        backgroundColor: mainBlack,
        appBar: AppBar(
          backgroundColor: mainBlack,
        ),
        body: ListView(
          children: [
            AutoCarouselGameSlider(list: games),
            SizedBox(
              height: 20,
            ),
            VerticalGameViewer(list: games, label: "On Sale"),
            SizedBox(
              height: 20,
            ),
            ...games.map(
              (e) {
                return GameCard(game: e);
              },
            ).toList()
          ],
        ));
  }
}
