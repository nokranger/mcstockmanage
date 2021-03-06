import 'package:flutter/material.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/generated/GeneratedEllipse3Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget/generated/GeneratedManage_product1Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget61/generated/GeneratedScanQRCodeWidget.dart';

/* Group Group 2
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedGroup2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/selectbrand'),
      child: Container(
        width: 87.68000030517578,
        height: 87.67616271972656,
        child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: [
              Positioned(
                left: 0.0,
                top: 0.0,
                right: null,
                bottom: null,
                width: 87.68000030517578,
                height: 87.67616271972656,
                child: GeneratedEllipse3Widget(),
              ),
              Positioned(
                left: 15.343999862670898,
                top: 8.767616271972656,
                right: null,
                bottom: null,
                width: 59.183998107910156,
                height: 63.565216064453125,
                child: GeneratedManage_product1Widget(),
              )
            ]),
      ),
    );
  }
}
