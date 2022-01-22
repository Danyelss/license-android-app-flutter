import 'package:crypto_bank_android_app/api/data.dart';
import 'package:crypto_bank_android_app/screens/HomeScreen.dart';
import 'package:crypto_bank_android_app/widgets/TextFieldAndLabelWidget.dart';
import 'package:crypto_bank_android_app/widgets/alertdialog_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String info = "";

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
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  minimumSize: Size(150, 50),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white.withOpacity(1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * (2 / 3),
                height: MediaQuery.of(context).size.height - 220,
                child: ListView(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.all(12.0),
                  children: [
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
                    TextFieldWidget(
                      label: 'Email',
                      textController: emailController,
                      password: false,
                    ),
                    TextFieldWidget(
                      label: 'First Name',
                      textController: firstNameController,
                      password: false,
                    ),
                    TextFieldWidget(
                      label: 'Last Name',
                      textController: lastNameController,
                      password: false,
                    ),
                    TextFieldWidget(
                      label: 'Phone Number',
                      textController: phoneNumberController,
                      password: false,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                  minimumSize: Size(150, 50),
                ),
                onPressed: () {
                  // make alert with variables
                  bool username =
                      usernameController.text.length >= 4 ? true : false;
                  bool password =
                      passwordController.text.length >= 4 ? true : false;
                  bool firstName =
                      firstNameController.text.length >= 1 ? true : false;
                  bool lastName =
                      lastNameController.text.length >= 1 ? true : false;
                  bool email = emailController.text.length >= 6 ? true : false;
                  bool phone =
                      phoneNumberController.text.length >= 10 ? true : false;

                  if (username &&
                      password &&
                      firstName &&
                      lastName &&
                      email &&
                      phone) {
                    register(
                        usernameController.text,
                        passwordController.text,
                        firstNameController.text,
                        lastNameController.text,
                        emailController.text,
                        phoneNumberController.text);

                    Navigator.pop(
                        context); // loading screen + informational message

                  } else {
                    if (!username)
                      info += "Username must be at least 4 characters. \n";
                    if (!password)
                      info += "Password must be at least 4 characters. \n";
                    if (!email)
                      info += "Email must be at least 6 characters. \n";
                    if (!firstName)
                      info += "First Name must be at least 1 character. \n";
                    if (!lastName)
                      info += "Last Name must be at least 1 character. \n";
                    if (!phone)
                      info += "Phone Number must be at least 10 characters. \n";

                    _showDialog(context);
                  }
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white.withOpacity(1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    VoidCallback continueCallBack =
        () => {Navigator.of(context).pop(), info = ""};

    BlurryDialog alert = BlurryDialog(
      "null",
      info,
      continueCallBack,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
