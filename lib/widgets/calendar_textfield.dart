import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildCustomTextField(BuildContext context, TextEditingController controller, DateTime dateTime, {Widget? prefixIcon, String hintText = '',}) {
  return IntrinsicWidth(
    child: TextField(
      readOnly: true,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText.isNotEmpty ? hintText : DateFormat('MMMM yyyy').format(dateTime),
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFedf0f8), width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: const Color(0xFFedf0f8),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),
      controller: controller,
    ),
  );
}
