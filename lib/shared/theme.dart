import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

const Color primaryColor = Color(0xff6C5ECF);
const Color secondaryColor = Color(0xff38ABBE);
const Color alertColor = Color(0xffED6363);
const Color defaultIconNavColor = Color(0xff808191);
const Color backgroundColor1 = Color(0xff1F1D2B);
const Color backgroundColor2 = Color(0xff2B2937);
const Color backgroundColor3 = Color(0xff242231);
const Color backgroundColor4 = Color(0xff252836);
const Color backgroundColor5 = Color(0xff2B2844);
const Color productBackgroundColor = Color(0xffECEDEF);
const Color primaryTextColor = Color(0xffF1F0F2);
const Color secondaryTextColor = Color(0xff999999);
const Color priceTextColor = Color(0xff2C96F1);
const Color subtitleTextColor = Color(0xff504F5E);
const Color blackTextColor = Color(0xff2E2E2E);
const Color redColor = Color(0xffB0251E);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
);

TextStyle priceTextStyle = GoogleFonts.poppins(
  color: priceTextColor,
);

TextStyle buttonTextStyle = GoogleFonts.poppins(
  color: primaryColor,
);

TextStyle subtitleTextStyle = GoogleFonts.poppins(
  color: subtitleTextColor,
);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackTextColor,
);

TextStyle alertTextStyle = GoogleFonts.poppins(
  color: alertColor,
);

const FontWeight light = FontWeight.w300;
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;

const double pagePadding = 30.0;
const double generalRadius = 12.0;

BorderRadius generalBorderRadius = BorderRadius.circular(generalRadius);

const IconData backIcon = Icons.arrow_back_ios_new_rounded;
const IconData closeIcon = Icons.close_rounded;
const IconData forwardIcon = Icons.arrow_forward_ios_rounded;

final InputBorder outlineInputBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: backgroundColor2),
  borderRadius: generalBorderRadius,
);

String currencyFormat(num number){
  return NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  ).format(number);
}