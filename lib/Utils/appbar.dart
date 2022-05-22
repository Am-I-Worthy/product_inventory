import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

PreferredSizeWidget? appbar = AppBar(
  toolbarHeight: 60,
  backgroundColor: const Color(0xff413F42),
  centerTitle: true,
  // title: Container(
  //   height: 55,
  //   width: 270,
  //   decoration: BoxDecoration(
  //     color: Colors.white,
  //     borderRadius: BorderRadius.circular(5.0),
  //   ),
  //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
  //   child: Center(
  //     child: SizedBox(
  //       child: Center(
  //         child: TextFormField(
  //           decoration: InputDecoration(
  //             hintText: "Search",
  //             hintStyle: GoogleFonts.poppins(
  //               fontSize: 16.0,
  //               color: Colors.black,
  //               fontWeight: FontWeight.w600,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),
  // ),
  actions: const [
    SizedBox(width: 25.0),
    CircleAvatar(radius: 20.0),
  ],
);
