import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_inventory/Screens/add_group.dart';
import 'package:product_inventory/Screens/add_inventory.dart';
import 'package:product_inventory/Screens/add_item.dart';
import 'package:product_inventory/Screens/add_remainder.dart';
import 'package:product_inventory/Screens/add_remainder_item.dart';
import 'package:product_inventory/Screens/faq.dart';
import 'package:product_inventory/Utils/appbar.dart';
import 'package:product_inventory/Utils/header.dart';
import 'package:product_inventory/Utils/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavDrawer(),
        bottomNavigationBar: const BottomBar(),
        appBar: appbar,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddInventory(),
                    ),
                  );
                },
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                      color: const Color(0xffBDE6F1),
                      borderRadius: BorderRadius.circular(7.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff7F8487).withOpacity(0.3),
                          offset: const Offset(0, 5),
                          blurRadius: 10.0,
                        )
                      ]),
                  child: Center(
                    child: Text(
                      "START NEW INVENTORY",
                      style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width - 70,
                decoration: BoxDecoration(
                    color: const Color(0xffBDE6F1),
                    borderRadius: BorderRadius.circular(7.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff7F8487).withOpacity(0.3),
                        offset: const Offset(0, 5),
                        blurRadius: 10.0,
                      )
                    ]),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFE59D),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Center(
                              child: Text(
                                "Getting\nStarted",
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin:
                                const EdgeInsets.only(right: 10.0, left: 10.0),
                            height: 80,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFE59D),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Center(
                              child: Text(
                                "Tips",
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Faq(),
                                ),
                              );
                            },
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: const Color(0xffFFE59D),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Center(
                                child: Text(
                                  "FAQ",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              NewItemsButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNewItem(),
                    ),
                  );
                },
                text: "NEW ITEM",
              ),
              const SizedBox(
                height: 20.0,
              ),
              NewItemsButton(
                onPressed: () async {
                  // await FirebaseFirestore.instance.collection("Group").add({
                  //   "name": "GROUP NAME",
                  // }).then((value) => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddGroup(id: "PyciMMA9Yh3zDj9LH4GP"),
                    ),
                  );
                  // });
                },
                text: "NEW GROUP",
              ),
              const SizedBox(
                height: 20.0,
              ),
              NewItemsButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddRemainderItem(),
                    ),
                  );
                },
                text: "NEW ORDER REMAINDER",
              ),
              const SizedBox(
                height: 20.0,
              ),
              NewItemsButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddRemainder(),
                    ),
                  );
                },
                text: "NEW INVENTORY REMAINDER",
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                    color: const Color(0xffBDE6F1),
                    borderRadius: BorderRadius.circular(7.0),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff7F8487).withOpacity(0.3),
                        offset: const Offset(0, 5),
                        blurRadius: 10.0,
                      )
                    ]),
                child: Center(
                  child: Text(
                    "VIEW PREVIOUS INVENTORY",
                    style: GoogleFonts.montserrat(
                      fontSize: 16.0,
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

class NewItemsButton extends StatefulWidget {
  final Function onPressed;
  final String text;
  const NewItemsButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  State<NewItemsButton> createState() => _NewItemsButtonState();
}

class _NewItemsButtonState extends State<NewItemsButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          widget.onPressed();
        },
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width - 70,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: BoxDecoration(
              color: const Color(0xffF2F2F2),
              border: Border.all(width: 1.5, color: Colors.black12),
              borderRadius: BorderRadius.circular(7.0),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff7F8487).withOpacity(0.2),
                  offset: const Offset(0, 5),
                  blurRadius: 10.0,
                )
              ]),
          child: Row(
            children: [
              const Icon(
                Icons.add_rounded,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  widget.text,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
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
