// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';
import 'package:megacosm_game_store/utils/price_display.dart';

class GameImageCard extends StatelessWidget {
  final Game game;
  const GameImageCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, 'gamePage',arguments: game);
      },
      child: ClipRRect(
          borderRadius:
              BorderRadius.circular(5.0),
          child: Stack(
            children: <Widget>[
              Image.asset(game.header,
                  fit: BoxFit.cover, width: double.infinity,height: 190,),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          game.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                        ),
                      ),
                      PriceDisplay(price: game.price, sale: game.sale,scale: .8,)
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}