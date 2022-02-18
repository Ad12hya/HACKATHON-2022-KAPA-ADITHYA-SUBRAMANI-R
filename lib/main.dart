import 'package:ccpc/screens/splash.dart';
import 'package:ccpc/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // display splash screen while the app is starting
  bool loading = true;
  bool isDarkMode = false;

  void initActions() async {
    // do initial async work like data fetch
    final prefs = await SharedPreferences.getInstance();
    bool? prefDarkMode = prefs.getBool('isDarkMode');
    setState(() {
      // display main app screen
      isDarkMode = prefDarkMode ?? false;
      loading = false;
    });
  }

  @override
  void initState() {
    initActions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = isDarkMode
        ? ThemeProvider(ThemeMode.dark)
        : ThemeProvider(ThemeMode.light);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>.value(value: themeProvider)
      ],
      child: MaterialApp(
        title: "CCPC",
        home: loading ? const Splash() : const Home(),
      ),
    );
  }
}
