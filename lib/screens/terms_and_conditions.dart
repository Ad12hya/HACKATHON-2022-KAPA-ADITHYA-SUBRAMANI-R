import 'package:ccpc/providers/theme_provider.dart';
import 'package:ccpc/utils/constants.dart';
import 'package:ccpc/data/ccpc_terms_and_conditions.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:ccpc/widgets/box_icon.dart';
import 'package:ccpc/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  static const routeName = '/termsAndConditions';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Scaffold(
            drawer: const AppDrawer(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Row(
                    children: [
                      Builder(builder: (context) {
                        return InkResponse(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: BoxIcon(
                              child: Icon(
                                Icons.notes_rounded,
                                color: themeProvider.isDarkMode
                                    ? colorWhite
                                    : colorBlack,
                              ),
                              height: 50,
                              width: 50),
                        );
                      }),
                      addHorizontalSpace(padding),
                      const Expanded(
                        child: Text(
                          "Terms and Conditions",
                          style: headline1,
                        ),
                      ),
                    ],
                  ),
                ),
                addVerticalSpace(padding),
                Expanded(
                    child: Padding(
                  padding: sidePadding,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: termsAndConditions.length,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Last updated: $tcLastUpdated",
                              style: subtitle1,
                            ),
                            Terms(index: index)
                          ],
                        );
                      }
                      return Terms(index: index);
                    },
                  ),
                )),
                addVerticalSpace(padding)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Terms extends StatelessWidget {
  final int index;
  const Terms({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      addVerticalSpace(10),
      Text(
        "${termsAndConditions[index]['title']}",
        style: bodyText1,
      ),
      Text(
        "${termsAndConditions[index]['content']}",
        style: bodyText2,
      )
    ]);
  }
}
