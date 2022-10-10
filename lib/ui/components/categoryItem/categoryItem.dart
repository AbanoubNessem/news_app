import 'package:flutter/material.dart';
import 'package:news_app/shared/models/category.dart';
import 'package:news_app/ui/screen/newsPage/newsPage.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsPage.routeName ,arguments: ArgCat(category.id));
      },
      child: Container(
        decoration: BoxDecoration(
            color: category.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomRight: category.isRight?Radius.circular(25):Radius.circular(0),
              bottomLeft: category.isRight?Radius.circular(0):Radius.circular(25)


            )),
        child: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
          child: Column(
            children: [
              Image.asset(category.imagePath,
                  height: MediaQuery.of(context).size.height*0.12,
                width: MediaQuery.of(context).size.width*0.3,
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              Text(category.nameCat,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}
class ArgCat{
  String cat;
  ArgCat(this.cat);
}
