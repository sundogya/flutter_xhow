import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'tapbar.dart';
import 'form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _ipAddress = 'Unknown';
  var _someThing = {};

  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        result = data['origin'];
      } else {
        result =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }
  _getResponse() async{
    Dio dio = new Dio(); // with default Options

    // Set default configs
    dio.options.baseUrl="https://www.itell.club/api";
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout=3000;
    Response response;
    var result;
    response = await dio.request(
      "/getExpressInfo",
      data:{
        "comCode":"JD",
        "expressNum":"83270675077",
      },
      options:new Options(
        method: "POST",
        contentType: ContentType.parse("application/json")
      )
    );
    if (response.statusCode == HttpStatus.ok) {
        var temp = json.decode(response.data);
        if(temp["errorCode"] == 0){
            result = temp["body"];
        }else{
          result = temp["msg"];
        }
    } else {
      result =
      'Error getting express info :\nHttp status ${response.statusCode}';
    }
    if (!mounted) return;
    print(result["Traces"]);
    setState(() {
      _someThing = result;
    });
  }
  void _toTapBar(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TabbedAppBarSample()),
    );
  }
  void _toForm(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyForm()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);
    return new Scaffold(
      appBar: AppBar(
        title: Text('Http Test'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.airplay), onPressed: _toTapBar)
        ],
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            new Text('Some response is:'),
            new Text('$_someThing.'),
            spacer,
            new RaisedButton(
              onPressed: _getIPAddress,
              child: new Text('Get IP address')
            ),
            new RaisedButton(
                onPressed: _getResponse,
                child: new Text('Get something')
            ),
            new IconButton(icon: const Icon(Icons.assignment), onPressed: _toForm),
          ],
        ),
      ),
    );
  }
}
