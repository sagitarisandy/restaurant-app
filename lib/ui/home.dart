import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_dicoding/custom-widget/platform_widget.dart';
import 'package:restaurant_dicoding/theme/styles.dart';
import 'package:restaurant_dicoding/ui/menu/list_menu.dart';
import 'package:restaurant_dicoding/ui/message/message.dart';
import 'package:restaurant_dicoding/ui/profile/profile.dart';
import 'dart:io';
import 'package:badges/badges.dart' as badges;
import 'package:restaurant_dicoding/ui/your-order/your_order.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  int _selectedIndex = 0;
  int promoCount = 2;
  late List<BottomNavigationBarItem> _bottomNavBarItems;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> _bottomNavBarItems = [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          _selectedIndex == 0
              ? 'assets/navbar-icon/foods.svg'
              : 'assets/navbar-icon/foods_inactive.svg',
          width: 32,
          height: 32,
        ),
      ),
      BottomNavigationBarItem(
        icon: badges.Badge(
          badgeContent: Text(
            promoCount.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: SvgPicture.asset(
            _selectedIndex == 1
                ? 'assets/navbar-icon/promo.svg'
                : 'assets/navbar-icon/promo_inactive.svg',
            width: 32,
            height: 32,
          ),
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          _selectedIndex == 2
              ? 'assets/navbar-icon/activity.svg'
              : 'assets/navbar-icon/activity_inactive.svg',
          width: 32,
          height: 32,
        ),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          _selectedIndex == 3
              ? 'assets/navbar-icon/message.svg'
              : 'assets/navbar-icon/message_inactive.svg',
          width: 32,
          height: 32,
        ),
      ),
    ];

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: primaryColor,
        inactiveColor: abuAbu,
        currentIndex: _selectedIndex,
        items: _bottomNavBarItems,
        onTap: _onItemTapped,
        height: 60,
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return ListMenu();
          case 1:
            return YourOrderPage();
          case 2:
            return ProfilePage();
          case 3:
            return MessagePage();
          default:
            return MessagePage();
        }
      },
    );
  }
}
