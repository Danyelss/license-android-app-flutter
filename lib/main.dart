import 'package:flutter/material.dart';

void main() {
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            const SizedBox(height: 30),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                minimumSize: const Size(150, 50),
              ),
              onPressed: () {
                // Respond to button press
              },
              child: Text(
                "Register",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white.withOpacity(1),
                ),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * (2 / 3),
                height: MediaQuery.of(context).size.height - 30 - 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        // Respond to button press
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
