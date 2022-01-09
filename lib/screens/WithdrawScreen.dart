import 'package:crypto_bank_android_app/widgets/Header.dart';
import 'package:flutter/material.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
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
