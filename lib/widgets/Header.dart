import 'package:crypto_bank_android_app/screens/LoginScreen.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.isHome}) : super(key: key);

  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 70),
        Row(
          children: [
            const SizedBox(height: 10),
            Expanded(
              flex: 5,
              child: new GestureDetector(
                onTap: () {
                  if (!isHome) {
                    Navigator.pop(context);
                  }
                },
                child: Align(
                  alignment: Alignment(-1, 1),
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/homeButton.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Align(
                  alignment: Alignment(1, -1),
                  child: Container(
                    width: 40,
                    height: 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logoutButton.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
