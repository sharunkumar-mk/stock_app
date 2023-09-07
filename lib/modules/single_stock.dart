import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/constants/routes_path.dart';
import 'package:stock_app/modules/about.dart';
import 'package:stock_app/modules/news.dart';
import 'package:stock_app/modules/overview.dart';
import 'package:stock_app/modules/main_tabs/analytics.dart';
import 'package:stock_app/utils/helpers/widgets/common_Text.dart';
import 'package:stock_app/utils/helpers/widgets/common_button.dart';
import 'package:stock_app/utils/helpers/widgets/common_chart.dart';
import 'package:stock_app/utils/helpers/widgets/common_icon_text.dart';
import 'package:stock_app/utils/helpers/widgets/common_tab_bar.dart';

class SingleStockPage extends StatefulWidget {
  const SingleStockPage({
    super.key,
    this.data,
  });

  final dynamic data;

  @override
  State<SingleStockPage> createState() => _SingleStockPageState();
}

class _SingleStockPageState extends State<SingleStockPage> {
  List<String> calenderData = ["1D", "1W", "3M", "6M", "1Y"];
  List<String> monthData = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/icons/back.png",
                width: 28,
                height: 28,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/icons/star.png",
                        width: 28,
                        height: 28,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/icons/menu.png",
                        width: 28,
                        height: 28,
                      )),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: StockAppColors.textBlack,
                            borderRadius: BorderRadius.circular(50)),
                        child: Image.asset(
                          widget.data['logo'],
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              widget.data['name'].toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: StockAppColors.textBlack,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: Text(
                              widget.data['description'],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: StockAppColors.textGrey),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CommonText(
                        text: widget.data['value'].toString(),
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        labelSize: 20,
                      ),
                      const Row(
                        children: [
                          CommonIconText(
                            text: "0.42%",
                          ),
                          Text("(\$",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          SizedBox(width: 1),
                          Text(
                            "6.25)",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 6,
              color: StockAppColors.greyDark,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 36,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: StockAppColors.whiteBackground),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (var item in calenderData)
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Material(
                                    color: selectedIndex ==
                                            calenderData.indexOf(item)
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(4),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(4),
                                      onTap: () {
                                        setState(() {
                                          selectedIndex =
                                              calenderData.indexOf(item);
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Center(
                                            child: Text(
                                          item,
                                          style: TextStyle(
                                              color: selectedIndex ==
                                                      calenderData.indexOf(item)
                                                  ? StockAppColors.textBlack
                                                  : StockAppColors
                                                      .textLightkGrey),
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ]),
                    ),
                    Container(
                      height: 36,
                      width: 40,
                      decoration: BoxDecoration(
                        color: StockAppColors.whiteBackground,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.asset("assets/icons/resize.png"),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 200,
              child: CommonChart(
                spots: [
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [for (var item in monthData) Text(item)],
                    ),
                  ),
                  Container(
                    height: 36,
                    width: 40,
                    decoration: BoxDecoration(
                      color: StockAppColors.whiteBackground,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.asset("assets/icons/candlesticks.png"),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: StockAppColors.greyDark,
            ),
            const SizedBox(height: 24),
            const CommonTabBar(horizontalPadding: 22, widgetOptions: [
              OverviewPage(),
              NewsPage(),
              AnalyticsPage(),
              AboutPage()
            ], widgetLabels: [
              "Overview",
              "News",
              "Analytics",
              "About"
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      fontSize: 16,
                      radius: 32,
                      padding: 20,
                      onButtonPressed: () {
                        Navigator.pushNamed(context, buyStockScreen,
                            arguments: widget.data);
                      },
                      label: "Buy Now",
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ));
  }
}
