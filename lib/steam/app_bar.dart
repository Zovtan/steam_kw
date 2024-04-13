import 'package:flutter/material.dart';

class SteamAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize =>
      Size.fromHeight(100); // Increased height to accommodate margin

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        color: Color.fromRGBO(30, 33, 41, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //baris 1
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromRGBO(40,44,49, 1),
                      ),
                      child: Row(
                        children: [
                          //logo steam
                          Image.asset(
                            'images/logo_steam.png',
                            width: 100,
                          ),
                          Expanded(
                            //bar search
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                // Handle search input
                              },
                            ),
                          ),
                          //search icon
                          Icon(Icons.search, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  //setting icon
                  Icon(Icons.more_vert, color: Colors.grey),
                  //pfp
                  Image.asset(
                    "images/pfp.png",
                    width: 60,
                    height: 60,
                  )
                ],
              ),
            ),
            //baris 2
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "MENU",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text("WISHLIST", style: TextStyle(color: Colors.white)),
                  Text("WALLET (RP 123 453)",
                      style: TextStyle(color: Colors.white))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
