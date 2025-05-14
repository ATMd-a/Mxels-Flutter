import 'package:Mxels/models/food_item.dart';

class RestaurantMenuData {
  static final Map<String, List<FoodItem>> restoMenus = {
    'Jollibee': [
      FoodItem(
        name: 'Jolly Spaghetti Solo',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/img/jollibee/jolli_snacks.png',
      ),
      FoodItem(
        name: 'Jolly Burger Solo',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/img/jollibee/jolli_snacks1.png',
      ),
      FoodItem(
        name: 'Jolli Chicken Joy',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/img/jollibee/jolli_ricemeal.png',
      ),
      FoodItem(
        name: 'Jolli Burger Joy',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/img/jollibee/jolli_ricemeal1.png',
      ),
      FoodItem(
        name: 'Jolli Bucket',
        price: 499.0,
        category: 'Group Meals',
        imageUrl: 'assets/img/jollibee/jolli_groupmeals.png',
      ),
      FoodItem(
        name: 'Jolli Spaghetti',
        price: 499.0,
        category: 'Group Meals',
        imageUrl: 'assets/img/jollibee/jolli_groupmeals1.png',
      ),
      FoodItem(
        name: 'Jolli pie',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/img/jollibee/jolli_desserts.png',
      ),
      FoodItem(
        name: 'Jolli Fries',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/img/jollibee/jolli_desserts1.png',
      ),
    ],
    'Chowking': [
      FoodItem(
        name: 'Chow Asado Siopao',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/img/chowking/chow_snacks.png',
      ),
      FoodItem(
        name: 'Chow Pancit Canton',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/img/chowking/chow_snacks1.png',
      ),
      FoodItem(
        name: 'Chow Chao Pan',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/img/chowking/chow_ricemeal.png',
      ),
      FoodItem(
        name: 'Chow Chao Pan auriart',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/img/chowking/chow_ricemeal1.png',
      ),
      FoodItem(
        name: 'Chow PancitG',
        price: 499.0,
        category: 'Group Meals',
        imageUrl: 'assets/img/chowking/chow_groupmeals.png',
      ),
      FoodItem(
        name: 'Chow Chao Pan w Siomai',
        price: 499.0,
        category: 'Group Meals',
        imageUrl: 'assets/img/chowking/chow_groupmeals1.png',
      ),
      FoodItem(
        name: 'Chow Desserts',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/img/chowking/chow_desserts.png',
      ),
      FoodItem(
        name: 'Chow Desserts',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/img/chowking/chow_desserts1.png',
      ),
    ],
    'Mang Inasal': [
      FoodItem(
        name: 'Palabok',
        price: 149.0,
        category: 'Snacks',
        imageUrl: 'assets/img/manginasal/mang_snacks.png',
      ),
      FoodItem(
        name: 'Paa Large - PM1',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/img/manginasal/mang_ricemeals.png',
      ),
      FoodItem(
        name: 'Pecho Large - PM1',
        price: 499.0,
        category: 'Rice Meals',
        imageUrl: 'assets/img/manginasal/mang_ricemeals1.png',
      ),
      FoodItem(
        name: 'Paa Large Family Size',
        price: 89.0,
        category: 'Group Meals',
        imageUrl: 'assets/img/manginasal/mang_group.png',
      ),
      FoodItem(
        name: 'Pork BBQ Buddy Size',
        price: 89.0,
        category: 'Group Meals',
        imageUrl: 'assets/img/manginasal/mang_group1.png',
      ),
      FoodItem(
        name: 'Extra Creamy Halo-Halo',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/img/manginasal/mang_dessert.png',
      ),
      FoodItem(
        name: 'Crema de Leche Halo-Halo',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/img/manginasal/mang_dessert1.png',
      ),
    ],
    'Greenwich': [
      FoodItem(
        name: 'Pizza Hawaiian Overload',
        price: 79.0,
        category: 'Pizza',
        imageUrl: 'assets/img/greenwich/green_pizza.png',
      ),
      FoodItem(
        name: 'Pizza All-in Overload',
        price: 199.0,
        category: 'Pizza',
        imageUrl: 'assets/img/greenwich/green_pizza1.png',
      ),
      FoodItem(
        name: 'Cheese Burger Classic',
        price: 199.0,
        category: 'Pizza',
        imageUrl: 'assets/img/greenwich/green_pizza3.png',
      ),
      FoodItem(
        name: 'Pizza Meat',
        price: 199.0,
        category: 'Pizza',
        imageUrl: 'assets/img/greenwich/green_pizza3.png',
      ),
      FoodItem(
        name: 'Lasagna',
        price: 199.0,
        category: 'Snacks',
        imageUrl: 'assets/img/greenwich/green_snacks.png',
      ),
      FoodItem(
        name: 'Pizza wrap',
        price: 199.0,
        category: 'Snacks',
        imageUrl: 'assets/img/greenwich/green_snacks1.png',
      ),
    ],
  };

  static final List<FoodItem> beverageItems = [
    FoodItem(
      name: 'Coke 2 L',
      price: 35.0,
      category: 'Beverage',
      imageUrl: 'assets/img/bev/bev_soft.png',
    ),
    FoodItem(
      name: 'Royal 1L',
      price: 35.0,
      category: 'Beverage',
      imageUrl: 'assets/img/bev/bev_soft1.png',
    ),
    FoodItem(
      name: 'Sprite 1L',
      price: 35.0,
      category: 'Beverage',
      imageUrl: 'assets/img/bev/bev_soft2.png',
    ),
    FoodItem(
      name: 'Water 1L',
      price: 30.0,
      category: 'Beverage',
      imageUrl: 'assets/img/bev/bev_soft4.png',
    ),
    FoodItem(
      name: 'Del Monte Pineapple Juice Ace 240ml',
      price: 40.0,
      category: 'Beverage',
      imageUrl: 'assets/img/bev/bev_soft3.png',
    ),
  ];

  static final List<FoodItem> combos = [
    FoodItem(
      name: 'Combo A: Chickenjoy, Lasagna, Breadstick and Drink',
      price: 35.0,
      category: 'Combo',
      imageUrl: 'assets/img/combos/comboA.png',
    ),
    FoodItem(
      name: 'Combo B: Chickenjoy, Rice, Sweet and Sour Pork, Half-Palabok and Drink',
      price: 35.0,
      category: 'Combo',
      imageUrl: 'assets/img/combos/comboB.png',
    ),
    FoodItem(
      name: 'Combo C: Chicken Inasal Paa, 1 pc Burgersteak, Half-Pancit and Drink',
      price: 35.0,
      category: 'Combo',
      imageUrl: 'assets/img/combos/comboC.png',
    ),
    FoodItem(
      name: 'Combo D: Yumburger, Regular Fries, Halo-Halo, and Drink',
      price: 30.0,
      category: 'Combo',
      imageUrl: 'assets/img/combos/comboD.png',
    ),
  ];

}