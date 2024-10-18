import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget{
  static const routeName = '/message';

  const MessagePage({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your Message Here')
          ],
        ),
      ),
    );
  }
}