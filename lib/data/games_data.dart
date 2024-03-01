import 'package:megacosm_game_store/models/game_model.dart';

List<Game> games = [
  //Red Dead Redemption 2
  Game(
    name: "Red Dead Redemption 2",
    developer: "Rockstar Games",
    publisher: "Rockstar Games",
    gameId: "aa001",
    releaseDate: "2019-12-05",
    metascore: "93",
    storage: "150",
    price: "59.99 USD",
    poster: 'assets/rdr2/rdr2_poster.jpg',
    screenShots: [
      'assets/rdr2/rdr2_screenshot-1.jpg',
      'assets/rdr2/rdr2_screenshot-2.jpg',
      'assets/rdr2/rdr2_screenshot-3.jpg',
      'assets/rdr2/rdr2_screenshot-4.jpg',
      'assets/rdr2/rdr2_screenshot-5.jpg'
    ],
    genres: ["Action", "Adventure"],
    genresId: ["a1", "a2"],
  ),
  //Starfield
  Game(
    name: "Starfield",
    developer: "Bethesda Game Studio",
    publisher: "Bethesda",
    gameId: "ar002",
    releaseDate: "2023-09-06",
    metascore: "85",
    storage: "125",
    price: "69.99 USD",
    poster: 'assets/starfield/starfield_poster.jpg',
    screenShots: [
      'assets/starfield/starfield_screenshot-1.jpg',
      'assets/starfield/starfield_screenshot-2.jpg',
      'assets/starfield/starfield_screenshot-3.jpg',
      'assets/starfield/starfield_screenshot-4.jpg',
      'assets/starfield/starfield_screenshot-5.jpg'
    ],
    genres: ["Action", "RPG"],
    genresId: ["a1", "r1"],
  ),
  //Cyberpunk 2077
  Game(
    name: "Cyberpunk 2077",
    developer: "CD PROJEKT RED",
    publisher: "CD PROJEKT RED",
    gameId: "ar003",
    releaseDate: "2020-12-10",
    metascore: "86",
    storage: "70",
    price: "59.99 USD",
    poster: 'assets/cp2077/cp2077_poster.jpg',
    screenShots: [
      'assets/cp2077/cp2077_screenshot-1.jpg',
      'assets/cp2077/cp2077_screenshot-2.jpg',
      'assets/cp2077/cp2077_screenshot-3.jpg',
      'assets/cp2077/cp2077_screenshot-4.jpg',
      'assets/cp2077/cp2077_screenshot-5.jpg'
    ],
    genres: ["Action", "RPG"],
    genresId: ["a1", "r1"],
  ),
  //God of War
  Game(
    name: "God of War",
    developer: "Santa Monica Studio",
    publisher: "PlayStation",
    gameId: "aa004",
    releaseDate: "2022-01-14",
    metascore: "93",
    storage: "70",
    price: "49.99 USD",
    poster: 'assets/gow/gow_poster.jpg',
    screenShots: [
      'assets/gow/gow_screenshot-1.jpg',
      'assets/gow/gow_screenshot-2.jpg',
      'assets/gow/gow_screenshot-3.jpg',
      'assets/gow/gow_screenshot-4.jpg',
      'assets/gow/gow_screenshot-5.jpg'
    ],
    genres: ["Action", "Adventure"],
    genresId: ["a1", "a2"],
  ),
  //Control
  Game(
    name: "Control",
    developer: "Remedy Entertainment",
    publisher: "505 Games",
    gameId: "aa005",
    releaseDate: "2020-08-27",
    metascore: "85",
    storage: "42",
    price: "34.99 USD",
    poster: 'assets/control/control_poster.jpg',
    screenShots: [
      'assets/control/control_screenshot-1.jpg',
      'assets/control/control_screenshot-2.jpg',
      'assets/control/control_screenshot-3.jpg',
      'assets/control/control_screenshot-4.jpg',
      'assets/control/control_screenshot-5.jpg'
    ],
    genres: ["Action", "Adventure"],
    genresId: ["a1", "a2"],
  ),
];
