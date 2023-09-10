import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';

class CommonTabBar extends StatefulWidget {
  const CommonTabBar(
      {super.key,
      required this.widgetOptions,
      required this.widgetLabels,
      this.horizontalPadding = 0});

  final List<Widget> widgetOptions;
  final List<String> widgetLabels;
  final double horizontalPadding;

  @override
  State<CommonTabBar> createState() => _CommonTabBarState();
}

class _CommonTabBarState extends State<CommonTabBar>
    with SingleTickerProviderStateMixin {
  late final tabController =
      TabController(length: widget.widgetOptions.length, vsync: this);
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
        child: Column(
          children: [
            Container(
              height: 36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? StockAppColors.black
                      : StockAppColors.whiteBackground),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (var labels in widget.widgetLabels)
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Material(
                                  color: selectedIndex ==
                                          widget.widgetLabels.indexOf(labels)
                                      ? Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? StockAppColors.blackDark
                                          : Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(6),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(6),
                                    onTap: () {
                                      setState(() {
                                        selectedIndex =
                                            widget.widgetLabels.indexOf(labels);

                                        tabController.animateTo(widget
                                            .widgetLabels
                                            .indexOf(labels));
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Center(
                                          child: Text(
                                        labels.toString(),
                                        style: TextStyle(
                                            color: selectedIndex ==
                                                    widget.widgetLabels
                                                        .indexOf(labels)
                                                ? Theme.of(context)
                                                            .brightness ==
                                                        Brightness.dark
                                                    ? StockAppColors.white
                                                    : StockAppColors.textBlack
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
                ],
              ),
            ),
            const SizedBox(height: 16),
            Flexible(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: widget.widgetOptions,
              ),
            )
          ],
        ),
      ),
    );
  }
}
