import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class text extends StatelessWidget {
  final String txt;
  const text({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: GoogleFonts.notoSansThai(
          fontWeight: FontWeight.w500, fontSize: 26, color: Colors.black),
    );
  }
}
