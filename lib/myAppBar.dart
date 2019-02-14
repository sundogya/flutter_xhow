import 'package:flutter/material.dart';
class myAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  AppBar(
        leading: IconButton(
          icon: Icon(Icons.all_inclusive),
          color: Colors.deepOrange,
        ),
        title: Center(
          child: Text(
            'Xhow Test',
            textAlign: TextAlign.center,
            style:TextStyle(
              fontSize: 18.0,
              fontFamily: 'Microsoft Yahei',
              fontWeight: FontWeight.bold,
              color: Colors.lightGreenAccent,
            ),
          ),
        ),
    );
  }
}