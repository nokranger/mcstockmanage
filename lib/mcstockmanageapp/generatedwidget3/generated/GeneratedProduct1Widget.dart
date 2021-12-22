import 'dart:convert';

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

Future<dynamic> fetchAlbum() async {
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
    // print(jsonDecode(response.body)["data"]);
    // print(Map<String, dynamic>.from(convert.jsonDecode(response.body)));
    // return Album.fromJson(Map<String, dynamic>.from(convert.jsonDecode(response.body)));
    // return Album.fromJson(Map<String, dynamic>.from(jsonDecode(response.body)['data']));
    return (jsonDecode(response.body)['data'] as List<dynamic>).map((e) {
        Album review = new Album.fromJson(Map<String, dynamic>.from(e));
        return review;
      }).toList();
    // List<Album> albums = [];
    // List<dynamic> albumsJson = convert.jsonDecode(response.body);
    //     albumsJson.forEach(
    //   (oneAlbum) {
    //     Album album = Album.fromJson(oneAlbum);
    //     albums.add(album);
    //   },
    // );
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

// class Album {
//   final Data datas;

//   Album({
//     this.datas
//   });

//   factory Album.fromJson(Map<String, dynamic> parsedJson) {
//     return Album(
//       datas: Data.fromJson(parsedJson['data']),
//     );
//   }
// }

class Album {
  final String productId;
  final String sku;
  final String productName;
  final String description;
  // final String groupId;
  // final String groupName;
  // final String shef;
  // final String godown;
  // final String price;
  // final String qty;
  // final String isActive;
  // final String isDelete;

  Album({
    this.productId,
    this.sku,
    this.productName,
    this.description,
    // this.groupId,
    // this.groupName,
    // this.shef,
    // this.godown,
    // this.price,
    // this.qty,
    // this.isActive,
    // this.isDelete
  });

  factory Album.fromJson(Map<String, dynamic> parsedJson) {
    return Album(
      productId: parsedJson['productId'] as String,
      sku: parsedJson['sku'] as String,
      productName: parsedJson['productName'] as String,
      description: parsedJson['description'] as String,
      // groupId: parsedJson['groupId'] as String,
      // groupName: parsedJson['groupName'] as String,
      // shef: parsedJson['shef'] as String,
      // godown: parsedJson['godown'] as String,
      // price: parsedJson['price'] as String,
      // qty: parsedJson['qty'] as String,
      // isActive: parsedJson['isActive'] as String,
      // isDelete: parsedJson['isDelete'] as String
    );
  }
}

// class Data {
//   final int productId;
//   final String sku;
//   final String productName;
//   final String description;
//   final int groupId;
//   final String groupName;
//   final String shef;
//   final String godown;
//   final double price;
//   final int qty;
//   final int isActive;
//   final int isDelete;

//   Data({
//     this.productId,
//     this.sku,
//     this.productName,
//     this.description,
//     this.groupId,
//     this.groupName,
//     this.shef,
//     this.godown,
//     this.price,
//     this.qty,
//     this.isActive,
//     this.isDelete
//   });

//     factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       productId: json['productId'],
//       sku: json['sku'],
//       productName: json['productName'],
//       description: json['description'],
//       groupId: json['groupId'],
//       groupName: json['groupName'],
//       shef: json['shef'],
//       godown: json['godown'],
//       price: json['price'],
//       qty: json['qty'],
//       isActive: json['isActive'],
//       isDelete: json['isDelete']
//     );
//   }
// }

class GeneratedProduct1Widget extends StatefulWidget {
    const GeneratedProduct1Widget({Key key}) : super(key: key);

  @override
  _GeneratedProduct1WidgetState createState() => _GeneratedProduct1WidgetState();
}

class _GeneratedProduct1WidgetState extends State<GeneratedProduct1Widget> {
  Future<dynamic> futureAlbum;

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
      // color: Colors.white,
      child: FutureBuilder<dynamic>(
        future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print((snapshot.data as List<Album>).length);
                // return Text('Id: ' + (snapshot.data[0] as Album).productId);
                return Container(
                  child: ListView.builder(
                  // physics:  NeverScrollableScrollPhysics(),
                  itemCount: (snapshot.data as List<Album>).length,
                  itemBuilder: (BuildContext context,int index){
                    return GestureDetector(
                        child: Card(
                            // 1
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)
                            ),
                            // 2
                            color: Colors.white,
                            elevation: 10,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                ListTile(
                                  contentPadding: EdgeInsets.all(10.0),
                                  leading: Icon(Icons.assignment, size: 20, color: Colors.blue[900],),
                                  title: Text(
                                    (snapshot.data[index] as Album).sku, 
                                    style: TextStyle(
                                    letterSpacing: 3.0),
                                  ),
                                  subtitle: Text((snapshot.data[index] as Album).productName)),
                            ]
                          ),
                        )
                      );
                    // ListTile(
                    //   // leading: Icon(Icons.list),
                    //   trailing: Text("GFG",
                    //                 style: TextStyle(
                    //                 color: Colors.green,fontSize: 15),),
                    //   title:Text((snapshot.data[index] as Album).sku + (snapshot.data[index] as Album).productName),
                    //   );
                  }
                  )); 
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
      )
    );
  }
Widget getRow(int index) {
    return GestureDetector(
      child: Card(
          // 1
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
          ),
          // 2
          color: Colors.orange[index*100],
          elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.all(10.0),
                leading: Icon(Icons.refresh, size: 70, color: Colors.orange[900],),
                title: Text(
                  "testddd", 
                  style: TextStyle(
                  letterSpacing: 3.0),
                ),
                subtitle: Text("test"),
              ),
          ]
        ),
      )
    );
  }
}