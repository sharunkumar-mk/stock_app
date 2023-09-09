import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeNotifierProvider =
    StateNotifierProvider<ThemeProvider, bool>((ref) => ThemeProvider());

class ThemeProvider extends StateNotifier<bool> {
  ThemeProvider() : super(false);
  void toggleTheme() {
    state = !state;
  }
}
