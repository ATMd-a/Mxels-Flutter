import 'package:Mxels/providers/selection_provider.dart';
import 'package:provider/provider.dart';


class AppProviders {
  static List<ChangeNotifierProvider> get providers => [
    ChangeNotifierProvider(create: (_) => SelectionProvider()),
  ];
}
