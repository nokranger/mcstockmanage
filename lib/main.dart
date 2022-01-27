import 'package:flutter/material.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/GeneratedWidget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/GeneratedWidget3.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget6/GeneratedWidget6.dart';
import 'package:flutterapp/mcstockmanageapp/generatedqrwidget/GeneratedQRWidget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedalert1widget/GeneratedAlert1Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedalert2widget/GeneratedAlert2Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedalert3widget/GeneratedAlert3Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget61/GeneratedWidget61.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/product.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/productadd.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/productdecrease.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/scanqrcode.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/scanqrcodeother.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/scanqrcodeadd.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/scanqrcodedecrease.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/selectbrand.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/stock.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/stockother.dart';

import 'mcstockmanageapp/generatedwidget3/generated/productdetail.dart';

void main() {
  runApp(MCStockManageApp());
}

class MCStockManageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MC Stock Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/GeneratedWidget',
      routes: {
        '/GeneratedWidget': (context) => GeneratedWidget(),
        '/GeneratedWidget3': (context) => GeneratedWidget3(),
        '/GeneratedWidget6': (context) => GeneratedWidget6(),
        '/GeneratedQRWidget': (context) => GeneratedQRWidget(),
        '/GeneratedAlert1Widget': (context) => GeneratedAlert1Widget(),
        '/GeneratedAlert2Widget': (context) => GeneratedAlert2Widget(),
        '/GeneratedAlert3Widget': (context) => GeneratedAlert3Widget(),
        '/GeneratedWidget61': (context) => GeneratedWidget61(),
        '/noproduct': (context) => Products(),
        '/noproductadd': (context) => ProductsAdd(),
        '/noproductdecrease': (context) => ProductsDecrease(),
        '/product': (context) => ProductDetail(),
        '/scanqrcode': (context) => QRViewExample(),
        '/scanqrcodeother': (context) => ScancodeOther(),
        '/scanqrcodeadd': (context) => ScanqrcodeAdd(),
        '/scanqrcodedecrease': (context) => ScanqrcodeDecrease(),
        '/selectbrand': (context) => SelectBrand(),
        '/stock': (context) => Stock(),
        '/stockother': (context) => Stockother(),
      },
    );
  }
}
