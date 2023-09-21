import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventText extends StatelessWidget {
  final String txt;
  const EventText({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: GoogleFonts.notoSansThai(
          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
    );
  }
}
