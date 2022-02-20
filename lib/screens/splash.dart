import 'package:ccpc/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// splash screen displayed while app starts

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.threeRotatingDots(
              color: Colors.blue.shade900, size: 100),
          addVerticalSpace(100),
          Text("CCPC",
              style: TextStyle(
                  color: Colors.blue.shade900,
                  fontSize: 65,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    ));
  }
}
