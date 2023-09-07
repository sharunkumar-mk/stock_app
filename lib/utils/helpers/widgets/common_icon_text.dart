import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';

class CommonIconText extends StatelessWidget {
  const CommonIconText(
      {super.key,
      required this.text,
      this.icon = 'assets/icons/up.png',
      this.fontSize = 16,
      this.fontColor = StockAppColors.green,
      this.fontWeight = FontWeight.w500});

  final String text;
  final String icon;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          width: 17.5,
          height: 9.5,
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
              fontSize: fontSize, fontWeight: fontWeight, color: fontColor),
        ),
      ],
    );
  }
}
