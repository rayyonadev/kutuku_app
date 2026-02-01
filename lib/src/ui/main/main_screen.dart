import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kutuku/src/ui/main/favorite/favorite_screen.dart';
import 'package:kutuku/src/ui/main/home/home_screen.dart';
import 'package:kutuku/src/ui/main/order/order_screen.dart';
import 'package:kutuku/src/ui/main/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    HomeScreen(),
    MyOrderScreen(),
     FavoriteScreen(),
    EditProfileScreen()
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: GNav(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              gap: 8,
              activeColor: Colors.white,
              color: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),

              tabBackgroundColor: Colors.blue,

              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },

              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.directions_car,
                  text: 'My order',
                ),
                GButton(
                  icon: Icons.favorite_border_outlined,
                  text: 'Favorite',
                ),
                GButton(
                  icon: Icons.person_2_outlined,
                  text: 'My Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
