import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Mxels/models/food_item.dart';

class CartProvider with ChangeNotifier {
  List<FoodItem> _cartItems = [];
  String _orderType = 'pickup';

  List<FoodItem> get cartItems => _cartItems;
  String get orderType => _orderType;

  CartProvider() {
    _loadCartFromPrefs();
  }

  void addToCart(FoodItem item) {
    _cartItems.add(item);
    _saveCartToPrefs();
    notifyListeners();
  }

  void removeFromCart(FoodItem item) {
    _cartItems.remove(item);
    _saveCartToPrefs();
    notifyListeners();
  }

  void setOrderType(String type) {
    _orderType = type;
    _saveCartToPrefs();
    notifyListeners();
  }

  double getCartTotal() {
    return _cartItems.fold(0, (sum, item) => sum + item.price);
  }

  void _saveCartToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = _cartItems.map((item) => json.encode(item.toJson())).toList();
    prefs.setStringList('cart_items', cartJson);
    prefs.setString('order_type', _orderType);
  }

  void _loadCartFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getStringList('cart_items');
    final savedOrderType = prefs.getString('order_type');

    if (cartJson != null) {
      _cartItems = cartJson.map((item) => FoodItem.fromJson(json.decode(item))).toList();
    }

    if (savedOrderType != null) {
      _orderType = savedOrderType;
    }

    notifyListeners();
  }

  void clearCart() async {
    _cartItems.clear();
    _orderType = 'pickup';
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('cart_items');
    prefs.remove('order_type');
    notifyListeners();
  }
}
