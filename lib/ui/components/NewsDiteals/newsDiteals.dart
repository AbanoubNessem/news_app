import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/apiCubit/ApiState.dart';
import 'package:news_app/ui/components/newsItem/newsItem.dart';
import 'package:news_app/ui/screen/home/home.dart';

import '../../../shared/apiCubit/apiCubit.dart';
import '../../../shared/style/appStyle.dart';

class NewsDiteals extends StatelessWidget {
  static String routeName = "NewsDiteals";

  @override
  Widget build(BuildContext context) {
   ArgIndex args = ModalRoute.of(context)!.settings.arguments as ArgIndex;
   return BlocProvider(
     create: (BuildContext context) => ApiCubit(),
     child: BlocConsumer<ApiCubit, ApiStates>(listener: (context, state) {
       if (state is UrlLauncherState) print('done');
     }, builder: (context, state) {
       // if (ApiCubit.get(context).sources.isEmpty) {
       //   ApiCubit.get(context).getSources();
       // }
       return Scaffold(
         appBar: AppBar(
           toolbarHeight: MediaQuery.of(context).size.height * 0.08,
           shape: const RoundedRectangleBorder(
               borderRadius:  BorderRadius.only(
                   bottomLeft: Radius.circular(50),
                   bottomRight: Radius.circular(50))),
           title: const Text("News App"),
           actions: const [
             Icon(Icons.search, size: 30),
             SizedBox(
               width: 10,
             ),
           ],
           centerTitle: true,

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
         body: Container(
           padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
           margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               SizedBox(height: MediaQuery.of(context).size.height*0.05),
               ClipRRect(
                 borderRadius: BorderRadius.circular(12),
                 child: Image.network(args.articles.urlToImage ??
                     "https://media4.s-nbcnews.com/i/newscms/2019_01/2705191/nbc-social-default_b6fa4fef0d31ca7e8bc7ff6d117ca9f4.png",),
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.02,
               ),
               Text(
                 args.articles.source!.id ?? "Unknown",
                 textAlign: TextAlign.start,
                 style: TextStyle(fontSize: 11, color: Colors.grey),
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.02,
               ),
               Text(
                 args.articles.title ?? "Unknown",
                 textAlign: TextAlign.start,
                 style: TextStyle(
                     fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.02,
               ),
               Text(
                 args.articles.publishedAt ?? "Unknown",
                 textAlign: TextAlign.end,
                 style: TextStyle(fontSize: 11, color: Colors.grey),
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.02,
               ),
               Text(
                 args.articles.description ?? "Unknown",
                 textAlign: TextAlign.start,
                 style: TextStyle(fontSize: 14, color: Colors.black),
               ),
               SizedBox(
                 height: MediaQuery.of(context).size.height * 0.02,
               ),
               InkWell(
                 onTap: (){
                   ApiCubit.get(context).LaunchUrl(args.articles.url??"https://abcnews.go.com/US/wireStory/climate-change-made-summer-drought-20-times-91062360");
                 },
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children:const [
                     Text("View Full News",
                     style:TextStyle(
                       fontWeight: FontWeight.bold
                     )
                     ),
                     Icon(
                       Icons.arrow_right,
                       color: Colors.black,
                       size: 30,
                     )
                   ],
                 ),
               )

             ],
           ),
         ),
       );
     }),
   );
  }
}









