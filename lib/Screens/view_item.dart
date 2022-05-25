import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:product_inventory/Utils/appbar.dart';
import 'package:product_inventory/Utils/header.dart';
import 'package:product_inventory/Utils/styles.dart';

class ViewItem extends StatefulWidget {
  const ViewItem({Key? key}) : super(key: key);

  @override
  State<ViewItem> createState() => _ViewItemState();
}

class _ViewItemState extends State<ViewItem> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar,
        bottomNavigationBar: const BottomBar(),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Item").snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              }
              return Container(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: snapshot.data!.docs.map<Widget>((e) {
                      return Container(
                        width: MediaQuery.of(context).size.width - 100,
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: const Color(0xffFFE59D),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "ITEM NAME : ",
                                  style: defaultStyle,
                                ),
                                Text(
                                  e.data()["itemName"],
                                  style: defaultStyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  "DESCRIPTION : ",
                                  style: defaultStyle,
                                ),
                                Text(
                                  e.data()["description"],
                                  style: defaultStyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Text(
                                  "ORDER INFO : ",
                                  style: defaultStyle,
                                ),
                                Text(
                                  e.data()["orderInfo"],
                                  style: defaultStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
