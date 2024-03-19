// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/providers/user_provider.dart';
import 'package:megacosm_game_store/utils/blackRay_app_bar.dart';
import 'package:megacosm_game_store/utils/price_display.dart';
import 'package:megacosm_game_store/utils/user_option_drawer.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: UserOptionsDrawer(),
      appBar: BlackRayAppBar(),
      body: ListView(
        children: [
          if (context.watch<UserProvider>().user!.wishlist!.isEmpty) ...{
            SizedBox(
              height: 600,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/blackRay/page-is-empty-256.png'),
                    Text(
                      'Nothing to look at here!!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  ]),
            )
          } else ...{
            ...context.watch<UserProvider>().user!.wishlist!.map((game) {
              bool isGameInCart =
                  context.watch<UserProvider>().user!.cart!.any((e) {
                return e.gameId.compareTo(game.gameId) == 0;
              });
              bool isGameInLibrary =
                  context.watch<UserProvider>().user!.library!.any((e) {
                return e.gameId.compareTo(game.gameId) == 0;
              });
              return Container(
                margin: EdgeInsets.only(top: 20),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage(game.poster),
                      fit: BoxFit.cover,
                      width: 120,
                      height: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 125,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    game.name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                InkWell(
                                  onTap: () {
                                    context
                                        .read<UserProvider>()
                                        .removeGameFromWishlist(game);
                                  },
                                  child: Icon(Icons.close_sharp),
                                ),
                              ],
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(5),
                              onTap: () {
                                isGameInCart
                                    ? Navigator.pushReplacementNamed(
                                        context, 'cartPage')
                                    : isGameInLibrary
                                        ? Navigator.pushReplacementNamed(
                                            context, 'libraryPage')
                                        : context
                                            .read<UserProvider>()
                                            .addGameToCart(game);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.transparent,
                                    border: Border.all(
                                        width: 1.5, color: Colors.white)),
                                width: 40,
                                height: 30,
                                child: Icon(isGameInCart
                                    ? Icons.shopping_cart_checkout_sharp
                                    : isGameInLibrary
                                        ? Icons.auto_awesome_mosaic_sharp
                                        : Icons.add_shopping_cart_sharp),
                              ),
                            ),
                            PriceDisplay(price: game.price, sale: game.sale),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          }
        ],
      ),
    );
  }
}
