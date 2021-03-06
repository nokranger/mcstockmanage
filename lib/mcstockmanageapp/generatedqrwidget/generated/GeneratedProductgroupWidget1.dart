import 'package:flutter/material.dart';
import 'package:flutterapp/mcstockmanageapp/generatedqrwidget/generated/GeneratedExpand_moreWidget.dart';
import 'package:flutterapp/helpers/transform/transform.dart';
import 'package:flutterapp/mcstockmanageapp/generatedqrwidget/generated/GeneratedMC3Widget1.dart';
import 'package:flutterapp/mcstockmanageapp/generatedqrwidget/generated/GeneratedWidget20.dart';
import 'package:flutterapp/mcstockmanageapp/generatedqrwidget/generated/GeneratedRectangle6Widget9.dart';

/* Group product-group
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedProductgroupWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 346.0,
      height: 77.00003051757812,
      child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: [
            Positioned(
              left: 2.0,
              top: 0.000030517578125,
              right: null,
              bottom: null,
              width: 68.0,
              height: 32.0,
              child: GeneratedWidget20(),
            ),
            Positioned(
              left: 0.0,
              top: 31.000030517578125,
              right: null,
              bottom: null,
              width: 346.0,
              height: 46.0,
              child: GeneratedRectangle6Widget9(),
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 0.0,
              width: null,
              height: null,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                final double width = constraints.maxWidth * 0.06936416184971098;

                final double height =
                    constraints.maxHeight * 0.3116889808203043;

                return Stack(children: [
                  TransformHelper.translate(
                      x: constraints.maxWidth * 0.9075144508670521,
                      y: constraints.maxHeight * 0.5844153527929716,
                      z: 0,
                      child: Container(
                        width: width,
                        height: height,
                        child: GeneratedExpand_moreWidget(),
                      ))
                ]);
              }),
            ),
            Positioned(
              left: 14.0,
              top: 41.000030517578125,
              right: null,
              bottom: null,
              width: 39.0,
              height: 32.0,
              child: GeneratedMC3Widget1(),
            )
          ]),
    );
  }
}
