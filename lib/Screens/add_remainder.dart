import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_inventory/Utils/appbar.dart';
import 'package:product_inventory/Utils/header.dart';
import 'package:product_inventory/Utils/styles.dart';

class AddRemainder extends StatefulWidget {
  const AddRemainder({Key? key}) : super(key: key);

  @override
  State<AddRemainder> createState() => _AddRemainderState();
}

enum Remainder { daily, weekly, monthly, custom }
enum Via { email, sms }

class _AddRemainderState extends State<AddRemainder> {
  Remainder _remainder = Remainder.daily;
  Via _via = Via.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      bottomNavigationBar: BottomBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "SET A REMAINDER FOR INVENTORY",
                style: GoogleFonts.montserrat(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 26,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color(0xffBDE6F1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "FREQUENCY",
                      style: GoogleFonts.montserrat(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Daily',
                        style: defaultStyle,
                      ),
                      leading: Radio<Remainder>(
                        value: Remainder.daily,
                        groupValue: _remainder,
                        onChanged: (Remainder? value) {
                          setState(() {
                            _remainder = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Weekly',
                        style: defaultStyle,
                      ),
                      leading: Radio<Remainder>(
                        value: Remainder.weekly,
                        groupValue: _remainder,
                        onChanged: (Remainder? value) {
                          setState(() {
                            _remainder = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Monthly',
                        style: defaultStyle,
                      ),
                      leading: Radio<Remainder>(
                        value: Remainder.monthly,
                        groupValue: _remainder,
                        onChanged: (Remainder? value) {
                          setState(() {
                            _remainder = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Custom',
                        style: defaultStyle,
                      ),
                      leading: Radio<Remainder>(
                        value: Remainder.custom,
                        groupValue: _remainder,
                        onChanged: (Remainder? value) {
                          setState(() {
                            _remainder = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 26,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: const Color(0xffBDE6F1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "SEND VIA PLATFORM",
                      style: GoogleFonts.montserrat(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Email',
                        style: defaultStyle,
                      ),
                      leading: Radio<Via>(
                        value: Via.email,
                        groupValue: _via,
                        onChanged: (Via? value) {
                          setState(() {
                            _via = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'SMS',
                        style: defaultStyle,
                      ),
                      leading: Radio<Via>(
                        value: Via.sms,
                        groupValue: _via,
                        onChanged: (Via? value) {
                          setState(() {
                            _via = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: Colors.blue,
                  ),
                  child: Text(
                    "SAVE",
                    style: GoogleFonts.montserrat(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
