import 'package:flutter/material.dart';
import 'package:stock_app/widgets/common_text_field.dart';

class BuyMarketPage extends StatefulWidget {
  const BuyMarketPage({super.key});

  @override
  State<BuyMarketPage> createState() => _BuyMarketPageState();
}

class _BuyMarketPageState extends State<BuyMarketPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CommonTextField(
              label: 'Amount',
            ),
            SizedBox(height: 14),
            CommonTextField(label: 'Shares'),
          ],
        ),
      ),
    );
  }
}
