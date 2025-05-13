import 'package:provider/provider.dart';
import 'package:Mxels/providers/selection_provider.dart';
import 'package:Mxels/providers/cart_provider.dart';
import 'package:Mxels/providers/user_provider.dart';

class AppProviders {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider(create: (context) => SelectionProvider()),
    ChangeNotifierProvider(create: (context) => CartProvider()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
    // Add more providers here if needed
  ];
}
