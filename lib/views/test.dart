import 'package:flutter/material.dart';
import 'package:megacosm_game_store/data/games_data.dart';
import 'package:megacosm_game_store/widgets/game_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:megacosm_game_store/widgets/game_image_card.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

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
            Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'FEATURED & RECOMMENDED',
                        style: TextStyle(
                          color: Colors.grey.shade50,
                          fontSize: 16,
                        ),
                      )),
                  CarouselSlider(
                    items:
                        games.map((item) => GameImageCard(game: item)).toList(),
                    carouselController: _controller,
                    options: CarouselOptions(
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: games.asMap().entries.map((game) {
                      return InkWell(
                        onTap: () => setState(() {
                          _controller.animateToPage(game.key);
                        }),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(
                                  _current == game.key ? 0.8 : 0.2)),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
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
