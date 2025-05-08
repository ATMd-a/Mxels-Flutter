import 'package:flutter/material.dart';
import 'package:hlep/screens/auth/login_screen.dart';
import 'package:hlep/screens/home/home_screen.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Information',
      home: const SignupScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _birthdayController = TextEditingController();

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Text(
                  'Enter First Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  'Enter Last Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),


            Row(
              children: [
                Text(
                  'Enter Birthday',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Birthday Text Field
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _birthdayController,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        _birthdayController.text =
                        "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.calendar_month),
                      hintText: 'Select your birthday',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.black, width: 1),
                      ),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),


            Row(
              children: [
                Text(
                  'Enter Phone Number',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),


            //txtfld
            Row(
              children: [
                Expanded( // Makes the TextField take the remaining space
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.add, // "+" sign icon
                        size: 24, // Adjust icon size
                        color: Colors.black, // Icon color
                      ),
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

            SizedBox(height: 230),



            ElevatedButton(
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
                minimumSize: Size(400, 50),
              ),
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
