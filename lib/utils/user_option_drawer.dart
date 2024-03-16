// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class UserOptionsDrawer extends StatelessWidget {
  const UserOptionsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shape: BeveledRectangleBorder(),
        backgroundColor: Color.fromRGBO(16, 16, 16, 1),
        surfaceTintColor: Color.fromRGBO(16, 16, 16, 1),
        shadowColor: Color.fromRGBO(16, 16, 16, 1),
        width: 250,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 220,
              child: Row(
                children: [
                  Image.asset('assets/blackRay/blackRay_white.png',width: 140,fit: BoxFit.cover,),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'homePage');
              },
              child: SizedBox(
                width: 220,
                height: 40,
                child: Row(
                  children: [
                    Icon(
                      Icons.storefront_sharp,
                      size: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Store',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'cartPage');
              },
              child: SizedBox(
                width: 220,
                height: 40,
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart_sharp,
                      size: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Cart',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'wishlistPage');
              },
              child: SizedBox(
                width: 220,
                height: 40,
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline_sharp,
                      size: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Wishlist',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'libraryPage');
              },
              child: SizedBox(
                width: 220,
                height: 40,
                child: Row(
                  children: [
                    Icon(
                      Icons.auto_awesome_mosaic_sharp,
                      size: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Library',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
