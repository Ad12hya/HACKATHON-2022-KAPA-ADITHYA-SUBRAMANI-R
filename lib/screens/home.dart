import 'package:ccpc/utils/data.dart';
import 'package:ccpc/utils/constants.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:ccpc/widgets/box_icon.dart';
import 'package:ccpc/widgets/feature_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        child: Stack(alignment: Alignment.center, children: [
          Column(
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
                                Text(
                                  "CCPC",
                                  style: themeData.textTheme.headline1,
                                ),
                                addVerticalSpace(padding),
                                Text(
                                  "Cloud Counselage\nProfessional Community",
                                  style: themeData.textTheme.headline2,
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
                    primary: colorDarkBlue,
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
