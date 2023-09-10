import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/widgets/common_sub_text.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CommonLabel(
              label: "Performance",
              fontSize: 16,
              fontColor: Theme.of(context).brightness == Brightness.dark
                  ? StockAppColors.textGrey
                  : StockAppColors.textDarkGrey,
            ),
            const SizedBox(width: 4),
            Image.asset("assets/icons/info.png")
          ],
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonLabel(
                      label: "Today’s Low",
                      fontSize: 12,
                      fontColor: Theme.of(context).brightness == Brightness.dark
                          ? StockAppColors.textGrey
                          : StockAppColors.textDarkGrey,
                    ),
                    CommonLabel(
                        label: "36.50",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontColor: Theme.of(context).primaryColor)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonLabel(
                        label: "Today’s High",
                        fontSize: 12,
                        fontColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? StockAppColors.textGrey
                                : StockAppColors.textDarkGrey),
                    CommonLabel(
                        label: "37.50",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontColor: Theme.of(context).primaryColor)
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? StockAppColors.blackLight
                          : StockAppColors.whiteBackground),
                  height: 4,
                ),
                Image.asset(
                  "assets/icons/polygon.png",
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonLabel(
                        label: "52 Week Low",
                        fontSize: 12,
                        fontColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? StockAppColors.textGrey
                                : StockAppColors.textDarkGrey),
                    CommonLabel(
                        label: "25.05",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontColor: Theme.of(context).primaryColor)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonLabel(
                        label: "52 Week High",
                        fontSize: 12,
                        fontColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? StockAppColors.textGrey
                                : StockAppColors.textDarkGrey),
                    CommonLabel(
                        label: "41.90",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontColor: Theme.of(context).primaryColor)
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? StockAppColors.blackLight
                          : StockAppColors.whiteBackground),
                  height: 4,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    "assets/icons/polygon.png",
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
