import 'dart:math';

// Function to generate a random price
int generateRandomPrice() {
  const int minPrice = 100000; // Minimum price
  const int maxPrice = 600000; // Maximum price
  const int increment = 5000; // Price increment
  const double freeChance = 0.10; // 10% chance of being free

  // Calculate the range of possible prices
  int range = ((maxPrice - minPrice) / increment).floor();

  // Generate a random index within the range
  int randomIndex = Random().nextInt(range + 1);

  // Check if the game should be free
  if (Random().nextDouble() < freeChance) {
    return 0; // Game is free
  }

  // Calculate the price based on the random index and increment
  int price = minPrice + (randomIndex * increment);

  return price;
}
