import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/pages/home.dart';
import 'package:news_app/providers/sport__provider.dart';
import 'package:news_app/providers/themeprovider.dart';
import 'package:news_app/providers/trend_provider.dart';
import 'package:provider/provider.dart';
import 'constants/localstorage.dart';
import 'constants/themes.dart';
import 'package:news_app/providers/finance_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String current = await localStorage.getTheme() ?? 'light';
  runApp(MyApp(
    currentTheme: current,
  ));
}

class MyApp extends StatelessWidget {
  final String currentTheme;
  MyApp({required this.currentTheme});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (create) => trendProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => themeProvider(currentTheme),
        ),
        ChangeNotifierProvider(
          create: (context) => sportProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => financeProvider(),
        ),
      ],
      child: Consumer<themeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            themeMode: themeProvider.type,
            theme: lightTheme,
            darkTheme: darktheme,
            home: homePage(),
          );
        },
      ),
    );
  }
}
