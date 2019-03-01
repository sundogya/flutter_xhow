import 'package:flutter/material.dart';

import './myAppBar.dart';

class myOwn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
          child: myAppBar(barTitle: 'Mine'),
          preferredSize: Size.fromHeight(50.0)),
      body: ListView(
        children: <Widget>[
          myOwnTop(),
        ],
      ),
    );
  }
}

class myOwnTop extends StatefulWidget {
  myOwnTop({Key key}) : super(key: key);

  @override
  _myOwnTop createState() => _myOwnTop();
}

class _myOwnTop extends State<myOwnTop> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        width: 100.0,
        height: 100.0,
        margin:EdgeInsets.all(10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Colors.white,
              width: 1.0
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.5, 0.5),
                blurRadius: 2.0,
                spreadRadius: 1.0
            ),
            BoxShadow(
                color: Colors.white,
                offset: Offset(0.5, 0.5),
                blurRadius: 2.0,
                spreadRadius: 1.0
            ),
          ],
        ),
        child: Text('nihao'),
      ),
    );
  }
}