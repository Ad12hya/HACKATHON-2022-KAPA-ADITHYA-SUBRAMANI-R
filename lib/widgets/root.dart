import 'package:ccpc/screens/contact_us.dart';
import 'package:ccpc/screens/detail_page.dart';
import 'package:ccpc/screens/faqs.dart';
import 'package:ccpc/screens/home.dart';
import 'package:ccpc/screens/interests_form.dart';
import 'package:ccpc/screens/reviews.dart';
import 'package:ccpc/screens/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      routes: {
        DetailPage.routeName: (context) => const DetailPage(),
        TermsAndConditions.routeName: (context) => const TermsAndConditions(),
        Reviews.routeName: (context) => const Reviews(),
        FAQs.routeName: (context) => const FAQs(),
        ContactUs.routeName: (context) => const ContactUs(),
        InterestForm.routeName: (context) => const InterestForm()
      },
      builder: EasyLoading.init(),
      themeMode: themeProvider.themeMode,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: Home(),
    );
  }
}
