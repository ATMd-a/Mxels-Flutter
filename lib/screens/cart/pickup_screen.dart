import 'dart:math';
import 'package:flutter/material.dart';

class PickupScreen extends StatefulWidget {
  const PickupScreen({super.key});

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  final List<String> qrImages = [
    'assets/qrs/qr1.png',
    'assets/qrs/qr2.png',
    'assets/qrs/qr3.png',
    'assets/qrs/qr4.png',
  ];

  late String _currentQr;

  @override
  void initState() {
    super.initState();
    _currentQr = qrImages[0]; // default image
  }

  void _refreshQr() {
    final random = Random();
    setState(() {
      _currentQr = qrImages[random.nextInt(qrImages.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pickup Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(60, 100, 60, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Please Scan QR Code',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),

            // Container for QR image
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  _currentQr,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 50),
            const Text(
              'Scan your QR code to sync with the kiosk.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            const Text(
              'Orders, Queue Numbers and Preferences will be synced with self-order kiosk.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _refreshQr,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                'Refresh QR Code',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
