import 'package:crypto_bank_android_app/api/data.dart';
import 'package:crypto_bank_android_app/screens/HomeScreen.dart';
import 'package:crypto_bank_android_app/screens/RegisterScreen.dart';
import 'package:crypto_bank_android_app/service_locator/service_locator.dart';
import 'package:crypto_bank_android_app/storage/user_data.dart';
import 'package:crypto_bank_android_app/widgets/TextFieldAndLabelWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  bool logedIn = false;
  final _dataApi = getIt<DataApi>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController informationalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (loading)
      return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/porscheLogin.jpg'),
                  fit: BoxFit.cover)),
          child: Center(child: CircularProgressIndicator()));

    return loginWidget(context);
  }

  Widget loginWidget(BuildContext context) {
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
                        minimumSize: const Size(150, 50)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text("Register",
                        style: TextStyle(
                            fontSize: 25, color: Colors.white.withOpacity(1)))),
                Container(
                    height: 140,
                    child: Center(
                        child: Text(informationalController.text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white.withOpacity(1))))),
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
                                  informationalController.text = "";
                                  loading = true;

                                  setState(() {});

                                  if (usernameController.text.length >= 4 &&
                                      passwordController.text.length >= 4) {
                                    _dataApi
                                        .login(usernameController.text,
                                            passwordController.text)
                                        .then((value) {
                                      loading = false;

                                      if (value) {
                                        usernameController.clear();
                                        passwordController.clear();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()),
                                        );
                                      } else {
                                        passwordController.clear();
                                        informationalController.text =
                                            "Wrong username or password";
                                      }
                                      setState(() {});
                                    });
                                  } else {
                                    loading = false;
                                    passwordController.clear();
                                    informationalController.text =
                                        "Username and Password must have at least 4 characters";
                                  }
                                },
                                child: Text("Login",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white.withOpacity(1),
                                    )))
                          ],
                        )))
              ],
            )));
  }
}
