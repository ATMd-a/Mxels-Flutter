import 'package:flutter/material.dart';
import 'package:Mxels/models/user_info.dart';
import 'package:Mxels/providers/user_provider.dart';
import 'package:Mxels/data/user_data.dart';
import 'package:provider/provider.dart';
import 'package:Mxels/routes/app_routes.dart';

class faceb extends StatelessWidget {
  const faceb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Information',
      initialRoute: AppRoutes.fb,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

class FacebookScreen extends StatelessWidget {
  const FacebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the first user data from SampleUserData
    UserInfo user = SampleUserData.users[0]; // Getting the first user

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.login,
                  (route) => false, // Removes all previous screens from stack
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
              ' - Name and profile picture\n - Email address\n - Phone Number',
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
                // Set user data in UserProvider
                Provider.of<UserProvider>(context, listen: false).setUser(
                  name: user.name,
                  birthday: user.bday,
                  phone: user.phoneNumber,
                  email: user.email,
                  password: user.password,
                );

                // Navigate to the home screen
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                      (route) => false, // Removes all previous screens from stack
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
                Navigator.pop(context);
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
            SizedBox(height: 50),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'By Continuing, Mxels will receive ongoing access to the information that you share and Meta will record when Mxels accesses it. Learn more about this sharing and the settings that you have.',
                style: TextStyle(
                  fontSize: 12,
                ),
                maxLines: 4,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mxels Privacy Policy and Terms of Service',
                style: TextStyle(
                  fontSize: 12,
                ),
                maxLines: 4,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
