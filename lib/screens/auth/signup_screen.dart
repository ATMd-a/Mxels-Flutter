import 'package:flutter/material.dart';
import 'package:Mxels/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:Mxels/providers/user_provider.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkIfFormIsFilled);
    _birthdayController.addListener(_checkIfFormIsFilled);
    _phoneController.addListener(_checkIfFormIsFilled);
    _emailController.addListener(_checkIfFormIsFilled);
    _passwordController.addListener(_checkIfFormIsFilled);
  }

  void _checkIfFormIsFilled() {
    setState(() {
      _isButtonEnabled =
          _nameController.text.trim().isNotEmpty &&
              _birthdayController.text.trim().isNotEmpty &&
              _phoneController.text.trim().isNotEmpty &&
              _emailController.text.trim().isNotEmpty &&
              _passwordController.text.trim().isNotEmpty;
    });
  }


  @override
  void dispose() {
    _nameController.dispose();
    _birthdayController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    userProvider.setUser(
      name: _nameController.text.trim(),
      birthday: _birthdayController.text.trim(),
      phone: _phoneController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
          (route) => false, // Removes all previous screens from stack
    );

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
        child: ListView(
          children: <Widget>[
            Text('Sign Up', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),

            Text('Enter Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              controller: _nameController,
              decoration: _buildInputDecoration(),
            ),
            SizedBox(height: 15),

            Text('Enter Birthday', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
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
              decoration: _buildInputDecoration(prefixIcon: Icon(Icons.calendar_month), hint: 'Select your birthday'),
            ),
            SizedBox(height: 15),

            Text('Enter Phone Number', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              controller: _phoneController,
              decoration: _buildInputDecoration(prefixIcon: Icon(Icons.add)),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 15),

            Text('Enter Email Address', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              controller: _emailController,
              decoration: _buildInputDecoration(),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 15),

            Text('Enter Password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: _buildInputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _isButtonEnabled ? _submitForm : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text('Sign up', style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),
    );
  }
}

  InputDecoration _buildInputDecoration({Widget? prefixIcon, Widget? suffixIcon, String? hint}) {
    return InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.black, width: 1),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

