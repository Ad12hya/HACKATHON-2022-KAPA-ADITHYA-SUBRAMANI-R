import 'package:ccpc/data/faqs.dart';
import 'package:ccpc/providers/theme_provider.dart';
import 'package:ccpc/utils/constants.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:ccpc/widgets/box_icon.dart';
import 'package:ccpc/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FAQs extends StatelessWidget {
  const FAQs({Key? key}) : super(key: key);

  static const routeName = '/faqs';

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
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                        "FAQs",
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
                    itemCount: faqs.length,
                    itemBuilder: (context, index) {
                      return FAQCard(faqItem: faqs[index]);
                    }),
              ))
            ]),
          ),
        ),
      ),
    );
  }
}

class FAQCard extends StatelessWidget {
  const FAQCard({Key? key, this.faqItem}) : super(key: key);

  final dynamic faqItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            faqItem["heading"],
            style: headline2,
          ),
          addVerticalSpace(15),
          ...(faqItem["faqs"] as List).map((faqs) => QA(qa: faqs))
        ],
      ),
    );
  }
}

class QA extends StatelessWidget {
  const QA({Key? key, required this.qa}) : super(key: key);

  final dynamic qa;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Text(
            qa["qs"],
            style: headline4,
          ),
          addVerticalSpace(5),
          Text(
            qa["ans"],
            style: bodyText1,
          )
        ],
      ),
    );
  }
}
