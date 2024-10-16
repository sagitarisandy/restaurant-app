import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_dicoding/custom-widget/platform_widget.dart';
import 'package:restaurant_dicoding/theme/styles.dart';
import 'package:restaurant_dicoding/ui/menu/list_menu.dart';
import 'package:restaurant_dicoding/ui/profile/profile.dart';
import 'dart:io';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget{
  static const routeName = '/';
  const HomePage ({Key? key}) : super (key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  int _selectedIndex = 0;
  int orderCount = 5;
  late List<BottomNavigationBarItem> _bottomNavBarItems;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _bottomNavIndex == 0 ? ListMenu() : ProfilePage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondaryColor,
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: (selected) {
          setState(() {
            _bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: secondaryColor,
        items: _bottomNavBarItems,
      ),
      tabBuilder:(context, index) {
        switch (index) {
          case 1:
            return ListMenu();
          default:
            return ProfilePage();
        }
      },
    );
  }

  void initState() {
    super.initState();
    _bottomNavBarItems = [
      BottomNavigationBarItem(
        icon: Icon(Platform.isIOS ? CupertinoIcons.home : Icons.home),
        label: 'Home'
      ),
      BottomNavigationBarItem(
        icon: badges.Badge(
          badgeContent: Text(orderCount.toString(), style: TextStyle(color: Colors.white)),
          child: Icon(Platform.isIOS ? CupertinoIcons.shopping_cart : Icons.shopping_cart)
        ),
        label: 'Your Order'
      ),
      BottomNavigationBarItem(
        icon: Icon(Platform.isIOS ? CupertinoIcons.person : Icons.person),
        label: 'Profile'
      ),
    ];
  }

}