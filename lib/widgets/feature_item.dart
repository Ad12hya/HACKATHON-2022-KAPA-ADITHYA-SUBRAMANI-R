import 'package:ccpc/utils/constants.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:ccpc/widgets/box_icon.dart';
import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({Key? key, required this.itemData}) : super(key: key);

  final dynamic itemData;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(itemData["image"])),
          itemData["moreInfo"]
              ? const Positioned(
                  top: 10,
                  right: 10,
                  child: BoxIcon(
                    padding: EdgeInsets.all(0),
                    child: Icon(
                      Icons.more_horiz_rounded,
                      color: colorDarkBlue,
                      size: 35,
                    ),
                    height: 40,
                    width: 40,
                  ))
              : const SizedBox()
        ]),
        addVerticalSpace(15),
        Text(
          itemData["title"],
          style: themeData.textTheme.headline3,
        ),
        addVerticalSpace(5),
        Text(
          itemData["description"],
          style: themeData.textTheme.subtitle1,
        )
      ]),
    );
  }
}
