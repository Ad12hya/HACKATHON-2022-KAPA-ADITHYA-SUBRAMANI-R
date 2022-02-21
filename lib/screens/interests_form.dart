import 'package:ccpc/providers/theme_provider.dart';
import 'package:ccpc/utils/constants.dart';
import 'package:ccpc/utils/widget_functions.dart';
import 'package:ccpc/widgets/box_icon.dart';
import 'package:ccpc/widgets/form_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InterestForm extends StatefulWidget {
  const InterestForm({Key? key}) : super(key: key);

  static const routeName = '/interestForm';

  @override
  _InterestFormState createState() => _InterestFormState();
}

class _InterestFormState extends State<InterestForm> {
  bool alreadyFilled = false;
  bool loading = true;

  void getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    bool? temp = prefs.getBool('alreadyFilledForm');
    if (temp != null) {
      setState(() {
        alreadyFilled = true;
      });
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Scaffold(
        body: Center(child: Text("Just a sec...")),
      );
    }
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
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
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
                              Navigator.pop(context);
                            },
                            child: BoxIcon(
                                child: Icon(
                                  Icons.keyboard_backspace_outlined,
                                  color: themeProvider.isDarkMode
                                      ? colorWhite
                                      : colorBlack,
                                ),
                                height: 50,
                                width: 50),
                          );
                        }),
                        addHorizontalSpace(padding),
                        Expanded(
                          child: Text(
                            "About yourself",
                            style: headline1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  FormBody(),
                  addVerticalSpace(padding)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
