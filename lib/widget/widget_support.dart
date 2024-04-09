import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget {
  static TextStyle boldTextFieldStyle() {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle HeadlineTextFieldStyle() {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextStyle LightTextFieldStyle() {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Colors.black38,
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static TextStyle semiBoldTextFieldStyle() {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static TextStyle regularTextFieldStyle() {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
