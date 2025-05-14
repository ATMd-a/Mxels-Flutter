import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/food_item.dart';
import '../../providers/cart_provider.dart';
import '../../data/resto_menu_data.dart';
import 'home_screen.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late List<String> allCategories;

  @override
  void initState() {
    super.initState();
    allCategories = _extractAllCategories();
    _tabController = TabController(length: allCategories.length, vsync: this);
  }

  List<String> _extractAllCategories() {
    final Set<String> categories = {};
    for (var menu in RestaurantMenuData.restoMenus.values) {
      for (var food in menu) {
        categories.add(food.category);
      }
    }
    // Add "Beverage" to the categories
    categories.add('Beverage');
    return categories.toList();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0xFF146F3D),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Container(
            color: Colors.white,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Colors.green,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: allCategories.map((category) => Tab(text: category)).toList(),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bgwallpaper.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: allCategories.map((category) {
            if (category == 'Beverage') {
              // Display beverages in a grid with scrolling
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                children: [
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: RestaurantMenuData.beverageItems.map((beverage) {
                      return _buildFoodItemCard(context, cartProvider, beverage);
                    }).toList(),
                  ),
                ],
              );
            } else {
              // Display food items from restaurants
              return ListView(
                children: RestaurantMenuData.restoMenus.entries.map((entry) {
                  final restoName = entry.key;
                  final foodsInCategory = entry.value.where((food) => food.category == category).toList();

                  if (foodsInCategory.isEmpty) return const SizedBox();

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                          child: Text(
                            restoName,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: foodsInCategory.map((food) {
                              return _buildFoodItemCard(context, cartProvider, food);
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }
          }).toList(),
        ),
      ),
    );
  }

  // Refactored _buildFoodItemCard for reusability
  Widget _buildFoodItemCard(BuildContext context, CartProvider cartProvider, FoodItem food) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 12 * 3) / 2,
      child: Container(
        height: 270,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      food.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          food.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '₱${food.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  cartProvider.addToCart(food);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${food.name} added to cart')),
                  );
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

