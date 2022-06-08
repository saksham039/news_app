import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/models/apisports.dart';

class sportProvider with ChangeNotifier {
  bool isLoading = false;
  List<news> sport = [];
  sportProvider() {
    fetchSports();
  }
  void fetchSports() async {
    List<news> temp = [];
    var response = await ApiSports.getSports();
    for (var article in response) {
      news c = news.fromJSON(article);
      temp.add(c);
    }
    sport = temp;
    //print(sport);
    isLoading = false;
    notifyListeners();
    Timer(Duration(minutes: 20), () {
      fetchSports();
    });
  }
}
