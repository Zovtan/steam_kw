import 'package:flutter/material.dart';

class SteamAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize =>
      const Size.fromHeight(100); // tinggi appbar

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        color: const Color.fromRGBO(30, 33, 41, 1),
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromRGBO(40, 44, 49, 1),
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
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                // Handle search input
                              },
                            ),
                          ),
                          //search icon
                          const Icon(Icons.search, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  //setting icon
                  const Icon(Icons.more_vert, color: Colors.grey),
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
                  Row(
                    children: [
                      Text(
                        "MENU",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons
                            .keyboard_arrow_down_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                  Text("WISHLIST", style: TextStyle(color: Colors.white)),
                  Row(
                    children: [
                      Text(
                        "WALLET ",
                        style: TextStyle(
                            color:
                                Colors.white),
                      ),
                      Text("(RP 123 456)",
                          style: TextStyle(color: Color.fromRGBO(37, 157, 253, 1)))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
