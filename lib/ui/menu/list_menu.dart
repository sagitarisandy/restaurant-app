import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_dicoding/micro-ui/search_bar.dart';
import 'package:restaurant_dicoding/theme/styles.dart';
import 'package:restaurant_dicoding/ui/menu/detail_menu.dart';
import 'package:restaurant_dicoding/ui/menu/menu.dart';
import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';

class ListMenu extends StatelessWidget{

  final List<String> carouselImages = [
    'https://restaurant-api.dicoding.dev/images/medium/14',
    'https://restaurant-api.dicoding.dev/images/medium/25',
    'https://restaurant-api.dicoding.dev/images/medium/03',
  ];

  int orderCount = 5;
  final FocusNode _focusNode = FocusNode();
  
  ListMenu({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
    ?Scaffold(
      appBar: AppBar(
        toolbarHeight: 130.0,
        backgroundColor: primaryColor,
        title: SearchBarAndroid(focusNode: _focusNode, orderCount: orderCount),
      ),
      body: _buildBody(context)
    ):CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: primaryColor,
        middle: Container(
          height: 200,
          alignment: Alignment.center,
          child: SearchBarIos(focusNode: _focusNode),
        ),
      ),
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
  return CustomScrollView(
    slivers: [
      SliverToBoxAdapter(
        child: SizedBox(height: 24.0)
      ),
      SliverToBoxAdapter(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 170.0,
            autoPlay: true,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
          ),
          items: carouselImages.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22.0),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
      SliverToBoxAdapter(
        child: SizedBox(height: 24.0),
      ),
      SliverToBoxAdapter(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Divider(
                    color: abuAbuMuda2,
                    thickness: 1.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 16.0,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SvgPicture.asset(
                            'assets/others/restaurant.svg',
                            height: 38.0,
                            width: 38.0,
                          ),
                        ),
                        Text(
                          'Restaurants Near You',
                          style: TextStyle(
                            fontSize: 20,
                            color: hitam,
                          ),  
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: hitam,
                      size: 16,
                    ),
                    SizedBox(width: 16.0,),
                  ],
                ),
              ],
            )
          )
        )
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return FutureBuilder<String>(
              future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Failed to load menu'));
                }

                if (snapshot.hasData) {
                  final MenuMakanan menuMakanan = parseMenuMakanan(snapshot.data!);
                  if (index < menuMakanan.restaurants.length) {
                    return _buildMenuItem(context, menuMakanan.restaurants[index]);
                  } else {
                    return const SizedBox.shrink();
                  }
                } else {
                  return const Center(child: Text('No menu data available'));
                }
              },
            );
          },
          childCount: 100,
        ),
      ),
    ],
  );
}

  Widget _buildMenuItem(BuildContext context, Restaurant restaurant) {
  return Material(
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailMenuPage.routeName, arguments: restaurant);
      },
      child: Card(
        key: ValueKey(restaurant.id),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0)
        ),
        color: Colors.white,
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: restaurant.pictureId,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    restaurant.pictureId,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, _) => const Icon(Icons.error),
                  ),
                )
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(
                    Icons.verified,
                    color: primaryColor,
                    size: 20,
                  ),
                  SizedBox(width: 6),
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    '(\$ ${restaurant.rating} - \$5.7)',
                    style: TextStyle(
                      color: myPrimarySwatch,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: secondaryColor
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    'Rating: ${restaurant.rating.toString()}',
                    style: const TextStyle(
                      color: myPrimarySwatch,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    '(482+)',
                    style: const TextStyle(
                      color: myPrimarySwatch,
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    '-',
                    style: const TextStyle(
                      color: myPrimarySwatch,
                    ),
                  ),
                  SizedBox(width: 4.0),
                  Icon(
                    Icons.location_on,
                    color: primaryColor
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    restaurant.city,
                    style: const TextStyle(
                      color: myPrimarySwatch,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    )
  );
}
}
