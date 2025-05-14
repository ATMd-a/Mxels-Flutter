import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Mxels/routes/app_routes.dart';
import 'package:Mxels/data/user_data.dart'; 

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  TextEditingController phoneController = TextEditingController();
  String errorMessage = ''; 
  String invalidNumberMessage = ''; 
  bool isButtonEnabled = false; 

  void checkPhoneNumber() {
    String phoneNumber = phoneController.text;

    bool phoneExists = SampleUserData.users.any((user) => user.phoneNumber == phoneNumber);

    if (phoneExists) {
      Navigator.pushNamed(context, AppRoutes.phoneOTP, arguments: phoneNumber);
    } else {
      setState(() {
        errorMessage = 'This phone number is not registered.';
      });
    }
  }


  void handlePhoneNumberChange(String value) {
    setState(() {
      if (value.isEmpty) {
        isButtonEnabled = false;
        invalidNumberMessage = '';
      } else if (!RegExp(r'^\d+$').hasMatch(value)) {
        invalidNumberMessage = 'Please enter a valid phone number (only numbers allowed)';
        isButtonEnabled = false;
      } else {
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
            Navigator.pop(context); 
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
              keyboardType: TextInputType.phone,
              inputFormatters: [
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
              onChanged: handlePhoneNumberChange,
            ),
            
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
