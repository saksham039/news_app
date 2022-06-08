import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/models/apitrending.dart';

class trendProvider with ChangeNotifier {
  bool isLoading = true;

  List<news> newsTrending = [];

  trendProvider() {
    fetchTrending();
  }

  void fetchTrending() async {
    List<dynamic> api = await ApiTrend.getTrending();
    List<news> temp = [];
    for (var article in api) {
      news articles = news.fromJSON(article);
      temp.add(articles);
    }
    isLoading = false;
    newsTrending = temp;
    
    notifyListeners();
    Timer(Duration(minutes: 20), () {
      fetchTrending();
    });
  }
}
