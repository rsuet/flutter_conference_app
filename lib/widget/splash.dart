import 'package:flutter/material.dart';

class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FractionallySizedBox(
          child: Image.asset("res/icon.png"),
          heightFactor: 0.4,
          widthFactor: 0.4,
        ),
      ),
    );
  }

}
