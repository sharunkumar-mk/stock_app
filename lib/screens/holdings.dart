import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/screens/trending.dart';
import 'package:stock_app/widgets/common_bullet_list.dart';
import 'package:stock_app/widgets/common_circular_chart.dart';
import 'package:stock_app/widgets/common_icon_text.dart';
import 'package:stock_app/widgets/common_text.dart';

class HoldingsPage extends StatefulWidget {
  const HoldingsPage({super.key});

  @override
  State<HoldingsPage> createState() => _HoldingsPageState();
}

class _HoldingsPageState extends State<HoldingsPage> {
  List<dynamic> holdingData = [
    {
      "logo": "assets/icons/google.png",
      "name": "GOOGLE",
      "description": "Alphabet Inc..",
      "value": 4134.32,
      "percentage": 41,
      "color": 0xff007AFF
    },
    {
      "logo": "assets/icons/tesla.png",
      "name": "TESLA",
      "description": "Tesla Motors Inc",
      "value": 4134.32,
      "percentage": 26,
      "color": 0xff259678
    },
    {
      "logo": "assets/icons/netflix.png",
      "name": "NETFLIX",
      "description": "Spordy Technology Inc",
      "value": 2703.21,
      "percentage": 17,
      "color": 0xffFFBB56
    },
    {
      "logo": "assets/icons/paypal.png",
      "name": "PYPL",
      "description": "Paypal Inc",
      "value": 2546.20,
      "percentage": 16,
      "color": 0xffE6584E
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 150),
                child: SizedBox(height: 280, child: CommonCircularChart()),
              ),
            ),
            Positioned(
              top: 100,
              left: 120,
              child: Column(
                children: [
                  CommonText(
                      text: "15,901.24",
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      labelSize: 20,
                      fontColor: Theme.of(context).primaryColor),
                  Row(
                    children: [
                      const CommonIconText(
                        text: "0.42%",
                      ),
                      const Text("(\$", style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 1),
                      Text(
                        "6.25)",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? StockAppColors.textGrey
                              : StockAppColors.textDarkGrey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned.fill(
              top: 180,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? StockAppColors.blackBg
                        : StockAppColors.whiteBackground,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var item in holdingData)
                          Column(
                            children: [
                              CommonBulletList(
                                name: item['name'],
                                description: item['description'],
                                percentage: item['percentage'],
                                value: item['value'],
                                color: item['color'],
                              ),
                              Divider(
                                  thickness: 2,
                                  color: Theme.of(context).dividerColor),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Stock",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.5,
                color: Theme.of(context).brightness == Brightness.dark
                    ? StockAppColors.textGrey
                    : StockAppColors.textDarkGrey,
              ),
            ),
            Text(
              "Performance",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.5,
                color: Theme.of(context).brightness == Brightness.dark
                    ? StockAppColors.textGrey
                    : StockAppColors.textDarkGrey,
              ),
            ),
            Text(
              "Price/Change",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.5,
                color: Theme.of(context).brightness == Brightness.dark
                    ? StockAppColors.textGrey
                    : StockAppColors.textDarkGrey,
              ),
            ),
          ],
        ),
        Divider(thickness: 2, color: Theme.of(context).dividerColor),
        const Expanded(child: TrendingPage())
      ],
    );
  }
}
