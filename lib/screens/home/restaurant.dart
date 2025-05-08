import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hlep/models/food_item.dart';
import 'package:hlep/providers/selection_provider.dart';
import 'package:hlep/data/resto_menu_data.dart';
import 'package:hlep/screens/home/summary_screen.dart';
import 'package:hlep/screens/home/beverage_screen.dart';

class RestaurantScreen extends StatelessWidget {
  final String restaurantKey;
  final int restaurantIndex;
  final int initialRestaurantIndex;

  const RestaurantScreen({
    Key? key,
    required this.restaurantKey,
    required this.restaurantIndex,
    required this.initialRestaurantIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectionProvider = Provider.of<SelectionProvider>(context, listen: false);
    final allFoods = RestaurantMenuData.restoMenus[restaurantKey] ?? [];

    final Map<String, List<FoodItem>> groupedByCategory = {};
    for (var food in allFoods) {
      if (food.category != 'Beverage' && !selectionProvider.isCategorySelected(food.category)) {
        groupedByCategory.putIfAbsent(food.category, () => []).add(food);
      }
    }

    final restoKeys = RestaurantMenuData.restoMenus.keys.toList();
    final totalRestaurants = restoKeys.length;

    void goToNextRestaurant(BuildContext context) {
      final nextIndex = (restaurantIndex + 1) % totalRestaurants;

      if (nextIndex == initialRestaurantIndex) {
        // If we've come full circle, go to beverage screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const BeverageScreen()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RestaurantScreen(
              restaurantKey: restoKeys[nextIndex],
              restaurantIndex: nextIndex,
              initialRestaurantIndex: initialRestaurantIndex,
            ),
          ),
        );
      }
    }

    void handleFoodSelection(BuildContext context, FoodItem food) {
      selectionProvider.selectItem(restaurantKey, food);
      goToNextRestaurant(context);
    }

    return WillPopScope(
      onWillPop: () async {
        selectionProvider.removeLastSelection();
        Navigator.pop(context); // Go back to the previous restaurant screen
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select from $restaurantKey'),
        ),
        body: ListView(
          children: groupedByCategory.entries.map((entry) {
            final category = entry.key;
            final foods = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    category,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: foods.map((food) {
                      return SizedBox(
                        width: (MediaQuery.of(context).size.width - 12 * 3) / 2,
                        child: GestureDetector(
                          onTap: () => handleFoodSelection(context, food),
                          child: Container(
                            height: 250,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 7,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      food.imageUrl,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),


                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center, // optional
                                      children: [
                                        Text(
                                          food.name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '₱${food.price.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => goToNextRestaurant(context),
              child: const Text('Skip This Restaurant'),
            ),
          ),
        ),
      ),
    );
  }
}
