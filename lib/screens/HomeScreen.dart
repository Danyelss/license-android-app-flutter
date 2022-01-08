import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/porscheLogin.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            IconButton(
              icon: Image.asset('assets/vault.png'),
              iconSize: 50,
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/vault.png'),
              iconSize: 50,
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/vault.png'),
              iconSize: 50,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
