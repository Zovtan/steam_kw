import 'dart:math';

double calculateDiscount(int originalPrice) {
  // Generate a random discount
  double discountPercentage =
      (5 + Random().nextInt(18 - 5 + 1)) / 100; // Random discount between 5% to 90% in 5% leap

  // Calculate the discounted price
  double discountedPrice = originalPrice * (1 - discountPercentage);
  return discountedPrice;
}
