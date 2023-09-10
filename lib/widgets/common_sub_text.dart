import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';

class CommonLabel extends StatelessWidget {
  const CommonLabel(
      {super.key,
      required this.label,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w400,
      this.fontColor = StockAppColors.textDarkGrey});

  final String label;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor,
      ),
    );
  }
}
