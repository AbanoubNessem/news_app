import 'package:flutter/material.dart';
import 'package:news_app/ui/components/NewsDiteals/newsDiteals.dart';
import 'package:news_app/ui/screen/home/home.dart';
import 'package:news_app/ui/screen/newsPage/newsPage.dart';
import 'package:news_app/ui/screen/search/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Home.routeName: (context) => Home(),
        NewsPage.routeName : (context)=> NewsPage(),
        NewsDiteals.routeName : (context)=> NewsDiteals(),
        SearchPage.routeName : (context)=> SearchPage(),
      },
      initialRoute: Home.routeName,
    );
  }
}