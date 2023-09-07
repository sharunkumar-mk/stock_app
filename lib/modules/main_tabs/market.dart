import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/modules/gainers.dart';
import 'package:stock_app/modules/losers.dart';
import 'package:stock_app/modules/trending.dart';
import 'package:stock_app/utils/helpers/widgets/common_card.dart';
import 'package:stock_app/utils/helpers/widgets/common_sub_text.dart';
import 'package:stock_app/utils/helpers/widgets/common_tab_bar.dart';
import 'package:stock_app/utils/helpers/widgets/common_text_button.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage>
    with SingleTickerProviderStateMixin {
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

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Market',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: StockAppColors.textBlack),
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/icons/search.png",
                  width: 28,
                  height: 28,
                )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonSubText(label: "Watchlist"),
              CommonTextButton(label: "Edit list")
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
          const SizedBox(height: 24),
          const CommonTabBar(widgetLabels: [
            "Trending",
            "Gainers",
            "Losers",
          ], widgetOptions: [
            TrendingPage(),
            GainersPage(),
            LosersPage()
          ]),
        ]),
      ),
    );
  }
}
