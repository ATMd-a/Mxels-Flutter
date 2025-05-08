import 'package:flutter/material.dart';
import 'package:hlep/models/food_item.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, FoodItem>> _orders = [];

  List<Map<String, FoodItem>> get orders => _orders;

  void addOrder(Map<String, FoodItem> order) {
    _orders.add(order);
    notifyListeners();
  }

  // Add an item to the current order, ensuring one item per category
  void addToCart(FoodItem item, String category) {
    if (_orders.isEmpty) {
      _orders.add({category: item});
      notifyListeners();
      return;
    }

    Map<String, FoodItem> lastOrder = _orders.last;

    // If the category already exists, ignore to avoid duplicates
    if (lastOrder.containsKey(category)) return;

    // Just add to the current order
    lastOrder[category] = item;

    notifyListeners();
  }

  void removeFromCart(int orderIndex, String category) {
    if (orderIndex >= 0 && orderIndex < _orders.length) {
      Map<String, FoodItem> order = _orders[orderIndex];
      if (order.containsKey(category)) {
        order.remove(category);
        if (order.isEmpty) {
          _orders.removeAt(orderIndex);
        }
        notifyListeners();
      }
    }
  }

  void clearCart() {
    _orders.clear();
    notifyListeners();
  }
}
