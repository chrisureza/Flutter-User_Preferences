import 'package:flutter/material.dart';
import 'package:user_preferences/src/shared_prefs/user_prefs.dart';
import 'package:user_preferences/src/widgets/drawer_menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new UserPrefs();

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'about',
                  child: Text('About'),
                ),
              ];
            },
            onSelected: (result) {
              switch (result) {
                case 'about':
                  Navigator.pushNamed(context, 'about');
                  break;
              }
            },
          ),
        ],
      ),
      drawer: DrawerMenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Secondary color: ${prefs.secondaryColor}'),
          Divider(),
          Text('Genre: ${prefs.genre}'),
          Divider(),
          Text('User Name: ${prefs.name}'),
        ],
      ),
    );
  }
}
