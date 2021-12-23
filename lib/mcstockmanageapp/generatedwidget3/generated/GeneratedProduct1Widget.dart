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
  final response = await http.post(
      Uri.parse('http://119.63.90.135:9090/product'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: convert.jsonEncode(<String, String>{'operation': 'get_products'}));
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
  final String groupId;
  final String groupName;
  final String shelf;
  final String godown;
  final double price;
  final int qty;
  final int isActive;
  final int isDelete;

  Album(
      {this.productId,
      this.sku,
      this.productName,
      this.description,
      this.groupId,
      this.groupName,
      this.shelf,
      this.godown,
      this.price,
      this.qty,
      this.isActive,
      this.isDelete});

  factory Album.fromJson(Map<String, dynamic> parsedJson) {
    return Album(
        productId: parsedJson['productId'] as String,
        sku: parsedJson['sku'] as String,
        productName: parsedJson['productName'] as String,
        description: parsedJson['description'] as String,
        groupId: parsedJson['groupId'] as String,
        groupName: parsedJson['groupName'] as String,
        shelf: parsedJson['shelf'] as String,
        godown: parsedJson['godown'] as String,
        price: parsedJson['price'],
        qty: parsedJson['qty'],
        isActive: parsedJson['isActive'],
        isDelete: parsedJson['isDelete']);
  }
}

class GeneratedProduct1Widget extends StatefulWidget {
  const GeneratedProduct1Widget({Key key}) : super(key: key);

  @override
  _GeneratedProduct1WidgetState createState() =>
      _GeneratedProduct1WidgetState();
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
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: Card(
                            // 1
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            // 2
                            color: Colors.white,
                            elevation: 10,
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  RaisedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SecondRoute(
                                                  productName:
                                                      (snapshot.data[index] as Album)
                                                          .productName
                                                          .toString(),
                                                  sku: (snapshot.data[index] as Album)
                                                      .sku
                                                      .toString(),
                                                  qty: (snapshot.data[index] as Album)
                                                      .qty
                                                      .toString(),
                                                  price: (snapshot.data[index] as Album)
                                                      .price
                                                      .toString(),
                                                  shelf: (snapshot.data[index]
                                                          as Album)
                                                      .shelf
                                                      .toString(),
                                                  groupName: (snapshot.data[index]
                                                          as Album)
                                                      .groupName
                                                      .toString(),
                                                  godown: (snapshot.data[index]
                                                          as Album)
                                                      .godown
                                                      .toString())),
                                        );
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      color: Colors.white,
                                      child: Column(
                                        children: <Widget>[
                                          ListTile(
                                              contentPadding:
                                                  EdgeInsets.all(10.0),
                                              leading: Icon(
                                                Icons.assignment,
                                                size: 30,
                                                color: Colors.blueAccent,
                                              ),
                                              title: Text(
                                                (snapshot.data[index] as Album)
                                                    .sku,
                                                style: TextStyle(
                                                    letterSpacing: 3.0,
                                                    color: Colors.blue),
                                              ),
                                              subtitle: Text(
                                                (snapshot.data[index] as Album)
                                                    .productName,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                        ],
                                      ))
                                ]),
                          ),
                        );
                      }));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ));
  }

  Widget test() {
    print('testtt');
  }

  Widget getRow(int index) {
    return GestureDetector(
        child: Card(
      // 1
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      // 2
      color: Colors.orange[index * 100],
      elevation: 10,
      child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.all(10.0),
          leading: Icon(
            Icons.refresh,
            size: 70,
            color: Colors.orange[900],
          ),
          title: Text(
            "testddd",
            style: TextStyle(letterSpacing: 3.0),
          ),
          subtitle: Text("test"),
        ),
      ]),
    ));
  }
}

class SecondRoute extends StatefulWidget {
  final Color passedColor;
  final String passedColorName;
  final String productName;
  final String sku;
  final String qty;
  final String price;
  final String shelf;
  final String groupName;
  final String godown;
  const SecondRoute(
      {Key key,
      this.passedColor,
      this.passedColorName,
      this.productName,
      this.sku,
      this.qty,
      this.price,
      this.shelf,
      this.groupName,
      this.godown})
      : super(key: key);

