import 'package:flutter/material.dart';
import 'package:news_app/shared/models/ArtRespons.dart';
import 'package:news_app/shared/models/SourcesRespons.dart';
import 'package:news_app/shared/style/appStyle.dart';
import 'package:news_app/ui/components/NewsDiteals/newsDiteals.dart';

class NewsItem extends StatelessWidget {
  Articles articles;
  int index;
  NewsItem(this.articles,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, NewsDiteals.routeName,arguments: ArgIndex(index: index, articles: articles));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(articles.urlToImage ??
                  "https://media4.s-nbcnews.com/i/newscms/2019_01/2705191/nbc-social-default_b6fa4fef0d31ca7e8bc7ff6d117ca9f4.png",),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              articles.source!.id ?? "Unknown",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              articles.title ?? "Unknown",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              articles.publishedAt ?? "Unknown",
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Divider(thickness: 2,
            color: AppStyle.lightTheme.backgroundColor,)
          ],
        ),
      ),
    );
  }
}
class ArgIndex{
 int index;
 Articles articles;
 ArgIndex({required this.index,required this.articles});

}
