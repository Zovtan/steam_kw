import 'package:flutter/material.dart';

class Featured extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int price;

  Featured({required this.imageUrl, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200, // Adjust the width of each item as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(price == 0 ? "Free" : "Rp $price"),
          ],
        ),
      ),
    );
  }
}
