import 'package:flutter/material.dart';

// splash screen displayed while app starts

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("CCPC"),
          SizedBox(
            height: 30,
          ),
          Text("netus et malesuada"),
        ],
      ),
    ));
  }
}
