import 'dart:async';

import 'package:crypto_bank_android_app/api/data.dart';
import 'package:crypto_bank_android_app/widgets/Header.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cron/cron.dart';
import 'dart:io';

class VaultScreen extends StatefulWidget {
  const VaultScreen({Key? key}) : super(key: key);

  @override
  _VaultScreenState createState() => _VaultScreenState();
}

Future<void> getBalance() async {
  final SharedPreferences store = await SharedPreferences.getInstance();
  final String token = await store.getString('acces_token') ?? "null";

  // setState(() => usernameController.text = patientPhone);
}

class _VaultScreenState extends State<VaultScreen> {
  TextEditingController balanceController = TextEditingController();
  var cron = new Cron();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) {
      balance().then((value) => {
            setState(() {
              balanceController.text = value;
            })
          });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    balance().then((value) => {
          setState(() {
            balanceController.text = value;
          })
        });
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
            Header(isHome: false),
            Text(
              'Vault',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 50),
            Container(
                width: 50,
                height: 50,
                child: RiveAnimation.asset('assets/reloadiconanimation.riv')),
            const SizedBox(height: 20),
            Container(
              width: 180,
              height: 208,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/EthVault.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -55.0, 0.0),
              child: Text(
                balanceController.text,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
