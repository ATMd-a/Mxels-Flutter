import 'package:hlep/models/food_item.dart';

class RestaurantMenuData {
  static final Map<String, List<FoodItem>> restoMenus = {
    'Jollibee': [
      FoodItem(
        name: 'Jolly Spaghetti Solo',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/jolli_snacks.png',
      ),
      FoodItem(
        name: 'Jolly Burger Solo',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/jolli_snacks1.png',
      ),
      FoodItem(
        name: 'Jolli Chicken Joy',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/jolli_ricemeal.jpg',
      ),
      FoodItem(
        name: 'Jolli Bucket with Spaghetti',
        price: 499.0,
        category: 'Group Meals',
        imageUrl: 'assets/jolli_groupmeals.png',
      ),
      FoodItem(
        name: 'Jolli pie',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/jolli_desserts.png',
      ),
      FoodItem(
          name: 'Jolli Fries',
          price: 89.0,
          category: 'Desserts',
          imageUrl: 'assets/jolli_desserts1.png',
      ),
    ],
    'Chowking': [
      FoodItem(
        name: 'Chow Asado Siopao',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/chow_snacks.png',
      ),
      FoodItem(
        name: 'Chow Chao Pan',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/chow_ricemeal.png',
      ),
      FoodItem(
        name: 'Chow Chao Pan w Siomai',
        price: 499.0,
        category: 'Group Meals',
        imageUrl: 'assets/chow_groupmeals.png',
      ),
      FoodItem(
        name: 'Chow Desserts',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/chow_desserts.png',
      ),
    ],
    'Mang Inasal': [
      FoodItem(
        name: 'Mang BBQ',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/mang_ricemeals.png',
      ),
      FoodItem(
        name: 'Mang PM1',
        price: 499.0,
        category: 'Rice Meals',
        imageUrl: 'assets/mang_ricemeal1.png',
      ),
      FoodItem(
        name: 'Mang Group Meal',
        price: 89.0,
        category: 'Group Meals',
        imageUrl: 'assets/mang_group.png',
      ),
      FoodItem(
        name: 'Mang Dessert',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/mang_dessert.png',
      ),
    ],
    'Greenwich': [
      FoodItem(
        name: 'Pizza Cheese',
        price: 79.0,
        category: 'Pizza',
        imageUrl: 'assets/jabee.png',
      ),
      FoodItem(
        name: 'Pizza Meat',
        price: 199.0,
        category: 'Snacks',
        imageUrl: 'assets/jabee.png',
      ),
    ],
  };

  static final List<FoodItem> beverageItems = [
    FoodItem(
      name: 'Coke',
      price: 35.0,
      category: 'Beverage',
      imageUrl: 'assets/jolli_ricemeal.png',
    ),
    FoodItem(
      name: 'Iced Tea',
      price: 30.0,
      category: 'Beverage',
      imageUrl: 'assets/jolli_ricemeal.png',
    ),
    FoodItem(
      name: 'Pineapple Juice',
      price: 40.0,
      category: 'Beverage',
      imageUrl: 'assets/jolli_ricemeal.png',
    ),
  ];
}
