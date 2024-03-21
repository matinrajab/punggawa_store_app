import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xff29206C);
const Color secondaryColor = Color(0xff38ABBE);
const Color tertiaryColor = Color(0xffFF8753);
const Color alertColor = Color(0xffED6363);
const Color unselectedColor = Color(0xffA39FC0);
const Color backgroundColor1 = Color(0xffFFFFFF);
const Color backgroundColor2 = Color(0xffEFEFEF);
const Color productBackgroundColor = Color(0xffECEDEF);
const Color primaryTextColor = Color(0xff2E2E2E);
const Color secondaryTextColor = Color(0xff999999);
const Color subtitleTextColor = Color(0xffB4B4B4);
const Color priceTextColor = Color(0xff2C96F1);
const Color whiteColor = Color(0xffFFFFFF);
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

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: whiteColor,
);

TextStyle alertTextStyle = GoogleFonts.poppins(
  color: alertColor,
);

TextStyle unselectedTextStyle = GoogleFonts.poppins(
  color: unselectedColor,
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
