import 'package:flutter/material.dart';
import 'package:user_preferences/src/widgets/drawer_menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'),
      ),
      drawer: DrawerMenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secondary color: '),
          Divider(),
          Text('Genre: '),
          Divider(),
          Text('User Name: '),
        ],
      ),
    );
  }
}