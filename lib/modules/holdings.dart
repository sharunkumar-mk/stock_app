import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/modules/trending.dart';
import 'package:stock_app/utils/helpers/widgets/common_Text.dart';
import 'package:stock_app/utils/helpers/widgets/common_bullet_list.dart';
import 'package:stock_app/utils/helpers/widgets/common_circular_chart.dart';
import 'package:stock_app/utils/helpers/widgets/common_icon_text.dart';

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
            const Positioned(
              top: 100,
              left: 120,
              child: Column(
                children: [
                  CommonText(
                    text: "15,901.24",
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    labelSize: 20,
                  ),
                  Row(
                    children: [
                      CommonIconText(
                        text: "0.42%",
                      ),
                      Text("(\$", style: TextStyle(fontSize: 16)),
                      SizedBox(width: 1),
                      Text(
                        "6.25)",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 180,
              child: Container(
                decoration: BoxDecoration(
                    color: StockAppColors.whiteBackground,
                    borderRadius: BorderRadius.circular(12)),
                height: 250,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
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
                              const Divider(
                                  thickness: 2,
                                  color: StockAppColors.greyBorder),
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Stock",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.5,
              ),
            ),
            Text(
              "Performance",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.5,
              ),
            ),
            Text(
              "Price/Change",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const Divider(thickness: 2, color: StockAppColors.greyBorder),
        const Expanded(child: TrendingPage())
      ],
    );
  }
}
