import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hlep/providers/selection_provider.dart';

class AppProviders {
  static List<ChangeNotifierProvider> get providers => [
    ChangeNotifierProvider(create: (_) => SelectionProvider()),
  ];
}
