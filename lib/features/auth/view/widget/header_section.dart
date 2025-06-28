import 'package:flutter/material.dart';

Widget buildHeaderSection({
  required String title,
  required String subTitle,
  required double height,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       SizedBox(height: height),
      Text(
        title,
        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
      ),
      Text(subTitle, style: const TextStyle(fontSize: 22, color: Colors.grey)),
    ],
  );
}
