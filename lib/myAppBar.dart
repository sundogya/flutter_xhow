import 'package:flutter/material.dart';



class myAppBar extends StatelessWidget{
  final String barTitle;
  myAppBar({Key key, this.barTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.all_inclusive),
//          color: Colors.deepOrange,
//        ),
        title: Center(
          child: Text(
            '$barTitle',
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