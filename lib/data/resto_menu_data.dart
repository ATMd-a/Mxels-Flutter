import 'package:hlep/models/food_item.dart';

class RestaurantMenuData {
  static final Map<String, List<FoodItem>> restoMenus = {
    'Jollibee': [
      FoodItem(
        name: 'Jolly Spaghetti Solo',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/jolli_snacks.jpg',
      ),
      FoodItem(
        name: 'Jolly Burger Solo',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/jolli_snacks1.jpg',
      ),
      FoodItem(
        name: 'Jolli Chicken Joy',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/jolli_ricemeal.jpg',
      ),
      FoodItem(
        name: 'Jolli Burger Joy',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/jolli_ricemeal1.jpg',
      ),
      FoodItem(
        name: 'Jolli Bucket',
        price: 499.0,
        category: 'Group Meals',
        imageUrl: 'assets/jolli_groupmeals.jpg',
      ),
      FoodItem(
        name: 'Jolli Spaghetti',
        price: 499.0,
        category: 'Group Meals',
        imageUrl: 'assets/jolli_groupmeals1.jpg',
      ),
      FoodItem(
        name: 'Jolli pie',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/jolli_desserts.jpg',
      ),
      FoodItem(
          name: 'Jolli Fries',
          price: 89.0,
          category: 'Desserts',
          imageUrl: 'assets/jolli_desserts1.jpg',
      ),
    ],
    'Chowking': [
      FoodItem(
        name: 'Chow Asado Siopao',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/chow_snacks.jpg',
      ),
      FoodItem(
        name: 'Chow Pancit Canton',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/chow_snacks1.jpg',
      ),
      FoodItem(
        name: 'Chow Chao Pan',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/chow_ricemeal.jpg',
      ),
      FoodItem(
        name: 'Chow Chao Pan auriart',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/chow_ricemeal1.jpg',
      ),
      FoodItem(
        name: 'Chow PancitG',
        price: 499.0,
        category: 'Group Meals',
        imageUrl: 'assets/chow_groupmeals.jpg',
      ),
      FoodItem(
        name: 'Chow Chao Pan w Siomai',
        price: 499.0,
        category: 'Group Meals',
        imageUrl: 'assets/chow_groupmeals1.jpg',
      ),
      FoodItem(
        name: 'Chow Desserts',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/chow_desserts.jpg',
      ),
      FoodItem(
        name: 'Chow Desserts',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/chow_desserts1.jpg',
      ),
    ],
    'Mang Inasal': [
      FoodItem(
        name: 'Palabok',
        price: 149.0,
        category: 'Snacks',
        imageUrl: 'assets/mang_snacks.png',
      ),
      FoodItem(
        name: 'Paa Large - PM1',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/mang_ricemeals.png',
      ),
      FoodItem(
        name: 'Pecho Large - PM1',
        price: 499.0,
        category: 'Rice Meals',
        imageUrl: 'assets/mang_ricemeal1.png',
      ),
      FoodItem(
        name: 'Paa Large Family Size',
        price: 89.0,
        category: 'Group Meals',
        imageUrl: 'assets/mang_group.png',
      ),
      FoodItem(
        name: 'Pork BBQ Buddy Size',
        price: 89.0,
        category: 'Group Meals',
        imageUrl: 'assets/mang_group1.png',
      ),
      FoodItem(
        name: 'Extra Creamy Halo-Halo',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/mang_dessert.png',
      ),
      FoodItem(
        name: 'Crema de Leche Halo-Halo',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/mang_dessert1.png',
      ),
    ],
    'Greenwich': [
      FoodItem(
        name: 'Pizza Hawaiian Overload',
        price: 79.0,
        category: 'Pizza',
        imageUrl: 'assets/green_pizza.jpg',
      ),
      FoodItem(
        name: 'Pizza All-in Overload',
        price: 199.0,
        category: 'Pizza',
        imageUrl: 'assets/green_pizza1.jpg',
      ),
      FoodItem(
        name: 'Cheese Burger Classic',
        price: 199.0,
        category: 'Pizza',
        imageUrl: 'assets/green_pizza3.jpg',
      ),
      FoodItem(
        name: 'Pizza Meat',
        price: 199.0,
        category: 'Pizza',
        imageUrl: 'assets/green_pizza3.jpg',
      ),
      FoodItem(
        name: 'Lasagna',
        price: 199.0,
        category: 'Snacks',
        imageUrl: 'assets/green_snacks.jpg',
      ),
      FoodItem(
        name: 'Pizza wrap',
        price: 199.0,
        category: 'Snacks',
        imageUrl: 'assets/green_snacks1.jpg',
      ),
    ],
  };

  static final List<FoodItem> beverageItems = [
    FoodItem(
      name: 'Coke',
      price: 35.0,
      category: 'Beverage',
      imageUrl: 'assets/jolli_snacks.jpg',
    ),
    FoodItem(
      name: 'Iced Tea',
      price: 30.0,
      category: 'Beverage',
      imageUrl: 'assets/jolli_snacks.jpg',
    ),
    FoodItem(
      name: 'Pineapple Juice',
      price: 40.0,
      category: 'Beverage',
      imageUrl: 'assets/jolli_snacks.jpg',
    ),
  ];
}
