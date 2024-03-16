// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/providers/user_provider.dart';
import 'package:megacosm_game_store/utils/user_option_drawer.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: UserOptionsDrawer(),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(16, 16, 16, 1),
          surfaceTintColor: Color.fromRGBO(16, 16, 16, 1),
          title: Row(
            children: [
              ImageIcon(
                AssetImage('assets/blackRay/blackRay_logo_white.png'),
                size: 40,
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top:8),
                child: Image.asset('assets/blackRay/blackRay_white.png',width: 100,fit: BoxFit.cover,),
              ),
            ],
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: Icon(
                  Icons.view_headline_sharp,
                  size: 30,
                  color: Colors.grey[100],
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [ 
            Text('Wishlist'),
            ...context.watch<UserProvider>().user!.wishlist!.map((e) {
              return Image.asset(e.poster,width: 160,height: 200,fit:BoxFit.fill,);
            }).toList(),
          ],
        ),
    );
  }
}