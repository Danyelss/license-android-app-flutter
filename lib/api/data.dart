import 'dart:convert';
import 'package:crypto_bank_android_app/api/client/dio_client.dart';
import 'package:crypto_bank_android_app/storage/user_data.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'endpoints.dart';

void decodeFromJsonToken(Map<String, dynamic> json) {
  String refresh_token = json['refresh_token'];
  String acces_token = json['acces_token'];

  setRefreshToken(refresh_token);
  setAccesToken(acces_token);
}

String decodeFromJsonBalance(Map<String, dynamic> json) {
  return json['eth'];
}

String decodeFromJsonDeposit(Map<String, dynamic> json) {
  return json['adress'];
}

// Future<String> withdraw(String address, String ammount) async {
//   var headers = {
//     'Content-Type': 'application/x-www-form-urlencoded',
//     'Accept': 'application/json',
//     'Authorization': 'Bearer ' + 'null'
//   };
//   await getAccesToken().then((token) {
//     headers = {
//       'Content-Type': 'application/x-www-form-urlencoded',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer ' + token
//     };
//   });

//   var request = http.Request('POST',
//       Uri.parse('https://license-crypto-bank.herokuapp.com/api/withdraw'));
//   request.bodyFields = {'address': address, 'ammount': ammount};
//   request.headers.addAll(headers);

//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     return decodeFromJsonWithdraw(
//         json.decode(await response.stream.bytesToString()));
//   } else {
//     return decodeFromJsonError(
//         json.decode(await response.stream.bytesToString()));
//   }
// }

String decodeFromJsonWithdraw(Map<String, dynamic> json) {
  print(json['response']);
  return json['response'];
}

String decodeFromJsonError(Map<String, dynamic> json) {
  print(json['error_message'].toString() + "wtf");
  return json['error_message'].toString();
}

class DataApi {
  final DioClient _dioClient;

  DataApi(this._dioClient);

  Future<bool> login(String username, String password) async {
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      "Accept": "application/json"
    };

    try {
      final response = await _dioClient
          .post(DataEndpoints.login,
              data: {"username": username, "password": password},
              options: Options(headers: headers))
          .then((value) {
        var responseJson = json.encode(value.data);

        decodeFromJsonToken(json.decode(responseJson));
      });

      return true;
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data == null) {
          print('Request Failed');
        }
        print('Wrong Username or Password.');
      } else {
        print(e.toString());
      }
      return false;
    }
  }

  Future<bool> register(
    String username,
    String password,
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
  ) async {
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      "Accept": "application/json"
    };

    try {
      final response = await _dioClient
          .post(DataEndpoints.register,
              data: {
                "username": username,
                "password": password,
                "first_name": firstName,
                "last_name": lastName,
                "email": email,
                "phone_number": phoneNumber,
                "roles": []
              },
              options: Options(headers: headers))
          .then((value) {
        print("User added");
      });

      return true;
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data == null) {
          print('Request Failed');
        }
        print('Username already registered.');
      } else {
        print(e.toString());
      }
      return false;
    }
  }

  Future<String> balance() async {
    Map<String, dynamic> headers = {};

    await getAccesToken().then((token) {
      headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Accept": "application/json",
        'Authorization': 'Bearer ' + token
      };
    });
    try {
      final response = await _dioClient
          .post(DataEndpoints.balance, options: Options(headers: headers))
          .then((value) {
        var responseJson = json.encode(value.data);

        print(value.data);
        return decodeFromJsonBalance(json.decode(responseJson));
      });

      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data == null) {
          print('Request Failed');
        }
        print('Error.');
      } else {
        print(e.toString());
      }
      return "error";
    }
  }

  Future<String> deposit() async {
    Map<String, dynamic> headers = {};

    await getAccesToken().then((token) {
      headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Accept": "application/json",
        'Authorization': 'Bearer ' + token
      };
    });
    try {
      final response = await _dioClient
          .post(DataEndpoints.deposit, options: Options(headers: headers))
          .then((value) {
        var responseJson = json.encode(value.data);

        print(value.data);
        return decodeFromJsonDeposit(json.decode(responseJson));
      });

      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data == null) {
          print('Request Failed');
        }
        print('Error.');
      } else {
        print(e.toString());
      }
      return "Error.";
    }
  }

  Future<String> withdraw(String address, String ammount) async {
    Map<String, dynamic> headers = {};

    await getAccesToken().then((token) {
      headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        "Accept": "application/json",
        'Authorization': 'Bearer ' + token
      };
    });
    try {
      final response = await _dioClient
          .post(DataEndpoints.deposit,
              data: {"address": address, "ammount": ammount},
              options: Options(headers: headers))
          .then((value) {
        var responseJson = json.encode(value.data);

        print(value.data);

        return decodeFromJsonWithdraw(json.decode(responseJson));
      });

      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data == null) {
          print('Request Failed');
        }
        print('Error.');
        //    decodeFromJsonError(
        //  json.decode(await response.stream.bytesToString()));
      } else {
        print(e.toString());
      }
      return "Error.";
    }
  }
}
