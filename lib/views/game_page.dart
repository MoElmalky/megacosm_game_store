// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/data/games_data.dart';
import 'package:megacosm_game_store/models/game_model.dart';
import 'package:megacosm_game_store/providers/user_provider.dart';
import 'package:megacosm_game_store/utils/blackRay_app_bar.dart';
import 'package:megacosm_game_store/utils/price_display.dart';
import 'package:megacosm_game_store/utils/score_display.dart';
import 'package:megacosm_game_store/utils/user_option_drawer.dart';
import 'package:megacosm_game_store/widgets/auto_carousel_image_slider.dart';
import 'package:megacosm_game_store/widgets/horizontal_game_viewer.dart';
import 'package:megacosm_game_store/widgets/rating_card.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Future<void> showLoading() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    Game game = ModalRoute.of(context)!.settings.arguments as Game;
    bool isGameInCart = context.watch<UserProvider>().user!.cart!.any((e) {
      return e.gameId.compareTo(game.gameId) == 0;
    });
    bool isGameInWishlist =
        context.watch<UserProvider>().user!.wishlist!.any((e) {
      return e.gameId.compareTo(game.gameId) == 0;
    });
    bool isGameInLibrary =
        context.watch<UserProvider>().user!.library!.any((e) {
      return e.gameId.compareTo(game.gameId) == 0;
    });
    return Scaffold(
      endDrawer: UserOptionsDrawer(),
      backgroundColor: Color.fromRGBO(16, 16, 16, 1),
      appBar: BlackRayAppBar(),
      body: ListView(children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          color: Colors.grey.shade900,
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    game.poster,
                    width: 160,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        PriceDisplay(
                          price: game.price,
                          sale: game.sale,
                          color: game.mainColor,
                        ),
                        InkWell(
                          onTap: () {
                            isGameInLibrary
                                ? Navigator.pushReplacementNamed(
                                    context, 'libraryPage')
                                : Navigator.pushNamed(
                                    context, 'checkoutPage',arguments: game);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            margin: EdgeInsets.only(top: 10),
                            decoration: isGameInLibrary
                                ? BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                  )
                                : BoxDecoration(
                                    color: game.mainColor,
                                    borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: SizedBox(
                                width: 190,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    isGameInLibrary
                                        ? 'VIEW IN LIBRARY'
                                        : 'BUY NOW',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Material(
                          child: InkWell(
                            onTap: () {
                              CircularProgressIndicator();
                              TextButton(
                                onPressed: () => showLoading(),
                                child: Text('Show Loading'),
                              );
                              setState(() {
                                isGameInCart
                                    ? Navigator.pushReplacementNamed(
                                        context, 'cartPage')
                                    : isGameInLibrary?
                                    Navigator.pushReplacementNamed(context, 'libraryPage'):
                                    context
                                        .read<UserProvider>()
                                        .addGameToCart(game);
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: Center(
                                child: SizedBox(
                                  width: 190,
                                  height: 20,
                                  child: Center(
                                    child: Text(
                                      isGameInCart
                                          ? 'VIEW IN CART':
                                          isGameInLibrary?
                                          'VIEW IN LIBRARY'
                                          : 'ADD TO CART',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isGameInWishlist
                                  ? context
                                      .read<UserProvider>()
                                      .removeGameFromWishlist(game)
                                  : context
                                      .read<UserProvider>()
                                      .addGameToWishlist(game);
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                            child: Center(
                              child: SizedBox(
                                width: 190,
                                height: 15,
                                child: Center(
                                  child: isGameInWishlist
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.check_circle_outline_sharp,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'IN WISHLIST',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add_circle_outline_sharp,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'WISHLIST',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 40),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Developer',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Text(
                            game.developer,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Publisher',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Text(
                            game.publisher,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Release Date',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          Text(
                            game.releaseDate,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        AutoCarouselImageSlider(game: game),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(5),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
                child: Text(
              'About The Game',
              style: TextStyle(fontSize: 24),
            )),
            Divider(),
            SizedBox(
              child: Text(game.description),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Text(
                    'Genres : ',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  ...List.generate(
                      game.genres.length,
                      (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.white.withAlpha(40),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              game.genres[index],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ))
                ],
              ),
            ),
            Divider(),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Text(
                    'Storage : ',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  Text(
                    game.storage,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ],
              ),
            ),
            Divider(),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Text(
                    'Score :    ',
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  ScoreDisplay(score: game.metascore)
                ],
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: HorizontalGameViewer(list: games, label: 'More Like This'),
        ),
        RatingCard(game: game)
      ]),
    );
  }
}
