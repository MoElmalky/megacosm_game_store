import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';
import 'package:megacosm_game_store/widgets/game_image_card.dart';

class AutoCarouselGameSlider extends StatefulWidget {
  final List<Game> list;
  const AutoCarouselGameSlider({super.key, required this.list});

  @override
  State<AutoCarouselGameSlider> createState() => _AutoCarouselGameSliderState(list);
}

class _AutoCarouselGameSliderState extends State<AutoCarouselGameSlider> {
  final List<Game> list;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  _AutoCarouselGameSliderState(this.list);
  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.all(10),
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
                        list.map((item) => GameImageCard(game: item)).toList(),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: list.asMap().entries.map((game) {
                        return InkWell(
                          onTap: () => setState(() {
                            _controller.animateToPage(game.key,
                                duration: Duration(milliseconds: 750),
                                curve: Curves.fastOutSlowIn);
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
                  ),
                ],
              ),
            );
  }
}