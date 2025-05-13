import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:Mxels/models/food_item.dart';

class SelectionProvider with ChangeNotifier {
  final Map<String, FoodItem> _selectedItems = {};
  final Set<String> _selectedCategories = {};
  final Set<String> _selectedBeverages = {};
  String? _selectedRestaurant;

  String? get selectedRestaurant => _selectedRestaurant;
  set selectedRestaurant(String? value) {
    _selectedRestaurant = value;
    notifyListeners();
    _saveSelection();
  }

  Map<String, FoodItem> get selectedItems => _selectedItems;

  void selectItem(String restaurantKey, FoodItem food) {
    _selectedItems[restaurantKey] = food;
    _selectedCategories.add(food.category);
    if (food.category == 'Beverage') {
      _selectedBeverages.add(restaurantKey);
    }
    notifyListeners();
    _saveSelection();
  }

  bool isCategorySelected(String category) {
    return _selectedCategories.contains(category);
  }

  void clearSelections() {
    _selectedItems.clear();
    _selectedCategories.clear();
    _selectedBeverages.clear();
    _selectedRestaurant = null;
    notifyListeners();
    _saveSelection();
  }

  void removeLastSelection() {
    if (_selectedItems.isNotEmpty) {
      final lastKey = _selectedItems.keys.last;
      final lastFood = _selectedItems.remove(lastKey);
      if (lastFood != null) {
        _selectedCategories.remove(lastFood.category);
        if (lastFood.category == 'Beverage') {
          _selectedBeverages.remove(lastKey);
        }
      }
      notifyListeners();
      _saveSelection();
    }
  }

  // ====== Persistence Methods ======

  Future<void> loadSelection() async {
    final prefs = await SharedPreferences.getInstance();

    // Load selected items
    final selectedItemsString = prefs.getString('selectedItems');
    if (selectedItemsString != null) {
      Map<String, dynamic> decoded = jsonDecode(selectedItemsString);
      _selectedItems.clear();
      decoded.forEach((key, item) {
        _selectedItems[key] = FoodItem.fromJson(item);
        _selectedCategories.add(_selectedItems[key]!.category);
        if (_selectedItems[key]!.category == 'Beverage') {
          _selectedBeverages.add(key);
        }
      });
    }

    // Load selected restaurant
    _selectedRestaurant = prefs.getString('selectedRestaurant');

    notifyListeners();
  }

  Future<void> _saveSelection() async {
    final prefs = await SharedPreferences.getInstance();

    // Save selected items
    Map<String, dynamic> toSave = {};
    _selectedItems.forEach((key, value) {
      toSave[key] = value.toJson();
    });
    prefs.setString('selectedItems', jsonEncode(toSave));

    // Save selected restaurant
    if (_selectedRestaurant != null) {
      prefs.setString('selectedRestaurant', _selectedRestaurant!);
    } else {
      prefs.remove('selectedRestaurant');
    }
  }
}
