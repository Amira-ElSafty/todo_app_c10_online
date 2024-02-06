import 'package:flutter/material.dart';

class MyTheme {
  // colors , light theme , dark theme
  static Color primaryColor = Color(0xff5D9CEC);
  static Color whiteColor = Color(0xffffffff);
  static Color blackColor = Color(0xff383838);
  static Color greenColor = Color(0xff61E757);
  static Color redColor = Color(0xffEC4B4B);
  static Color greyColor = Color(0xffa59b9b);
  static Color backgroundColor = Color(0xffDFECDB);
  static Color blackDarkColor = Color(0xff141922);
  static Color backgroundDarkColor = Color(0xff060E1E);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
        backgroundColor: Colors.transparent,
        elevation: 0),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: whiteColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
          side: BorderSide(color: MyTheme.blackColor, width: 4)),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      shape: StadiumBorder(side: BorderSide(color: whiteColor, width: 6)),
      // RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(35),
      //   side: BorderSide(
      //     color: whiteColor,
      //     width: 4
      //   )
      // )
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
      titleSmall: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: blackColor),
    ),
  );
}
