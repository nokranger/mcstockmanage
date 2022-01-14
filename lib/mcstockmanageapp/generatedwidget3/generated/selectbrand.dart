import 'package:flutter/material.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/GeneratedWidget.dart';

import 'dart:convert';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class SelectBrand extends StatefulWidget {
  const SelectBrand({Key key}) : super(key: key);

  @override
  _SelectBrandState createState() => _SelectBrandState();
}

class _SelectBrandState extends State<SelectBrand> {
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
              'เลือกประเภทอุปกรณ์',
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
                    child: Text('Honda'),
                    onPressed: () async {
                      print('test');
                      Navigator.pushNamed(context, '/stock');
                    },
                  ),
                ),
                Container(
                  child: RaisedButton(
                    child: Text('Other'),
                    onPressed: () async {
                      Navigator.pushNamed(context, '/stock');
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: () async {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GeneratedWidget(),
          ));
        });
  }
}
