import 'package:flutter/material.dart';
import 'package:hlep/screens/auth/login_screen.dart';
import 'package:hlep/screens/auth/phoneNumber_screen.dart';
import 'package:hlep/screens/home/home_screen.dart';

class phoneOTP extends StatelessWidget {
  const phoneOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Information',
      home: const PhoneOTPScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PhoneOTPScreen extends StatelessWidget {
  const PhoneOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PhoneNumberScreen()),
            );
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 5-0),

            Text(
              'What\'s your OTP?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),



            Text(
              'Enter OTP',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),

              ),
            ),
          ],
        ),
      ),

      // ✅ Fixed button at the bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: Size(double.infinity, 50), // full width
          ),
          child: Text(
            'Confirm',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
