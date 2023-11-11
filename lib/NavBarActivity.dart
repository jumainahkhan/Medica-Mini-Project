import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medica/Controller/nav_bar_controller.dart';
import 'package:medica/Screens/CategoriesScreen/CategoriesScreen.dart';
import 'package:medica/Screens/HomeScreen/HomeScreen.dart';
import 'package:medica/Screens/ProfileScreen/ProfileScreen.dart';
import 'package:medica/Screens/ScanScreen/ScanScreen.dart';
import 'package:provider/provider.dart';

class NavBarActivity extends StatefulWidget {
  const NavBarActivity({super.key});

  @override
  State<NavBarActivity> createState() => _NavBarActivityState();
}

class _NavBarActivityState extends State<NavBarActivity> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CategoriesScreen(),
    ScanScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarController>(
        builder: (context, navBarController, child) {
      return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(navBarController.selectedIndex),
        ),
        bottomNavigationBar: Container(
          color: HexColor('#f0f2f0'),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: GNav(
              selectedIndex: navBarController.selectedIndex,
              onTabChange: (index) {
                setState(() {
                  navBarController.changeIndex(index);
                });
              },

              activeColor: Colors.white,
              backgroundColor: HexColor('#f0f2f0'),
              color: Colors.black,
              // activeColor: HexColor('#499FA4'),
              tabBackgroundColor: HexColor('#6d69f0'),
              // gap: 2,
              padding: const EdgeInsets.all(13),
              // tabBorder: Border.symmetric(horizontal: BorderSide.merge(a, b)),
              tabBorderRadius: 21,
              tabs: const [
                GButton(
                  icon: CupertinoIcons.home,
                  // text: 'Home',
                ),
                GButton(
                  icon: CupertinoIcons.doc_fill,
                  // text: 'Scan',
                ),
                GButton(
                  icon: CupertinoIcons.viewfinder,
                  // text: 'Search',
                ),
                GButton(
                  icon: CupertinoIcons.profile_circled,
                  // text: 'Profile',
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
