import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/GeneratedWidget3.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/GeneratedSearchWidget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget61/generated/GeneratedScanQRCodeWidget.dart';
import 'dart:async';
import 'dart:convert' as convert;
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

class Products extends StatefulWidget {
  const Products({Key key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'รายละเอียดสินค้า',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: const Color(0xffC2B280),
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop),
                image: AssetImage(
                    "assets/images/f2f8bce97262e01a7a2b6a3ec1383331cfa13e7f.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Container(
                  width: 375,
                  height: 200,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  color: Colors.white,
                  child: ListView(
                    children: [
                      Center(
                        child: Container(
                          child: ListTile(
                              title: Center(
                                child: const Text(
                                  'ไม่พบสินค้า',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                ),
                              ),),
                        ),
                      ),
                      Center(
                          child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 20),
                            child: SizedBox(
                                width: 375,
                                height: 60,
                                child: ElevatedButton(
                                  child: Text('กลับ'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => QRViewExample(),
                                    ));
                                  },
                                )),
                          ),
                        ],
                      ))
                    ],
                  )),
            ),
          ),
        ),
        onWillPop: () async {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => QRViewExample(),
          ));
        });
  }
}
