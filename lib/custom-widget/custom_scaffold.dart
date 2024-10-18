import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_dicoding/theme/styles.dart';
import 'package:restaurant_dicoding/ui/menu/menu.dart';
import 'dart:io';
import 'package:badges/badges.dart' as badges;

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Restaurant restaurant;

  const CustomScaffold({
    Key? key,
    required this.body,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
    ?Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                restaurant.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
              ),
            ),
            IconButton(
              onPressed: () {

              },
              icon: badges.Badge(
                badgeContent: Text(
                  '5',
                  style: const TextStyle(
                    color: darkPrimaryColor
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: secondaryColor
                ),
              ),
            )
          ],
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: body,
      ),
    ):CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: primaryColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        middle: Text(
          restaurant.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17
          ),
        ),
      ),
      child: SafeArea(
        child: body,
      ),
    );
  }
}
