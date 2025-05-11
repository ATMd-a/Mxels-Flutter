import 'package:flutter/material.dart';
import 'package:hlep/screens/cart/paymentMethod_screen.dart';
import 'package:provider/provider.dart';
import 'package:hlep/models/food_item.dart';
import 'package:hlep/providers/cart_provider.dart';
import 'package:hlep/screens/cart/pickup_screen.dart';
import 'package:hlep/screens/cart/olpayment.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? _selectedOrderType;
  String? _selectedPaymentMethod;

  void _handlePaymentSelection(String method) {
    setState(() {
      _selectedPaymentMethod = method;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final orders = cartProvider.orders;

    double getOrderTotal(Map<String, FoodItem> order) =>
        order.values.fold(0, (sum, item) => sum + item.price);

    double getCartTotal() =>
        orders.fold(0, (sum, order) => sum + getOrderTotal(order));

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
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
        ),
      );
    }

    const labelStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Order Type', style: labelStyle),
              buildDropdownField(
                hint: 'Select Order Type',
                value: _selectedOrderType,
                items: ['Pickup', 'Delivery'],
                onChanged: (val) => setState(() => _selectedOrderType = val),
              ),
              const SizedBox(height: 16),

              const Text('Store Address', style: labelStyle),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/googlemaps.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Maharlika Highway, corner Dalahican Rd, Lucena, 4301 Quezon',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),

              const Text('Payment Method', style: labelStyle),
              buildDropdownField(
                hint: 'Select Payment Method',
                value: _selectedPaymentMethod,
                items: ['GCash', 'Maya Wallet', 'Cash'],
                onChanged: (val) => setState(() => _selectedPaymentMethod = val),
              ),
              const SizedBox(height: 16),

              const Text('Order Summary', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),

              // Orders Summary
              ...orders.map((order) {
                final orderTotal = getOrderTotal(order);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order ${orders.indexOf(order) + 1}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '₱${orderTotal.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: order.values.map((food) {
                          return Text('• ${food.name}', style: TextStyle(fontSize: 16));
                        }).toList(),
                      ),
                    ),

                    const Divider(),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Calculate subtotal and delivery
            Builder(builder: (context) {
              final subtotal = getCartTotal();
              final isDelivery = _selectedOrderType == 'Delivery';
              final deliveryFee = isDelivery ? 50.0 : 0.0;
              final total = subtotal + deliveryFee;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subtotal:',
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      Text('₱${subtotal.toStringAsFixed(2)}'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Delivery Fee:',
                          style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      Text('₱${deliveryFee.toStringAsFixed(2)}'),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total:',
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('₱${total.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (_selectedOrderType != null &&
                          _selectedPaymentMethod != null)
                          ? () {
                        final isOnline = _selectedPaymentMethod == 'GCash' ||
                            _selectedPaymentMethod == 'Maya Wallet';

                        if (isOnline) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => OLPaymentScreen(
                                paymentType: _selectedPaymentMethod!,
                                amount: total,
                              ),
                            ),
                          );
                        } else if (_selectedOrderType == 'Pickup' &&
                            _selectedPaymentMethod == 'Cash') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PickupScreen(),
                            ),
                          );
                        } else if (_selectedOrderType == 'Delivery' &&
                            _selectedPaymentMethod == 'Cash') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Order confirmed!')),
                          );
                        }
                      }
                          : null,
                      child: const Text('Continue'),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),

    );
  }
}
