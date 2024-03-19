// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/providers/user_provider.dart';
import 'package:megacosm_game_store/utils/blackRay_app_bar.dart';
import 'package:megacosm_game_store/utils/user_option_drawer.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: UserOptionsDrawer(),
      appBar: BlackRayAppBar(),
      body: context.watch<UserProvider>().user!.library!.isEmpty
          ? SizedBox(
            width: double.infinity,
              height: 600,
              child: ListView(
                  children: [
                    Image.asset('assets/blackRay/page-is-empty-256.png'),
                    Text(
                      'It\'s so boring here , \nfor some reason!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                    )
                  ]),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemCount: context.watch<UserProvider>().user!.library!.length,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    context.watch<UserProvider>().user!.library![index].poster,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
    );
  }
}
