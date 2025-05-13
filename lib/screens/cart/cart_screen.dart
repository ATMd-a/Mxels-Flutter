import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Mxels/providers/cart_provider.dart';
import 'package:Mxels/models/food_item.dart';
import 'package:Mxels/routes/app_routes.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double getOrderTotal(FoodItem item) {
    return item.price;
  }

  double getCartTotal(List<FoodItem> orders) {
    return orders.fold(0, (sum, item) => sum + getOrderTotal(item));
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final orders = cartProvider.cartItems;
    final selectedOrderType = cartProvider.orderType;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF146F3D),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.home);
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
            image: AssetImage('assets/bgwallpaper.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: orders.isEmpty
            ? const Center(child: Text('Your cart is empty.'))
            : Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final foodItem = orders[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.horizontal(left: Radius.circular(8)),
                        child: Image.asset(
                          foodItem.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              foodItem.name,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '₱${foodItem.price.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 14, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.red, size: 30),
                          onPressed: () {
                            cartProvider.removeFromCart(foodItem);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text('Order Type:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio<String>(
                  value: 'pickup',
                  groupValue: selectedOrderType,
                  onChanged: (value) {
                    cartProvider.setOrderType(value!);
                  },
                ),
                const Text('Pickup'),
                Radio<String>(
                  value: 'delivery',
                  groupValue: selectedOrderType,
                  onChanged: (value) {
                    cartProvider.setOrderType(value!);
                  },
                ),
                const Text('Delivery'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  '₱${getCartTotal(orders).toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedOrderType.isEmpty || orders.isEmpty
                    ? null
                    : () {
                  // Navigate based on selected order type
                  if (selectedOrderType == 'pickup') {
                    Navigator.pushNamed(context, AppRoutes.checkOutP);
                  } else if (selectedOrderType == 'delivery') {
                    Navigator.pushNamed(context, AppRoutes.checkOutD);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF146F3D),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                child: const Text('Review payment and address', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
