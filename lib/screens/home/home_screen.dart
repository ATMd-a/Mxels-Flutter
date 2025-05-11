
import 'package:flutter/material.dart';
import 'package:hlep/screens/cart/cart_screen.dart';
import 'package:provider/provider.dart';
import 'package:hlep/screens/home/restaurant.dart';
import 'package:hlep/providers/selection_provider.dart';
import 'package:hlep/data/resto_menu_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => SelectionProvider(),
        child: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaurantKeys = RestaurantMenuData.restoMenus.keys.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.location_on, color: Colors.black),
            const SizedBox(width: 5),
            const Expanded(
              child: Text(
                "123 Sample St.",
                style: TextStyle(color: Colors.black, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.black),
              onPressed: () {
                // Navigate to profile screen (future implementation)
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              width: double.infinity,
              height: 150,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage('https://via.placeholder.com/400x150'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Popular Restaurants
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Popular Restaurants",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            // Changed to GridView for small squares layout
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Adjusted for more columns
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1, // Square aspect ratio
              ),
              itemCount: restaurantKeys.length,
              itemBuilder: (context, index) {
                final restoKey = restaurantKeys[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RestaurantScreen(
                          restaurantKey: restoKey,
                          restaurantIndex: index,
                          initialRestaurantIndex: index,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        restoKey,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // Favorites Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Customers Combo Favorites",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 3 / 4,
              ),
              itemCount: 6, // Replace this with favorite items count if available
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.asset(
                            'assets/mang_dessert.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Food Item ${index + 1}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
