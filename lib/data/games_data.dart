import 'package:flutter/material.dart';
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
      storage: "150 GB",
      price: "59.99",
      sale: "20",
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
      mainColor: Colors.red,
      description:
          "America, 1899. Arthur Morgan and the Van der Linde gang are outlaws on the run. With federal agents and the best bounty hunters in the nation massing on their heels, the gang must rob, steal and fight their way across the rugged heartland of America in order to survive. As deepening internal divisions threaten to tear the gang apart, Arthur must make a choice between his own ideals and loyalty to the gang who raised him."),
  //Starfield
  Game(
      name: "Starfield",
      developer: "Bethesda Game Studio",
      publisher: "Bethesda",
      gameId: "ar002",
      releaseDate: "2023-09-06",
      metascore: "85",
      storage: "125 GB",
      price: "69.99",
      sale: "10",
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
      description:
          "In the year 2330, humanity has ventured beyond our solar system, settling new planets, and living as a spacefaring people. You will join Constellation - the last group of space explorers seeking rare artifacts throughout the galaxy - and navigate the vast expanse of space in Bethesda Game Studios' biggest and most ambitious game."),
  //Cyberpunk 2077
  Game(
      name: "Cyberpunk 2077",
      developer: "CD PROJEKT RED",
      publisher: "CD PROJEKT RED",
      gameId: "ar003",
      releaseDate: "2020-12-10",
      metascore: "86",
      storage: "70 GB",
      price: "59.99",
      sale: "40",
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
      mainColor: Colors.yellow,
      description:
          "Cyberpunk 2077 is an open-world, action-adventure RPG set in Night City, a megalopolis obsessed with power, glamour, and body modification. Play as V, a cyberpunk mercenary, and take on the most powerful forces of the city in a fight for glory and survival. Legends will be made here. What will yours be?"),
  //God of War
  Game(
      name: "God of War",
      developer: "Santa Monica Studio",
      publisher: "PlayStation",
      gameId: "aa004",
      releaseDate: "2022-01-14",
      metascore: "93",
      storage: "70 GB",
      price: "49.99",
      sale: "40",
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
      description:
          "His vengeance against the Gods of Olympus years behind him, Kratos now lives as a man in the realm of Norse Gods and monsters. It is in this harsh, unforgiving world that he must fight to survive… and teach his son to do the same."),
  //Control
  Game(
      name: "Control",
      developer: "Remedy Entertainment",
      publisher: "505 Games",
      gameId: "aa005",
      releaseDate: "2020-08-27",
      metascore: "85",
      storage: "42 GB",
      price: "34.99",
      sale: "10",
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
      mainColor: Colors.red,
      description:
          "Control is Jesse Faden’s story and her personal search for answers as she grows into the role of the Director. The world of Control has its own story, as do the allies Jesse meets along the way. Jesse works with other Bureau agents and discovers strange experiments and secrets."),
];

List<Game> gamesInCart = [];
List<Game> gamesInWishlist = [];
