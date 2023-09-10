import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/screens/trending.dart';

import 'package:stock_app/widgets/common_button.dart';
import 'package:stock_app/widgets/common_card.dart';
import 'package:stock_app/widgets/common_icon_text.dart';
import 'package:stock_app/widgets/common_sub_text.dart';
import 'package:stock_app/widgets/common_text.dart';
import 'package:stock_app/widgets/common_text_button.dart';

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
                color: Theme.of(context).primaryColor,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Investo",
                  style: GoogleFonts.manjari(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 2),
                ),
              ],
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
                      color: Theme.of(context).primaryColor,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/icons/search.png",
                      width: 28,
                      height: 28,
                      color: Theme.of(context).primaryColor,
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
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 26, bottom: 8),
                    child: CommonLabel(
                      label: "Your net worth",
                      fontColor: Theme.of(context).brightness == Brightness.dark
                          ? StockAppColors.textGrey
                          : StockAppColors.textDarkGrey,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                    text: "15,901.24",
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                    labelSize: 24,
                    labelWeight: FontWeight.w400,
                    fontColor: Theme.of(context).primaryColor,
                    labelColor: Theme.of(context).brightness == Brightness.dark
                        ? StockAppColors.textGrey
                        : StockAppColors.textDarkGrey),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const CommonIconText(text: '0.42%'),
                    CommonText(
                      text: "66.25",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontColor: Theme.of(context).brightness == Brightness.dark
                          ? StockAppColors.textGrey
                          : StockAppColors.textDarkGrey,
                      gap: 1,
                      labelSize: 14,
                      labelColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? StockAppColors.textGrey
                              : StockAppColors.textDarkGrey,
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
                    hasBorder: true,
                    horizontalPadding: 0,
                    verticalPadding: 0,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : StockAppColors.black,
                    labelWithIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/upload.png",
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? StockAppColors.black
                                    : Colors.white),
                        const SizedBox(width: 4),
                        Text(
                          "Deposit",
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? StockAppColors.black
                                  : Colors.white),
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
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? StockAppColors.black
                            : Colors.white,
                    labelWithIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/download.png",
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : StockAppColors.black,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Withdraw",
                          style: TextStyle(
                            fontSize: 14,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : StockAppColors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonLabel(
                  label: "My portfolio",
                  fontColor: Theme.of(context).brightness == Brightness.dark
                      ? StockAppColors.textGrey
                      : StockAppColors.textDarkGrey,
                ),
                const CommonTextButton(label: "View all")
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var item in portfolioData)
                    CommonCard(
                      borderColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? StockAppColors.borderBlack
                              : StockAppColors.lightGrey,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonLabel(
                  label: "Trending",
                  fontColor: Theme.of(context).brightness == Brightness.dark
                      ? StockAppColors.textGrey
                      : StockAppColors.textDarkGrey,
                ),
                const CommonTextButton(label: "View market")
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
