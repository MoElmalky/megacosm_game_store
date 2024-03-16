// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/providers/user_provider.dart';
import 'package:provider/provider.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 220,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/blackRay/blackRay_white.png',
                        width: 140,
                        fit: BoxFit.cover,
                      ),
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              //color: Colors.grey[700],
              width: 220,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 120,
                            child: Row(
                              children: [
                                SizedBox(
                                  child: Text(
                                    context.watch<UserProvider>().user!.firstName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      context.watch<UserProvider>().user!.lastName,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            context.watch<UserProvider>().user!.username,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.logout_sharp),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, 'loginPage'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
