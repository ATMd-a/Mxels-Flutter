import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hlep/models/food_item.dart';
import 'package:hlep/providers/selection_provider.dart';
import 'package:hlep/data/resto_menu_data.dart';
import 'package:hlep/screens/home/summary_screen.dart';
import 'package:hlep/screens/home/restaurant.dart';

class BeverageScreen extends StatelessWidget {
  const BeverageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectionProvider = Provider.of<SelectionProvider>(context, listen: false);

    // Collect all beverage items from all restaurants
    final beverages = <FoodItem>[];
    final restoKeys = RestaurantMenuData.restoMenus.keys.toList();
    for (var key in restoKeys) {
      final items = RestaurantMenuData.restoMenus[key];
      if (items != null) {
        beverages.addAll(items.where((item) => item.category == 'Beverage'));
      }
    }

    void handleSelectBeverage(BuildContext context, FoodItem drink) {
      selectionProvider.selectItem("Beverage", drink);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SummaryScreen()),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        // Go back to last restaurant screen
        final lastRestoKey = selectionProvider.selectedItems.keys.lastWhere(
              (key) => key != "Beverage",
          orElse: () => restoKeys.last,
        );
        final lastRestoIndex = restoKeys.indexOf(lastRestoKey);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => RestaurantScreen(
              restaurantKey: lastRestoKey,
              restaurantIndex: lastRestoIndex,
              initialRestaurantIndex: 0, // or pass the correct initial index if needed
            ),
          ),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Select Your Beverage"),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 3 / 4,
          ),
          itemCount: beverages.length,
          itemBuilder: (context, index) {
            final drink = beverages[index];
            return GestureDetector(
              onTap: () => handleSelectBeverage(context, drink),
              child: Container(
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
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          drink.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            drink.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '₱${drink.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
