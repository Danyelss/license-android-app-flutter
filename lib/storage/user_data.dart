import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? store;

Future<SharedPreferences?> getStore() async {
  if (store == null) createStore();

  return store;
}

createStore() async {
  store = await SharedPreferences.getInstance();
}

Future<String> getToken() async {
  return store?.getString('acces_token') ?? "null";
}

setToken(String token) {
  store?.setString('acces_token', token);
}

Future<String> getRefreshToken() async {
  return store?.getString('refresh_token') ?? "null";
}

setRefreshToken(String token) {
  store?.setString('refresh_token', token);
}
