import 'package:flutter/material.dart';

const Color mainBgColor = Color(0xFFF0F4F4);
const Color whiteColor = Color(0xFFFFFFFF);
const Color redColor = Color(0xFFFF0000);
const Color otpFieldBgColor = Color(0xFFF5F5F5);
const Color inputFieldBgColor = Color(0xFFF8F8F8);
const Color inputFieldBorderColor = Color(0xFFF3F3F3);
const Color themeColor = Color(0xFF2DBC77);
const Color otherTextColor = Color(0xFFA3A3A8);
const Color backButtonBorderColor = Color(0xFFCCCCCC);
const Color otherDeepTextColor = Color(0xFF78787F);
const Color normalTextColor = Color(0xFF040415);

MaterialColor getColorFromHexCode(String hexCode) {
  var primary = int.parse(hexCode.replaceAll('#', '0xff'));
  Map<int, Color> color = {
    50: Color(primary).withOpacity(0.1),
    100: Color(primary).withOpacity(0.2),
    200: Color(primary).withOpacity(0.3),
    300: Color(primary).withOpacity(0.4),
    400: Color(primary).withOpacity(0.5),
    500: Color(primary).withOpacity(0.6),
    600: Color(primary).withOpacity(0.7),
    700: Color(primary).withOpacity(0.8),
    800: Color(primary).withOpacity(0.9),
    900: Color(primary).withOpacity(1.0),
  };
  return MaterialColor(primary, color);
}
