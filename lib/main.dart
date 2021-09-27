import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newapp/shared/cubit/app_news_state.dart';
import 'package:newapp/shared/cubit/cubit.dart';
import 'package:newapp/shared/my_bloc_observer.dart';
import 'package:newapp/style/style.dart';

import 'modules/home_screen/home_screen.dart';
import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  bool? isDarkMode = CacheHelper.getBool('isDark');
  print(isDarkMode);
  runApp(MyApp(isDarkMode));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) => NewsCubit()..getNewsData()),
          BlocProvider(
              create: (BuildContext context) =>
                  NewsCubit()..changeAppMode(fromShared: isDark)),
        ],
        child: BlocConsumer<NewsCubit, AppNewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: NewsCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: Home(),
            );
          },
        ));
  }
}
