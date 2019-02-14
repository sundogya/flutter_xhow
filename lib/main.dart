import 'package:flutter/material.dart';
import 'myAppBar.dart';
import 'postExample.dart';
void main()=>runApp(new myApp());

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title:'Xhow Test',
      home: Scaffold(
        appBar:  PreferredSize(child: myAppBar(), preferredSize:Size.fromHeight(50.0),),
        body: Center(
          child: postExample(),
        ),
      ),
    );
  }
}
