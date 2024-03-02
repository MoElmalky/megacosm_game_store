import 'package:flutter/material.dart';
import 'package:megacosm_game_store/models/game_model.dart';

class GameCard extends StatelessWidget {
  final Game game;
  const GameCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.white.withAlpha(20),
        child: Container(
          //padding: EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(40),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(game.poster),
                fit: BoxFit.fill,
                width: 120,
                height: 150,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15,left: 15),
                      child: Text(
                        game.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8,left: 15),
                    child: Row(
                      children: [ 
                      ...List.generate(game.genres.length, (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      padding: const EdgeInsets.symmetric(horizontal:5),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(40),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(game.genres[index],style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),),
                    ))
                    ],),
                  ),
                  Row(
                    children: [
                      Text(game.releaseDate,style: const TextStyle(color: Colors.white),),
                      Container(
                        margin: const EdgeInsets.only(left: 40,top: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(100),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(game.price,style: const TextStyle(color: Colors.white),)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
