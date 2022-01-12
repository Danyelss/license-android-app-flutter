import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.textController,
    required this.password,
  }) : super(key: key);

  final String label;
  final TextEditingController textController;
  final bool password;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      child: TextField(
        controller: textController,
        obscureText: password,
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