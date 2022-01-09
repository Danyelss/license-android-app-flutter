import 'package:crypto_bank_android_app/screens/HomeScreen.dart';
import 'package:crypto_bank_android_app/widgets/TextFieldAndLabelWidget.dart';
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
                        password: false),
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
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                minimumSize: const Size(150, 50),
              ),
              onPressed: () {
                print(usernameController.text);
                print(passwordController.text);
                print(emailController.text);
                print(firstNameController.text);
                print(lastNameController.text);
                print(phoneNumberController.text);
                Navigator.pop(context);
              },
              child: Text(
                "register",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white.withOpacity(1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFieldWidget(
                    label: 'Username',
                    textController: usernameController,
                    password: false,
                  ),
                  //const SizedBox(height: 10),
                  TextFieldWidget(
                    label: 'Password',
                    textController: passwordController,
                    password: true,
                  ),
                  //const SizedBox(height: 10),
                  TextFieldWidget(
                    label: 'Email',
                    textController: emailController,
                    password: false,
                  ),
                  //const SizedBox(height: 10),
                  TextFieldWidget(
                    label: 'First Name',
                    textController: firstNameController,
                    password: false,
                  ),
                  //const SizedBox(height: 10),
                  TextFieldWidget(
                    label: 'Last Name',
                    textController: lastNameController,
                    password: false,
                  ),
                  //const SizedBox(height: 10),
                  TextFieldWidget(
                    label: 'Phone Number',
                    textController: phoneNumberController,
                    password: false,
                  ),
                  //const SizedBox(height: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      minimumSize: const Size(150, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text(
                      "register",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white.withOpacity(1),
                      ),
                    ),
                  ),
                ],
              ),

    */
