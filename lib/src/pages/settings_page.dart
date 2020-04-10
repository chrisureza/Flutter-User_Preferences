import 'package:flutter/material.dart';
import 'package:user_preferences/src/shared_prefs/user_prefs.dart';
import 'package:user_preferences/src/widgets/drawer_menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor;
  int _genre;
  // String _name;

  TextEditingController _textController;
  final prefs = new UserPrefs();

  @override
  void initState() {
    super.initState();
    _genre = prefs.genre;
    _secondaryColor = prefs.secondaryColor;
    _textController = new TextEditingController(text: prefs.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
      ),
      drawer: DrawerMenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: _secondaryColor,
            title: Text('Secondary Color'),
            onChanged: (bool value) {
              setState(() {
                prefs.secondaryColor = value;
                _secondaryColor = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Male'),
            groupValue: _genre,
            onChanged: (int value) => _setSelectedRadio(value),
          ),
          RadioListTile(
            value: 2,
            title: Text('female'),
            groupValue: _genre,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Name',
                helperText: 'Name of the user',
              ),
              onChanged: (String value) {
                prefs.name = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  _setSelectedRadio(int value) {
    prefs.genre = value;
    setState(() {
      _genre = value;
    });
  }
}
