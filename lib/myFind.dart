import 'package:flutter/material.dart';

import './myAppBar.dart';

class myFind extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
            child: myAppBar(barTitle: 'Find'),
            preferredSize: Size.fromHeight(50.0)),
        body: Text(
          'This is Find',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.lightGreen,
          ),
        ));
  }
}
