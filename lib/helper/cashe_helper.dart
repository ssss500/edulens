
import 'package:shared_preferences/shared_preferences.dart';


class CacheHelper{
  static SharedPreferences? prefereces;
// to save token in storage
  static init()async{
    prefereces=await SharedPreferences.getInstance();
  }
  static dynamic getData({required String key}){
    return prefereces!.get(key);
  }
  static Future<bool>saveData({
    required String key,
    required dynamic value
  })async {
    if(value is String )return await prefereces!.setString(key, value);
    if(value is int )return await prefereces!.setInt(key, value);
    if(value is bool )return await prefereces!.setBool(key, value);
    if(value is double )return await prefereces!.setDouble(key, value);
    return await prefereces!.setStringList(key, value);
  }

  static Future<bool>clearData(){return prefereces!.clear();}
  static Future<bool>removeData({required key}){
    return prefereces!.remove(key);
  }

}