  @override
  _SecondRouteState createState() => _SecondRouteState(
      passedColor: this.passedColor,
      passedColorName: this.passedColorName,
      productName: this.productName,
      sku: this.sku,
      qty: this.qty,
      price: this.price,
      shelf: this.shelf,
      groupName: this.groupName,
      godown: this.godown);
}

class _SecondRouteState extends State<SecondRoute> {
  Color passedColor;
  String passedColorName;
  String productName;
  String sku;
  String qty;
  String price;
  String shelf;
  String groupName;
  String godown;
  TextEditingController cproductName,
      csku,
      cqty,
      cprice,
      cshelf,
      cgroupName,
      cgodown;

  _SecondRouteState(
      {this.passedColor,
      this.passedColorName,
      this.productName,
      this.sku,
      this.qty,
      this.price,
      this.shelf,
      this.groupName,
      this.godown});
  @override
  void initState() {
    super.initState();
    cproductName = TextEditingController(text: productName);
    csku = TextEditingController(text: sku);
    cqty = TextEditingController(text: qty);
    cprice = TextEditingController(text: price);
    cshelf = TextEditingController(text: shelf);
    cgroupName = TextEditingController(text: groupName);
    cgodown = TextEditingController(text: godown);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('รายละเอียดสินค้า'),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 700,
            color: Colors.white,
            child: Column(
              children: [
                Flexible(
                    child: Column(
                  children: [
                    ListTile(
                      title: Text('ชื่อสินค้า'),
                    ),
                    TextField(
                      enabled: false,
                      controller: cproductName,
                      onChanged: (Search) {
                        print('$Search');
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: 'ชื่อสินค้า: ' + productName,
                      ),
                    )
                  ],
                )),
                Flexible(
                    child: Column(
                  children: [
                    ListTile(
                      title: Text('รหัสสินค้า'),
                    ),
                    TextField(
                      enabled: false,
                      controller: csku,
                      onChanged: (Search) {
                        print('$Search');
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: 'ชื่อสินค้า: ' + productName,
                      ),
                    )
                  ],
                )),
                Flexible(
                    child: Column(
                  children: [
                    ListTile(
                      title: Text('จำนวน'),
                    ),
                    TextField(
                      enabled: false,
                      controller: cqty,
                      onChanged: (Search) {
                        print('$Search');
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: 'ชื่อสินค้า: ' + productName,
                      ),
                    )
                  ],
                )),
                Flexible(
                    child: Column(
                  children: [
                    ListTile(
                      title: Text('ราคา(บาท)'),
                    ),
                    TextField(
                      enabled: false,
                      controller: cprice,
                      onChanged: (Search) {
                        print('$Search');
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: 'ชื่อสินค้า: ' + productName,
                      ),
                    )
                  ],
                )),
                Flexible(
                    child: Column(
                  children: [
                    ListTile(
                      title: Text('ชั้นสินค้า'),
                    ),
                    TextField(
                      enabled: false,
                      controller: cshelf,
                      onChanged: (Search) {
                        print('$Search');
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: 'ชื่อสินค้า: ' + productName,
                      ),
                    )
                  ],
                )),
                Flexible(
                    child: Column(
                  children: [
                    ListTile(
                      title: Text('กลุ่มสินค้า'),
                    ),
                    TextField(
                      enabled: false,
                      controller: cgroupName,
                      onChanged: (Search) {
                        print('$Search');
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: 'ชื่อสินค้า: ' + productName,
                      ),
                    )
                  ],
                )),
                Flexible(
                    child: Column(
                  children: [
                    ListTile(
                      title: Text('โกดัง'),
                    ),
                    TextField(
                      enabled: false,
                      controller: cgodown,
                      onChanged: (Search) {
                        print('$Search');
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: 'ชื่อสินค้า: ' + productName,
                      ),
                    )
                  ],
                )),
                Flexible(
                    child: Column(
                  children: [
                    ElevatedButton(
                      child: Text('กลับ'),
                    )
                  ],
                )),
              ],
            ),
          ),
        )
        // Center(
        //     child: Text(
        //   'ชื่อสินค้า: ' + productName + 'รหัสสินค้า: ' +  sku + 'จำนวน: ' + qty + 'ราคา: ' + price + 'ชั้นสินค้า: ' + shelf + 'กลุ่มสินค้า: ' + groupName + 'โกดัง: ' + godown,
        //   style: TextStyle(color: Colors.pink),
        // )),
        );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
