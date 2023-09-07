import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/utils/helpers/widgets/common_sub_text.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CommonSubText(label: "Performance", fontSize: 16),
            const SizedBox(width: 4),
            Image.asset("assets/icons/info.png")
          ],
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonSubText(
                      label: "Today’s Low",
                      fontSize: 12,
                    ),
                    CommonSubText(
                        label: "36.50",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontColor: StockAppColors.textBlack)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonSubText(
                      label: "Today’s High",
                      fontSize: 12,
                    ),
                    CommonSubText(
                      label: "37.50",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontColor: StockAppColors.textBlack,
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  decoration: const BoxDecoration(
                      color: StockAppColors.whiteBackground),
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonSubText(
                      label: "52 Week Low",
                      fontSize: 12,
                    ),
                    CommonSubText(
                      label: "25.05",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontColor: StockAppColors.textBlack,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonSubText(
                      label: "52 Week High",
                      fontSize: 12,
                    ),
                    CommonSubText(
                      label: "41.90",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontColor: StockAppColors.textBlack,
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  decoration: const BoxDecoration(
                      color: StockAppColors.whiteBackground),
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
