// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';
import 'package:megacosm_game_store/models/rating_model.dart';
import 'package:megacosm_game_store/providers/rating_provider.dart';
import 'package:megacosm_game_store/providers/user_provider.dart';
import 'package:provider/provider.dart';

class RatingCard extends StatefulWidget {
  final Game game;
  const RatingCard({super.key, required this.game});

  @override
  State<RatingCard> createState() => _RatingCardState(game);
}

class _RatingCardState extends State<RatingCard> {
  final Game game;

  _RatingCardState(this.game);
  TextEditingController test1 = TextEditingController();
  TextEditingController test2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String username = context.watch<UserProvider>().user!.username;
    return Container(
      color: Colors.grey[900],
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 100,
                child: TextFormField(
                  controller: test1,
                  decoration: InputDecoration(label: Text('data')),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 100,
                child: TextFormField(
                  controller: test2,
                  decoration: InputDecoration(label: Text('data')),
                ),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            setState(() {
              Rating rating = Rating(
                      rating: int.parse(test1.text),
                      comment: test2.text,
                      username: username);
              context.read<RatingProvider>().addRating(
                  game,
                  rating);
            });
          },
          child: Container(
            color: Colors.blue,
            width: double.infinity,
            height: 50,
          ),
        ),
        Text(game.ratings!.length.toString()),
        ...game.ratings!.map((e) {
          return Column(
            children: [
              Text(e.username),
              Text(e.rating.toString()),
              Text(e.comment)
            ],
          );
        }).toList(),
      ]),
    );
  }
}
