import 'package:shared_preferences/shared_preferences.dart';

Future<String> getAccesToken() async {
  SharedPreferences store = await SharedPreferences.getInstance();
  return store.getString('acces_token') ?? "null";
}

setAccesToken(String token) async {
  SharedPreferences store = await SharedPreferences.getInstance();
  store.setString('acces_token', token);
}

Future<String> getRefreshToken() async {
  SharedPreferences store = await SharedPreferences.getInstance();
  return store.getString('refresh_token') ?? "null";
}

setRefreshToken(String token) async {
  SharedPreferences store = await SharedPreferences.getInstance();
  store.setString('refresh_token', token);
}
