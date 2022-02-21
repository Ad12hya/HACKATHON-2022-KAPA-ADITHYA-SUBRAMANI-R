import 'package:ccpc/data/links.dart';
import 'package:ccpc/screens/interests_form.dart';
import 'package:ccpc/data/ccpc_features.dart';
import 'package:ccpc/utils/constants.dart';
import 'package:ccpc/providers/theme_provider.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:ccpc/widgets/box_icon.dart';
import 'package:ccpc/widgets/drawer.dart';
import 'package:ccpc/widgets/feature_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double padding = 25;
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
        child: Scaffold(
      drawer: const AppDrawer(),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Builder(builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(InterestForm.routeName);
                        },
                        child: Icon(Icons.person_add_alt_rounded),
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(), minimumSize: Size(50, 50)),
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
    ));
  }
}
