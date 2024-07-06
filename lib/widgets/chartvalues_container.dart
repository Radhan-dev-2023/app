import 'package:flutter/material.dart';

Widget buildLegendItem(String text, Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        width: 20,
        height: 20,
        color: color,
        margin: const EdgeInsets.symmetric(horizontal: 5),
      ),
      Text(text,style: const TextStyle(fontWeight: FontWeight.bold),),
    ],
  );
}