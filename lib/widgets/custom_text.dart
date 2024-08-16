import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Text CustomText(String text, double size, FontWeight textWeight, Color textColor){
  return Text(
      text,
      style: GoogleFonts.openSans(
        fontSize: size,
        fontWeight: textWeight,
        color: textColor
      ),
  );
}