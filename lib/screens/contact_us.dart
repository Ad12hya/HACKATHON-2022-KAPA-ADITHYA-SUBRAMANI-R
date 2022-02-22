import 'package:ccpc/data/contact_us.dart';
import 'package:ccpc/data/links.dart';
import 'package:ccpc/providers/theme_provider.dart';
import 'package:ccpc/utils/constants.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:ccpc/widgets/box_icon.dart';
import 'package:ccpc/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(160, 60),
                            padding: EdgeInsets.all(20),
                            primary: Color(0xffe52f60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () async {
                          await launch(instagram);
                        },
                        icon: Icon(FontAwesomeIcons.instagram),
                        label: Text(
                          "Instagram",
                          style: subtitle1,
                        ),
                      ),
                      addHorizontalSpace(10),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(160, 60),
                              padding: EdgeInsets.all(20),
                              primary: Color(0xff2567b3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () async {
                            await launch(linkedIn);
                          },
                          icon: Icon(FontAwesomeIcons.linkedin),
                          label: Text(
                            "LinkedIn",
                            style: subtitle1,
                          ))
                    ],
                  ),
                  addVerticalSpace(padding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(160, 60),
                            padding: EdgeInsets.all(20),
                            primary: Color(0xff395899),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () async {
                          await launch(facebook);
                        },
                        icon: Icon(FontAwesomeIcons.facebookF),
                        label: Text(
                          "Facebook",
                          style: subtitle1,
                        ),
                      ),
                      addHorizontalSpace(10),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(160, 60),
                              padding: EdgeInsets.all(20),
                              primary: Color(0xff37a4dc),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () async {
                            await launch(telegram);
                          },
                          icon: Icon(FontAwesomeIcons.telegramPlane),
                          label: Text(
                            "Telegram",
                            style: subtitle1,
                          ))
                    ],
                  ),
                  addVerticalSpace(padding),
                  Text(
                    "For support, write to us at: ${supportMail}",
                    style: subtitle1,
                  ),
                  addVerticalSpace(padding),
                  const Text(
                    "You can also contact us",
                    style: headline2,
                  ),
                  Expanded(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
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
                  addVerticalSpace(padding),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
