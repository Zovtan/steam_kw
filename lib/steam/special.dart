import 'package:flutter/material.dart';
import 'dart:math';

class Special extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int originalPrice;

  Special(
      {required this.imageUrl,
      required this.name,
      required this.originalPrice});

  @override
  Widget build(BuildContext context) {
    // Generate a random discount
    double discountPercentage = (5 + Random().nextInt(18 - 5 + 1)) /
        100; // Random discount between 5% to 90% in 5% leap

    // Calculate the discounted price
    double discountedPrice = originalPrice * (1 - discountPercentage);

    //utk tampilan
    double displayPercentage = discountPercentage * 100;

    String formattedPercentage =
        displayPercentage.toStringAsFixed(2); // Rounds to 2 decimal places
    formattedPercentage = formattedPercentage.replaceAll(
        RegExp(r'0*$'), ''); // Removes trailing zeros
    formattedPercentage = formattedPercentage.replaceAll(
        RegExp(r'\.$'), ''); // Removes trailing decimal point if present

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
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
              offset: const Offset(0, 0),
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
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Color(0xFF4D693D),
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                    child: Text(
                      '-$formattedPercentage%',
                      style: TextStyle(
                          color: Color(0xFF9FC853),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    color: Color(0xFF364A55),
                    padding: EdgeInsets.all(6.5),
                    child: Row(
                      children: [
                        Text(
                          'Rp $originalPrice ',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Color(0xFF687B89),
                            color: Color(0xFF687B89),
                            decorationThickness:
                                3.5,
                          ),
                        ),
                        Text(
                          'Rp ${discountedPrice.toStringAsFixed(2)}',
                          style: TextStyle(color: Color(0xFF9FC853)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
