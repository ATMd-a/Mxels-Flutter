import 'package:flutter/material.dart';
import 'package:hlep/models/food_item.dart';

class SelectionProvider with ChangeNotifier {
  final Map<String, FoodItem> _selectedItems = {};
  final Set<String> _selectedCategories = {};
  final Set<String> _selectedBeverages = {};

  void selectItem(String restaurantKey, FoodItem food) {
    _selectedItems[restaurantKey] = food;
    _selectedCategories.add(food.category);

    if (food.category == 'Beverage') {
      _selectedBeverages.add(restaurantKey);
    }

    notifyListeners();
  }

  bool isCategorySelected(String category) {
    return _selectedCategories.contains(category);
  }

  Map<String, FoodItem> get selectedItems => _selectedItems;

  void clearSelections() {
    _selectedItems.clear();
    _selectedCategories.clear();
    _selectedBeverages.clear();
    notifyListeners();
  }

  void finalizeSelection() {
    // Save logic here if needed
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
    }
  }
}
