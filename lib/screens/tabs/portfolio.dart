import 'package:flutter/material.dart';
import 'package:stock_app/screens/history.dart';
import 'package:stock_app/screens/holdings.dart';
import 'package:stock_app/screens/performance.dart';
import 'package:stock_app/widgets/common_tab_bar.dart';

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
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Portfolio',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor),
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
