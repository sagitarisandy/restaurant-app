import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_dicoding/custom-widget/custom_scaffold.dart';
import 'package:restaurant_dicoding/theme/styles.dart';
import 'package:restaurant_dicoding/ui/menu/list_menu.dart';
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
      restaurant: restaurant,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: restaurant.pictureId,
                  child: Image.network(restaurant.pictureId),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 24.0, left: 24.0, top: 230.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4.0,
                            offset: Offset( 0, 4 ),
                            spreadRadius: 2.0
                          )
                        ]
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 16.0),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.verified,
                                  color: primaryColor,
                                ),
                                SizedBox(width: 6.0),
                                Text(
                                  'Verfied Store',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal
                                  ),
                                )
                              ],
                            ),
                          ),
                          RestaurantDescription(description: restaurant.description,),
                          SizedBox(height: 16.0),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
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
                          ),
                          SizedBox(height: 16.0),
                        ],
                      )
                    ),
                  ]
                ),
              ],
            ),
            
            SizedBox(height: 24.0),

            Column(
              children: [
                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 16.0),
                    Icon(
                      Icons.schedule,
                      color: myPrimarySwatch,
                      size: 28,
                    ),
                    SizedBox(width: 12.0),
                    Text(
                      'Delivery order: ${restaurant.rating.toString()} min',
                      style: const TextStyle(
                        color: darkPrimaryColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 16
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12),
                  child: Divider(
                    color: abuAbuMuda2,
                    thickness: 1.0,
                  ),
                ),
                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 16.0),
                    Icon(
                      Icons.group_add_outlined,
                      color: myPrimarySwatch,
                      size: 28,
                    ),
                    SizedBox(width: 12.0),
                    Text(
                      'Group Order',
                      style: const TextStyle(
                        color: darkPrimaryColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 16
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
                Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Divider(
                    color: abuAbuMuda2,
                    thickness: 1.0,
                  ),
                ),

                SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 16.0),
                    Icon(
                      Icons.confirmation_num_outlined,
                      color: primaryColor,
                      size: 28,
                    ),
                    SizedBox(width: 12.0),
                    Expanded(
                      child: Text(
                        '15% off coupon - minimum spend \$12',
                        style: const TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 16
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Expanded(child: Container()),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: primaryColor,
                      size: 16,
                    ),
                    SizedBox(width: 16.0),
                  ],
                ),
                SizedBox(height: 12.0),
                Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Divider(
                    color: abuAbuMuda2,
                    thickness: 1.0,
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 24.0),
            

            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: Column(
                children: [
                  // Container(
                  //   padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                  //   child: Divider(
                  //     color: abuAbuMuda2,
                  //     thickness: 1.0,
                  //   ),
                  // ),
                  SizedBox(height: 24.0),
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
                              'assets/menu-icon/drinks.svg',
                              height: 38.0,
                              width: 38.0,
                            ),
                          ),
                          Text(
                            'Drinks',
                            style: TextStyle(
                              fontSize: 20,
                              color: hitam,
                            ),  
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                ],
              )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: restaurant.menus.drinks.map((drink) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)
                  ),
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/others/no_image.svg',
                              height: 80,
                              width: 80,
                            ),
                            const SizedBox(width: 18.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  drink.name,
                                  style: TextStyle(
                                    color: darkPrimaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                SizedBox(height: 6.0),
                                Text(
                                  '\$${restaurant.rating}',
                                  style: TextStyle(
                                    color: darkPrimaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(22.0)
                          ),
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList()
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                    child: Divider(
                      color: abuAbuMuda2,
                      thickness: 1.0,
                    ),
                  ),
                  SizedBox(height: 24.0),
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
                              'assets/menu-icon/fry.svg',
                              height: 38.0,
                              width: 38.0,
                            ),
                          ),
                          Text(
                            'Foods',
                            style: TextStyle(
                              fontSize: 20,
                              color: hitam,
                            ),  
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                ],
              )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: restaurant.menus.foods.map((food) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)
                  ),
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/others/no_image.svg',
                                height: 80,
                                width: 80,
                              ),
                              const SizedBox(width: 18.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      food.name,
                                      style: TextStyle(
                                        color: darkPrimaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    SizedBox(height: 6.0),
                                    Text(
                                      '\$${restaurant.rating}',
                                      style: TextStyle(
                                        color: darkPrimaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(22.0)
                          ),
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList()
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantDescription extends StatefulWidget{
  final String description;

  RestaurantDescription({required this.description});

  @override
  _RestaurantDescriptionState createState() => _RestaurantDescriptionState();
}

class _RestaurantDescriptionState extends State<RestaurantDescription>{
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                color: darkPrimaryColor,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: _isExpanded
                      ? widget.description
                      : (widget.description.length > 100
                          ? '${widget.description.substring(0, 100)}...'
                          : widget.description),
                ),
                if (! _isExpanded && widget.description.length > 100)
                  TextSpan(
                    text: ' Read More',
                    style: TextStyle(color: primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          _isExpanded = true;
                        });
                      },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}