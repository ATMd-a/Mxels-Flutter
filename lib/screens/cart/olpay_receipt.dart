import 'package:flutter/material.dart';
import 'package:Mxels/screens/cart/qr_screen.dart';
import 'package:Mxels/screens/cart/trackDelivery.dart'; // Import DeliveryScreen

class OLPaymentReceiptScreen extends StatelessWidget {
  final String paymentType;
  final String orderType; // New parameter to detect order type (pickup or delivery)
  final double amount; // Add amount here

  const OLPaymentReceiptScreen({
    super.key,
    required this.paymentType,
    required this.orderType, // Accept orderType in the constructor
    required this.amount, // Add amount to the constructor
  });

  @override
  Widget build(BuildContext context) {
    final color =
    paymentType == 'GCash' ? const Color(0xFF007DFE) : const Color(0xFF06A555);
    final logoPath = 'assets/img/MxelsLogo.png';

    return Scaffold(
      appBar: AppBar( backgroundColor: color,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(color: color),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: 380,
              height: 500,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black12, // Corrected line
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(
                    child: Text(
                      'Successfully Paid To',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Image.asset(
                      logoPath,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Mxels',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Text('PHP ${amount.toStringAsFixed(2)}', // Use amount here
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Amount Due',
                              style: TextStyle(fontSize: 16)),
                          Text(
                            'Payment Method',
                            style: TextStyle(fontSize: 16, color: color),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('PHP ${amount.toStringAsFixed(2)}', // And here
                              style: const TextStyle(fontSize: 16)),
                          Text(paymentType,
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                  const Text(
                    'Ref No. 1243235',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const Text(
                    '14 May 2025 03:00 PM',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to QRScreen if it's pickup, or to DeliveryScreen if it's delivery
                      if (orderType == 'pickup') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QRScreen()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const TrackDeliveryScreen()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Proceed'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

