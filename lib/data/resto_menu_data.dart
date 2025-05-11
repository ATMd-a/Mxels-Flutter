import 'package:hlep/models/food_item.dart';

class RestaurantMenuData {
  static final Map<String, List<FoodItem>> restoMenus = {
    'Jollibee': [
      FoodItem(
        name: 'Jolly Spaghetti Solo',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/jollibee/jolli_snacks.jpg',
      ),
      FoodItem(
        name: 'Jolly Burger Solo',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/jollibee/jolli_snacks1.jpg',
      ),
      FoodItem(
        name: 'Jolli Chicken Joy',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/jollibee/jolli_ricemeal.jpg',
      ),
      FoodItem(
        name: 'Jolli Burger Joy',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/jollibee/jolli_ricemeal1.jpg',
      ),
      FoodItem(
        name: 'Jolli Bucket',
        price: 499.0,
        category: 'Group Meals',
        imageUrl: 'assets/jollibee/jolli_groupmeals.jpg',
      ),
      FoodItem(
        name: 'Jolli Spaghetti',
        price: 499.0,
        category: 'Group Meals',
        imageUrl: 'assets/jollibee/jolli_groupmeals1.jpg',
      ),
      FoodItem(
        name: 'Jolli pie',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/jollibee/jolli_desserts.jpg',
      ),
      FoodItem(
          name: 'Jolli Fries',
          price: 89.0,
          category: 'Desserts',
          imageUrl: 'assets/jollibee/jolli_desserts1.jpg',
      ),
    ],
    'Chowking': [
      FoodItem(
        name: 'Chow Asado Siopao',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/chowking/chow_snacks.jpg',
      ),
      FoodItem(
        name: 'Chow Pancit Canton',
        price: 99.0,
        category: 'Snacks',
        imageUrl: 'assets/chowking/chow_snacks1.jpg',
      ),
      FoodItem(
        name: 'Chow Chao Pan',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/chowking/chow_ricemeal.jpg',
      ),
      FoodItem(
        name: 'Chow Chao Pan auriart',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/chowking/chow_ricemeal1.jpg',
      ),
      FoodItem(
        name: 'Chow PancitG',
        price: 499.0,
        category: 'Group Meals',
        imageUrl: 'assets/chowking/chow_groupmeals.jpg',
      ),
      FoodItem(
        name: 'Chow Chao Pan w Siomai',
        price: 499.0,
        category: 'Group Meals',
        imageUrl: 'assets/chowking/chow_groupmeals1.jpg',
      ),
      FoodItem(
        name: 'Chow Desserts',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/chowking/chow_desserts.jpg',
      ),
      FoodItem(
        name: 'Chow Desserts',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/chowking/chow_desserts1.jpg',
      ),
    ],
    'Mang Inasal': [
      FoodItem(
        name: 'Palabok',
        price: 149.0,
        category: 'Snacks',
        imageUrl: 'assets/manginasal/mang_snacks.jpg',
      ),
      FoodItem(
        name: 'Paa Large - PM1',
        price: 149.0,
        category: 'Rice Meals',
        imageUrl: 'assets/manginasal/mang_ricemeals.jpg',
      ),
      FoodItem(
        name: 'Pecho Large - PM1',
        price: 499.0,
        category: 'Rice Meals',
        imageUrl: 'assets/manginasal/mang_ricemeals1.jpg',
      ),
      FoodItem(
        name: 'Paa Large Family Size',
        price: 89.0,
        category: 'Group Meals',
        imageUrl: 'assets/manginasal/mang_group.jpg',
      ),
      FoodItem(
        name: 'Pork BBQ Buddy Size',
        price: 89.0,
        category: 'Group Meals',
        imageUrl: 'assets/manginasal/mang_group1.jpg',
      ),
      FoodItem(
        name: 'Extra Creamy Halo-Halo',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/manginasal/mang_dessert.jpg',
      ),
      FoodItem(
        name: 'Crema de Leche Halo-Halo',
        price: 89.0,
        category: 'Desserts',
        imageUrl: 'assets/manginasal/mang_dessert1.jpg',
      ),
    ],
    'Greenwich': [
      FoodItem(
        name: 'Pizza Hawaiian Overload',
        price: 79.0,
        category: 'Pizza',
        imageUrl: 'assets/greenwich/green_pizza.jpg',
      ),
      FoodItem(
        name: 'Pizza All-in Overload',
        price: 199.0,
        category: 'Pizza',
        imageUrl: 'assets/greenwich/green_pizza1.jpg',
      ),
      FoodItem(
        name: 'Cheese Burger Classic',
        price: 199.0,
        category: 'Pizza',
        imageUrl: 'assets/greenwich/green_pizza3.jpg',
      ),
      FoodItem(
        name: 'Pizza Meat',
        price: 199.0,
        category: 'Pizza',
        imageUrl: 'assets/greenwich/green_pizza3.jpg',
      ),
      FoodItem(
        name: 'Lasagna',
        price: 199.0,
        category: 'Snacks',
        imageUrl: 'assets/greenwich/green_snacks.jpg',
      ),
      FoodItem(
        name: 'Pizza wrap',
        price: 199.0,
        category: 'Snacks',
        imageUrl: 'assets/greenwich/green_snacks1.jpg',
      ),
    ],
  };

  static final List<FoodItem> beverageItems = [
    FoodItem(
      name: 'Coke 2 L',
      price: 35.0,
      category: 'Beverage',
      imageUrl: 'assets/bev/bev_soft.jpg',
    ),
    FoodItem(
      name: 'Royal 1L',
      price: 35.0,
      category: 'Beverage',
      imageUrl: 'assets/bev/bev_soft1.jpg',
    ),
    FoodItem(
      name: 'Sprite 1L',
      price: 35.0,
      category: 'Beverage',
      imageUrl: 'assets/bev/bev_soft2.jpg',
    ),
    FoodItem(
      name: 'Water 1L',
      price: 30.0,
      category: 'Beverage',
      imageUrl: 'assets/bev/bev_soft4.jpg',
    ),
    FoodItem(
      name: 'Del Monte Pineapple Juice Ace 240ml',
      price: 40.0,
      category: 'Beverage',
      imageUrl: 'assets/bev/bev_soft3.jpg',
    ),
  ];

  static final List<FoodItem> combos = [
    FoodItem(
      name: 'Combo A',
      price: 35.0,
      category: 'Combo',
      imageUrl: 'assets/combos/comboA.jpg',
    ),
    FoodItem(
      name: 'Combo B',
      price: 35.0,
      category: 'Combo',
      imageUrl: 'assets/combos/comboB.jpg',
    ),
    FoodItem(
      name: 'Combo C',
      price: 35.0,
      category: 'Combo',
      imageUrl: 'assets/combos/comboC.jpg',
    ),
    FoodItem(
      name: 'Combo D',
      price: 30.0,
      category: 'Combo',
      imageUrl: 'assets/combos/comboD.jpg',
    ),
  ];

}

