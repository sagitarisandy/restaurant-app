import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_dicoding/custom-widget/platform_widget.dart';

class ProfilePage extends StatelessWidget{
  const ProfilePage({Key? key}) : super (key: key);

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
            Text('Profile Menu Here')
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
            Text('Profile Menu Here')
          ],
        ),
      )
    );
  }
}