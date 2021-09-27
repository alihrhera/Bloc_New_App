
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static late SharedPreferences sharedPreferences;


  static init () async{
    sharedPreferences = await SharedPreferences.getInstance();
  }


  static Future<bool> putBool (String key , bool value){

   return sharedPreferences.setBool('isDark', value);
  }

  static getBool(String key){
    return sharedPreferences.getBool(key);
  }


}