import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/modules/buy_limit.dart';
import 'package:stock_app/modules/buy_market.dart';
import 'package:stock_app/modules/buy_oto.dart';
import 'package:stock_app/modules/buy_stop.dart';
import 'package:stock_app/utils/helpers/widgets/common_Text.dart';
import 'package:stock_app/utils/helpers/widgets/common_button.dart';
import 'package:stock_app/utils/helpers/widgets/common_sub_text.dart';
import 'package:stock_app/utils/helpers/widgets/common_tab_bar.dart';

class BuyStockPage extends StatefulWidget {
  const BuyStockPage({super.key, this.data});

  final dynamic data;

  @override
  State<BuyStockPage> createState() => _BuyStockPageState();
}

class _BuyStockPageState extends State<BuyStockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/icons/back.png",
              width: 28,
              height: 28,
              color: Theme.of(context).primaryColor,
            )),
        title: Column(
          children: [
            Text(
              'Buy stock',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor),
            ),
            CommonLabel(
              label: widget.data['description'],
              fontSize: 16,
              fontColor: StockAppColors.textGrey,
            )
          ],
        ),
        actions: [
          IconButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/icons/help.png",
                width: 32,
                height: 32,
                color: Theme.of(context).primaryColor,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? StockAppColors.black
                    : StockAppColors.whiteBackground,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? StockAppColors.blackBg
                                  : StockAppColors.lightGrey,
                              borderRadius: BorderRadius.circular(50)),
                          child: Image.asset(widget.data['logo'],
                              color: Theme.of(context).primaryColor),
                        ),
                        const SizedBox(width: 10),
                        CommonLabel(
                            label: widget.data['name'],
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontColor: Theme.of(context).primaryColor)
                      ],
                    ),
                    Row(
                      children: [
                        CommonText(
                          text: widget.data['value'].toString(),
                          fontWeight: FontWeight.w400,
                          fontColor: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? StockAppColors.textGrey
                                  : StockAppColors.lightGrey,
                              borderRadius: BorderRadius.circular(50)),
                          child: Image.asset(
                            "assets/icons/reload.png",
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            const CommonTabBar(widgetOptions: [
              BuyMarketPage(),
              BuyLimitPage(),
              BuyStopPage(),
              BuyOTOPage()
            ], widgetLabels: [
              "Market",
              "Limit",
              "Stop",
              "OTO"
            ]),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    textColor: Theme.of(context).brightness == Brightness.dark
                        ? StockAppColors.black
                        : Colors.white,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : StockAppColors.black,
                    padding: 20,
                    radius: 32,
                    fontSize: 16,
                    onButtonPressed: () {},
                    label: "Confirm purchase",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
