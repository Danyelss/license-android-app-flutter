import 'package:crypto_bank_android_app/screens/LoginScreen.dart';
import 'package:crypto_bank_android_app/screens/TestScreen.dart';
import 'package:crypto_bank_android_app/service_locator/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Title',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
