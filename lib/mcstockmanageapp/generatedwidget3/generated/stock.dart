import 'package:flutter/material.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/GeneratedWidget.dart';

import 'dart:convert';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Stock extends StatefulWidget {
  const Stock({Key key}) : super(key: key);

  @override
  _StockState createState() => _StockState();
}

class _StockState extends State<Stock> {
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
              'นับสต็อก',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: const Color(0xffC2B280),
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: Container(
            child: ListView(
              children: [
                Container(
                  child: RaisedButton(
                    child: Text('นับสินค้า'),
                    onPressed: () async {
                      print('test');
                      Navigator.pushNamed(context, '/scanqrcode');
                    },
                  ),
                ),
                Container(
                  child: RaisedButton(
                    child: Text('เพิ่มสต็อกสินค้า'),
                    onPressed: () async {
                      Navigator.pushNamed(context, '/scanqrcodeadd');
                    },
                  ),
                ),
                                Container(
                  child: RaisedButton(
                    child: Text('ตัดสต็อกสินค้า'),
                    onPressed: () async {
                      Navigator.pushNamed(context, '/scanqrcodedecrease');
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: () async {
          Navigator.pushNamed(context, '/selectbrand');
        });
  }
}
