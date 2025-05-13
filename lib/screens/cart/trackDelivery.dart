import 'package:flutter/material.dart';
import 'package:Mxels/routes/app_routes.dart'; // Import for route names

class TrackDeliveryScreen extends StatelessWidget {
  const TrackDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              _buildOrderDetailsContainer(), // Bottom container
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // Background color for the container
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: const [
          BoxShadow(
            color: Colors.black12, // Shadow for depth
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

  Widget _buildOrderDetailsContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // Background color for the container
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: const [
          BoxShadow(
            color: Colors.black12, // Shadow for depth
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
          const Text(
            'SM Lucena City', // Store name
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          const Text(
            'Maharlika Highway, corner Dalahican Rd, Lucena, 4301 Quezon', // Delivery address
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          const Text(
            'Order Total: ₱100.00', //  Replace with your actual order total
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

