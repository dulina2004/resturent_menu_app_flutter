import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Resturent Home Page'),
    );
  }
}


// Models
class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}

class FoodItem {
  final String id;
  final String name;
  final String image;
  final double price;
  final double rating;
  final String description;

  FoodItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
  });
}

// Sample Data
final List<Category> categories = [
  Category(name: 'All', icon: Icons.restaurant_menu),
  Category(name: 'Pizza', icon: Icons.local_pizza),
  Category(name: 'Burgers', icon: Icons.lunch_dining),
  Category(name: 'Desserts', icon: Icons.cake),
  Category(name: 'Drinks', icon: Icons.local_drink),
];

final List<FoodItem> foodItems = [
  FoodItem(
    id: '1',
    name: 'Margherita Pizza',
    image: 'assets/pizza.jpg',
    price: 12.99,
    rating: 4.5,
    description: 'Classic Italian pizza with tomato sauce, mozzarella, and basil.',
  ),
  // Add more food items here
];


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),  // Adjust the value as needed
            topRight: Radius.circular(50),  // Adjust the value as needed
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
          child: GNav(
            backgroundColor: Colors.transparent,
            color: Colors.white,
            activeColor: Colors.white,
            tabBorderRadius: 15,
            gap: 8,
            padding: EdgeInsets.all(16),
            tabs:[
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.shopping_bag,
                text: 'Cart',

              ),
              GButton(
                icon: Icons.settings_accessibility_rounded,
                text: 'Settings',
              ),

            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: 20,
              ),
              //UserDetail
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Container(
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                "https://picsum.photos/200/300/?blur"),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, User!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                          Text(
                            "Colombo",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notification_add,
                    color: Colors.white,
                    size: 35,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //searchbar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 30,
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    hintText: 'Search...',
                                    hintStyle: TextStyle(color: Colors.grey[400]),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.search_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              //Image Gallery
              Container(
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the radius as needed
                        child: Image.network(
                          'https://picsum.photos/200/300?grayscale',
                          height: 100,
                          width: 300,
                          fit: BoxFit
                              .cover, // Ensures the image fills the specified width and height
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the radius as needed
                        child: Image.network(
                          'https://picsum.photos/200/300?grayscale',
                          height: 100,
                          width: 300,
                          fit: BoxFit
                              .cover, // Ensures the image fills the specified width and height
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the radius as needed
                        child: Image.network(
                          'https://picsum.photos/200/300?grayscale',
                          height: 100,
                          width: 300,
                          fit: BoxFit
                              .cover, // Ensures the image fills the specified width and height
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the radius as needed
                        child: Image.network(
                          'https://picsum.photos/200/300?grayscale',
                          height: 100,
                          width: 300,
                          fit: BoxFit
                              .cover, // Ensures the image fills the specified width and height
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "MENU",
                      style: TextStyle(
                          color: Colors.grey[400]
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            "SORT BY",
                            style: TextStyle(
                                color: Colors.grey[400]
                            ),

                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.sort_rounded,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              //menu list
              Container(
                height: 50,
                margin: const EdgeInsets.all(10.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // Example button with underline
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            // Define your action here
                          },
                          child: Text(
                            "Frequent order",
                            style: TextStyle(
                                color: Colors.white, // Text color
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                        Container(
                          height: 2, // Thickness of the underline
                          width: 30, // Width of the underline
                          color: Colors.red, // Color of the underline
                        ),
                      ],
                    ),

                    // Other buttons without underline
                    TextButton(
                      onPressed: () {
                        // Define your action here
                      },
                      child: Text(
                        "Veg",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        // Define your action here
                      },
                      child: Text(
                        "Fish",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        // Define your action here
                      },
                      child: Text(
                        "Egg",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        // Define your action here
                      },
                      child: Text(
                        "Chicken",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Define your action here
                      },
                      child: Text(
                        "Biriyani",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Define your action here
                      },
                      child: Text(
                        "Kottu",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Define your action here
                      },
                      child: Text(
                        "Fride Rice",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),

                    // Add more buttons as needed
                  ],
                ),
              ),
              //Food Gallery


            ],
          ),
        ),
      ),

    );
  }
}
