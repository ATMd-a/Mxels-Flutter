import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hlep/providers/selection_provider.dart';
import 'package:hlep/providers/cart_provider.dart'; // import this
import 'package:hlep/models/food_item.dart';


class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectionProvider = Provider.of<SelectionProvider>(context);
    final selectedItems = selectionProvider.selectedItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Summary"),
      ),
      body: selectedItems.isEmpty
          ? const Center(
        child: Text("No items selected."),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: selectedItems.length,
        itemBuilder: (context, index) {
          final entry = selectedItems.entries.elementAt(index);
          final restaurant = entry.key;
          final food = entry.value;

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Image.asset(
                food.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(food.name),
              subtitle: Text("₱${food.price.toStringAsFixed(2)}"),
              trailing: Text(restaurant),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            final cartProvider = Provider.of<CartProvider>(context, listen: false);
            if (selectedItems.isNotEmpty) {
              // Add the current selection to the cart
              cartProvider.addOrder(Map<String, FoodItem>.from(selectedItems));
              selectionProvider.clearSelections();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Order placed!")),
              );

              Navigator.popUntil(context, (route) => route.isFirst);
            }
          },
          child: const Text("Place Order"),
        ),
      ),
    );
  }
}
