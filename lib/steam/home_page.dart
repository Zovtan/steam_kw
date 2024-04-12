import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:steam_kw/steam/special.dart';
import 'dart:convert';
import 'app_bar.dart'; // Import the app_bar.dart file
import '../util/random_price.dart'; // Import the price generator function
import 'featured.dart'; // Import the Featured widget
import 'bottom_nav_bar.dart'; // Import the BottomNavBar widget

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiKey = "8dd0c74b4198460a836dc73d67c06351";
  List<dynamic> games = [];

  bool _loading = false;

  @override
  void initState() {
    super.initState();
    fetchGames();
  }

  Future<void> fetchGames() async {
    if (!_loading) {
      setState(() {
        _loading = true;
      });

      final response = await http.get(
          Uri.parse("https://api.rawg.io/api/games?key=$apiKey"));
      if (response.statusCode == 200) {
        setState(() {
          games.addAll(json.decode(response.body)["results"]);

          // Add a random price for each game
          games.forEach((game) {
            game['price'] = generateRandomPrice();
          });

          _loading = false;
        });
      } else {
        throw Exception('Failed to load games');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SteamAppBar(),
      body: Column(
        children: [
          // Featured items
          SizedBox(
            height: 200, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: games.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == games.length) {
                  if (_loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container();
                  }
                }
                final game = games[index];
                return Featured(
                  imageUrl: game['background_image'],
                  name: game['name'],
                  price: game['price'],
                );
              },
            ),
          ),
          // Image below featured items
          Image.asset(
            'images/banner.png', // Replace with your image URL
            fit: BoxFit.cover,
            //width: double.infinity, // Take the full width of the screen
            //height: 150, // Adjust the height as needed
          ),
          //special offer
          SizedBox(
            height: 200, // Adjust the height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: games.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == games.length) {
                  if (_loading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container();
                  }
                }
                final game = games[index];
                return Special(
                  imageUrl: game['background_image'],
                  name: game['name'],
                  originalPrice: game['price'],
                );
              },
            ),
          ),
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: BottomNavBar(
      ),
    );
  }
}
