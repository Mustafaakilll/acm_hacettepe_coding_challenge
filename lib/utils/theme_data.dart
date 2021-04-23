import 'package:flutter/material.dart';

ThemeData get myTheme => ThemeData.light().copyWith(
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff444777),
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontSize: 15),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 96,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
          color: Colors.black,
        ),
        headline2: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          color: Colors.black,
        ),
        headline3: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        headline4: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          letterSpacing: 0.25,
        ),
        headline5: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        headline6: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          letterSpacing: 0.15,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          letterSpacing: 0.5,
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          letterSpacing: 0.25,
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          letterSpacing: 0.15,
        ),
        subtitle2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          letterSpacing: 0.1,
        ),
        button: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          letterSpacing: 1.25,
        ),
        caption: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          letterSpacing: 0.4,
        ),
        overline: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          letterSpacing: 1.5,
        ),
      ),
    );
