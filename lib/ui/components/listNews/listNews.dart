import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/apiCubit/ApiState.dart';
import 'package:news_app/shared/apiCubit/apiCubit.dart';
import 'package:news_app/shared/models/ArtRespons.dart';
import 'package:news_app/shared/models/SourcesRespons.dart';
import 'package:news_app/ui/components/newsItem/newsItem.dart';

class ListNews extends StatelessWidget {
  Source source;
  ListNews(this.source);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ApiCubit(),
      child: BlocConsumer<ApiCubit, ApiStates>(listener: (context, state) {
        if (state is GetResponsArtState) print('done');
      }, builder: (context, state) {
        // if (ApiCubit.get(context).sources.isEmpty) {
        //   ApiCubit.get(context).getSources();
        // }
        return Container(
          child: Column(
            children: [
              FutureBuilder<ArtRespons?>(
                  future:ApiCubit.get(context).getAllArt(source),
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
        );
      }),
    );
  }
}









