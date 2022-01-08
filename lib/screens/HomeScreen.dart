import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            IconButton(
                icon: SvgPicture.asset(
                  'assets/vault.svg',
                ),
                onPressed: null //do something,
                ),
          ],
        ),
      ),
    );
  }
}
