import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/generated/GeneratedWidget2.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/generated/GeneratedRectangle1Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/generated/GeneratedGroup1Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/generated/Generated162111Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/generated/GeneratedHomepageWidget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/generated/GeneratedLogoMCSuperbike011Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/generated/GeneratedGroup2Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/generated/GeneratedRectangle2Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/generated/GeneratedWidget1.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/generated/GeneratedMCStockManagementWidget.dart';

/* Frame หน้าแรก
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Material(
            child: ClipRRect(
          borderRadius: BorderRadius.zero,
          child: Container(
            width: 411.0,
            height: 731.0,
            child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                overflow: Overflow.visible,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.zero,
                    child: Container(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    top: 0.0,
                    right: null,
                    bottom: null,
                    width: 411.0,
                    height: 731.0,
                    child: GeneratedHomepageWidget(),
                  ),
                  Positioned(
                    left: 0.0,
                    top: 0.0,
                    right: null,
                    bottom: null,
                    width: 411.0,
                    height: 731.0,
                    child: Generated162111Widget(),
                  ),
                  Positioned(
                    left: 0.0,
                    top: 0.0,
                    right: null,
                    bottom: null,
                    width: 411.0,
                    height: 98.0,
                    child: GeneratedRectangle1Widget(),
                  ),
                  Positioned(
                    left: 20.0,
                    top: 14.0,
                    right: null,
                    bottom: null,
                    width: 85.0,
                    height: 69.0,
                    child: GeneratedRectangle2Widget(),
                  ),
                  Positioned(
                    left: 110.0,
                    top: 28.0,
                    right: null,
                    bottom: null,
                    width: 273.0,
                    height: 42.0,
                    child: GeneratedMCStockManagementWidget(),
                  ),
                  Positioned(
                    left: 19.0,
                    top: 4.0,
                    right: null,
                    bottom: null,
                    width: 87.0,
                    height: 88.0,
                    child: GeneratedLogoMCSuperbike011Widget(),
                  ),
                  Positioned(
                    left: 25.0,
                    top: 228.0,
                    right: null,
                    bottom: null,
                    width: 150.0,
                    height: 44.0,
                    child: GeneratedWidget1(),
                  ),
                  // Positioned(
                  //   left: 25.0,
                  //   top: 378.0,
                  //   right: null,
                  //   bottom: null,
                  //   width: 119.0,
                  //   height: 44.0,
                  //   child: GeneratedWidget2(),
                  // ),
                  Positioned(
                    left: 200.0,
                    top: 228.0,
                    right: null,
                    bottom: null,
                    width: 150.0,
                    height: 25.0,
                    child: GeneratedWidget2(),
                  ),
                  // Positioned(
                  //   left: 240.0,
                  //   top: 378.0,
                  //   right: null,
                  //   bottom: null,
                  //   width: 71.0,
                  //   height: 25.0,
                  //   child: GeneratedWidget2(),
                  // ),
                  Positioned(
                    left: 50,
                    top: 134.80209350585938,
                    right: null,
                    bottom: null,
                    width: 87.68000030517578,
                    height: 87.67616271972656,
                    child: GeneratedGroup1Widget(),
                  ),
                  Positioned(
                    left: 230,
                    top: 134.80209350585938,
                    right: null,
                    bottom: null,
                    width: 87.68000030517578,
                    height: 87.67616271972656,
                    child: GeneratedGroup2Widget(),
                  ),
                  // Positioned(
                  //   left: 50,
                  //   top: 284.80209350585938,
                  //   right: null,
                  //   bottom: null,
                  //   width: 87.68000030517578,
                  //   height: 87.67616271972656,
                  //   child: GeneratedGroup2Widget(),
                  // ),
                  // Positioned(
                  //   left: 230,
                  //   top: 284.80209350585938,
                  //   right: null,
                  //   bottom: null,
                  //   width: 87.68000030517578,
                  //   height: 87.67616271972656,
                  //   child: GeneratedGroup2Widget(),
                  // )
                ]),
          ),
        )),
        onWillPop: () async {
          exit(0);
        });
  }
}
