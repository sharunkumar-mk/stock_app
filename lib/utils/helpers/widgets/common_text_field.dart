import 'package:flutter/material.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/utils/helpers/widgets/common_sub_text.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({super.key, this.label = ''});

  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.right,
      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: CommonSubText(
            label: label,
            fontSize: 20,
            fontColor: StockAppColors.textBlack,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: StockAppColors.lightGrey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: StockAppColors.textBlack), // Border color when focused
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: StockAppColors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: StockAppColors.red),
        ),
      ),
    );
  }
}
