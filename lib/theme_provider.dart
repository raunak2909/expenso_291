import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDark = false; //light

  void updateTheme(bool value){
    _isDark = value;
    notifyListeners();
  }

  bool getThemeValue() => _isDark;

}