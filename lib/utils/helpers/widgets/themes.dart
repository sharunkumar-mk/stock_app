import 'package:flutter/material.dart';

import 'package:stock_app/constants/colors.dart';

class AppTheme {
  final lightTheme = ThemeData(
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    scaffoldBackgroundColor: Colors.transparent,
    brightness: Brightness.light,
    primaryColor: StockAppColors.black,
    dividerColor: StockAppColors.greyLight,
  );

  final darkTheme = ThemeData(
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    scaffoldBackgroundColor: Colors.transparent,
    brightness: Brightness.dark,
    primaryColor: StockAppColors.white,
    dividerColor: StockAppColors.divderDark,
  );
}
