// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/data/games_data.dart';
import 'package:megacosm_game_store/utils/blackRay_app_bar.dart';
import 'package:megacosm_game_store/utils/user_option_drawer.dart';
import 'package:megacosm_game_store/widgets/auto_carousel_game_slider.dart';
import 'package:megacosm_game_store/widgets/horizontal_game_viewer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color mainBlack = const Color.fromRGBO(16, 16, 16, 1);
    return Scaffold(
        endDrawer: UserOptionsDrawer(),
        backgroundColor: mainBlack,
        appBar: BlackRayAppBar(),
        body: ListView(
          children: [
            AutoCarouselGameSlider(list: featuredGames),
            SizedBox(
              height: 20,
            ),
            HorizontalGameViewer(list: onSale, label: "On Sale"),
            SizedBox(height: 20,),
            HorizontalGameViewer(list: newReleases, label: "New Releases"),
            SizedBox(height: 20,),
            HorizontalGameViewer(list: topSellers, label: "Top Sellers"),
            SizedBox(height: 20,),
            HorizontalGameViewer(list: mostPlayed, label: "Most Played"),
            SizedBox(height: 20,),
            HorizontalGameViewer(list: mostPopular, label: "Most Popular"),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
