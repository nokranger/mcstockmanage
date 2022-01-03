import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/GeneratedWidget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/GeneratedWidget3.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/GeneratedSearchWidget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget61/generated/GeneratedScanQRCodeWidget.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<dynamic> fetchAlbum(search) async {
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
    // return (jsonDecode(response.body)['data'] as List<dynamic>).map((e) {
    //   Album review = new Album.fromJson(Map<String, dynamic>.from(e));
    //   return review;
    // }).toList();
    // List<Album> albums = [];
    // List<dynamic> albumsJson = convert.jsonDecode(response.body);
    //     albumsJson.forEach(
    //   (oneAlbum) {
    //     Album album = Album.fromJson(oneAlbum);
    //     albums.add(album);
    //   },
    // );
                              final response = await http.post(
                              Uri.parse('http://119.63.90.135:9090/product'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                              },
                              body: convert.jsonEncode(<String, dynamic>{
                                'operation': 'get_products',
                                "keyword" : search,
                                "productId" : null,
                                "sku": null,
                                "productName" : null,
                                "groupId" : null,
                                "groupName" : null,
                                "price" : null,
                                "qty" : null,
                                "isActive" : true,
                                "isDelete" : false
                              }));
                          if (response.statusCode == 200) {
                            // If the server did return a 200 OK response,
                            // then parse the JSON.
                            print(jsonDecode(response.body)['data']);
                            if (jsonDecode(response.body)['data'] == '' ||
                                jsonDecode(response.body)['data'] == null ||
                                jsonDecode(response.body)['data'] == 'null') {
                              print('sssss');
                              // Navigator.push(context, MaterialPageRoute());
                            } else {
                              print('scan done');
                              return (jsonDecode(response.body)['data'] as List<dynamic>).map((e) {
                                Album review = new Album.fromJson(Map<String, dynamic>.from(e));
                                return review;
                              }).toList();
                            }
                          } else {
                            // If the server did not return a 200 OK response,
                            // then throw an exception.
                            throw Exception('Failed to load album');
                          }
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

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Future<dynamic> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(null);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'ตรวจสอบรายละเอียดสินค้า',
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
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20, top: 20),
                    color: Colors.white,
                    child: TextField(
                        onChanged: (search) async {
                          fetchAlbum(search);
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          hintText: 'ค้นหา',
                          border: OutlineInputBorder(),
                        )),
                  ),
                  Container(
                    width: 200,
                    height: 600,
                    child: FutureBuilder<dynamic>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print((snapshot.data as List<Album>).length);
                          // return Text('Id: ' + (snapshot.data[0] as Album).productId);
                          return Container(
                              child: ListView.builder(
                                  // physics:  NeverScrollableScrollPhysics(),
                                  itemCount:
                                      (snapshot.data as List<Album>).length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      child: Card(
                                        // 1
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
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
                                                              productName: (snapshot.data[index] as Album)
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
                                                              groupName:
                                                                  (snapshot.data[index] as Album)
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
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: <Widget>[
                                                      ListTile(
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          leading: Icon(
                                                            Icons.assignment,
                                                            size: 30,
                                                            color: Colors
                                                                .blueAccent,
                                                          ),
                                                          title: Text(
                                                            (snapshot.data[
                                                                        index]
                                                                    as Album)
                                                                .sku
                                                                .toString(),
                                                            style: TextStyle(
                                                                letterSpacing:
                                                                    3.0,
                                                                color: Colors
                                                                    .blue[900],
                                                                fontSize: 20),
                                                          ),
                                                          subtitle: Text(
                                                            (snapshot.data[
                                                                        index]
                                                                    as Album)
                                                                .productName
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20),
                                                          )),
                                                    ],
                                                  ))
                                            ]),
                                      ),
                                    );
                                  }));
                        } else if (snapshot.hasError) {
                          // return Text('${snapshot.error}');
                        }
                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                  // Center(
                  //   child: Container(
                  //       width: 375,
                  //       height: 200,
                  //       margin: const EdgeInsets.only(
                  //           left: 20, right: 20, top: 20, bottom: 20),
                  //       color: Colors.white,
                  //       child: ListView(
                  //         children: [
                  //           Center(
                  //             child: Container(
                  //               child: ListTile(
                  //                   title: Center(
                  //                     child: const Text(
                  //                       'ไม่พบสินค้า',
                  //                       style: TextStyle(
                  //                           color: Colors.black, fontSize: 30),
                  //                     ),
                  //                   ),
                  //                   subtitle: Center(
                  //                     child: Text(
                  //                       '(Product id)',
                  //                       style: TextStyle(
                  //                           color: Colors.black, fontSize: 30),
                  //                     ),
                  //                   )),
                  //             ),
                  //           ),
                  //           Center(
                  //               child: Column(
                  //             children: [
                  //               Container(
                  //                 margin: const EdgeInsets.only(
                  //                     left: 20, right: 20, top: 20, bottom: 20),
                  //                 child: SizedBox(
                  //                     width: 375,
                  //                     height: 60,
                  //                     child: ElevatedButton(
                  //                       child: Text('กลับ'),
                  //                       onPressed: () {
                  //                         Navigator.of(context)
                  //                             .push(MaterialPageRoute(
                  //                           builder: (context) =>
                  //                               GeneratedWidget(),
                  //                         ));
                  //                       },
                  //                     )),
                  //               ),
                  //             ],
                  //           ))
                  //         ],
                  //       )),
                  // ),
                ],
              )),
        ),
        onWillPop: () async {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GeneratedWidget(),
          ));
        });
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
  Color passedColor = Color(0xffb74093);
  String passedColorName;
  String productName;
  String sku;
  String qty;
  String price;
  String shelf;
  String groupName;
  String godown;
  String cnodate;
  TextEditingController cproductName,
      csku,
      cqty,
      cprice,
      cshelf,
      cgroupName,
      cgodown,
      cnodata,
      cnull;

  _SecondRouteState(
      {this.passedColor,
      this.passedColorName,
      this.productName,
      this.sku,
      this.qty,
      this.price,
      this.shelf,
      this.groupName,
      this.godown,
      this.cnodata,
      this.cnull});

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
    cnodata = TextEditingController(text: 'ไม่มีข้อมูล');
    cnull = TextEditingController(text: 'null');
  }

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
              // color: Colors.black,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.dstATop),
                  image: AssetImage(
                      "assets/images/f2f8bce97262e01a7a2b6a3ec1383331cfa13e7f.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                child: Container(
                  width: 375,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 20),
                  color: Colors.white,
                  child: ListView(
                    children: [
                      Flexible(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text('ชื่อสินค้า'),
                                  ),
                                  TextField(
                                    enabled: false,
                                    controller: productName == 'null'
                                        ? cnodata
                                        : cproductName,
                                    onChanged: (Search) {
                                      print('$Search');
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.grey[350],
                                        filled: true
                                        // hintText: 'ชื่อสินค้า: ' + productName,
                                        ),
                                  )
                                ],
                              ))),
                      Flexible(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text('รหัสสินค้า'),
                                  ),
                                  TextField(
                                    enabled: false,
                                    controller: sku == 'null' ? cnodata : csku,
                                    onChanged: (Search) {
                                      print('$Search');
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.grey[350],
                                        filled: true
                                        // hintText: 'ชื่อสินค้า: ' + productName,
                                        ),
                                  )
                                ],
                              ))),
                      Flexible(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text('จำนวน'),
                                  ),
                                  TextField(
                                    enabled: false,
                                    controller: qty == 'null' ? cnodata : cqty,
                                    onChanged: (Search) {
                                      print('$Search');
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.grey[350],
                                        filled: true
                                        // hintText: 'ชื่อสินค้า: ' + productName,
                                        ),
                                  )
                                ],
                              ))),
                      Flexible(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text('ราคา(บาท)'),
                                  ),
                                  TextField(
                                    enabled: false,
                                    controller:
                                        price == 'null' ? cnodata : cprice,
                                    onChanged: (Search) {
                                      print('$Search');
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.grey[350],
                                        filled: true
                                        // hintText: 'ชื่อสินค้า: ' + productName,
                                        ),
                                  )
                                ],
                              ))),
                      Flexible(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text('ชั้นสินค้า'),
                                  ),
                                  TextField(
                                    enabled: false,
                                    controller:
                                        shelf == 'null' ? cnodata : cshelf,
                                    onChanged: (Search) {
                                      print('$Search');
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.grey[350],
                                        filled: true
                                        // hintText: 'ชื่อสินค้า: ' + productName,
                                        ),
                                  )
                                ],
                              ))),
                      Flexible(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text('กลุ่มสินค้า'),
                                  ),
                                  TextField(
                                    enabled: false,
                                    controller: groupName == 'null'
                                        ? cnodata
                                        : cgroupName,
                                    onChanged: (Search) {
                                      print('$Search');
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        fillColor: Colors.grey[350],
                                        filled: true
                                        // hintText: 'ชื่อสินค้า: ' + productName,
                                        ),
                                  )
                                ],
                              ))),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('โกดัง'),
                              ),
                              TextField(
                                enabled: false,
                                controller:
                                    godown == 'null' ? cnodata : cgodown,
                                onChanged: (Search) {
                                  print('$Search');
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: Colors.grey[350],
                                    filled: true
                                    // hintText: 'ชื่อสินค้า: ' + productName,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                          child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: SizedBox(
                                width: 375,
                                height: 60,
                                child: ElevatedButton(
                                  child: Text('กลับ'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => ProductDetail(),
                                    ));
                                  },
                                )),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            )),
        onWillPop: () async {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetail(),
          ));
        });
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}