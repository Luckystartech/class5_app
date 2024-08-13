import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF148d8c);

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    super.key,
    required this.title,
    required this.hintText,
    required this.onPressed,
    required this.icon,
    required this.width,
  });

  final String title;
  final String hintText;
  final void Function() onPressed;
  final Icon icon;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: kPrimaryColor),
          ),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(hintText),
                IconButton(
                  onPressed: onPressed,
                  icon: icon,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
