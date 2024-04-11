import 'package:flutter/material.dart';

class SteamAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 3, 33, 83),
              ),
              child: Row(
                children: [
                  //logo steam
                  Image.asset(
                    'images/logo_steam.png',
                    width: 60,
                    height: 60,
                  ),
                  Expanded(
                    //bar search
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white), // Set hint text color to white
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
      automaticallyImplyLeading: false, // Hide back button
    );
  }
}
