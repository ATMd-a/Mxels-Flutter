import 'package:flutter/material.dart';
import 'package:hlep/screens/auth/login_screen.dart';
import 'package:hlep/screens/auth/phoneOTP_screen.dart';

class phoneNumber extends StatelessWidget {
  const phoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Information',
      home: const PhoneNumberScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
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
              'What\'s your Phone Number?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We\'ll check if you have an account',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),


            Text(
              'Enter Phone Number',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.add,
                  size: 24,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                hintText: '09xxxxxxxxx', // Add hint text here
                hintStyle: TextStyle(
                  color: Colors.grey, // Set the hint text color to gray
                ),
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
              MaterialPageRoute(builder: (context) => phoneOTP()),
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
            'Send OTP',
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
