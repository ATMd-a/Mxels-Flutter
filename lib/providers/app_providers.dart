import 'package:provider/provider.dart';
import 'package:hlep/providers/selection_provider.dart';

class AppProviders {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider(create: (context) => SelectionProvider()),
    // Add more providers here if you have others like AuthenticationProvider, etc.
  ];
}
