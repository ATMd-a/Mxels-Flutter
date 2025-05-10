import 'package:flutter/material.dart';
import 'package:hlep/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:hlep/providers/app_providers.dart';  // Import your AppProviders file
import 'package:hlep/providers/selection_provider.dart';  // Import the SelectionProvider file
import 'package:hlep/providers/cart_provider.dart';  // Import the CartProvider file

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
        ChangeNotifierProvider(create: (_) => CartProvider()), // Add CartProvider here
      ],
      child: MaterialApp(
        title: 'Your App',
        theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
        initialRoute: AppRoutes.login,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
