import 'package:flutter/material.dart';
import 'package:megacosm_game_store/providers/user_provider.dart';
import 'package:megacosm_game_store/views/cart_page.dart';
import 'package:megacosm_game_store/views/game_page.dart';
import 'package:megacosm_game_store/views/home_page.dart';
import 'package:megacosm_game_store/views/library_page.dart';
import 'package:megacosm_game_store/views/login_page.dart';
import 'package:megacosm_game_store/views/signin_page.dart';
import 'package:megacosm_game_store/views/wishlist_page.dart';
import 'package:provider/provider.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            'loginPage': (context) => const LoginPage(),
            'signInPage': (context) => const SignInPage(),
            'homePage': (context) => const HomePage(),
            'gamePage': (context) => const GamePage(),
            'cartPage': (context) => const CartPage(),
            'wishlistPage': (context) => const WishlistPage(),
            'libraryPage': (context) => const LibraryPage(),
          },
          home: const LoginPage(),
          theme: ThemeData.dark()),
    );
  }
}
