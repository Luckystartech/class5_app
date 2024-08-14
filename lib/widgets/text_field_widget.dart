import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF148d8c);

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.maxLines,
    required this.fieldTitle,
    required this.controller,
  });

  final int maxLines;
  final String fieldTitle;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldTitle,
          style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(border: OutlineInputBorder()),
        ),

      ],
    );
  }
}
