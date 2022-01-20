import 'package:flutter/material.dart';
import 'ui_helper.dart';

class Styles {
  static const btnTxtStyle =
      TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600);
  static const titleBarStyle = TextStyle(
      fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: darkColor);
  static final ButtonStyle elevBtnStyle = ElevatedButton.styleFrom(
      elevation: 0.5,
      primary: primaryColor,
      minimumSize: const Size(100, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onPrimary: lightColor,
      textStyle: btnTxtStyle);

  static final ButtonStyle outlineBtnStyle = OutlinedButton.styleFrom(
      elevation: 0,
      primary: primaryColor,
      minimumSize: const Size(100, 50),
      side: const BorderSide(color: primaryColor, width: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: btnTxtStyle);

  static const headStyle = TextStyle(
      fontFamily: 'Poppins', fontSize: 30, fontWeight: FontWeight.w600);

  static const bodyStyle = TextStyle(
      fontFamily: 'Poppins', fontSize: 19, fontWeight: FontWeight.w600);

  static const smallStyle = TextStyle(
      fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w500);
  static const verySmallStyle = TextStyle(
      fontFamily: 'Poppins', fontSize: 11, fontWeight: FontWeight.w500);
}

// by rafiknurf