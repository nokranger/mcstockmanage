import 'dart:convert';
import 'dart:developer';
// import 'dart:html';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/GeneratedWidget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/generated/GeneratedWidget1.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/GeneratedWidget3.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

/* Text จัดการสินค้า
    Autogenerated by FlutLab FTF Generator
  */
// class GeneratedScanQRCodeWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       height: 100,
//       color: Colors.white,
//       child: ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => const QRViewExample(),
//             ));
//           },
//           child: const Text('SCAN QR CODE')),
//     );
//   }
// }

class ScanqrcodeAdd extends StatefulWidget {
  const ScanqrcodeAdd({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanqrcodeAddState();
}

class _ScanqrcodeAddState extends State<ScanqrcodeAdd> {
  Barcode result;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller.pauseCamera();
  //   }
  //   controller.resumeCamera();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'SCAN CODE',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: const Color(0xffC2B280),
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: Column(
            children: <Widget>[
              Container(
                child: TextField(
                    autofocus: true,
                    onChanged: (search) async {
                      print(search);
                      var sc = search.split('.');
                      print(sc[0]);
                      print(sc.length);
                      if (sc.length > 1) {
                        print('over1');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ScanQR(code: sc[0])));
                      } else {
                        print('lower2');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ScanQR(code: search)));
                      }
                    }),
              )
            ],
          ),
        ),
        onWillPop: () async {
          Navigator.pushNamed(context, '/stock');
        });
  }
}

class ScanQR extends StatefulWidget {
  final String code;
  final int add;
  const ScanQR({Key key, this.code, this.add}) : super(key: key);

  @override
  _ScanQRState createState() => _ScanQRState(code: this.code);
}

