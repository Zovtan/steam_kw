import 'package:flutter/material.dart';

class Featured extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int price;

  const Featured({required this.imageUrl, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                price == 0 ? "Free" : "Rp $price",
                style: const TextStyle(color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
