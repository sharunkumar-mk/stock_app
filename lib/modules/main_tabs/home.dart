import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/modules/trending.dart';
import 'package:stock_app/utils/helpers/widgets/common_Text.dart';
import 'package:stock_app/utils/helpers/widgets/common_button.dart';
import 'package:stock_app/utils/helpers/widgets/common_card.dart';
import 'package:stock_app/utils/helpers/widgets/common_icon_text.dart';
import 'package:stock_app/utils/helpers/widgets/common_sub_text.dart';
import 'package:stock_app/utils/helpers/widgets/common_text_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //mock data
  List<dynamic> portfolioData = [
    {
      "logo": "assets/icons/google.png",
      "name": "GOOGLE",
      "description": "Alphabet Inc..",
      "value": 232.0,
      "percentage": 2.0
    },
    {
      "logo": "assets/icons/tesla.png",
      "name": "TESLA",
      "description": "Tesla Motors Inc",
      "value": 10.0,
      "percentage": 10.0
    },
    {
      "logo": "assets/icons/netflix.png",
      "name": "NETFLIX",
      "description": "Spordy Technology Inc",
      "value": 10.0,
      "percentage": 0.2
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/icons/group.png",
                height: 44,
                width: 38,
              ),
            ),
            Text(
              "Investo",
              style: GoogleFonts.manjari(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: StockAppColors.textBlack),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/icons/notification.png",
                      width: 28,
                      height: 28,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/icons/search.png",
                      width: 28,
                      height: 28,
                    )),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 26, bottom: 8),
                    child: CommonSubText(label: "Your net worth")),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: "15,901.24",
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  labelSize: 24,
                  labelWeight: FontWeight.w400,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CommonIconText(text: '0.42%'),
                    CommonText(
                      text: "66.25",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontColor: StockAppColors.textGrey,
                      gap: 1,
                      labelSize: 14,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    onButtonPressed: () {},
                    hasIcon: true,
                    horizontalPadding: 0,
                    verticalPadding: 0,
                    labelWithIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/upload.png"),
                        const SizedBox(width: 4),
                        const Text(
                          "Deposit",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: CommonButton(
                    onButtonPressed: () {},
                    hasIcon: true,
                    hasBorder: true,
                    backgroundColor: Colors.white,
                    labelWithIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/download.png"),
                        const SizedBox(width: 4),
                        const Text(
                          "Withdraw",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonSubText(label: "My portfolio"),
                CommonTextButton(label: "View all")
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var item in portfolioData)
                    CommonCard(
                      logo: item['logo'],
                      name: item['name'],
                      percentage: item['percentage'],
                      value: item['value'],
                      description: item['description'],
                      graphData: const [
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
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonSubText(label: "Trending"),
                CommonTextButton(label: "View market")
              ],
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [TrendingPage()],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
