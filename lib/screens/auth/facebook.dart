import 'package:flutter/material.dart';
import 'package:hlep/screens/auth/login_screen.dart';
import 'package:hlep/screens/home/home_screen.dart';


class faceb extends StatelessWidget {
  const faceb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Information',
      home: const FacebookScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FacebookScreen extends StatelessWidget {
  const FacebookScreen({super.key});

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
            SizedBox(height: 50),

            Text(
              'Mxels is requesting access to:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '- Name and profile picture\n - Email address',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            SizedBox(height: 20),





          ],
        ),
      ),

      // ✅ Fixed button at the bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF046CFC),
                side: const BorderSide(color: Color(0xFFCCCCCC), width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                'Continue as Roselle Jean',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white54,
                side: const BorderSide(color: Color(0xFFCCCCCC), width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),


          ],
        ),
      ),



    );
  }
}
