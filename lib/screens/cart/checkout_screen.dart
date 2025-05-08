import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hlep/models/food_item.dart';
import 'package:hlep/providers/cart_provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? _selectedOrderType;
  String? _selectedPaymentMethod;

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

    Widget buildDropdownField({
      required String hint,
      required String? value,
      required List<String> items,
      required void Function(String?) onChanged,
    }) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButton<String>(
          value: value,
          onChanged: onChanged,
          isExpanded: true,
          underline: const SizedBox(),
          icon: const Icon(Icons.keyboard_arrow_down),
          hint: Text(hint),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Payment and Address
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Order Type', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  buildDropdownField(
                    hint: 'Select Order Type',
                    value: _selectedOrderType,
                    items: ['Pickup', 'Delivery'],
                    onChanged: (val) {
                      setState(() {
                        _selectedOrderType = val;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text('Store Address',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Container(
                    height: 150,
                    color: Colors.grey[200],
                    child: const Center(child: Text('Store Image Here')),
                  ),
                  const SizedBox(height: 8),
                  const Text('1234 Food St, City, Philippines', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 16),
                  const Text('Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  buildDropdownField(
                    hint: 'Select Payment Method',
                    value: _selectedPaymentMethod,
                    items: ['GCash', 'Maya Wallet', 'Cash'],
                    onChanged: (val) {
                      setState(() {
                        _selectedPaymentMethod = val;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text('Order Summary', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),

            // Order Summary
            ...orders.map((order) {
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
                          'Order ${orders.indexOf(order) + 1}',
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
                    String category = entry.key;
                    FoodItem food = entry.value;

                    return ListTile(
                      leading: Image.asset(food.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                      title: Text(food.name),
                      subtitle: Text('₱${food.price.toStringAsFixed(2)} - $category'),
                    );
                  }).toList(),
                  const Divider(),
                ],
              );
            }).toList(),
          ],
        ),
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
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order confirmed!')),
                  );
                },
                child: const Text('Confirm Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

