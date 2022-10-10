

import 'dart:ui';

import 'package:flutter/material.dart';

class Category {
  String id;
  String imagePath;
  String nameCat;
  Color backgroundColor;
  bool isRight;

  Category({
    required this.id,
    required this.imagePath,
    required this.nameCat,
    required this.backgroundColor,
    required this.isRight
});
  static List<Category> categories = [
    Category(id: "sports", imagePath: "assets/ball.png", nameCat: "Sports", backgroundColor: Color(0xffC91C22), isRight: false),
    Category(id: "general", imagePath: "assets/Politics.png", nameCat: "General", backgroundColor: Color(0xff003E90), isRight: true),
    Category(id: "health", imagePath: "assets/health.png", nameCat: "Health", backgroundColor: Color(0xffED1E79), isRight: false),
    Category(id: "business", imagePath: "assets/bussines.png", nameCat: "Business", backgroundColor: Color(0xffCF7E48), isRight: true),
    Category(id: "entertainment", imagePath: "assets/environment.png", nameCat: "Entertainment", backgroundColor: Color(0xff4882CF), isRight: false),
    Category(id: "science", imagePath: "assets/science.png", nameCat: "Science", backgroundColor: Color(0xffF2D352), isRight: true),

  ];
}