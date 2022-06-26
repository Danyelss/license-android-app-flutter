import 'package:crypto_bank_android_app/api/data.dart';
import 'package:crypto_bank_android_app/service_locator/service_locator.dart';
import 'package:crypto_bank_android_app/widgets/Header.dart';
import 'package:crypto_bank_android_app/widgets/TextFieldAndLabelWidget.dart';
import 'package:crypto_bank_android_app/widgets/alertdialog_widget.dart';
import 'package:flutter/material.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  TextEditingController addressController = TextEditingController();
  TextEditingController ammountController = TextEditingController();
  final _dataApi = getIt<DataApi>();

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
        child: Column(
          children: [
            Header(isHome: false),
            Text(
              'Withdraw',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * (2 / 3),
                //height: MediaQuery.of(context).size.height - 30 - 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 60),
                    TextFieldWidget(
                      label: 'Address',
                      textController: addressController,
                      password: false,
                    ),
                    TextFieldWidget(
                      label: 'Ammount',
                      textController: ammountController,
                      password: false,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        minimumSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        // make alert with variables
                        bool address =
                            addressController.text.length == 42 ? true : false;
                        bool ammount =
                            num.tryParse(ammountController.text) != null
                                ? true
                                : false;

                        if (address && ammount) {
                          _dataApi
                              .withdraw(addressController.text,
                                  ammountController.text)
                              .then((value) => null);

                          Navigator.pop(
                              context); // loading screen + informational message

                        } else {
                          if (!address)
                            info += "Address must have 42 characters. \n";
                          if (!ammount)
                            info +=
                                "Ammount should be numerical and have at least one character. \n";

                          _showDialog(context);
                        }
                      },
                      child: Text(
                        "Withdraw",
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
