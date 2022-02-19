import 'package:ccpc/providers/theme_provider.dart';
import 'package:ccpc/utils/ccpc_reviews.dart';
import 'package:ccpc/utils/constants.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:ccpc/widgets/box_icon.dart';
import 'package:ccpc/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  static const routeName = '/reviews';

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
                        child: Row(children: [
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
                              "Reviews",
                              style: headline1,
                            ),
                          ),
                        ]),
                      ),
                      addVerticalSpace(padding),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  children: ccpcReviews
                                      .map((e) => ReviewCard(
                                            reviewItem: e,
                                          ))
                                      .toList(),
                                ),
                              ),
                              addVerticalSpace(padding),
                              const Text(
                                "Read more reviews...",
                                style: headline3,
                              ),
                              addVerticalSpace(padding),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(150, 50)),
                                          onPressed: () async {
                                            await launch(
                                                cloudCounselageWebsiteReviews);
                                          },
                                          child:
                                              const Text("Cloud Counselage")),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(150, 50)),
                                          onPressed: () async {
                                            await launch(facebookReviews);
                                          },
                                          child: const Text("Facebook"))
                                    ],
                                  ),
                                  addVerticalSpace(30),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(150, 50)),
                                          onPressed: () async {
                                            await launch(glassdoorReviews);
                                          },
                                          child: const Text("Glassdoor")),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(150, 50)),
                                          onPressed: () async {
                                            await launch(googleReviews);
                                          },
                                          child: const Text("Google"))
                                    ],
                                  ),
                                  addVerticalSpace(30),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ]))),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final dynamic reviewItem;
  const ReviewCard({Key? key, required this.reviewItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.75,
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: colorGrey.withAlpha(40), width: 2)),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(children: [
              addVerticalSpace(10),
              Text(
                reviewItem["name"],
                style: headline2,
                textAlign: TextAlign.center,
              ),
              addVerticalSpace(20),
              Text(
                reviewItem["featuredText"],
                style: headline4,
                textAlign: TextAlign.center,
              ),
              addVerticalSpace(10),
              Text(
                reviewItem["content"],
                style: bodyText1,
              ),
              addVerticalSpace(25)
            ]),
          ),
        ),
      ),
    );
  }
}
