import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';

class CommonText extends StatelessWidget {
  const CommonText(
      {super.key,
      required this.text,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w500,
      this.fontColor = StockAppColors.textBlack,
      this.labelSize = 12,
      this.labelWeight = FontWeight.w400,
      this.labelColor = StockAppColors.textDarkGrey,
      this.gap = 1,
      this.letterSpacing = -0.5});

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final double labelSize;
  final FontWeight labelWeight;
  final Color labelColor;
  final double gap;
  final double letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$',
          style: TextStyle(
            fontSize: labelSize,
            fontWeight: labelWeight,
            color: labelColor,
          ),
        ),
        SizedBox(width: gap),
        Text(
          text,
          // style: Theme.of(context).textTheme.bodyLarge,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: fontColor,
              letterSpacing: letterSpacing),
        ),
      ],
    );
  }
}
