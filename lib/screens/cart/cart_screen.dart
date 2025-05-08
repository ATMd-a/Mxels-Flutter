import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hlep/providers/cart_provider.dart';
import 'package:hlep/models/food_item.dart';
import 'package:hlep/screens/cart/checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final orders = cartProvider.orders;

    double getOrderTotal(Map<String, FoodItem> order) {
      return order.values.fold(0, (sum, item) => sum + item.price);
    }

    double getCartTotal() {
      return orders.fold(0, (sum, order) => sum + getOrderTotal(order));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: orders.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, orderIndex) {
          final order = orders[orderIndex];
          final orderTotal = getOrderTotal(order);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order ${orderIndex + 1}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '₱${orderTotal.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              ...order.entries.map((entry) {
                final category = entry.key;
                final food = entry.value;

                return ListTile(
                  leading: Image.asset(food.imageUrl,
                      width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(food.name),
                  subtitle: Text('₱${food.price.toStringAsFixed(2)} - $category'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                    onPressed: () {
                      cartProvider.removeFromCart(orderIndex, category);
                    },
                  ),
                );
              }).toList(),
              const Divider(),
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '₱${getCartTotal().toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: orders.isEmpty
                    ? null
                    : () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckoutScreen()),
                  );
                },
                child: const Text('Proceed to Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
