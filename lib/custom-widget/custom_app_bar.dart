import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_dicoding/micro-ui/search_bar.dart';

class CustomAppBar extends StatelessWidget{
  final FocusNode focusNode;
  final int orderCount;
  final Color primaryColor;

  const CustomAppBar({
    Key? key,
    required this.focusNode,
    required this.orderCount,
    required this.primaryColor
  }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 45, bottom: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: SearchBarUi(focusNode: focusNode, orderCount: orderCount),
      ),
    );
  }
}