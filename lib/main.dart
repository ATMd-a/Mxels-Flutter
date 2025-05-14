import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import 'package:provider/provider.dart';
import '../../providers/app_providers.dart'; 
import '../../providers/selection_provider.dart'; 
import '../../providers/cart_provider.dart';
import '../../providers/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...AppProviders.providers, // Include other providers if needed
        ChangeNotifierProvider(create: (_) => SelectionProvider()), 
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
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
