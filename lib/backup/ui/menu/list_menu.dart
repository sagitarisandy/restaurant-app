import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_dicoding/custom-widget/platform_widget.dart';
import 'package:restaurant_dicoding/theme/styles.dart';

class ListMenu extends StatelessWidget{
  const ListMenu({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Profile Page Here')
          ],
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Profile Page Here', style: TextStyle(color: secondaryColor))
          ],
        ),
      )
    );
  }
}