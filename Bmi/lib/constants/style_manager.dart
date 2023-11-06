import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi/constants/values_manger.dart';

TextStyle _getTextStyle(
    double fontSize,  FontWeight fontWeight, Color color,) {
  return GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight, )
  );
}

// regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize,FontWeight.w400, color);
}

// light text style
 TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize,  FontWeight.w300, color);
}
// bold text style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontWeight.w500, color,);
}

// semi bold text style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize,  FontWeight.w600, color);
}

// medium text style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize,  FontWeight.w500, color);
}

///---------------------///


TextStyle _getTextInvoiceStyle(
    double fontSize,  FontWeight fontWeight, Color color,) {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight, )
  );
}

// regular style
TextStyle getRegularInvoiceStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextInvoiceStyle(
      fontSize, FontWeight.w400, color);
}

// light text style
TextStyle getLightInvoiceStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextInvoiceStyle(
      fontSize,FontWeight.w300, color);
}
// bold text style

TextStyle getBoldInvoiceStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextInvoiceStyle(
    fontSize,  FontWeight.w700, color,);
}

// semi bold text style
TextStyle getSemiBoldInvoiceStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextInvoiceStyle(
      fontSize, FontWeight.w600, color);
}

// medium text style

TextStyle getMediumInvoiceStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextInvoiceStyle(
      fontSize,  FontWeight.w500, color);
}

///---------------------///

class FontSize {
  static const double s5 = 5.0;
  static const double s6 = 6.0;
  static const double s7 = 7.0;
  static const double s8 = 8.0;
  static const double s9 = 9.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s13 = 13.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s17 = 17.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
  static const double s24 = 24.0;
  static const double s26 = 26.0;
  static const double s28 = 28.0;
  static const double s30 = 30.0;
  static const double s36 = 36.0;
  static const double s50 = 50.0;
  static const double s60 = 60.0;
  static const double s100 = 100.0;
}

