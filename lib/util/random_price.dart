import 'dart:math';

int generateRandomPrice() {
  const int minPrice = 100000;
  const int maxPrice = 600000;
  const int increment = 5000;
  const double freeChance = 0.10;

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
