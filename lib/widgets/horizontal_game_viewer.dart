import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';
import 'package:megacosm_game_store/widgets/game_vertical_card.dart';

class HorizontalGameViewer extends StatelessWidget {
  final String label;
  final List<Game> list;
  const HorizontalGameViewer({super.key, required this.list, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      children: [
                        Text(
                          "$label ",
                          style: TextStyle(
                            color: Colors.grey.shade50,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          ">",
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GameVerticalCard(game: list[index]);
                      },
                      itemCount: list.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),
            );
  }
}