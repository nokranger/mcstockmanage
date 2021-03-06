import 'package:flutter/material.dart';
import 'package:flutterapp/mcstockmanageapp/generatedqrwidget/generated/GeneratedWidget24.dart';
import 'package:flutterapp/mcstockmanageapp/generatedqrwidget/generated/GeneratedRectangle8Widget1.dart';

/* Group Group 3
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedGroup3Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/GeneratedWidget61'),
      child: Container(
        width: 345.0,
        height: 42.0,
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
                width: 345.0,
                height: 42.0,
                child: GeneratedRectangle8Widget1(),
              ),
              Positioned(
                left: 136.0,
                top: 7.0,
                right: null,
                bottom: null,
                width: 200.49998474121094,
                height: 32.0,
                child: GeneratedWidget24(),
              )
            ]),
      ),
    );
  }
}
