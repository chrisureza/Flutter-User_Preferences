import 'package:flutter/material.dart';
import 'package:user_preferences/src/pages/home_page.dart';
import 'package:user_preferences/src/pages/settings_page.dart';
import 'package:user_preferences/src/shared_prefs/user_prefs.dart';

import 'src/pages/about_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPrefs();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final prefs = new UserPrefs();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Preferences',
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => SettingsPage(),
        'about': (BuildContext context) => AboutPage(),
      },
    );
  }
}
