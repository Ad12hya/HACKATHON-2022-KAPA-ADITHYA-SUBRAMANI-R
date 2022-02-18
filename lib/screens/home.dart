import 'package:ccpc/utils/data.dart';
import 'package:ccpc/utils/constants.dart';
import 'package:ccpc/providers/theme_provider.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:ccpc/widgets/box_icon.dart';
import 'package:ccpc/widgets/feature_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      themeMode: themeProvider.themeMode,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: SafeArea(
          child: Scaffold(
        drawer: Drawer(
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
                  leading: const Icon(Icons.question_answer_rounded),
                  title: const Text('FAQs'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.reviews_rounded),
                  title: const Text('Reviews'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.message_rounded),
                  title: const Text('Contact us'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.view_list_outlined),
                  title: const Text('Terms & Conditions'),
                  onTap: () {},
                ),
              ]),
            ],
          ),
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(alignment: Alignment.center, children: [
            Column(
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
                    ],
                  ),
                ),
                addVerticalSpace(padding),
                const Padding(
                  padding: sidePadding,
                  child: Text(
                    "CCPC",
                    style: headline1,
                  ),
                ),
                addVerticalSpace(5),
                Expanded(
                  child: Padding(
                    padding: sidePadding,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: ccpcFeatures.length,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  addVerticalSpace(padding),
                                  const Text(
                                    "Cloud Counselage\nProfessional Community",
                                    style: headline2,
                                  ),
                                  const Divider(
                                    height: padding,
                                    color: colorGrey,
                                  ),
                                  FeatureItem(itemData: ccpcFeatures[index])
                                ]);
                          }
                          if (index == ccpcFeatures.length - 1) {
                            return Column(
                              children: [
                                FeatureItem(itemData: ccpcFeatures[index]),
                                addVerticalSpace(100)
                              ],
                            );
                          }
                          return FeatureItem(itemData: ccpcFeatures[index]);
                        }),
                  ),
                ),
              ],
            ),
            // express interest button
            Positioned(
                bottom: 20,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () async {
                    if (!await launch(eoiLink)) throw 'Could not launch';
                  },
                  icon: const Icon(
                    Icons.favorite_rounded,
                    size: 30,
                  ),
                  label: const Text("Express interest",
                      style: TextStyle(fontSize: 20)),
                ))
          ]),
        ),
      )),
    );
  }
}
