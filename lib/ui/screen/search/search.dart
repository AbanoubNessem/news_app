import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/apiCubit/ApiState.dart';
import '../../../shared/apiCubit/apiCubit.dart';
import '../../../shared/models/ArtRespons.dart';
import '../../../shared/models/category.dart';
import '../../../shared/style/appStyle.dart';
import '../../components/categoryItem/categoryItem.dart';
import '../../components/newsItem/newsItem.dart';
import '../home/home.dart';

class SearchPage extends StatelessWidget {
  static String routeName = "SearchPage" ;
  String searchText ="";
  var _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ApiCubit(),
      child: BlocConsumer<ApiCubit, ApiStates>(listener: (context, state) {
        if (state is SearchArtState) print('done');
      }, builder: (context, state) {
        // if (ApiCubit.get(context).sources.isEmpty) {
        //   ApiCubit.get(context).getSources(args.cat);
        // }
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.08,
            shape: const RoundedRectangleBorder(
                borderRadius:  BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            title: TextFormField(
              controller: _controller,
              onChanged: (value){
                searchText = value;

              },
              decoration: InputDecoration(
                prefixIcon: InkWell(
                  onTap: (){
                    _controller.clear();
                  },
                    child: Icon(Icons.clear,color: AppStyle.lightTheme.backgroundColor)),
                suffixIcon: Icon(Icons.search,color: AppStyle.lightTheme.backgroundColor,),
                focusColor: AppStyle.lightTheme.backgroundColor,
                hintText: "Search",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),


            backgroundColor: AppStyle.lightTheme.appBarTheme.backgroundColor,
// backgroundColor: AppStyle.lightPrimaryColor,
          ),
          body: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.03),
            child: Column(
              children: [
                FutureBuilder<ArtRespons?>(
                    future:ApiCubit.get(context).SearchArt(searchText),
                    builder: (context, snapShot){
                      if(snapShot.hasError){
                        return Text('Some went please try again');
                      }else if(snapShot.hasData){
                        return Expanded(
                          child: ListView.builder(
                              itemCount: snapShot.data!.articles!.length,
                              itemBuilder:(context , index){
                                return NewsItem(snapShot.data!.articles!.elementAt(index),index);
                              }
                          ),
                        );
                      }else if(snapShot.connectionState == ConnectionState.none){
                        return Text('Some went please try again');
                      }else {
                        return CircularProgressIndicator();
                      }
                    }
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}










