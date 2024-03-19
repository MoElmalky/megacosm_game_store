// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/providers/user_provider.dart';
import 'package:megacosm_game_store/utils/blackRay_app_bar.dart';
import 'package:megacosm_game_store/utils/price_display.dart';
import 'package:megacosm_game_store/utils/user_option_drawer.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double price = 0;
    double priceAfterSale = 0;
    return Scaffold(
      backgroundColor: Color.fromRGBO(16, 16, 16, 1),
      endDrawer: UserOptionsDrawer(),
      appBar: BlackRayAppBar(),
      body: Column(
        children: [
          if (context.watch<UserProvider>().user!.cart!.isEmpty) ...{
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 600,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/blackRay/page-is-empty-256.png'),
                        Text(
                          'hmmm... It\'s empty in here.',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      ]),
                )
              ],
            )
          } else ...{
            Column(
              children: [
                SizedBox(
                  height: 485,
                  child: ListView(
                    children: [
                      ...context.watch<UserProvider>().user!.cart!.map((game) {
                        bool isOnSale = !(game.sale == "0");
                        priceAfterSale += isOnSale
                            ? (double.parse(game.price) -
                                (double.parse(game.price).ceil() *
                                    (double.parse(game.sale) / 100)))
                            : double.parse(game.price);
                        price += double.parse(game.price);
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                  .removeGameFromCart(game);
                                            },
                                            child: Icon(Icons.close_sharp),
                                          ),
                                        ],
                                      ),
                                      PriceDisplay(
                                          price: game.price, sale: game.sale),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Price',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '${price.toStringAsFixed(2)}\$',
                            style: TextStyle(fontSize: 16),
                          )
                        ]),
                    Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sale Discount',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '- ${(price - priceAfterSale).toStringAsFixed(2)}\$',
                            style: TextStyle(fontSize: 16),
                          )
                        ]),
                    Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${priceAfterSale.toStringAsFixed(2)}\$',
                            style: TextStyle(fontSize: 16),
                          )
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          context.read<UserProvider>().addGamesToLibrary();
                          context.read<UserProvider>().removeAllGamesFromCart();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5)),
                          height: 50,
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            'CHECK OUT',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                        )),
                    SizedBox(
                      height: 20,
                    )
                  ]),
                )
              ],
            )
          },
        ],
      ),
    );
  }
}
