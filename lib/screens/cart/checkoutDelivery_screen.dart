import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Mxels/models/food_item.dart';
import 'package:Mxels/providers/cart_provider.dart';
import 'package:Mxels/routes/app_routes.dart';
import 'package:Mxels/models/delivery_option.dart';

class CheckoutScreenD extends StatefulWidget {
  const CheckoutScreenD({super.key});

  @override
  State<CheckoutScreenD> createState() => _CheckoutScreenDState();
}

class _CheckoutScreenDState extends State<CheckoutScreenD> {
  TextEditingController _deliveryInstructionController =
  TextEditingController();
  String? _selectedDeliveryOption;
  String? _selectedOrderType;
  String? _selectedPaymentMethod;

  @override
  void dispose() {
    _deliveryInstructionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final orders = cartProvider.cartItems;

    double getOrderTotal(FoodItem item) => item.price;
    double getCartTotal() =>
        orders.fold(0, (sum, item) => sum + getOrderTotal(item));

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
      appBar: AppBar(
        title: const Text(
          'CheckOut',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF146F3D),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/bgwallpaper.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Delivery Address
                _buildStyledContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.location_on),
                          SizedBox(width: 6),
                          Text(
                            'Delivery Address',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/googlemaps.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 150,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'MSEUF Main',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Manuel S. Enverga University Foundation, Enverga Blvd, Ibabang Dupay, Lucena, 4301 Quezon Province',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

// Delivery Options
                _buildStyledContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Delivery Options', style: labelStyle),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: deliveryOptions.map((option) {
                          final isSelected =
                              _selectedOrderType == option.label;

                          String formattedPrice = '';
                          if (option.price > 0) {
                            formattedPrice =
                            '+₱${option.price.toStringAsFixed(0)}';
                          } else if (option.price < 0) {
                            formattedPrice =
                            '-₱${option.price.abs().toStringAsFixed(0)}';
                          }

                          return GestureDetector(
                            onTap: () =>
                                setState(() => _selectedOrderType = option.label),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 12),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFF146F3D)
                                      : Colors.grey,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: isSelected
                                    ? const Color(0xFFeaf5ef)
                                    : Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(option.label,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      Text(option.time,
                                          style: const TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                  Text(
                                    formattedPrice,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Payment Method
                _buildStyledContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Payment Method', style: labelStyle),
                      const SizedBox(height: 8),
                      buildDropdownField(
                        hint: 'Select Payment Method',
                        value: _selectedPaymentMethod,
                        items: ['GCash', 'Maya Wallet', 'Cash'],
                        onChanged: (val) =>
                            setState(() => _selectedPaymentMethod = val),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Order Summary
                _buildStyledContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Order Summary', style: labelStyle),
                      const SizedBox(height: 8),
                      ...orders.map((food) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      food.name,
                                      style: const TextStyle(fontSize: 14),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '₱${food.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Builder(builder: (context) {
          final subtotal = getCartTotal();

          
          final selectedDelivery = deliveryOptions.firstWhere(
                (opt) => opt.label == _selectedOrderType,
            orElse: () => DeliveryOption(label: '', price: 0, time: ''),
          );
          final deliveryFee = 50.0; 
          final deliveryOptionPrice = selectedDelivery.price;
          final total = subtotal + deliveryOptionPrice + deliveryFee;

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSummaryRow('Subtotal:', subtotal),
              const SizedBox(height: 4),
              _buildSummaryRow('Misc:', deliveryOptionPrice),
              const SizedBox(height: 4),
              _buildSummaryRow('Delivery Fee:', deliveryFee),
             
              const Divider(),
              _buildSummaryRow('Total:', total, isBold: true),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (_selectedPaymentMethod != null)
                      ? () {
                    final isOnline = _selectedPaymentMethod == 'GCash' ||
                        _selectedPaymentMethod == 'Maya Wallet';
                    print(
                        'Selected Payment Method: $_selectedPaymentMethod, isOnline: $isOnline');
                    if (isOnline) {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.olpayment,
                        arguments: {
                          'paymentType': _selectedPaymentMethod!,
                          'ordertype': orders,
                          'amount': total,
                          'orderType': 'delivery',
                        },
                      );
                    } else if (_selectedPaymentMethod == 'Cash') {
                      Navigator.pushNamed(context, AppRoutes.track);
                    }
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF146F3D),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildStyledContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  Widget _buildSummaryRow(String label, double amount,
      {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
              fontSize: isBold ? 18 : 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            )),
        Text(
          '₱${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: isBold ? 18 : 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

