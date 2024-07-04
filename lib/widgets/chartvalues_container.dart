import 'package:flutter/material.dart';

Widget buildLegendItem(String text, Color color) {
  return Row(
    children: [
      Container(
        width: 20,
        height: 20,
        color: color,
        margin: const EdgeInsets.symmetric(horizontal: 5),
      ),
      Text(text),
    ],
  );
}