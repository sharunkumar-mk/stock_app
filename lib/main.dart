import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stock_app/config/routes.dart';
import 'package:stock_app/constants/routes_path.dart';
import 'package:stock_app/constants/secure_storage_path.dart';
import 'package:stock_app/providers/theme_provider.dart';
import 'package:stock_app/utils/themes.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  getThemeMode() async {
    final darkMode = await storage.read(key: SecureStoragePath.themeMode);
    if (darkMode == 'true') {
      ref.read(themeNotifierProvider.notifier).toggleTheme();
    }
  }

  @override
  void initState() {
    getThemeMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = ref.watch(themeNotifierProvider);
    final appTheme = AppTheme();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: isDarkTheme ? appTheme.darkTheme : appTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: landingScreen,
    );
  }
}
