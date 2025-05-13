import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import 'package:provider/provider.dart';
import '../../providers/app_providers.dart';  // Import your AppProviders file
import '../../providers/selection_provider.dart';  // Import the SelectionProvider file
import '../../providers/cart_provider.dart';
import '../../providers/user_provider.dart';// Import the CartProvider file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...AppProviders.providers, // Include other providers if needed
        ChangeNotifierProvider(create: (_) => SelectionProvider()), // Add your SelectionProvider here
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),// Add CartProvider here
      ],
      child: MaterialApp(
        title: 'Your App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.login,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
