import 'package:flutter/material.dart';
import 'package:qr_reader/qr_reader.dart';

import './myFind.dart';
import './myHome.dart';
import './myOwn.dart';

void main() => runApp(new myApp());

Future<String> _qrScan() async {
  return new QRCodeReader().scan();
}

class myApp extends StatefulWidget {
  myApp({Key key}) : super(key: key);

  @override
  _myApp createState() => _myApp();
}

class _myApp extends State<myApp> {
  var _title = [
    'Send',
    'Find',
    'Mine',
  ];
  final List<String> _tabValues = [
    'Send',
    'Find',
    'Mine',
  ];
  TabController _tabController;

//  List<String> _Titles = _title.map((i) => _title.fromJson(i)).toList();
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: ScrollableState());
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Xhow Test',
      home: Scaffold(
//        appBar:  PreferredSize(child: myAppBar(barTitle:'Navication'), preferredSize:Size.fromHeight(50.0)),
//        body: Center(
//          child: postExample(post: fetchPost('https://www.itell.club/api/getExpressInfo?expressNum=83270675077&comCode=JD')),
//        ),
        body: new TabBarView(controller: _tabController, children: <Widget>[
          myHome(),
          myFind(),
          myOwn(),
//          postExample(
//              post: fetchPost(
//                  'https://www.itell.club/api/getExpressInfo?expressNum=83270675077&comCode=JD')),
//        ]),
        ]),
        bottomNavigationBar: new Material(
          color: Colors.lightBlue,
          child: new TabBar(
            controller: _tabController,
            tabs: <Tab>[
              new Tab(text: "Send", icon: new Icon(Icons.send)),
              new Tab(text: "Find", icon: new Icon(Icons.find_in_page)),
              new Tab(text: "Mine", icon: new Icon(Icons.person)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _qrScan,
          label: Text('Scan'),
          icon: Icon(Icons.camera_alt),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
