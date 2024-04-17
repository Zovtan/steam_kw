import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:steam_kw/steam/special.dart';
import 'dart:convert';
import 'app_bar.dart';
import '../util/random_price.dart';
import 'featured.dart';
import 'bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiKey = "8dd0c74b4198460a836dc73d67c06351";
  List<dynamic> featuredGames = [];
  List<dynamic> specialOfferGames = [];

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

      final response = await http
          .get(Uri.parse("https://api.rawg.io/api/games?key=$apiKey"));
      if (response.statusCode == 200) {
        final List<dynamic> games = json.decode(response.body)["results"];

        // Clear existing lists
        featuredGames.clear();
        specialOfferGames.clear();

        // Split games into two lists
        for (int i = 0; i < games.length; i++) {
          if (i % 2 == 0) {
            featuredGames.add(games[i]);
          } else {
            specialOfferGames.add(games[i]);
          }
        }

        // Add a random price for each game
        featuredGames.forEach((game) {
          game['price'] = generateRandomPrice();
        });
        specialOfferGames.forEach((game) {
          game['price'] = generateRandomPrice();
        });

        setState(() {
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
      backgroundColor: const Color.fromARGB(255, 32, 58, 92),
      appBar: SteamAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Image.asset(
              'images/banner_square.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("FEATURED & RECOMMENDED",
                  style: TextStyle(color: Colors.white)),
            ),
            // Featured items
            SizedBox(
              height: 340,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: featuredGames.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == featuredGames.length) {
                    if (_loading) {
                      return const Center(
                        child: CircularProgressIndicator(color: Color.fromRGBO(37, 157, 253, 1),),
                      );
                    } else {
                      return Container();
                    }
                  }
                  final game = featuredGames[index];
                  return Featured(
                    imageUrl: game['background_image'],
                    name: game['name'],
                    price: game['price'],
                  );
                },
              ),
            ),
            const SizedBox(height: 16,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child:
                  Text("SPECIAL OFFERS", style: TextStyle(color: Colors.white)),
            ),
            //special offer
            SizedBox(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: specialOfferGames.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == specialOfferGames.length) {
                    if (_loading) {
                      return const Center(
                        child: CircularProgressIndicator(color: Color.fromRGBO(37, 157, 253, 1),),
                      );
                    } else {
                      return Container();
                    }
                  }
                  final game = specialOfferGames[index];
                  // Check if the price is greater than 0 before displaying the game
                  if (game['price'] > 0) {
                    return Special(
                      imageUrl: game['background_image'],
                      name: game['name'],
                      originalPrice: game['price'],
                    );
                  } else {
                    // Return an empty container if the price is 0, menghindari game gratis di diskon
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
