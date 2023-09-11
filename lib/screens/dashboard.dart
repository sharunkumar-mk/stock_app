import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_app/screens/tabs/analytics.dart';
import 'package:stock_app/screens/tabs/home.dart';
import 'package:stock_app/screens/tabs/market.dart';
import 'package:stock_app/screens/tabs/portfolio.dart';
import 'package:stock_app/screens/tabs/settings.dart';
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

  List<NavItems> navItems = [
    NavItems(
        active: "assets/icons/home_active.png",
        inActive: "assets/icons/home.png"),
    NavItems(
        active: "assets/icons/document_active.png",
        inActive: "assets/icons/document.png"),
    NavItems(
        active: "assets/icons/chart_active.png",
        inActive: "assets/icons/chart.png"),
    NavItems(
        active: "assets/icons/pie-chart_active.png",
        inActive: "assets/icons/pie-chart.png"),
    NavItems(
        active: "assets/icons/settings_active.png",
        inActive: "assets/icons/settings.png")
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
                    for (var item in navItems)
                      IconButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = navItems.indexOf(item);
                              tabController.animateTo(navItems.indexOf(item));
                            });
                          },
                          icon: selectedIndex == navItems.indexOf(item)
                              ? Image.asset(
                                  item.active,
                                  width: 25,
                                  color: Theme.of(context).iconTheme.color,
                                )
                              : Image.asset(
                                  item.inActive,
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

class NavItems {
  final String active;
  final String inActive;
  NavItems({required this.active, required this.inActive});
}
