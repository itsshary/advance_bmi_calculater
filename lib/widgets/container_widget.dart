import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomWidget extends StatelessWidget {
  final double height;
  final double width;

  Widget? childwidget;

  CustomWidget({
    super.key,
    this.height = 200,
    this.width = 150,
    this.childwidget,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.white, style: BorderStyle.solid)),
      child: Container(height: height, width: width, child: childwidget),
    );
  }
}
