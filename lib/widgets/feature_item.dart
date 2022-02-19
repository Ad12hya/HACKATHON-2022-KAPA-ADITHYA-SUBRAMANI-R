import 'package:ccpc/providers/theme_provider.dart';
import 'package:ccpc/screens/detail_page.dart';
import 'package:ccpc/utils/constants.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:ccpc/widgets/box_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({Key? key, required this.itemData}) : super(key: key);

  final dynamic itemData;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(itemData["image"])),
          itemData["moreInfo"]
              ? Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DetailPage.routeName,
                          arguments: {'dataItem': itemData});
                    },
                    child: BoxIcon(
                      padding: const EdgeInsets.all(0),
                      child: Icon(
                        Icons.more_horiz_rounded,
                        color: isDarkMode ? colorWhite : colorBlack,
                        size: 35,
                      ),
                      height: 40,
                      width: 40,
                    ),
                  ))
              : const SizedBox()
        ]),
        addVerticalSpace(15),
        Text(
          itemData["title"],
          style: headline3,
        ),
        addVerticalSpace(5),
        Text(
          itemData["shortDescription"],
          style: subtitle1,
        )
      ]),
    );
  }
}
