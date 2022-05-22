import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff413F42),
      child: Center(
        child: Text(
          "INVENTORY ASSIST",
          style: GoogleFonts.montserrat(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
    
  }
}
