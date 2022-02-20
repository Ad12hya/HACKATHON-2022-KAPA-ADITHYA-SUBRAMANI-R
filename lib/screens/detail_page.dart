import 'package:ccpc/data/links.dart';
import 'package:ccpc/providers/theme_provider.dart';
import 'package:ccpc/utils/constants.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:ccpc/widgets/box_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final dataItem = arguments["dataItem"];
    const double padding = 25;
    final themeProvider = Provider.of<ThemeProvider>(context);
    const sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Hero(
                            tag: dataItem['image'],
                            child: Image.asset(dataItem["image"])),
                      ],
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        "${dataItem['title']}",
                        style: headline2,
                      ),
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        dataItem["longDescription"],
                        textAlign: TextAlign.justify,
                        style: bodyText2,
                      ),
                    ),
                    addVerticalSpace(100)
                  ],
                ),
              ),
              Positioned(
                  top: padding,
                  right: 5,
                  child: Padding(
                    padding: sidePadding,
                    child: InkResponse(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: BoxIcon(
                        padding: const EdgeInsets.all(0),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 35,
                          color: themeProvider.isDarkMode
                              ? colorWhite
                              : colorBlack,
                        ),
                        height: 40,
                        width: 40,
                      ),
                    ),
                  )),
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
            ],
          ),
        ),
      ),
    );
  }
}
