import 'package:flutter/material.dart';
import 'package:news_app/constants/localstorage.dart';
import 'package:provider/provider.dart';

class themeProvider with ChangeNotifier {
  late ThemeMode type;

  themeProvider(String mode) {
    if (mode == 'light') {
      type = ThemeMode.light;
    } else {
      type = ThemeMode.dark;
    }
  }
  void changeTheme() async {
    if (type == ThemeMode.light) {
      type = ThemeMode.dark;
      await localStorage.saveTheme('dark');
    } else {
      type = ThemeMode.light;
      await localStorage.saveTheme('light');
    }
    notifyListeners();
  }
}
