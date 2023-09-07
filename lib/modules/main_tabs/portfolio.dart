import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/modules/history.dart';
import 'package:stock_app/modules/holdings.dart';
import 'package:stock_app/modules/performance.dart';
import 'package:stock_app/utils/helpers/widgets/common_tab_bar.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Portfolio',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: StockAppColors.textBlack),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/icons/menu.png",
                    width: 28,
                    height: 28,
                  )),
            )
          ],
        ),
        body: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              CommonTabBar(widgetOptions: [
                HoldingsPage(),
                PerformacePage(),
                HistoryPage()
              ], widgetLabels: [
                "Holding",
                "Performance",
                "History"
              ])
            ])));
  }
}
