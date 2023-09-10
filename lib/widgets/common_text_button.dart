import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';

class CommonTextButton extends StatelessWidget {
  const CommonTextButton(
      {super.key, required this.label, this.onButtonPressed});

  final String label;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: TextButton(
        style: const ButtonStyle(
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: onButtonPressed,
        child: Text(
          label,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: StockAppColors.blue),
        ),
      ),
    );
  }
}
