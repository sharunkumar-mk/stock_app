import 'package:flutter/material.dart';
import 'package:stock_app/constants/routes_path.dart';
import 'package:stock_app/modules/buy_stock.dart';
import 'package:stock_app/modules/dashboard.dart';
import 'package:stock_app/modules/landing.dart';
import 'package:stock_app/modules/main_tabs/settings.dart';
import 'package:stock_app/modules/single_stock.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingScreen:
        return MaterialPageRoute(
          builder: (_) => const LandingPage(),
        );

      case dashboardScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardPage(),
        );

      case singleStockScreen:
        dynamic data = settings.arguments as dynamic;
        return MaterialPageRoute(
          builder: (_) => SingleStockPage(data: data),
        );

      case buyStockScreen:
        dynamic data = settings.arguments as dynamic;
        return MaterialPageRoute(
          builder: (_) => BuyStockPage(data: data),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route found for the name $settings.name',
              ),
            ),
          ),
        );
    }
  }
}
