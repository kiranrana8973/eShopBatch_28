import 'package:eshopping/screen/bottom_screen/cart.dart';
import 'package:eshopping/screen/bottom_screen/home.dart';
import 'package:eshopping/screen/bottom_screen/printbill.dart';
import 'package:eshopping/screen/bottom_screen/profile.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  List<Widget> lstWidget = [
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const PrintBillScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: lstWidget[_selectedIndex],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[200],
        onPressed: () {
          Navigator.pushNamed(context, '/addProduct');
        },
        child: const Icon(Icons.add_a_photo_rounded), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar(
        color: Colors.redAccent,
        elevation: 5,
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin:
            5, //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.shopping_bag_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.people,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.print,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

//  bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_basket),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.verified_user),
//             label: 'Profile',
//           ),
//         ],
//         backgroundColor: Colors.amber[200],
//         currentIndex: _selectedIndex,
//         unselectedItemColor: Colors.grey,
//         elevation: 10,
//         onTap: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//       ),
