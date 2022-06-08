import 'package:flutter/material.dart';
import 'package:news_app/providers/themeprovider.dart';
import 'package:provider/provider.dart';

import 'trending.dart';
import 'sports.dart';
import 'finance.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin {
  late TabController control;
  @override
  void initState() {
    super.initState();
    control = TabController(length: 3, vsync: this);
  }

  Widget build(BuildContext context) {
    themeProvider themes = Provider.of<themeProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      themes.changeTheme();
                    },
                    icon: (themes.type == ThemeMode.dark)
                        ? Icon(Icons.light_mode)
                        : Icon(Icons.dark_mode),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TabBar(
                controller: control,
                tabs: [
                  Tab(
                    child: Text('Trending Today',
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                  Tab(
                    child: Text('Sports',
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                  Tab(
                    child: Text('Finance',
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: control,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  children: [
                    trending(),
                    sports(),
                    finance(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
