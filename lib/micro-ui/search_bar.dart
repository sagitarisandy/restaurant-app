import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_dicoding/theme/styles.dart';
import 'package:restaurant_dicoding/ui/message/message.dart';

class SearchBarIos extends StatelessWidget {
  const SearchBarIos({
    super.key,
    required FocusNode focusNode,
  }) : _focusNode = focusNode;

  final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      focusNode: _focusNode,
      placeholder: 'Search Restaurant or foods..',
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      prefix: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(
          CupertinoIcons.search,
          color: CupertinoColors.systemGrey,
        ),
      ),
      style: TextStyle(
        color: CupertinoColors.black,
      ),
    );
  }
}

class SearchBarAndroid extends StatelessWidget {
  const SearchBarAndroid({
    super.key,
    required FocusNode focusNode,
    required this.orderCount,
  }) : _focusNode = focusNode;

  final FocusNode _focusNode;
  final int orderCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: 'Search Restaurant or foods..',
                      // icon: Icon(Icons.shopping_cart, color: Colors.white),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                      border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0), // Membuat sudut rounded
                            borderSide: BorderSide.none, // Menghilangkan border default
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0), // Membuat sudut rounded
                            borderSide: BorderSide.none, // Menghilangkan border default
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0), // Membuat sudut rounded
                            borderSide: BorderSide.none, // Menghilangkan border default
                          ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.qr_code_scanner,
                        color: Colors.black54,
                      )
                    ),
                  ),
            ),
            SizedBox(width: 8.0),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    
                  },
                  icon: badges.Badge(
                    badgeContent: Text(
                      orderCount.toString(),
                      style: const TextStyle(color: darkPrimaryColor),
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: secondaryColor
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -8), // Menggeser teks ke atas
                  child: Text(
                    '\$17,43',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            )
          ],
        ),
        Divider(color: Colors.white38),
        SizedBox(height: 2.0),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MessagePage())
            );
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SvgPicture.asset(
                  'assets/others/location.svg',
                  height: 28.0,
                  width: 28.0,
                  // color: Colors.white,
                ),
              ),
              SizedBox(width: 4.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jl. Kesehatan, No. 13, RT/RW 004 012, Serpong Selat..',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.normal
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16.0,
                    )
                  ],
                )
              ),
            ]
          )
        )
      ]
    );
  }
}