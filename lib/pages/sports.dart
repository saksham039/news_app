import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:provider/provider.dart';
import 'package:news_app/providers/sport__provider.dart';

class sports extends StatefulWidget {
  const sports({Key? key}) : super(key: key);

  @override
  State<sports> createState() => _sportsState();
}

class _sportsState extends State<sports> {
  @override
  Widget build(BuildContext context) {
    return Consumer<sportProvider>(builder: (context, sportProvider, child) {
      if (sportProvider.isLoading == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        if (sportProvider.sport.length > 0) {
          return ListView.builder(
            itemCount: sportProvider.sport.length,
            itemBuilder: (context, index) {
              news current = sportProvider.sport[index];
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
            },
          );
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
