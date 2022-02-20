import 'package:ccpc/data/contact_us.dart';
import 'package:ccpc/providers/theme_provider.dart';
import 'package:ccpc/utils/constants.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:ccpc/widgets/box_icon.dart';
import 'package:ccpc/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  static const routeName = '/contactUs';

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
            body: Padding(
              padding: sidePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Row(
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
                          "Contact Us",
                          style: headline1,
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpace(padding),
                  const Text(
                    "You can contact us",
                    style: headline2,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: contactUs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                contactUs[index],
                                style: bodyText1,
                              ),
                            );
                          })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
