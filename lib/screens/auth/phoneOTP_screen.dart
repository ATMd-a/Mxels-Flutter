import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Mxels/data/user_data.dart'; // Import your user data
import 'package:Mxels/routes/app_routes.dart';

import '../../models/user_info.dart';

class PhonePassScreen extends StatefulWidget {
  final String phoneNumber; // Receive the phone number from the previous screen

  const PhonePassScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _PhonePassScreenState createState() => _PhonePassScreenState();
}

class _PhonePassScreenState extends State<PhonePassScreen> {
  TextEditingController passwordController = TextEditingController();
  String errorMessage = ''; // To store error message
  bool isButtonEnabled = false; // To control the button state

  // Function to check if the password is correct
  void checkPassword() {
    String password = passwordController.text;

    // Find the user with the given phone number
    UserInfo? user = SampleUserData.users.firstWhere(
          (user) => user.phoneNumber == widget.phoneNumber,
      orElse: () => UserInfo(
        name: '',
        bday: '',
        phoneNumber: '',
        email: '',
        password: '',
      ),
    );

    if (user != null) {
      // If user is found, check the password
      if (user.password == password) {
        // If password is correct, navigate to the next screen
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.home,
              (route) => false, // Removes all previous screens from stack
        );

      } else {
        // If password is incorrect, show an error message
        setState(() {
          errorMessage = 'Incorrect password. Please try again.';
        });
      }
    }
  }

  // Function to handle changes in the password field
  void handlePasswordChange(String value) {
    setState(() {
      isButtonEnabled = value.isNotEmpty; // Enable button if password is not empty
      errorMessage = ''; // Clear error message
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Password'),
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
              'Please enter your password',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true, // Hide password input
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  size: 24,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                hintText: 'Enter your password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
              onChanged: handlePasswordChange, // Listen for changes in input
            ),
            // Show error message if password is incorrect
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
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: isButtonEnabled ? checkPassword : null, // Disable if not valid
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text(
            'Submit',
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