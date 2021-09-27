

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/layout/bottom_navigation_screens/business_screen.dart';
import 'package:newapp/layout/bottom_navigation_screens/science_screen.dart';
import 'package:newapp/layout/bottom_navigation_screens/sport_screen.dart';
import 'package:newapp/network/local/cache_helper.dart';
import 'package:newapp/network/remote/dio_helper.dart';
import 'package:newapp/shared/cubit/app_news_state.dart';

class NewsCubit extends Cubit<AppNewsState>{

  NewsCubit() : super (AppInitialState());

  int currentIndex=0;
  List<dynamic>? business= [];
  List<dynamic>? science= [];
  List<dynamic>? sport= [];
  List<dynamic>? search= [];
  bool isDark = false;
  static NewsCubit get (context) => BlocProvider.of(context);


  List<Widget> screens =[
    BusinessNews(),
    SportNews(),
    ScienceNews(),

  ];


  void changeIndex({required int index}){
    currentIndex = index;
    if(index == 0)
      getNewsData();
    if(index == 1)
      getSportData();
    if(index==2)
      getScienceData();
    emit(ChangeBottomNavBarState());
  }

  void getNewsData(){
    emit(AppLoadingBusinessNewsState());
    DioHelper().getData(url: '/v2/top-headlines', query: {
      'country':'eg',
      'category':'business',
      'apiKey':'2653eb8c13b74596865cecf5ea9a9065',

    }).then((value) {
      business =value.data['articles'];
      print(business![0]['title']);
      emit(AppGetBusinessNewsState());
    }).catchError((onError){
      print(onError.toString());
      emit(AppOnErrorBusinessNewsState(onError.toString()));
    });
  }
  void getScienceData(){
    emit(AppLoadingScienceNewsState());
    DioHelper().getData(url: '/v2/top-headlines', query: {
      'country':'eg',
      'category':'science',
      'apiKey':'2653eb8c13b74596865cecf5ea9a9065',

    }).then((value) {
      science =value.data['articles'];
      print(science![0]['title']);
      emit(AppGetScienceNewsState());
    }).catchError((onError){
      print(onError.toString());
      emit(AppOnErrorScienceNewsState(onError.toString()));
    });
  }
  void getSportData(){
    emit(AppLoadingSportNewsState());
    DioHelper().getData(url: '/v2/top-headlines', query: {
      'country':'eg',
      'category':'sport',
      'apiKey':'2653eb8c13b74596865cecf5ea9a9065',

    }).then((value) {
      sport =value.data['articles'];
      print(sport![0]['title']);
      emit(AppGetSportNewsState());
    }).catchError((onError){
      print(onError.toString());
      emit(AppOnErrorSportNewsState(onError.toString()));
    });
  }


  void changeAppMode({bool? fromShared}) {
    if(fromShared != null){
      isDark = fromShared;
      emit(AppChangeModeState());
    }

    else {
      isDark = !isDark;
      print('before changed value $isDark');
      CacheHelper.putBool('isDark', isDark).then((value) {

        print('changed value $value');
        emit(AppChangeModeState());});

    }


  }

  void getSearch(String value){

  //  emit(AppLoadingSportNewsState());
    search=[];
    DioHelper().getData(url: 'v2/everything', query: {
      'q':'$value',
      'apiKey':'2653eb8c13b74596865cecf5ea9a9065',

    }).then((value) {
      search =value.data['articles'];
      print(search![0]['title']);
      emit(AppGetSearchNewsState());
    }).catchError((onError){
      print(onError.toString());
      emit(AppOnErrorSearchNewsState(onError.toString()));
    });

  }
}