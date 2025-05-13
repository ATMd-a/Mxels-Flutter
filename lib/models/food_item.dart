class FoodItem {
  final String name;
  final String imageUrl;
  final double price;
  final String category;

  FoodItem({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.category,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'category': category,
    };
  }

  // Create from JSON
  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
    );
  }
}
