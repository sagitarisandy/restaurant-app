import 'package:flutter/material.dart';

class YourOrderPage extends StatelessWidget{
  const YourOrderPage({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your Promo Here')
          ],
        ),
      ),
    );
  }
}