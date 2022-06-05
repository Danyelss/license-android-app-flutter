import 'package:crypto_bank_android_app/api/client/dio_client.dart';
import 'package:crypto_bank_android_app/api/data.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  getIt.registerSingleton(DataApi(getIt<DioClient>()));
}
