import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stock_app/constants/colors.dart';
import 'package:stock_app/constants/routes_path.dart';
import 'package:stock_app/providers/theme_provider.dart';
import 'package:stock_app/widgets/common_button.dart';

class LandingPage extends ConsumerStatefulWidget {
  const LandingPage({super.key});

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends ConsumerState<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeNotifierProvider);
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: isDarkMode
                ? const AssetImage(
                    "assets/images/bg_black.png",
                  )
                : const AssetImage(
                    "assets/images/bg_white.png",
                  )),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text("Investo",
                        style: GoogleFonts.manjari(
                            fontSize: 48,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 82),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: ' Monitor ',
                      style: TextStyle(
                          fontSize: 40,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -2.5),
                    ),
                    TextSpan(
                        text: 'Your\n Portfolio and Track\n Market ',
                        style: TextStyle(
                            color: isDarkMode
                                ? StockAppColors.textGrey
                                : StockAppColors.textDarkGrey,
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -2.5)),
                    TextSpan(
                        text: 'Trends',
                        style: TextStyle(
                            fontSize: 40,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -2.5))
                  ])),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text(
                'Join our community of traders and investors to share ideas , startegies, and  insights that can help you achieve your financial goals',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                  color: const Color(0xff1E1A17),
                                  borderRadius: BorderRadius.circular(50)),
                              child:
                                  Image.asset("assets/icons/google_logo.png")),
                          const SizedBox(width: 8),
                          Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                  color: const Color(0xff1E1A17),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Image.asset(
                                  "assets/icons/facebook_logo.png")),
                        ],
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CommonButton(
                          radius: 50,
                          padding: 18,
                          onButtonPressed: () {
                            Navigator.pushReplacementNamed(
                                context, dashboardScreen);
                          },
                          label: 'Let’s go',
                          fontSize: 16,
                          textColor: isDarkMode
                              ? StockAppColors.black
                              : StockAppColors.white,
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ))
                  ],
                )
              ],
            ),
            const SizedBox(height: 27)
          ],
        ),
      ),
    ));
  }
}
