import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

 TextStyle defaultTextStyle(double fontSize, Color color , {FontWeight fontWeight = FontWeight.w300}){
  return  GoogleFonts.roboto(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight
  );
}