import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Mxels/routes/app_routes.dart';
import 'package:Mxels/data/user_data.dart'; // Import your user data

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController phoneController = TextEditingController();
  String errorMessage = ''; // To store error message
  String invalidNumberMessage = ''; // To store invalid number message
  bool isButtonEnabled = false; // To control the button state

  // Function to check if the phone number exists
  void checkPhoneNumber() {
    String phoneNumber = phoneController.text;

    // Check if the phone number exists in the user data
    bool phoneExists = SampleUserData.users.any((user) => user.phoneNumber == phoneNumber);

    if (phoneExists) {
      // If found, navigate to the next screen with the phone number
      Navigator.pushNamed(context, AppRoutes.phoneOTP, arguments: phoneNumber);
    } else {
      // If not found, show an error message
      setState(() {
        errorMessage = 'This phone number is not registered.';
      });
    }
  }

  // Function to handle changes in the phone number field
  void handlePhoneNumberChange(String value) {
    setState(() {
      // Check if the phone number is valid and enable/disable the button
      if (value.isEmpty) {
        isButtonEnabled = false;
        invalidNumberMessage = '';
      } else if (!RegExp(r'^\d+$').hasMatch(value)) {
        // Check if the input is not a number
        invalidNumberMessage = 'Please enter a valid phone number (only numbers allowed)';
        isButtonEnabled = false;
      } else {
        // If the phone number is valid, check if the button can be enabled
        invalidNumberMessage = '';
        isButtonEnabled = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to login screen
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
              controller: phoneController,
              keyboardType: TextInputType.phone, // Allow phone number input
              inputFormatters: [
                // Allow only numbers to be entered
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  size: 24,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                hintText: '09xxxxxxxxx',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onChanged: handlePhoneNumberChange, // Listen for changes in input
            ),
            // Show error message if phone number not found
            if (errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
              ),
            // Show message if input is not a number
            if (invalidNumberMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  invalidNumberMessage,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: isButtonEnabled ? checkPhoneNumber : null, // Disable if not valid
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: Size(double.infinity, 50),
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
