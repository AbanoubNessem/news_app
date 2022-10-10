import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/apiCubit/apiCubit.dart';
import 'package:news_app/shared/apiCubit/ApiState.dart';
import 'package:news_app/ui/components/categoryItem/categoryItem.dart';
import 'package:news_app/ui/components/listNews/listNews.dart';
import 'package:news_app/ui/components/tapItem/tapItem.dart';
import 'package:news_app/ui/screen/home/home.dart';
import 'package:news_app/ui/screen/search/search.dart';

import '../../../shared/style/appStyle.dart';

class NewsPage extends StatelessWidget {
  static String routeName = "NewsPage";
  @override
  Widget build(BuildContext context) {
    ArgCat args = ModalRoute.of(context)!.settings.arguments as ArgCat;
    return BlocProvider(
      create: (BuildContext context) => ApiCubit(),
      child: BlocConsumer<ApiCubit, ApiStates>(listener: (context, state) {
        if (state is GetResponsState) print('done');
      }, builder: (context, state) {
        if (ApiCubit.get(context).sources.isEmpty) {
          ApiCubit.get(context).getSources(args.cat);
        }
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.08,
            shape: const RoundedRectangleBorder(
                borderRadius:  BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            title: const Text("News App"),
            actions:  [
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, SearchPage.routeName);
                },
                  child: Icon(Icons.search, size: 30)),
              SizedBox(
                width: 10,
              ),
            ],
            centerTitle: true,
            // leading: Icon(
            //   Icons.list,
            //   size: 30,
            // ),
            backgroundColor: AppStyle.lightTheme.appBarTheme.backgroundColor,
            // backgroundColor: AppStyle.lightPrimaryColor,
          ),
          drawer: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green
                  ),
                    child: Center(
                      child: Text(
                        "News App",
                        style: TextStyle(
                  color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                ),),
                    )),
                SizedBox(width: 12,),
                Padding(
                  padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
                  child: Row(
                    children: [
                      Icon(Icons.list,color: Colors.black,size: 30,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, Home.routeName);
                        },
                          child: Text(
                            "Categories",
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),))
                    ],
                  ),
                )
              ],
            ),
          ),
          body: ApiCubit.get(context).sources.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    Image.asset(
                      "assets/background.png",
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    DefaultTabController(
                      length: ApiCubit.get(context).sources.length,
                      child: Column(
                        children: [
                          TabBar(
                            tabs: ApiCubit.get(context).sources.map((source) {
                              return TabItem(
                                source: source,
                                selected: ApiCubit.get(context)
                                        .sources
                                        .indexOf(source) ==
                                    ApiCubit.get(context).currentIndex,
                              );
                            }).toList(),
                            isScrollable: true,
                            indicatorColor: Colors.transparent,
                            onTap: (index) {
                              ApiCubit.get(context).index(index);
                            },
                          ),
                          Expanded(
                            child: TabBarView(
                              // physics: ScrollPhysics(),
                              children: ApiCubit.get(context)
                                  .sources
                                  .map((e) => ListNews(e))
                                  .toList(),
                            ),
                          ),
                          // Text('${ApiCubit.get(context).sources.length}'),
                        ],
                      ),
                    )
                  ],
                ),
        );
      }),
    );
  }
}
