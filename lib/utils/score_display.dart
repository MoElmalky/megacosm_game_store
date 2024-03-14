import 'package:flutter/material.dart';

class ScoreDisplay extends StatelessWidget {
  final String score;
  Color scoreColorPicker(String score) {
    if (int.parse(score) > 74) {
      return Colors.green;
    } else if (int.parse(score) > 49) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  const ScoreDisplay({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        decoration: BoxDecoration(
          color: scoreColorPicker(score),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          score,
          style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 18),
        ));
  }
}
