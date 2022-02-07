import 'package:ecommerce/bottom_nav_pages/added_to_cart.dart';
import 'package:ecommerce/bottom_nav_pages/favourite.dart';
import 'package:ecommerce/bottom_nav_pages/home.dart';
import 'package:ecommerce/bottom_nav_pages/profile.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 1;
  List<Widget> screens = [
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: "Favourite",
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: "Cart",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Person",
              backgroundColor: Colors.yellowAccent),
        ],
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
