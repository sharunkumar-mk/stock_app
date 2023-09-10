import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/constants/routes_path.dart';
import 'package:stock_app/modules/about.dart';
import 'package:stock_app/modules/news.dart';
import 'package:stock_app/modules/overview.dart';
import 'package:stock_app/modules/main_tabs/analytics.dart';
import 'package:stock_app/providers/theme_provider.dart';
import 'package:stock_app/utils/helpers/widgets/common_Text.dart';
import 'package:stock_app/utils/helpers/widgets/common_button.dart';
import 'package:stock_app/utils/helpers/widgets/common_chart.dart';
import 'package:stock_app/utils/helpers/widgets/common_icon_text.dart';
import 'package:stock_app/utils/helpers/widgets/common_tab_bar.dart';

class SingleStockPage extends ConsumerStatefulWidget {
  const SingleStockPage({
    super.key,
    this.data,
  });

  final dynamic data;

  @override
  SingleStockPageState createState() => SingleStockPageState();
}

class SingleStockPageState extends ConsumerState<SingleStockPage> {
  List<String> calenderData = ["1D", "1W", "3M", "6M", "1Y"];
  List<String> monthData = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeNotifierProvider);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: isDarkMode
                ? const AssetImage(
                    "assets/images/bg_black.png",
                  )
                : const AssetImage(
                    "assets/images/bg_white.png",
                  )),
      ),
      child: Scaffold(
          // backgroundColor: Colors.black,
          extendBody: true,
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
                  color: Theme.of(context).primaryColor,
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
                          color: Theme.of(context).primaryColor,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
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
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                widget.data['description'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? StockAppColors.textGrey
                                        : StockAppColors.textDarkGrey),
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
                            labelColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? StockAppColors.textGrey
                                    : StockAppColors.textDarkGrey,
                            fontColor: Theme.of(context).primaryColor),
                        Row(
                          children: [
                            const CommonIconText(
                              text: "0.42%",
                            ),
                            Text(
                              "(\$",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? StockAppColors.textGrey
                                      : StockAppColors.textDarkGrey),
                            ),
                            const SizedBox(width: 1),
                            Text(
                              "6.25)",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? StockAppColors.textGrey
                                      : StockAppColors.textDarkGrey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 6,
                color: Theme.of(context).dividerColor,
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
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? StockAppColors.black
                                    : StockAppColors.whiteBackground),
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
                                          ? Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? StockAppColors.blackDark
                                              : Colors.white
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
                                                        calenderData
                                                            .indexOf(item)
                                                    ? Theme.of(context)
                                                                .brightness ==
                                                            Brightness.dark
                                                        ? StockAppColors.white
                                                        : StockAppColors
                                                            .textBlack
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
                          color: Theme.of(context).brightness == Brightness.dark
                              ? StockAppColors.black
                              : StockAppColors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Image.asset(
                          "assets/icons/resize.png",
                          color: Theme.of(context).primaryColor,
                        ),
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
                        color: Theme.of(context).brightness == Brightness.dark
                            ? StockAppColors.black
                            : StockAppColors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Image.asset("assets/icons/candlesticks.png"),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
                color: Theme.of(context).dividerColor,
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
                        textColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? StockAppColors.black
                                : Colors.white,
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : StockAppColors.black,
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
          )),
    );
  }
}
