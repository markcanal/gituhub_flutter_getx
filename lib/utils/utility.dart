import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppUtility {
  static const rowSpaceSm = SizedBox(
    width: 10,
  );
  static const rowSpaceM = SizedBox(
    width: 20,
  );
  static const rowSpaceL = SizedBox(
    width: 30,
  );
  static const rowSpaceXL = SizedBox(
    width: 40,
  );

  static const colSpaceXL = SizedBox(
    height: 40,
  );

  static const colSpaceSm = SizedBox(
    height: 10,
  );

  static rowSpace(double width) {
    return SizedBox(
      width: width,
    );
  }

  static const EdgeInsets edgeInsetsAllSm = EdgeInsets.all(8);
  static const EdgeInsets paddingVertical = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets paddingHorizontal =
      EdgeInsets.symmetric(horizontal: 8);

  static SizedBox dashBoardAvatarHolder(Widget child) {
    return SizedBox(
      width: 60,
      height: 60,
      child: child,
    );
  }

  static SizedBox userAvatarHolder(Widget child) {
    return SizedBox(
      width: 100,
      height: 100,
      child: child,
    );
  }

  /// Font Styling
  static TextStyle labelText =
      TextStyle(fontSize: 14, fontFamily: GoogleFonts.adventPro().fontFamily);

  /// Widget Styling
  static Text titleLabel(String name, {Color? colors = Colors.black}) {
    return Text(
      name,
      style: TextStyle(
          fontFamily: GoogleFonts.adventPro().fontFamily,
          letterSpacing: 0.9,
          fontWeight: FontWeight.w900,
          fontSize: 18,
          color: colors ?? Colors.black),
    );
  }

  static Text normalText(String string) {
    return Text(
      string,
      style: TextStyle(
          fontFamily: GoogleFonts.adventPro().fontFamily,
          letterSpacing: 0.9,
          fontSize: 14),
    );
  }

  static Text normalTextBold(String string) {
    return Text(
      string,
      style: TextStyle(
          fontFamily: GoogleFonts.adventPro().fontFamily,
          letterSpacing: 0.9,
          fontWeight: FontWeight.bold,
          fontSize: 14),
    );
  }

  static Text linkText(String string) {
    return Text(
      string,
      style: TextStyle(
          fontFamily: GoogleFonts.adventPro().fontFamily,
          letterSpacing: 0.9,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
          fontSize: 14,
          color: Colors.blue),
      overflow: TextOverflow.ellipsis,
    );
  }

  static Widget informativeRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppUtility.normalTextBold(label),
        AppUtility.rowSpaceSm,
        Flexible(child: AppUtility.normalTextBold(value))
      ],
    );
  }
}
