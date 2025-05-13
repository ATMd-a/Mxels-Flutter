import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/food_item.dart';
import '../../providers/cart_provider.dart';
import '../../data/resto_menu_data.dart';

class RestoScreen extends StatelessWidget {
  final String restaurantKey;

  const RestoScreen({Key? key, required this.restaurantKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FoodItem> selectedMenu = [];
    String appBarTitle = "Menu";

    if (restaurantKey == 'Jollibee') {
      selectedMenu = RestaurantMenuData.restoMenus['Jollibee'] ?? [];
      appBarTitle = 'Jollibee Menu';
    } else if (restaurantKey == 'Chowking') {
      selectedMenu = RestaurantMenuData.restoMenus['Chowking'] ?? [];
      appBarTitle = 'Chowking Menu';
    } else if (restaurantKey == 'Mang Inasal') {
      selectedMenu = RestaurantMenuData.restoMenus['Mang Inasal'] ?? [];
      appBarTitle = 'Mang Inasal\'s Menu';
    } else if (restaurantKey == 'Greenwich') {
      selectedMenu = RestaurantMenuData.restoMenus['Greenwich'] ?? [];
      appBarTitle = 'Greenwich\'s Menu';
    } else {
      selectedMenu = [];
      appBarTitle = 'Restaurant';
    }

    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF146F3D),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Add this line
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgwallpaper.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 3 / 4,
          ),
          itemCount: selectedMenu.length,
          itemBuilder: (context, index) {
            final foodItem = selectedMenu[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        foodItem.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(
                      foodItem.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₱${foodItem.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.green,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            cartProvider.addToCart(foodItem);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      '${foodItem.name} added to cart')),
                            );
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: const Icon(Icons.add,
                                color: Colors.white, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

