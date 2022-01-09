import 'package:crypto_bank_android_app/widgets/Header.dart';
import 'package:flutter/material.dart';

class VaultScreen extends StatefulWidget {
  const VaultScreen({Key? key}) : super(key: key);

  @override
  _VaultScreenState createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> {
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
