import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_dicoding/theme/styles.dart';
import 'package:restaurant_dicoding/ui/message/message.dart';

class SearchBarUi extends StatelessWidget {
  const SearchBarUi({
    Key? key,
    required this.focusNode,
    required this.orderCount,
  }) : super(key: key);

  final FocusNode focusNode;
  final int orderCount;

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Platform.isIOS
                    ? CupertinoTextField(
                        focusNode: focusNode,
                        placeholder: 'Search Restaurant or foods..',
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
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
                        suffix: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            CupertinoIcons.qrcode,
                            color: CupertinoColors.systemGrey,
                          ),
                        ),
                        style: TextStyle(
                          color: CupertinoColors.black,
                        ),
                      )
                    : TextField(
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        hintText: 'Search Restaurant or foods..',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
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
                            badgeColor: secondaryColor,
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(0, -8), 
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
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Expanded(
                          child: Text(
                            'Jl. Kesehatan, No. 13, RT/RW 004 012, Serpong Selatan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.normal
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                    ),
                    Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16.0,
                          ),
                  ],
                ),
              )
            ],
          );
  }
}
