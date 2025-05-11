import 'package:flutter/material.dart';
import 'package:hlep/models/food_item.dart';

class RestaurantMenuScreen extends StatelessWidget {
  final String restaurantName;
  final Map<String, List<FoodItem>> categorizedFoods; // category name => food list

  const RestaurantMenuScreen({
    super.key,
    required this.restaurantName,
    required this.categorizedFoods,
  });

  @override
  Widget build(BuildContext context) {
    final categories = categorizedFoods.keys.toList();

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(restaurantName),
          bottom: TabBar(
            isScrollable: true,
            tabs: categories.map((cat) => Tab(text: cat)).toList(),
          ),
        ),
        body: TabBarView(
          children: categories.map((category) {
            final items = categorizedFoods[category]!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final food = items[index];
                return ListTile(
                  leading: Image.network(food.imageUrl, width: 50, height: 50),
                  title: Text(food.name),
                  subtitle: Text("₱${food.price.toStringAsFixed(2)}"),
                  onTap: () {
                    // handle food selection
                  },
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
