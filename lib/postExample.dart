import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './dataStruct.dart';

Future<Post> fetchPost(String url) async {
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to get express info');
  }
}



class postExample extends StatelessWidget {
  final Future<Post> post;

  postExample({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 1000.0,
      height: 1000.0,
      margin: EdgeInsets.all(0.0),
      padding: EdgeInsets.all(10.0),
      child: FutureBuilder<Post>(
        future: post,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.body.Traces.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  '${snapshot.data.body.Traces[index].AcceptStation}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepOrange,
                    textBaseline: TextBaseline.alphabetic,
                    fontSize: 16.0,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner
          return CircularProgressIndicator();
        },
      ),
    ));
  }
}
