import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_dicoding/custom-widget/custom_app_bar.dart';
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
        toolbarHeight: 120.0,
        backgroundColor: primaryColor,
        title: SearchBarUi(focusNode: _focusNode, orderCount: orderCount),
      ),
      body: _buildBody(context)
    ):CupertinoPageScaffold(
      child: Column(
        children: [
          CustomAppBar(focusNode: _focusNode, orderCount: orderCount, primaryColor: primaryColor),
          Expanded(child: _buildBody(context))
        ],
      ),
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
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 115,
                height: 46,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor
                  ),
                  borderRadius: BorderRadius.circular(22.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          'assets/menu-icon/promo.svg',
                          height: 34.0,
                          width: 34.0,
                        ),
                      ),
                      SizedBox(width: 6),
                      Container(
                        child: Text(
                          'Promo',
                          style: TextStyle(
                            fontSize: 16,
                            color: hitam
                          ),
                        )
                      ),
                    ],
                  ),
                )
              ),
              Container(
                width: 115,
                height: 46,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor
                  ),
                  borderRadius: BorderRadius.circular(22.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          'assets/menu-icon/popular.svg',
                          height: 34.0,
                          width: 34.0,
                        ),
                      ),
                      SizedBox(width: 6),
                      Container(
                        child: Text(
                          'Popular',
                          style: TextStyle(
                            fontSize: 16,
                            color: hitam
                          ),
                        )
                      ),
                    ],
                  ),
                )
              ),
              Container(
                width: 115,
                height: 46,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryColor
                  ),
                  borderRadius: BorderRadius.circular(22.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          'assets/menu-icon/mart.svg',
                          height: 34.0,
                          width: 34.0,
                        ),
                      ),
                      SizedBox(width: 6),
                      Container(
                        child: Text(
                          'Mart',
                          style: TextStyle(
                            fontSize: 16,
                            color: hitam
                          ),
                        )
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        )
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 90,
                    height: 72,
                    // decoration: BoxDecoration(
                    //   border: Border.all(
                    //     color: primaryColor
                    //   ),
                    //   borderRadius: BorderRadius.circular(22.0)
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/menu-icon/fry.svg',
                              height: 42.0,
                              width: 42.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Container(
                            child: Text(
                              'Fry',
                              style: TextStyle(
                                fontSize: 14,
                                color: hitam
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 72,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/menu-icon/boiled.svg',
                              height: 42.0,
                              width: 42.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Container(
                            child: Text(
                              'Boiled',
                              style: TextStyle(
                                fontSize: 14,
                                color: hitam
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 72,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/menu-icon/24-hours.svg',
                              height: 42.0,
                              width: 42.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Container(
                            child: Text(
                              '24 Hours',
                              style: TextStyle(
                                fontSize: 14,
                                color: hitam
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 72,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/menu-icon/fast-food.svg',
                              height: 42.0,
                              width: 42.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Container(
                            child: Text(
                              'Fast Food',
                              style: TextStyle(
                                fontSize: 14,
                                color: hitam
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 18.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 90,
                    height: 72,
                    // decoration: BoxDecoration(
                    //   border: Border.all(
                    //     color: primaryColor
                    //   ),
                    //   borderRadius: BorderRadius.circular(22.0)
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/menu-icon/rice.svg',
                              height: 42.0,
                              width: 42.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Container(
                            child: Text(
                              'Rice',
                              style: TextStyle(
                                fontSize: 14,
                                color: hitam
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 72,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/menu-icon/noodles.svg',
                              height: 42.0,
                              width: 42.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Container(
                            child: Text(
                              'Noodles',
                              style: TextStyle(
                                fontSize: 14,
                                color: hitam
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 72,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/menu-icon/drinks.svg',
                              height: 42.0,
                              width: 42.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Container(
                            child: Text(
                              'Drinks',
                              style: TextStyle(
                                fontSize: 14,
                                color: hitam
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 72,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/menu-icon/snack.svg',
                              height: 42.0,
                              width: 42.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Container(
                            child: Text(
                              'Snacks',
                              style: TextStyle(
                                fontSize: 14,
                                color: hitam
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 18.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 90,
                    height: 72,
                    // decoration: BoxDecoration(
                    //   border: Border.all(
                    //     color: primaryColor
                    //   ),
                    //   borderRadius: BorderRadius.circular(22.0)
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/menu-icon/dish.svg',
                              height: 42.0,
                              width: 42.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Container(
                            child: Text(
                              'Dish',
                              style: TextStyle(
                                fontSize: 14,
                                color: hitam
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 72,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/menu-icon/cakes.svg',
                              height: 42.0,
                              width: 42.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Container(
                            child: Text(
                              'Cakes',
                              style: TextStyle(
                                fontSize: 14,
                                color: hitam
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 72,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/menu-icon/new.svg',
                              height: 42.0,
                              width: 42.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Container(
                            child: Text(
                              'New',
                              style: TextStyle(
                                fontSize: 14,
                                color: hitam
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 72,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/menu-icon/street-food.svg',
                              height: 42.0,
                              width: 42.0,
                            ),
                          ),
                          SizedBox(height: 2.0),
                          Container(
                            child: Text(
                              'Street Food',
                              style: TextStyle(
                                fontSize: 14,
                                color: hitam
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.0),
              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //     ),
              //   ),
              // )
            ],
          )
        ),
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
      SliverToBoxAdapter(
        child: SizedBox(height: 100.0)
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
                  Flexible(
                    child: Text(
                      restaurant.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
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
                    color: secondaryColor,
                    size: 20,
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
                    color: Color.fromARGB(255, 248, 92, 19),
                    size: 20,
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
