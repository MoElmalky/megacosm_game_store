// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:megacosm_game_store/providers/filter_provider.dart';
import 'package:megacosm_game_store/utils/blackray_app_bar.dart';
import 'package:megacosm_game_store/utils/user_option_drawer.dart';
import 'package:megacosm_game_store/widgets/game_card.dart';
import 'package:provider/provider.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<String> sortTerms = [
    'none',
    'Name',
    'Price',
    'Release',
    'Score',
  ];

  @override
  Widget build(BuildContext context) {
    String selectedSort = context.watch<FilterProvider>().sortTerm;
    var searchController = TextEditingController();
    return Scaffold(
      endDrawer: UserOptionsDrawer(),
      appBar: BlackRayAppBar(),
      body: Container(
        color: Color.fromRGBO(16, 16, 16, 1),
        child: Column(children: [
          Container(
            height: 60,
            color: Color.fromRGBO(16, 16, 16, 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: TextFormField(
                      controller: searchController,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  context
                                      .read<FilterProvider>()
                                      .searchGames(searchController.text);
                                  Navigator.pushReplacementNamed(
                                      context, 'discoverPage');
                                });
                              },
                              child: Icon(
                                Icons.search_sharp,
                                color: Colors.white,
                              )),
                          focusColor: Colors.grey.shade900,
                          fillColor: Colors.grey.shade800,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(width: 2, color: Colors.white24),
                          )),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              context
                                  .read<FilterProvider>()
                                  .resetFilteredGames();
                              context.read<FilterProvider>().sortTerm =
                                  'none';
                              Navigator.pushReplacementNamed(
                                  context, 'discoverPage');
                            });
                          },
                          child: Icon(
                            Icons.clear_all_sharp,
                            size: 30,
                          )),
                      SizedBox(
                        child: Row(
                          children: [
                            Icon(
                              Icons.filter_alt_sharp,
                              size: 30,
                            ),
                            DropdownButton<String>(
                              value: selectedSort,
                              items: sortTerms.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedSort = value!;
                                  context.read<FilterProvider>().sortTerm =
                                      selectedSort;
                                  context.read<FilterProvider>().sortGamesBy();
                                  Navigator.pushReplacementNamed(
                                      context, 'discoverPage');
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              thickness: 8,
              child: ListView(
                children: [
                  ...context.watch<FilterProvider>().filteredGames.map(
                    (e) {
                      return GameCard(game: e);
                    },
                  ).toList()
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
