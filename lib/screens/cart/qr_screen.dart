import 'dart:math';

import '../../routes/app_routes.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  final List<String> qrImages = [
    'assets/img/qrs/qr1.png',
    'assets/img/qrs/qr2.png',
    'assets/img/qrs/qr3.png',
    'assets/img/qrs/qr4.png',
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
        title: const Text('QR', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
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
                backgroundColor: Color(0xFF146F3D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(double.infinity, 50),

              ),
              child: const Text(
                'Refresh QR Code',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen()), // Updated to use the imported screen
                    );
                  },
                  child: const Text(
                    'BACK TO MENU',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
