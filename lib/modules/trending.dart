import 'package:flutter/material.dart';
import 'package:stock_app/constants/routes_path.dart';
import 'package:stock_app/utils/helpers/widgets/common_list.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  List<dynamic> trendingData = [
    {
      "logo": "assets/icons/nike.png",
      "name": "NIKE",
      "description": "Nike Inc",
      "value": 10.0,
      "percentage": 1.0
    },
    {
      "logo": "assets/icons/adidas.png",
      "name": "ADIDAS",
      "description": "Spordy Technology Inc",
      "value": 10.0,
      "percentage": 2.5
    },
    {
      "logo": "assets/icons/apple.png",
      "name": "AAPL",
      "description": "Apple Inc",
      "value": 10.0,
      "percentage": 0.5
    },
    {
      "logo": "assets/icons/tesla.png",
      "name": "TESLA",
      "description": "Tesla Motors Inc",
      "value": 10.0,
      "percentage": 0.8
    },
    {
      "logo": "assets/icons/paypal.png",
      "name": "PYPL",
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
    {
      "logo": "assets/icons/amazon.png",
      "name": "AMAZON",
      "description": "Amazone Inc",
      "value": 10.0,
      "percentage": 0.9
    }
  ];

  onButtonpressed({required String type, dynamic data}) {
    if (type == 'OPEN_STOCK') {
      Navigator.pushNamed(context, singleStockScreen, arguments: data);
      // Navigator.pushNamed(context, settingsScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var data in trendingData)
            CommonList(
                onButtonpressed: () {
                  onButtonpressed(type: "OPEN_STOCK", data: data);
                },
                logo: data['logo'],
                name: data['name'],
                description: data['description'],
                value: data['value'],
                percentage: data['percentage']),
        ],
      ),
    );
  }
}
