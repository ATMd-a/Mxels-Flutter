import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hlep/providers/selection_provider.dart';
import 'package:hlep/providers/cart_provider.dart'; // Your cart provider
import 'package:hlep/models/food_item.dart'; // FoodItem model
import 'package:hlep/screens/home/home_screen.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectionProvider = Provider.of<SelectionProvider>(context);
    final selectedItems = selectionProvider.selectedItems;

    // Separate beverages and foods, if necessary
    final beverages = selectedItems.values.where((item) => item.category == 'Beverage').toList();
    final foods = selectedItems.values.where((item) => item.category != 'Beverage').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Selected Foods'),
      ),
      body: selectedItems.isEmpty
          ? const Center(child: Text('No items selected.'))
          : Column(
        children: [
          if (beverages.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Selected Beverages',
                style: Theme.of(context).textTheme.titleLarge, // Changed to titleLarge
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: beverages.length,
              itemBuilder: (context, index) {
                final food = beverages[index];

                return ListTile(
                  leading: Image.asset(food.imageUrl,
                      width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(food.name),
                  subtitle: Text(
                    '₱${food.price.toStringAsFixed(2)}\nCategory: ${food.category}',
                  ),
                );
              },
            ),
          ),
          if (foods.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Selected Food Items',
                style: Theme.of(context).textTheme.titleLarge, // Changed to titleLarge
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];

                return ListTile(
                  leading: Image.asset(food.imageUrl,
                      width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(food.name),
                  subtitle: Text(
                    '₱${food.price.toStringAsFixed(2)}\nCategory: ${food.category}',
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final cartProvider =
              Provider.of<CartProvider>(context, listen: false);

              // Step 1: Group selected items by category
              Map<String, FoodItem> order = {};
              for (var food in selectedItems.values) {
                order[food.category] = food;
              }

              // Step 2: Add as a new order to cart
              cartProvider.addOrder(order);

              // Step 3: Clear the selection
              selectionProvider.clearSelections();

              // Feedback
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Order added to cart!')),
              );

              // Optional: Navigate to cart screen or back
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
