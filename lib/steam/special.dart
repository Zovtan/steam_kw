import 'package:flutter/material.dart';
import '../util/discount.dart';

class Special extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int originalPrice;

  Special({required this.imageUrl, required this.name, required this.originalPrice});

  @override
  Widget build(BuildContext context) {
    // Calculate the discounted price
    double discountedPrice = calculateDiscount(originalPrice);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 400, // Adjust the width of each item as needed
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.black,
              Color(0xFF1E3655)
            ], // dari atas bawah
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                name,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Original Price: $originalPrice', // Display the original price
                style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Discounted Price: ${discountedPrice.toStringAsFixed(2)}', // Display the discounted price
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
