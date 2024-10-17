import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_dicoding/theme/styles.dart';
import 'package:restaurant_dicoding/theme/text_theme.dart';
import 'package:restaurant_dicoding/ui/home.dart';
import 'package:restaurant_dicoding/ui/menu/detail_menu.dart';
import 'package:restaurant_dicoding/ui/menu/menu.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS 
      ?CupertinoApp(
        title: 'Dicoding Restaurant App',
        theme:  CupertinoThemeData(
          primaryColor: primaryColor,
          textTheme: CupertinoTextThemeData(
            primaryColor: primaryColor,
            textStyle: myTextTheme.bodyMedium,
          ),
          // barBackgroundColor: CupertinoColors.systemGrey
        ),
        initialRoute: '/',
        routes: {
          HomePage.routeName:(context) => HomePage(), 
        },
      )
    : MaterialApp(
        title: 'Dicoding Restaurant App',
        theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
            primary: primaryColor,
            secondary: secondaryColor
          ),
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: myTextTheme
        ),
        initialRoute: '/',
        routes: {
          HomePage.routeName:(context) => const HomePage(),
          DetailMenuPage.routeName:(context) => DetailMenuPage(
            restaurant: Restaurant(id: '', name: '', description: '', pictureId: '', city: '', rating: 0.0, menus: Menus(foods: [], drinks: [])),
          ),
        },
      );
  }
}