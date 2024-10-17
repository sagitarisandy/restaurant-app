import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_dicoding/custom-widget/custom_scaffold.dart';
import 'package:restaurant_dicoding/ui/menu/menu.dart';

class DetailMenuPage extends StatelessWidget{
  static const routeName = '/detail_menu';

  final Restaurant restaurant;

  const DetailMenuPage({
    Key? key,
    required this.restaurant
  }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    final Restaurant restaurant = ModalRoute.of(context)!.settings.arguments as Restaurant;

    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: Image.network(restaurant.pictureId),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.description),
                  Divider(color: Colors.grey),
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}