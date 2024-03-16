// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/data/games_data.dart';
import 'package:megacosm_game_store/utils/user_option_drawer.dart';
import 'package:megacosm_game_store/widgets/auto_carousel_game_slider.dart';
import 'package:megacosm_game_store/widgets/game_card.dart';
import 'package:megacosm_game_store/widgets/horizontal_game_viewer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color mainBlack = const Color.fromRGBO(16, 16, 16, 1);
    return Scaffold(
        endDrawer: UserOptionsDrawer(),
        backgroundColor: mainBlack,
        appBar: AppBar(
          backgroundColor: mainBlack,
          surfaceTintColor: mainBlack,
          title: Row(
            children: [
              ImageIcon(
                AssetImage('assets/blackRay/blackRay_logo_white.png'),
                size: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top:8),
                child: Image.asset('assets/blackRay/blackRay_white.png',width: 100,fit: BoxFit.cover,),
              ),
            ],
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(
                  Icons.view_headline_sharp,
                  size: 30,
                  color: Colors.grey[100],
                ),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            AutoCarouselGameSlider(list: games),
            SizedBox(
              height: 20,
            ),
            HorizontalGameViewer(list: games, label: "On Sale"),
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
