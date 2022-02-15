import 'package:ccpc/utils/constants.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:ccpc/widgets/box_icon.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double padding = 25;
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            addVerticalSpace(padding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: padding),
              child: Row(
                children: const [
                  BoxIcon(
                      child: Icon(
                        Icons.menu,
                        color: colorBlack,
                      ),
                      height: 50,
                      width: 50)
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
