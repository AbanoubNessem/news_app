import 'package:flutter/material.dart';
import 'package:news_app/shared/models/category.dart';
import 'package:news_app/shared/style/appStyle.dart';
import 'package:news_app/ui/components/categoryItem/categoryItem.dart';

class Home extends StatelessWidget {
  static String routeName = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50))),
        title: Text("News App"),
        centerTitle: true,
        // leading: Icon(Icons.list,size: 30,),
        backgroundColor: AppStyle.lightTheme.appBarTheme.backgroundColor,
        // backgroundColor: AppStyle.lightPrimaryColor,
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/background.png",
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Text("Pick Your Category Of Interst",style: AppStyle.lightTheme.textTheme.titleMedium,),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                Expanded(
                  child: GridView.builder(
                    itemCount: 6,
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                          crossAxisCount: 2
                      ) ,
                      itemBuilder: (context , index){
                        return CategoryItem(Category.categories[index]);
                      }
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
