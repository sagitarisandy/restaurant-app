import 'package:flutter/material.dart';
import 'package:restaurant_dicoding/ui/menu/detail_menu.dart';
import 'package:restaurant_dicoding/ui/menu/menu.dart';

class ListMenu extends StatelessWidget{
  const ListMenu({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMenuList(context)
    );
  }

  Widget _buildMenuList(BuildContext context) {
    return FutureBuilder <String>(
      future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }else if(snapshot.hasError) {
          return const Center(child: Text('Failed to load menu'),);
        }

        if (snapshot.hasData){
          final MenuMakanan menuMakanan = parseMenuMakanan(snapshot.data!);

          return ListView.builder(
            itemCount: menuMakanan.restaurants.length,
            itemBuilder: (context, index) {
              return _buildMenuItem(context, menuMakanan.restaurants[index]);
            },
          );
        }else {
          return const Center(child: Text('no menu data available'));
        }

      }
    );
  }

  Widget _buildMenuItem(BuildContext context, Restaurant restaurant) {
    return Material(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Image.network(
          restaurant.pictureId,
          width: 100,
          errorBuilder: (context, error, _) => const Icon(Icons.error),
        ),
        title: Text(restaurant.name),
        subtitle: Text('Rating: ${restaurant.rating.toString()} - ${restaurant.city}'),
        onTap: () {
          Navigator.pushNamed(context, DetailMenuPage.routeName,
            arguments: restaurant
          );
        },
      ),
    );
  }
}