import 'package:flutter/material.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/GeneratedLine2Widget4.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/GeneratedAssignmentWidget4.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/Generated06220K95305Widget.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/GeneratedRectangle5Widget4.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/GeneratedRectangle4Widget4.dart';
import 'package:flutterapp/mcstockmanageapp/generatedwidget3/generated/GeneratedPUDWidget2.dart';
import 'package:flutterapp/helpers/transform/transform.dart';

/* Group product5
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedProduct5Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/GeneratedWidget6'),
      child: Container(
        width: 378.0,
        height: 85.0,
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
                width: 377.0,
                height: 85.0,
                child: GeneratedRectangle4Widget4(),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: null,
                bottom: null,
                width: 378.0,
                height: 39.0,
                child: GeneratedRectangle5Widget4(),
              ),
              Positioned(
                left: 42.0,
                top: 5.0,
                right: null,
                bottom: null,
                width: 136.0,
                height: 32.0,
                child: Generated06220K95305Widget(),
              ),
              Positioned(
                left: 16.0,
                top: 47.0,
                right: null,
                bottom: null,
                width: 187.0,
                height: 29.0,
                child: GeneratedPUDWidget2(),
              ),
              Positioned(
                left: 0.0,
                top: 39.0,
                right: null,
                bottom: null,
                width: 377.0013122558594,
                height: 3.0,
                child: GeneratedLine2Widget4(),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
                width: null,
                height: null,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  final double width =
                      constraints.maxWidth * 0.06349206349206349;

                  final double height =
                      constraints.maxHeight * 0.2823529411764706;

                  return Stack(children: [
                    TransformHelper.translate(
                        x: constraints.maxWidth * 0.042328042328042326,
                        y: constraints.maxHeight * 0.07058823529411765,
                        z: 0,
                        child: Container(
                          width: width,
                          height: height,
                          child: GeneratedAssignmentWidget4(),
                        ))
                  ]);
                }),
              )
            ]),
      ),
    );
  }
}
