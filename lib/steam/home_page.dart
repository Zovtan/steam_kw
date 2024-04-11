import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'app_bar.dart'; // Import the app_bar.dart file
import '../util/random_price.dart'; // Import the price generator function

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiKey = "8dd0c74b4198460a836dc73d67c06351";
  List<dynamic> games = [];

  @override
  void initState() {
    super.initState();
    fetchGames();
  }

  Future<void> fetchGames() async {
    final response =
        await http.get(Uri.parse("https://api.rawg.io/api/games?key=$apiKey"));
    if (response.statusCode == 200) {
      setState(() {
        games = json.decode(response.body)["results"];

        // Add a random price for each game
        games.forEach((game) {
          game['price'] = generateRandomPrice();
        });
      });
    } else {
      throw Exception('Failed to load games');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SteamAppBar(), // Use SteamAppBar instead of SteamAppbar
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: games.map<Widget>((game) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200, // Adjust the width of each item as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(game['background_image']),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      game['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(game['price'] == 0 ? "Free" : "Rp ${game['price']}"),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
