import 'package:crypto_bank_android_app/api/data.dart';
import 'package:crypto_bank_android_app/service_locator/service_locator.dart';
import 'package:crypto_bank_android_app/widgets/Header.dart';
import 'package:crypto_bank_android_app/widgets/TextFieldAndLabelWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  _DepositScreenState createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  TextEditingController addressController = TextEditingController();
  final _dataApi = getIt<DataApi>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _dataApi.deposit().then((value) => {
              setState(() {
                addressController.text = value;
              })
            }));
  }

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
            const Header(isHome: false),
            Text(
              'Deposit',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 80),
            Container(
                width: MediaQuery.of(context).size.width * (2 / 3),
                child: Row(
                  children: <Widget>[
                    Flexible(
                        child: new Text(
                      addressController.text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ))
                  ],
                )),
            const SizedBox(height: 40),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.white),
                minimumSize: const Size(150, 50),
              ),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: addressController.text));
                setState(() {});
              },
              child: Text(
                "Copy",
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
