import 'package:ccpc/screens/splash.dart';

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

  void initActions() async {
    // do initial async work like data fetch
    setState(() {
      // display main app screen
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
    return MaterialApp(
      title: "CCPC",
      routes: {
        '/': (context) => const Home(),
        '/splash': (context) => const Splash(),
      },
      initialRoute: loading ? '/splash' : '/',
    );
  }
}
