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
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(padding),
            Padding(
              padding: sidePadding,
              child: Row(
                children: const [
                  BoxIcon(
                      child: Icon(
                        Icons.notes_rounded,
                        color: colorBlack,
                      ),
                      height: 50,
                      width: 50)
                ],
              ),
            ),
            addVerticalSpace(padding),
            Padding(
              padding: sidePadding,
              child: Text(
                "CCPC",
                style: themeData.textTheme.headline1,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
