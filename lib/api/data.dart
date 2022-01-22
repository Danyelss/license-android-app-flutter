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
    decodeFromJsonToken(json.decode(await response.stream.bytesToString()));
    return true;
  } else {
    print(response.reasonPhrase.toString()); // wrong pass or username
  }

  return false;
}

Future<bool> register(
  String username,
  String password,
  String firstName,
  String lastName,
  String email,
  String phoneNumber,
) async {
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': '<Your token>'
  };
  var request = http.Request('POST',
      Uri.parse('https://license-crypto-bank.herokuapp.com/api/register'));
  request.body = json.encode({
    "username": username,
    "password": password,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone_number": phoneNumber,
    "roles": []
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString()); // multiple 200 responses
    return true;
  } else {
    print(response.reasonPhrase);
  }

  return false;
}

void decodeFromJsonToken(Map<String, dynamic> json) {
  String refresh_token = json['refresh_token'];
  String acces_token = json['acces_token'];
  print(acces_token);

  setRefreshToken(refresh_token);
  setAccesToken(acces_token);
}

String decodeFromJsonBalance(Map<String, dynamic> json) {
  return json['eth'];
}

Future<String> balance() async {
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ' + 'null'
  };
  await getAccesToken().then((token) {
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token
    };
  });

  print(headers.toString());
  var request = http.Request('POST',
      Uri.parse('https://license-crypto-bank.herokuapp.com/api/balance'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return decodeFromJsonBalance(
        json.decode(await response.stream.bytesToString()));
  } else {
    print(response.reasonPhrase);
    return "undefined";
  }
}
