import 'package:flutter/material.dart';
import 'package:steam_kw/steam/bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Image.asset("images/pfp.png"),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
