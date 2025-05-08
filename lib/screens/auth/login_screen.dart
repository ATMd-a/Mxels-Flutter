import 'package:flutter/material.dart';
import 'package:hlep/screens/auth/signup_screen.dart';
import 'phoneNumber_screen.dart'; // make sure the filename and class match

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  TextAndButtonAction createState() => TextAndButtonAction();
}


class TextAndButtonAction extends State<Login> {
  String bank = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 500),

            //ADD THE LOGO

            //TEXT OF LOGIN
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // centers the row's content
              children: [
                Text(
                  'LOGIN / SIGNUP',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),

            //BUTTON FOR FACEBOOK
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                side: BorderSide(color: Colors.black, width: 1), // border line
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // rounded corners
                ),
                minimumSize: Size(400, 50),
              ),
              child: Text('Facebook',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 12),

            //BUTTON FOR GOOGLE
            ElevatedButton(
              onPressed: () {
                //_calculateBalance();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.black, width: 1), // border line
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // rounded corners
                ),
                minimumSize: Size(400, 50),
              ),
              child: Text('Google',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 18),

            //TEXT FOR 'OR'
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // centers the row's content
              children: [
                Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),

            //BUTTON FOR PHONE NUMBER
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => phoneNumber()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.black, width: 1), // border line
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // rounded corners
                ),
                minimumSize: Size(400, 50),
              ),
              child: Text('Phone Number',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 25),

            //TEXT LINKED FOR GUEST ORDER
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: Text(
                    'ORDER AS GUEST',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Optional: add color to show it's clickable
                      decoration: TextDecoration.underline, // Optional: underline to look like a link
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