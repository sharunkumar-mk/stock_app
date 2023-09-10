import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_app/modules/main_tabs/analytics.dart';
import 'package:stock_app/modules/main_tabs/home.dart';
import 'package:stock_app/modules/main_tabs/market.dart';
import 'package:stock_app/modules/main_tabs/portfolio.dart';
import 'package:stock_app/modules/main_tabs/settings.dart';
import 'package:stock_app/providers/theme_provider.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends ConsumerState<DashboardPage>
    with SingleTickerProviderStateMixin {
  static const List<Widget> widgetOptions = <Widget>[
    HomePage(),
    MarketPage(),
    AnalyticsPage(),
    PortfolioPage(),
    SettingsPage()
  ];
  late final tabController =
      TabController(length: widgetOptions.length, vsync: this);
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
        // backgroundColor: Colors.white,
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: widgetOptions,
        ),
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = 0;
                            tabController.animateTo(0);
                          });
                        },
                        icon: selectedIndex == 0
                            ? Image.asset(
                                "assets/icons/home_active.png",
                                width: 25,
                                color: Theme.of(context).iconTheme.color,
                              )
                            : Image.asset(
                                "assets/icons/home.png",
                                width: 25,
                                color: Theme.of(context).iconTheme.color,
                              )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = 1;
                            tabController.animateTo(1);
                          });
                        },
                        icon: selectedIndex == 1
                            ? Image.asset(
                                "assets/icons/document_active.png",
                                width: 25,
                                color: Theme.of(context).iconTheme.color,
                              )
                            : Image.asset(
                                "assets/icons/document.png",
                                width: 25,
                                color: Theme.of(context).iconTheme.color,
                              )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = 2;
                            tabController.animateTo(2);
                          });
                        },
                        icon: selectedIndex == 2
                            ? Image.asset(
                                "assets/icons/chart_active.png",
                                width: 25,
                                color: Theme.of(context).iconTheme.color,
                              )
                            : Image.asset(
                                "assets/icons/chart.png",
                                width: 25,
                                color: Theme.of(context).iconTheme.color,
                              )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = 3;
                            tabController.animateTo(3);
                          });
                        },
                        icon: selectedIndex == 3
                            ? Image.asset(
                                "assets/icons/pie-chart_active.png",
                                width: 25,
                                color: Theme.of(context).iconTheme.color,
                              )
                            : Image.asset(
                                "assets/icons/pie-chart.png",
                                width: 25,
                                color: Theme.of(context).iconTheme.color,
                              )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = 4;
                            tabController.animateTo(4);
                          });
                        },
                        icon: selectedIndex == 4
                            ? Image.asset(
                                "assets/icons/settings_active.png",
                                width: 25,
                                color: Theme.of(context).iconTheme.color,
                              )
                            : Image.asset(
                                "assets/icons/settings.png",
                                width: 25,
                                color: Theme.of(context).iconTheme.color,
                              )),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
