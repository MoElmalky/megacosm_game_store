import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';
import 'package:megacosm_game_store/utils/image_dialog.dart';

class AutoCarouselImageSlider extends StatefulWidget {
  final Game game;
  const AutoCarouselImageSlider({super.key, required this.game});

  @override
  State<AutoCarouselImageSlider> createState() =>
      _AutoCarouselImageSliderState(game);
}

class _AutoCarouselImageSliderState extends State<AutoCarouselImageSlider> {
  final Game game;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  _AutoCarouselImageSliderState(this.game);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade900),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Screenshots',
            style: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 24,
            ),
          ),
          CarouselSlider(
            items: game.screenShots
                .map((e) => InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => imageDialog(e, context));
                    },
                    child: Image.asset(e)))
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: game.screenShots.asMap().entries.map((image) {
                  return InkWell(
                    onTap: () => setState(() {
                      _controller.animateToPage(image.key,
                          duration: Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn);
                    }),
                    child: SizedBox(
                      width: 64,
                      height: 36,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Stack(
                            children: [
                              Image.asset(
                                image.value,
                                width: 64,
                                height: 36,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                color: Colors.white.withOpacity(
                                    _current == image.key ? 0.5 : 0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