class _ScanQRState extends State<ScanQR> {
  _ScanQRState({this.code});
  String code;
  int add;
  Future<dynamic> futureAlbum;
  TextEditingController cproductName,
      csku,
      cqty,
      cprice,
      cshelf,
      cgroupName,
      cgodown,
      cproductId,
      cnodata;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    cproductName = TextEditingController();
    csku = TextEditingController();
    cqty = TextEditingController();
    cprice = TextEditingController();
    cshelf = TextEditingController();
    cgroupName = TextEditingController();
    cgodown = TextEditingController();
    cproductId = TextEditingController();
    cnodata = TextEditingController(text: 'ไม่มีข้อมูล');
  }

  Future<dynamic> fetchAlbum() async {
    final response = await http.post(
        Uri.parse('http://119.63.90.135:9090/product'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.jsonEncode(<String, String>{
          'operation': 'get_product_detail',
          'sku': code
        }));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(jsonDecode(response.body)['data']);
      print('scan QRCODE');
      // var ss = jsonDecode(response.body)['data'];
      // print('ss' +  ss);
      // print(Map<String, dynamic>.from(convert.jsonDecode(response.body)));
      // return Album.fromJson(Map<String, dynamic>.from(convert.jsonDecode(response.body)));
      // return Album.fromJson(Map<String, dynamic>.from(jsonDecode(response.body)['data']));
      if (jsonDecode(response.body)['data'] == '' ||
          jsonDecode(response.body)['data'] == null ||
          jsonDecode(response.body)['data'] == 'null') {
        print('sssss');
        Navigator.pushNamed(context, '/noproductadd');
      } else {
        print('scan done');
        final albums = Album.fromJson(
            Map<String, dynamic>.from(jsonDecode(response.body)['data']));
        cproductName.text = albums.name.toString();
        csku.text = albums.sku.toString();
        cqty.text = albums.qty.toString();
        cshelf.text = albums.shelf.toString();
        cgroupName.text = albums.groupName.toString();
        cgodown.text = albums.godown.toString();
        cproductId.text = albums.id.toString();

        return Album.fromJson(
            Map<String, dynamic>.from(jsonDecode(response.body)['data']));
      }

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
      Navigator.pushNamed(context, '/noproductadd');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'รายละเอียดสินค้า (เพิ่ม)',
              style: TextStyle(color: Colors.black, fontFamily: 'Kanit', fontSize: 18.0),
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
                color: Colors.white,
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                // child: Text(productName),
                child: FutureBuilder<dynamic>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print((snapshot.data as Album).id);
                      print((snapshot.data as Album).name);
                      print((snapshot.data as Album).sku);
                      return ListView(
                        children: [
                          Flexible(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text('ชื่อสินค้า', style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)),
                                      ),
                                      TextField(
                                        enabled: false,
                                        controller: cproductName.text == 'null'
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
                                            ), style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)
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
                                        title: Text('รหัสสินค้า', style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)),
                                      ),
                                      TextField(
                                        enabled: false,
                                        controller: csku.text == 'null'
                                            ? cnodata
                                            : csku,
                                        onChanged: (Search) {
                                          print('$Search');
                                        },
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            fillColor: Colors.grey[350],
                                            filled: true
                                            // hintText: 'ชื่อสินค้า: ' + productName,
                                            ), style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)
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
                                        title: Text('จำนวนที่มีอยู่ในสต็อก', style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)),
                                      ),
                                      TextField(
                                        enabled: false,
                                        controller: cqty.text == 'null'
                                            ? cnodata
                                            : cqty,
                                        onChanged: (Search) {
                                          print('$Search');
                                        },
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            fillColor: Colors.grey[350],
                                            filled: true
                                            // hintText: 'ชื่อสินค้า: ' + productName,
                                            ), style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)
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
                                        title: Text('ชั้นสินค้า', style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)),
                                      ),
                                      TextField(
                                        enabled: false,
                                        controller: cshelf.text == 'null'
                                            ? cnodata
                                            : cshelf,
                                        onChanged: (Search) {
                                          print('$Search');
                                        },
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            fillColor: Colors.grey[350],
                                            filled: true
                                            // hintText: 'ชื่อสินค้า: ' + productName,
                                            ), style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)
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
                                        title: Text('กลุ่มสินค้า', style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)),
                                      ),
                                      TextField(
                                        enabled: false,
                                        controller: cgroupName.text == 'null'
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
                                            ), style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)
                                      )
                                    ],
                                  ))),
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
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green),
                                    child: Text('เพิ่มสต็อกสินค้า( ทีละชิ้น )', style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)),
                                    onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title:
                                            const Text('ยืนยันการเพิ่มสต็อก'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'ไม่ยืนยัน'),
                                            child: const Text('ไม่ยืนยัน'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              final response = await http.post(
                                                  Uri.parse(
                                                      'http://119.63.90.135:9090/product'),
                                                  headers: <String, String>{
                                                    'Content-Type':
                                                        'application/json; charset=UTF-8',
                                                  },
                                                  body: convert.jsonEncode({
                                                    'operation':
                                                        'handle_product_stock',
                                                    'scanData':
                                                        (snapshot.data as Album)
                                                            .sku,
                                                    'qty': 1,
                                                    "eventId": 2,
                                                    'userId': "mobile",
                                                  }));
                                              if (response.statusCode == 200) {
                                                // If the server did return a 200 OK response,
                                                // then parse the JSON.
                                                print(
                                                    jsonDecode(response.body));
                                                print('update done add');
                                                Navigator.pushNamed(
                                                    context, '/scanqrcodeadd');
                                              } else {
                                                // If the server did not return a 200 OK response,
                                                // then throw an exception.
                                                throw Exception(
                                                    'Failed to load album');
                                              }
                                            },
                                            child: const Text('ยืนยัน'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: SizedBox(
                                  width: 375,
                                  height: 60,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.blue),
                                    child: Text('เพิ่มสต็อกสินค้า(หลายชิ้น)', style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)),
                                    onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                              scrollable: true,
                                              content: Column(
                                                children: [
                                                  Container(
                                                    child: Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 20,
                                                            right: 20,
                                                            bottom: 20),
                                                        child: Column(
                                                          children: [
                                                            ListTile(
                                                              title: Text(
                                                                  'ชื่อสินค้า', style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)),
                                                            ),
                                                            TextField(
                                                              enabled: false,
                                                              controller: cproductName
                                                                          .text ==
                                                                      'null'
                                                                  ? cnodata
                                                                  : cproductName,
                                                              onChanged:
                                                                  (Search) {
                                                                print(
                                                                    '$Search');
                                                              },
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  fillColor:
                                                                      Colors.grey[
                                                                          350],
                                                                  filled: true
                                                                  // hintText: 'ชื่อสินค้า: ' + productName,
                                                                  ), style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)
                                                            )
                                                          ],
                                                        )),
                                                  ),
                                                  Container(
                                                    child: Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 20,
                                                            right: 20,
                                                            bottom: 20),
                                                        child: Column(
                                                          children: [
                                                            ListTile(
                                                              title: Text(
                                                                  'รหัสสินค้า', style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)),
                                                            ),
                                                            TextField(
                                                              enabled: false,
                                                              controller:
                                                                  csku.text ==
                                                                          'null'
                                                                      ? cnodata
                                                                      : csku,
                                                              onChanged:
                                                                  (Search) {
                                                                print(
                                                                    '$Search');
                                                              },
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  fillColor:
                                                                      Colors.grey[
                                                                          350],
                                                                  filled: true
                                                                  // hintText: 'ชื่อสินค้า: ' + productName,
                                                                  ), style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)
                                                            )
                                                          ],
                                                        )),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 20,
                                                            bottom: 20),
                                                    child: Text(
                                                        'กรุณาระบุจำนวนสินค้า', style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)),
                                                  ),
                                                  Container(
                                                    child: Container(
                                                        margin: const EdgeInsets
                                                                .only(
                                                            left: 20,
                                                            right: 20,
                                                            bottom: 20),
                                                        child: Column(
                                                          children: [
                                                            TextField(
                                                              autofocus: true,
                                                              onChanged:
                                                                  (search) {
                                                                this.add =
                                                                    int.parse(
                                                                        search);
                                                                print(this.add);
                                                              },
                                                              decoration: InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder(),
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                  filled: true
                                                                  // hintText: 'ชื่อสินค้า: ' + productName,
                                                                  ), style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)
                                                            ),
                                                            Wrap(
                                                              direction: Axis
                                                                  .horizontal,
                                                              children: <
                                                                  Widget>[
                                                                TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            context,
                                                                            'ไม่ยืนยัน'),
                                                                    child: Text(
                                                                        'ไม่ยืนยัน', style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0))),
                                                                TextButton(
                                                                  onPressed:
                                                                      () async {
                                                                    final responses = await http.post(
                                                                        Uri.parse(
                                                                            'http://119.63.90.135:9090/product'),
                                                                        headers: <
                                                                            String,
                                                                            String>{
                                                                          'Content-Type':
                                                                              'application/json; charset=UTF-8',
                                                                        },
                                                                        body:
                                                                            jsonEncode({
                                                                          'operation':
                                                                              'handle_product_stock',
                                                                          'scanData':
                                                                              (snapshot.data as Album).sku,
                                                                          'qty':
                                                                              this.add,
                                                                          "eventId":
                                                                              2,
                                                                          'userId':
                                                                              "mobile",
                                                                        }));
                                                                    print(responses
                                                                        .body);
                                                                    if (responses
                                                                            .statusCode ==
                                                                        200) {
                                                                      // If the server did return a 200 OK response,
                                                                      // then parse the JSON.
                                                                      print(jsonDecode(
                                                                          responses
                                                                              .body));
                                                                      print(
                                                                          'update done add');
                                                                      print((snapshot.data
                                                                              as Album)
                                                                          .sku);
                                                                      Navigator.pushNamed(
                                                                          context,
                                                                          '/scanqrcode');
                                                                    } else {
                                                                      // If the server did not return a 200 OK response,
                                                                      // then throw an exception.
                                                                      throw Exception(
                                                                          'Failed to load album');
                                                                    }
                                                                  },
                                                                  child: const Text(
                                                                      'ยืนยัน', style: TextStyle(fontFamily: 'Kanit', fontSize: 18.0)),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                ],
                                              )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ),
        ),
        onWillPop: () async {
          Navigator.pushNamed(context, '/scanqrcodeadd');
        });
  }
}

class Album {
  final String id;
  final String sku;
  final String name;
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
      {this.id,
      this.sku,
      this.name,
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
        id: parsedJson['id'] as String,
        sku: parsedJson['sku'] as String,
        name: parsedJson['name'] as String,
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
