import 'package:flutter/material.dart';

class FeaturedWithDiscount extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int originalPrice;

  FeaturedWithDiscount({required this.imageUrl, required this.name, required this.originalPrice});

  @override
  Widget build(BuildContext context) {
    // Generate a random discount
    double discountPercentage = (5 + 5 * (DateTime.now().microsecondsSinceEpoch % 18)) / 100; // Random discount between 5% to 90% in 5% leap

    // Calculate the discounted price
    int discountedPrice = (originalPrice * (1 - discountPercentage)).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            imageUrl,
            width: 150, // Adjust as needed
            height: 100, // Adjust as needed
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4.0),
        Text(
          'Original Price: $originalPrice', // Display the original price
          style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),
        ),
        SizedBox(height: 4.0),
        Text(
          'Discounted Price: $discountedPrice', // Display the discounted price
          style: TextStyle(color: Colors.green),
        ),
      ],
    );
  }
}
  