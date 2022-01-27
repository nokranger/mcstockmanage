import 'package:flutter/material.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/GeneratedWidget.dart';

import 'dart:convert';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Stockother extends StatefulWidget {
  const Stockother({Key key}) : super(key: key);

  @override
  _StockotherState createState() => _StockotherState();
}

class _StockotherState extends State<Stockother> {
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
                    child: Text('นับสินค้า', style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Kanit'
                    ),),
                    onPressed: () async {
                      print('test');
                      Navigator.pushNamed(context, '/scanqrcodeother');
                    },
                  ),
                ),
                Container(
                  child: RaisedButton(
                    child: Text('เพิ่มสต็อกสินค้า', style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Kanit'
                    )),
                    onPressed: () async {
                      Navigator.pushNamed(context, '/scanqrcodeaddother');
                    },
                  ),
                ),
                                Container(
                  child: RaisedButton(
                    child: Text('ตัดสต็อกสินค้า', style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Kanit'
                    )),
                    onPressed: () async {
                      Navigator.pushNamed(context, '/scanqrcodedecreaseother');
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
