abstract class AppNewsState {}

class AppInitialState extends AppNewsState{}


class ChangeBottomNavBarState extends AppNewsState{}

class AppGetBusinessNewsState extends AppNewsState{}

class AppOnErrorBusinessNewsState extends AppNewsState{
  String error;
  AppOnErrorBusinessNewsState(this.error);
}

class AppLoadingBusinessNewsState extends AppNewsState{}

class AppGetSportNewsState extends AppNewsState{}

class AppOnErrorSportNewsState extends AppNewsState{
  String error;
  AppOnErrorSportNewsState(this.error);
}

class AppLoadingSportNewsState extends AppNewsState{}


class AppGetScienceNewsState extends AppNewsState{}

class AppOnErrorScienceNewsState extends AppNewsState{
  String error;
  AppOnErrorScienceNewsState(this.error);
}

class AppLoadingScienceNewsState extends AppNewsState{}


class AppGetSearchNewsState extends AppNewsState{}

class AppOnErrorSearchNewsState extends AppNewsState{
  String error;
  AppOnErrorSearchNewsState(this.error);
}

class AppChangeModeState extends AppNewsState{}

