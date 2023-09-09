import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/utils/helpers/widgets/common_Text.dart';
import 'package:stock_app/utils/helpers/widgets/common_chart.dart';
import 'package:stock_app/utils/helpers/widgets/common_icon_text.dart';

class CommonList extends StatelessWidget {
  const CommonList(
      {super.key,
      required this.name,
      required this.description,
      required this.value,
      required this.percentage,
      required this.logo,
      this.onButtonpressed});

  final String logo;
  final String name;
  final String description;
  final double value;
  final double percentage;
  final VoidCallback? onButtonpressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonpressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(225, 225, 225, 1),
                      borderRadius: BorderRadius.circular(50)),
                  child: Image.asset(logo),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(name.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(description,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? StockAppColors.textGrey
                                  : StockAppColors.textDarkGrey)),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 54.5,
                  height: 27.5,
                  child: CommonChart(
                    color: percentage < 1
                        ? StockAppColors.red
                        : StockAppColors.green,
                    spots: const [
                      FlSpot(0, 3),
                      FlSpot(1, 1),
                      FlSpot(2, 4),
                      FlSpot(3, 2),
                      FlSpot(4, 6),
                      FlSpot(5, 8),
                      FlSpot(6, 5),
                      FlSpot(7, 4),
                      FlSpot(8, 7),
                      FlSpot(10, 2)
                    ],
                  ),
                ),
                const SizedBox(width: 23.5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CommonText(
                        text: value.toString(),
                        fontColor: Theme.of(context).primaryColor,
                        labelColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? StockAppColors.textGrey
                                : StockAppColors.textDarkGrey),
                    CommonIconText(
                      icon: percentage < 1
                          ? "assets/icons/down.png"
                          : "assets/icons/up.png",
                      text: '$percentage%',
                      fontColor: percentage < 1
                          ? StockAppColors.red
                          : StockAppColors.green,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
