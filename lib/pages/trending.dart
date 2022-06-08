import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/providers/themeprovider.dart';
import 'package:news_app/providers/trend_provider.dart';
import 'package:provider/provider.dart';

class trending extends StatefulWidget {
  const trending({Key? key}) : super(key: key);

  @override
  State<trending> createState() => _trendingState();
}

class _trendingState extends State<trending> {
  @override
  Widget build(BuildContext context) {
    return Consumer<trendProvider>(builder: (context, trendProvider, child) {
      if (trendProvider.isLoading == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        if (trendProvider.newsTrending.length > 0) {
          return ListView.builder(
              itemCount: trendProvider.newsTrending.length,
              itemBuilder: (context, index) {
                news current = trendProvider.newsTrending[index];
                return Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Card(
                    elevation: 0,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Builder(builder: (context) {
                          String? img = current.urlToImage;
                          if (img == null) {
                            return SizedBox(
                              height: 0,
                            );
                          } else {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: NetworkImage(img),
                              ),
                            );
                          }
                        }),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          current.title ?? 'No Title',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Builder(builder: (context) {
                          String? des = current.description;
                          if (des == null) {
                            return Text('');
                          } else {
                            return Text(
                              des,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            );
                          }
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Center(
            child: Text(
              'Please check you network connection.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          );
        }
      }
    });
  }
}
