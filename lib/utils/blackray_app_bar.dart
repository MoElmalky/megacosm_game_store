// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BlackRayAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BlackRayAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(16, 16, 16, 1),
      surfaceTintColor: Color.fromRGBO(16, 16, 16, 1),
      title: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              if(ModalRoute.of(context)!.settings.name!='homePage'){
                Navigator.pushReplacementNamed(context, 'homePage');
              }
            },
            child: ImageIcon(
              AssetImage('assets/blackRay/blackRay_logo_white.png'),
              size: 40,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Image.asset(
              'assets/blackRay/blackRay_white.png',
              width: 100,
              fit: BoxFit.cover,
            ),
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
