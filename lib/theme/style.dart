import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

ThemeData appTheme() {
  return ThemeData(
    appBarTheme: AppBarTheme(elevation: 0),
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyText2:
          TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
    ),
    primaryColor: HexColor('#25252d'),
    hintColor: Colors.white,
    dividerColor: Colors.white,
    buttonColor: Colors.white,
    canvasColor: HexColor('#25252d'),
  );
}
