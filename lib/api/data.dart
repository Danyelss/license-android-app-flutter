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
