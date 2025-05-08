import 'package:flutter/material.dart';
import 'package:hlep/models/food_item.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, FoodItem>> _orders = [];  // List to store grouped orders, with one item per category per order

  List<Map<String, FoodItem>> get orders => _orders;

  void addOrder(Map<String, FoodItem> order) {
    _orders.add(order);
    notifyListeners();
  }

  // Add an item to the current order (ensuring one per category)
  void addToCart(FoodItem item, String category) {
    // Find the last order or create a new one
    if (_orders.isEmpty || _orders.last.keys.contains(category)) {
      // If the category is already added for this order, don't add again
      return;
    }

    // Add to the current order or create a new one if no order exists
    if (_orders.isEmpty || _orders.last.length < 5) {
      // Add the food item to the current order
      _orders.last[category] = item;
    } else {
      // Create a new order if the current one is full
      _orders.add({category: item});
    }

    notifyListeners();
  }

  // Remove item from cart based on category
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



  // Clear all orders
  void clearCart() {
    _orders.clear();
    notifyListeners();
  }
}
