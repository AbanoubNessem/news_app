import 'package:flutter/material.dart';
import 'package:news_app/shared/models/SourcesRespons.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool selected;
  TabItem({required this.source, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
      decoration: BoxDecoration(
        border:
            Border.all(width: 1, color: selected ? Colors.white : Colors.green),
        borderRadius: BorderRadius.circular(25),
        color: selected ? Colors.green : Colors.white,
      ),
      child: Text(
        source.name ?? "Unknown",
        style: TextStyle(
            fontSize: 18, color: selected ? Colors.white : Colors.green),
      ),
    );
  }
}
