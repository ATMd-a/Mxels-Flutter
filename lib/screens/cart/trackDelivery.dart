import 'package:flutter/material.dart';
import 'package:Mxels/routes/app_routes.dart'; // Import for route names
import 'package:provider/provider.dart';
import 'package:Mxels/providers/cart_provider.dart'; // Import CartProvider
import 'package:Mxels/models/food_item.dart'; // Import the FoodItem model

class TrackDeliveryScreen extends StatelessWidget {
  const TrackDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get cart data from CartProvider
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Track Delivery',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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
            image: AssetImage('assets/bgwallpaper.png'), //  Use your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopContainer(), // Top container
              const SizedBox(height: 20),
              _buildOrderDetailsContainer(cartProvider), // Bottom container, pass cartProvider
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopContainer() {
    return Container(
      width: double.infinity, // Make container take full width
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Track Delivery',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Preparing your order!', // Improved status text
            style: TextStyle(fontSize: 16, color: Colors.green),
          ),
          const SizedBox(height: 12),
          const Text(
            'Time estimated order arrival',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetailsContainer(CartProvider cartProvider) {
    // Get order details from the cartProvider
    final cartItems = cartProvider.cartItems;
    final orderType = cartProvider.orderType;
    double orderTotal = cartProvider.getCartTotal();

    return Container(
      width: double.infinity, // Make container take full width
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Details',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Order Type:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                orderType,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Store:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Text(
                'SM Lucena City',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 30),

          const Text(
            'Order List',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: cartItems.map((item) {
              //  FoodItem does not have quantity.
              return Text(
                ' - ${item.name}', // Display each food item
                style: const TextStyle(fontSize: 14),
              );
            }).toList(),
          ),

          const SizedBox(height: 8),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Order Total:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '₱${orderTotal.toStringAsFixed(2)}', // Display order total
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

