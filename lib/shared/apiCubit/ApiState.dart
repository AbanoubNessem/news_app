import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/shared/apiCubit/apiCubit.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/shared/models/ArtRespons.dart';
import 'package:news_app/shared/models/SourcesRespons.dart';
import 'package:url_launcher/url_launcher.dart';

class ApiCubit extends Cubit<ApiStates> {
  ApiCubit() : super(ApiInitialState());

  static ApiCubit get(context) => BlocProvider.of(context);
  List<Source> sources = [];
  int currentIndex = 0;
  void getSources(String cat) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines/sources?apiKey=1c95099bf8ec4176be7e4b7f10df5968&category=$cat"));
      SourcesRespons sourcesRespons =
          SourcesRespons.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        sources = sourcesRespons.sources!;
      } else {
        Fluttertoast.showToast(
            msg: sourcesRespons.message ?? " ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(
          msg: "please check internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    emit(GetResponsState(sources));
  }

  void index(int index) {
    currentIndex = index;
    emit(IndexState(currentIndex));
  }

  Future<ArtRespons?> getAllArt(Source source) async {
    try{
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?apiKey=1c95099bf8ec4176be7e4b7f10df5968&sources=${source.id}"));
      ArtRespons artRespons = ArtRespons.fromJson(jsonDecode(response.body));
      if(response.statusCode >=200 && response.statusCode < 300){
        return artRespons;
      }else{
        throw Exception(artRespons.message);
      }
    }on Exception catch (e){
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
 emit(GetResponsArtState());
  }
  Future<void> LaunchUrl(String _url)async {
    if (await canLaunchUrl(Uri.parse(_url))) {
      await launchUrl(Uri.parse(_url),);
    }else{
      throw 'Could not launch $_url';
    }
    emit(UrlLauncherState());
  }
  Future<ArtRespons?> SearchArt(String searchText) async {
    try{
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?apiKey=1c95099bf8ec4176be7e4b7f10df5968&q=${searchText}"));
      ArtRespons artRespons = ArtRespons.fromJson(jsonDecode(response.body));
      if(response.statusCode >=200 && response.statusCode < 300){
        return artRespons;
      }else{
        throw Exception(artRespons.message);
      }
    }on Exception catch (e){
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    emit(SearchArtState());
  }
}
