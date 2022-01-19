import 'dart:convert';

import 'package:crypto_bank_android_app/storage/user_data.dart';
import 'package:http/http.dart' as http;

Future<bool> login(String username, String password) async {
  var headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json',
    'Authorization': '<Your token>'
  };

  var request = http.Request(
      'POST', Uri.parse('https://license-crypto-bank.herokuapp.com/api/login'));
  request.bodyFields = {'username': username, 'password': password};
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    decodeFromJson(json.decode(await response.stream.bytesToString()));
    return true;
  } else {
    print(response.reasonPhrase.toString()); // wrong pass or username
    return false;
  }

  return false;
}

void decodeFromJson(Map<String, dynamic> json) {
  String refresh_token = json['refresh_token'];
  String acces_token = json['acces_token'];
  print(acces_token);

  setRefreshToken(refresh_token);
  setAccesToken(acces_token);
}
