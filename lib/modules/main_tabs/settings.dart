import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stock_app/constants/secure_storage_path.dart';
import 'package:stock_app/providers/theme_provider.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends ConsumerState<SettingsPage> {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  late bool isActive;

  storeThemeMode() async {
    await storage.write(
        key: SecureStoragePath.themeMode, value: isActive.toString());
  }

  @override
  void initState() {
    isActive = ref.read(themeNotifierProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Text(
            'Settings',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Dark mode",
                    style: TextStyle(fontSize: 20),
                  ),
                  Switch(
                      activeColor: isActive ? Colors.white : Colors.black,
                      value: isActive,
                      onChanged: (value) {
                        setState(() {
                          isActive = !isActive;
                          ref
                              .read(themeNotifierProvider.notifier)
                              .toggleTheme();
                          storeThemeMode();
                        });
                      }),
                ],
              ),
            ),
          ],
        ));
  }
}
