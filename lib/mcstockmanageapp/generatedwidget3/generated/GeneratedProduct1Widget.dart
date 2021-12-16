import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as convert;

import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/GeneratedRectangle5Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/GeneratedPUDWidget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/GeneratedRectangle4Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/Generated06160MKK305Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/GeneratedAssignmentWidget.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/GeneratedLine2Widget.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .post(Uri.parse('http://119.63.90.135:9090/product'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(<String, String>{
        'operation': 'get_products'
      })
      );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Album.fromJson(convert.jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    this.userId,
    this.id,
    this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
class GeneratedProduct1Widget extends StatefulWidget {
    const GeneratedProduct1Widget({Key key}) : super(key: key);

  @override
  _GeneratedProduct1WidgetState createState() => _GeneratedProduct1WidgetState();
}

class _GeneratedProduct1WidgetState extends State<GeneratedProduct1Widget> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
}
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      color: Colors.white,
      child: FutureBuilder<Album>(
        future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('Title: ' + snapshot.data.title + 'Id: ' +snapshot.data.id.toString() + 'User Id: ' + snapshot.data.userId.toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
      )
    );
  }
}