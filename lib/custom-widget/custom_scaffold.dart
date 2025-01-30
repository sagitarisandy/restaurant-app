import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_dicoding/theme/styles.dart';
import 'package:restaurant_dicoding/ui/menu/menu.dart';
import 'dart:io';
import 'package:badges/badges.dart' as badges;
import 'package:lottie/lottie.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;
  final Restaurant restaurant;

  const CustomScaffold({
    Key? key,
    required this.body,
    required this.restaurant,
  }) : super(key: key);

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  bool _isLiked = false;
  bool _isAnimating = false;

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
                widget.restaurant.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if(!_isAnimating) {
                  setState(() {
                    _isAnimating = true;
                  });
                  Future.delayed(Duration(seconds: 1),() {
                    setState(() {
                      _isLiked = true;
                      _isAnimating = false;
                    });
                  });
                }
              },
              icon: _isLiked
                ? Container(
                  height: 60,
                  width: 60,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  ) 
                : (_isAnimating
                  ? Lottie.asset(
                    'assets/others/love2.json',
                    width: 60,
                    height: 60
                    )
                  : Container(
                    height: 60,
                    width: 60,
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                      )
                  ) 
                  )
              // Icon(
              //   Icons.favorite,
              //   color: Colors.white,
              //   ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: widget.body,
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
          widget.restaurant.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            if(!_isAnimating) {
              setState(() {
                _isAnimating = true;
              });
              Future.delayed(Duration(seconds: 2), (){
                setState(() {
                  _isLiked = true;
                  _isAnimating = false;
                });
              });
            }
          },
          icon: _isLiked
            ? Container(
              height: 30,
              width: 30,
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            )
            : (_isAnimating
            ? Lottie.asset(
              'assets/others/love2.json',
              width: 40,
              height: 40
            )
            : Container(
              height: 30,
              width: 30,
              child: Icon(
                Icons.favorite_outline,
                color: Colors.white,
              ),
            )
            )
        ),
      ),
      child: SafeArea(
        child: widget.body,
      ),
    );
  }
}
