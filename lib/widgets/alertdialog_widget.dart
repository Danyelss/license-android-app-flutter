import 'dart:ui';
import 'package:flutter/material.dart';

class BlurryDialog extends StatelessWidget {
  String title;
  String content;
  VoidCallback continueCallBack;

  BlurryDialog(this.title, this.content, this.continueCallBack);
  TextStyle textStyle = TextStyle(color: Colors.grey[300], fontSize: 17);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          backgroundColor: Colors.grey[850],
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15)),
          content: new Text(
            content,
            style: textStyle,
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text(
                "Continue",
                style: textStyle,
              ),
              onPressed: () {
                continueCallBack();
              },
            ),
          ],
        ));
  }
}
