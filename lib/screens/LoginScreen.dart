import 'package:crypto_bank_android_app/api/data.dart';
import 'package:crypto_bank_android_app/screens/HomeScreen.dart';
import 'package:crypto_bank_android_app/screens/RegisterScreen.dart';
import 'package:crypto_bank_android_app/storage/user_data.dart';
import 'package:crypto_bank_android_app/widgets/TextFieldAndLabelWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/porscheLogin.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 60),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                minimumSize: const Size(150, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white.withOpacity(1),
                ),
              ),
            ),
            const SizedBox(height: 140),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * (2 / 3),
                //height: MediaQuery.of(context).size.height - 30 - 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFieldWidget(
                      label: 'Username',
                      textController: usernameController,
                      password: false,
                    ),
                    TextFieldWidget(
                      label: 'Password',
                      textController: passwordController,
                      password: true,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        print(usernameController.text);
                        print(passwordController.text);

                        // request

                        setToken("Compot");

                        String token = "null";

                        test1();

                        //getToken().then((value) => token = value);

                        if (token != "null") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                          usernameController.clear();
                          passwordController.clear();
                        } else {
                          passwordController.clear();
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white.withOpacity(1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
