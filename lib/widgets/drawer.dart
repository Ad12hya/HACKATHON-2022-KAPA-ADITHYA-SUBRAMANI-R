import 'package:ccpc/data/links.dart';
import 'package:ccpc/providers/theme_provider.dart';
import 'package:ccpc/screens/contact_us.dart';
import 'package:ccpc/screens/reviews.dart';
import 'package:ccpc/screens/terms_and_conditions.dart';
import 'package:ccpc/utils/constants.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.a
      child: ListView(
        padding: const EdgeInsets.all(0),
        // Important: Remove any padding from the ListView.
        // padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'CCPC',
                  style: headline1,
                ),
                Text(
                  "CONTINUOUS PROFESSIONAL DEVELOPMENT FOR STUDENTS",
                  style: subtitle1,
                )
              ],
            ),
          ),
          Column(children: [
            addVerticalSpace(20),
            Center(
              child: GestureDetector(
                child: Icon(themeProvider.isDarkMode
                    ? Icons.light_mode
                    : Icons.dark_mode),
                onTap: () {
                  themeProvider.toggleTheme();
                },
              ),
            ),
            addVerticalSpace(20),
            ListTile(
              leading: const Icon(Icons.stars_rounded),
              title: const Text('Benefits'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer_rounded),
              title: const Text('FAQs'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/faqs');
              },
            ),
            ListTile(
              leading: const Icon(Icons.reviews_rounded),
              title: const Text('Reviews'),
              onTap: () {
                Navigator.pushReplacementNamed(context, Reviews.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.message_rounded),
              title: const Text('Contact us'),
              onTap: () {
                Navigator.pushReplacementNamed(context, ContactUs.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_list_outlined),
              title: const Text('Terms & Conditions'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, TermsAndConditions.routeName);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_rounded),
              title: Row(
                children: [
                  const Text('Privacy Policy'),
                  addHorizontalSpace(10),
                  const Icon(
                    Icons.open_in_new_rounded,
                    size: 20,
                  )
                ],
              ),
              onTap: () async {
                await launch(privacyPolicyLink);
              },
            ),
          ]),
        ],
      ),
    );
  }
}
