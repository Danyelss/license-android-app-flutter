import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

test1() async {
  try {
    var response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
        body: {"test": "test"});
    print(response.body);
  } catch (e) {
    print(e);
  }
}

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
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase.toString() + "wtf");
  }

  return false;
}
