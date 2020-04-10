import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  // Singleton Pettern
  static final UserPrefs _instance = new UserPrefs._internal();

  factory UserPrefs() {
    return _instance;
  }

  UserPrefs._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // bool _sevondaryColor;
  // int _genre;
  // String _name;

  get genre {
    return _prefs.getInt('genre') ?? 1;
  }

  set genre(int value) {
    _prefs.setInt('genre', value);
  }

  get secondaryColor {
    return _prefs.getBool('secondaryColor') ?? false;
  }

  set secondaryColor(bool value) {
    _prefs.setBool('secondaryColor', value);
  }

  get name {
    return _prefs.getString('name') ?? 'Christian';
  }

  set name(String value) {
    _prefs.setString('name', value);
  }
}
