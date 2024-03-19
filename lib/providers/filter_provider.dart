import 'package:flutter/material.dart';
import 'package:megacosm_game_store/data/games_data.dart';
import 'package:megacosm_game_store/models/game_model.dart';

class FilterProvider extends ChangeNotifier {
  List<Game> filteredGames = games.take(games.length).toList();
  String sortTerm ='none';

  void searchGames(String searchTerm) async {
    filteredGames = games.where((element) {
      return element.name.toUpperCase().contains(searchTerm.toUpperCase());
    }).toList();
    notifyListeners();
  }

  void resetFilteredGames() async {
    filteredGames = games.take(games.length).toList();
    notifyListeners();
  }

  void sortGamesBy() async {
    if (sortTerm == 'Name') {
      filteredGames.sort(
        (a, b) => a.name.compareTo(b.name),
      );
    } else if (sortTerm == 'Price') {
      filteredGames.sort(
        (a, b) {
          bool isAOnSale = !(a.sale == "0");
          String priceAfterSaleA = isAOnSale
              ? (double.parse(a.price) -
                      (double.parse(a.price).ceil() *
                          (double.parse(a.sale) / 100)))
                  .toStringAsFixed(2)
              : a.price;
          bool isBOnSale = !(b.sale == "0");
          String priceAfterSaleB = isBOnSale
              ? (double.parse(b.price) -
                      (double.parse(b.price).ceil() *
                          (double.parse(b.sale) / 100)))
                  .toStringAsFixed(2)
              : b.price;
          return double.parse(priceAfterSaleA)
              .compareTo(double.parse(priceAfterSaleB));
        },
      );
    } else if (sortTerm == 'Score') {
      filteredGames.sort(
        (a, b) =>
            double.parse(b.metascore).compareTo(double.parse(a.metascore)),
      );
    } else if (sortTerm == 'Release') {
      filteredGames.sort(
        (a, b) =>
            DateTime.parse(b.releaseDate).compareTo(DateTime.parse(a.releaseDate)),
      );
    } else if (sortTerm == 'none') {
      filteredGames = games.take(games.length).toList();
    }
    notifyListeners();
  }
}
