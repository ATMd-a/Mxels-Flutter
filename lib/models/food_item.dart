class FoodItem {
  final String name;
  final String imageUrl;
  final double price;
  final String category;  // New category field

  FoodItem({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category, // Include category in constructor
  });

// You can also update the `fromJson` and `toJson` methods to handle the new field if needed
}
