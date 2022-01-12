import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required this.label,
      required this.textController,
      required this.password,
      required this.enabled})
      : super(key: key);

  final String label;
  final TextEditingController textController;
  final bool password;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      child: TextField(
        controller: textController,
        obscureText: password,
        enabled: enabled,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: label,
        ),
      ),
    );
  }
}

/*
final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }
  */