import 'package:flutter/material.dart';

import './myAppBar.dart';

class myHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
            child: myAppBar(barTitle: 'Home'),
            preferredSize: Size.fromHeight(50.0)),
        body: Text(
          'This is home',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.lightGreen,
          ),
        ));
  }
}
