import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/modules/search_screen/search.dart';
import 'package:newapp/network/remote/dio_helper.dart';
import 'package:newapp/shared/components/components.dart';
import 'package:newapp/shared/cubit/app_news_state.dart';
import 'package:newapp/shared/cubit/cubit.dart';

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);



  //base url : https://newsapi.org/
  // method : /v2/top-headlines?
  // queries : country=eg&category=business&apiKey=2653eb8c13b74596865cecf5ea9a9065

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , AppNewsState>(
      listener: (context, state){},
      builder: (context , state ){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('New App'),
            titleSpacing: 20.0,
            actions: [
              IconButton(
                onPressed: () {
                  cubit.search=[];
                  navigateTo(context: context,widget: SearchScreen());
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeAppMode();
                },
                icon: Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){

            },
            child: Icon(Icons.add),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeIndex(index: index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.business),label: 'business' ),
              BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'sports' ),
              BottomNavigationBarItem(icon: Icon(Icons.science),label: 'science' ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
