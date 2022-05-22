import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_inventory/Utils/appbar.dart';
import 'package:product_inventory/Utils/header.dart';

class Faq extends StatefulWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar,
        bottomNavigationBar: const BottomBar(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "FAQ",
                  style: GoogleFonts.montserrat(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Faq")
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }
                      return Column(
                        children: snapshot.data!.docs
                            .map(
                              (e) => FaqSection(
                                question: e.data()["question"],
                                answer: e.data()["answer"],
                              ),
                            )
                            .toList(),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}

class FaqSection extends StatefulWidget {
  final String question;
  final String answer;
  const FaqSection({Key? key, required this.answer, required this.question})
      : super(key: key);

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 26,
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.0),
        border: Border.all(
          width: 1.0,
          color: Colors.black26,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            style: GoogleFonts.montserrat(
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            widget.answer,
            style: GoogleFonts.montserrat(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
