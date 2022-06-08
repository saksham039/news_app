import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/models/apifinance.dart';

class financeProvider with ChangeNotifier {
  bool isLoading = false;
  List<news> finance = [];
  financeProvider() {
    fetchFinance();
  }
  void fetchFinance() async {
    List<news> temp = [];
    var response = await ApiFinance.getFinance();
    for (var article in response) {
      news c = news.fromJSON(article);
      temp.add(c);
    }
    finance = temp;
    isLoading = false;
    
    notifyListeners();
    Timer(Duration(minutes: 20), () {
      fetchFinance();
    });
  }
}
