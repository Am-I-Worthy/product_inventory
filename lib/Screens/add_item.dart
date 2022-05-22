import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_inventory/Utils/appbar.dart';
import 'package:product_inventory/Utils/header.dart';
import 'package:product_inventory/Utils/navbar.dart';

class AddNewItem extends StatefulWidget {
  const AddNewItem({Key? key}) : super(key: key);

  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  String itemName = "ITEM NAME";
  String orderInfo = "";
  String desc = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavDrawer(),
        bottomNavigationBar: BottomBar(),
        appBar: appbar,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "ADD NEW ITEM",
                    style: GoogleFonts.montserrat(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      Container(
                          height: 185,
                          width: 200,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10.0,
                                offset: Offset(0, 5),
                                color: Colors.black.withOpacity(0.1),
                              )
                            ],
                          ),
                          child: const Image(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1612817288484-6f916006741a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGhvbWUlMjBwcm9kdWN0c3xlbnwwfHwwfHw%3D&w=1000&q=80"),
                            fit: BoxFit.cover,
                          )),
                      Container(
                        height: 130,
                        padding: const EdgeInsets.only(left: 20.0, right: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              itemName,
                              style: GoogleFonts.montserrat(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Location",
                              style: GoogleFonts.montserrat(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Group",
                              style: GoogleFonts.montserrat(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Low quantity alert",
                              style: GoogleFonts.montserrat(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "ENTER ITEM DETAILS",
                    style: GoogleFonts.montserrat(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: TextField(
                      maxLines: 1,
                      onChanged: (a) {
                        setState(() {
                          itemName = a;
                        });
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Item Name',
                        hintText: 'Enter Item Name',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "ORDERING INFORMATION",
                    style: GoogleFonts.montserrat(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: TextField(
                      maxLines: 4,
                      onChanged: (a) {
                        setState(() {
                          orderInfo = a;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // labelText: 'User Name',
                        // hintText: 'Enter Your Name',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "DESCRIPTION",
                    style: GoogleFonts.montserrat(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: TextField(
                      maxLines: 7,
                      onChanged: (a) {
                        setState(() {
                          desc = a;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // labelText: 'User Name',
                        // hintText: 'Enter Your Name',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  InkWell(
                    onTap: () {
                      FirebaseFirestore.instance.collection("Item").add({
                        "itemName": itemName,
                        "orderInfo": orderInfo,
                        "description": desc,
                      }).then((value) => Navigator.pop(context));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        color: Colors.blue,
                      ),
                      child: Text(
                        "CREATE",
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
        ),
      ),
    );
  }
}
