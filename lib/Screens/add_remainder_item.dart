import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_inventory/Utils/appbar.dart';
import 'package:product_inventory/Utils/header.dart';
import 'package:product_inventory/Utils/styles.dart';

class AddRemainderItem extends StatefulWidget {
  const AddRemainderItem({Key? key}) : super(key: key);

  @override
  State<AddRemainderItem> createState() => _AddRemainderItemState();
}

enum Frequency { lowquantity, set }
enum Via { email, sms }

class _AddRemainderItemState extends State<AddRemainderItem> {
  Frequency _remainder = Frequency.lowquantity;
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
                "SET A REMAINDER FOR ORDER ITEM",
                textAlign: TextAlign.center,
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
                        'Low Qunatity Alert',
                        style: defaultStyle,
                      ),
                      leading: Radio<Frequency>(
                        value: Frequency.lowquantity,
                        groupValue: _remainder,
                        onChanged: (Frequency? value) {
                          setState(() {
                            _remainder = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Set Frequency',
                        style: defaultStyle,
                      ),
                      leading: Radio<Frequency>(
                        value: Frequency.set,
                        groupValue: _remainder,
                        onChanged: (Frequency? value) {
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
                      "ENTER DETAILS",
                      style: GoogleFonts.montserrat(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Website',
                          hintText: 'Enter the URL',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: TextField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Quantity',
                          hintText: 'Enter a Quantity (Eg:3 , number > 1)',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Description',
                          hintText: 'Enter a Description about the Item',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
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
