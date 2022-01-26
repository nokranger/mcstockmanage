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
              style: TextStyle(color: Colors.black, 
                      fontSize: 18.0,
                      fontFamily: 'Kanit'),
            ),
            backgroundColor: const Color(0xffC2B280),
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: Container(
            child: ListView(
              children: [
                Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 20),
                    child: SizedBox(
                        height: 300,
                        child: RaisedButton(
                          child: Container(
                            child: Image.asset(
                                'assets/images/NSgvhpc.png'),
                          ),
                          onPressed: () async {
                            print('test');
                            Navigator.pushNamed(context, '/stock');
                          },
                        ))),
                Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 20),
                    child: SizedBox(
                      height: 300,
                      child: RaisedButton(
                        child: Text(
                          'OTHER',
                          style: TextStyle(fontSize: 90, fontFamily: 'Kanit'),
                        ),
                        onPressed: () async {
                          print('test');
                          Navigator.pushNamed(context, '/stock');
                        },
                      ),
                    )),
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
