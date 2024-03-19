// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';
import 'package:megacosm_game_store/providers/user_provider.dart';
import 'package:megacosm_game_store/utils/price_display.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Game game = ModalRoute.of(context)!.settings.arguments as Game;
    bool isOnSale = !(game.sale == "0");
    String priceAfterSale = isOnSale
        ? (double.parse(game.price) -
                (double.parse(game.price).ceil() *
                    (double.parse(game.sale) / 100)))
            .toStringAsFixed(2)
        : game.price;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Container(
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
                              width: 55,
                            ),
                          ],
                        ),
                        PriceDisplay(price: game.price, sale: game.sale),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Price',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${game.price}\$',
                  style: TextStyle(fontSize: 16),
                )
              ]),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Sale Discount',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '- ${(double.parse(game.price) - double.parse(priceAfterSale)).toStringAsFixed(2)}\$',
                  style: TextStyle(fontSize: 16),
                )
              ]),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Subtotal',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$priceAfterSale\$',
                  style: TextStyle(fontSize: 16),
                )
              ]),
              SizedBox(height: 20,),
              InkWell(
                  onTap: () {
                    context.read<UserProvider>().addGameToLibrary(game);
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    height: 50,
                    width: double.infinity,
                    child: Center(child: Text('CHECK OUT',style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),)),
                  )),
                  SizedBox(height: 20,)
            ]),
          ),
        ]),
      ),
    );
  }
}
