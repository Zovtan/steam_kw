import 'package:flutter/material.dart';

class Special extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int originalPrice;

  Special({required this.imageUrl, required this.name, required this.originalPrice});

  @override
  Widget build(BuildContext context) {
    // Generate a random discount
    double discountPercentage = (5 + 5 * (DateTime.now().microsecondsSinceEpoch % 18)) / 100; // Random discount between 5% to 90% in 5% leap

    // Calculate the discounted price
    int discountedPrice = (originalPrice * (1 - discountPercentage)).round();

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
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Original Price: $originalPrice', // Display the original price
              style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),
            ),
            Text("$discountPercentage", // Display the discounted price
              style: TextStyle(color: Colors.green),),
            Text(
              'Discounted Price: $discountedPrice', // Display the discounted price
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
