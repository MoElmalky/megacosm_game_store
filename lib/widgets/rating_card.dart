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
  int rating = 1;
  double totalRatings = 0;
  @override
  Widget build(BuildContext context) {
    String username = context.watch<UserProvider>().user!.username;
    bool rated = game.ratings!.any((e) {
      return e.username == username;
    });
    return Container(
      color: Colors.grey[900],
      padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.only(bottom: 20),
      child: Column(children: [
        Container(
          child: Text(totalRatings.toString()),
        ),
        rated
            ? SizedBox()
            : Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          username,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            ...List.generate(5, (index) {
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      rating = index + 1;
                                      print(totalRatings);
                                    });
                                  },
                                  child: Icon(
                                    Icons.star,
                                    color: rating > index
                                        ? Colors.white
                                        : Colors.white24,
                                  ));
                            })
                          ],
                        )
                      ],
                    ),
                    Divider(),
                    TextFormField(
                      cursorColor: Colors.white,
                      maxLines: null,
                      controller: test2,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[900],
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          filled: true,
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  for (var e in game.ratings!) {
                                    totalRatings += e.rating;
                                  }
                                  totalRatings = double.parse(
                                      (totalRatings / game.ratings!.length)
                                          .toStringAsFixed(1));
                                  context.read<RatingProvider>().addRating(
                                      game,
                                      Rating(
                                          rating: rating,
                                          comment: test2.text,
                                          username: username));
                                });
                              },
                              child: Icon(
                                Icons.send_sharp,
                                color: Colors.white,
                              ))),
                    ),
                  ],
                ),
              ),
        ...List.generate(game.ratings!.length, (index) {
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 10, left: 5, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.black26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      game.ratings![index].username,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++) ...{
                          if ((game.ratings![index].rating) - i > 0) ...{
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            )
                          } else ...{
                            Icon(
                              Icons.star,
                              color: Colors.white24,
                            )
                          }
                        }
                      ],
                    )
                  ],
                ),
                Divider(),
                Text(
                  game.ratings![index].comment,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          );
        }),
      ]),
    );
  }
}
