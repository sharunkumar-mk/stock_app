import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/utils/helpers/widgets/common_text.dart';

class CommonBulletList extends StatelessWidget {
  const CommonBulletList(
      {super.key,
      required this.name,
      required this.description,
      required this.percentage,
      required this.value,
      this.color = 0xffE6584E});

  final String name;
  final String description;
  final int percentage;
  final double value;
  final int color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                  color: Color(color),
                  borderRadius: BorderRadius.circular(100)),
            ),
            const SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -1.5,
                      color: Theme.of(context).primaryColor),
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? StockAppColors.textGrey
                          : StockAppColors.textDarkGrey,
                      letterSpacing: -0.2),
                )
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$percentage%',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -1.5,
                  color: Theme.of(context).primaryColor),
            ),
            CommonText(
              text: value.toString(),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              gap: 1,
              fontColor: Theme.of(context).brightness == Brightness.dark
                  ? StockAppColors.textGrey
                  : StockAppColors.textDarkGrey,
            )
          ],
        )
      ],
    );
  }
}
