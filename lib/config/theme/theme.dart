import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0XFF0076FE);

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.manropeTextTheme(),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
    ),
    appBarTheme: appBarTheme(),
    inputDecorationTheme: inputTheme(),
    elevatedButtonTheme: elevatedButtonTheme(),
    bottomNavigationBarTheme: bottomNavigationBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}

InputDecorationTheme inputTheme() {
  return const InputDecorationTheme(
    labelStyle: TextStyle(
      color: Color(0xFF8B8B8B),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFF8B8B8B),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
    ),
    filled: true,
    fillColor: Color.fromARGB(255, 251, 251, 251),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFF8B8B8B),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: primaryColor,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
    ),
  );
}

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      minimumSize: const Size(double.infinity, 50),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
}

BottomNavigationBarThemeData bottomNavigationBarTheme() {
  return const BottomNavigationBarThemeData(
    selectedItemColor: primaryColor,
    unselectedItemColor: Color(0xFF8B8B8B),
    elevation: 10,
  );
}
