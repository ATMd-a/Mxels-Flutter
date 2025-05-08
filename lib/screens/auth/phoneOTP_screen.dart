import 'package:flutter/material.dart';
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
              MaterialPageRoute(builder: (context) => phoneNumber()),
            );

          },
        ),
        //title: Text('Phone Number'),
      ),


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[


            SizedBox(height: 150),

            //TEXT OF EOTP
            Row(
              // centers the row's content
              children: [
                Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            Row(
              children: [
                Expanded( // Makes the TextField take the remaining space
                  child: TextField(
                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                        borderSide: BorderSide(color: Colors.black, width: 1), // Border style
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Inside padding of the text field
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 470),


            //BUTTON FOR OTP
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                //side: BorderSide(color: Colors.black, width: 1), // border line
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // rounded corners
                ),
                minimumSize: Size(400, 50),
              ),
              child: Text('Continue',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 12),



          ],
        ),
      ),
    );
  }
}