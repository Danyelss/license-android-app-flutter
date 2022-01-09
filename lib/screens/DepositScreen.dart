import 'package:crypto_bank_android_app/widgets/Header.dart';
import 'package:flutter/material.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/porscheLogin.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Header(),
        ],
      ),
    );
  }
}
