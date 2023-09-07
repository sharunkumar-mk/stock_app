import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/utils/helpers/widgets/common_Text.dart';
import 'package:stock_app/utils/helpers/widgets/common_chart.dart';
import 'package:stock_app/utils/helpers/widgets/common_icon_text.dart';

class CommonCard extends StatelessWidget {
  const CommonCard(
      {super.key,
      required this.logo,
      required this.name,
      required this.description,
      required this.value,
      required this.percentage,
      required this.graphData});
  final String logo;
  final String name;
  final String description;
  final double value;
  final double percentage;
  final List<FlSpot> graphData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Container(
          width: 157,
          height: 169,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1.5, color: StockAppColors.lightGrey)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          width: 69,
                          child: Text(
                            name.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              color: StockAppColors.textBlack,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 78,
                          child: Text(
                            description,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 12, color: StockAppColors.textGrey),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        width: 132,
                        height: 53,
                        child: CommonChart(
                          color: percentage < 1
                              ? StockAppColors.red
                              : StockAppColors.green,
                          spots: graphData,
                        )),
                  ],
                ),
                const SizedBox(height: 11.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      text: value.toString(),
                      fontSize: 16,
                      labelSize: 10,
                    ),
                    CommonIconText(
                        icon: percentage < 1
                            ? "assets/icons/down.png"
                            : "assets/icons/up.png",
                        text: percentage.toString(),
                        fontColor: percentage < 1
                            ? StockAppColors.red
                            : StockAppColors.green)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
