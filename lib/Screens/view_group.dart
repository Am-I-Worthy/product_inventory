import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:product_inventory/Utils/styles.dart';

class ViewGroup extends StatefulWidget {
  const ViewGroup({Key? key}) : super(key: key);

  @override
  State<ViewGroup> createState() => _ViewGroupState();
}

class _ViewGroupState extends State<ViewGroup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Group").snapshots(),
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
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: const Color(0xffFFE59D),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "GROUP NAME : ",
                                  style: defaultStyle,
                                ),
                                Text(
                                  e.data()["name"],
                                  style: defaultStyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Column(
                              children: e.data()["items"].map<Widget>((e) {
                                return StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("Item")
                                        .doc(e)
                                        .snapshots(),
                                    builder: (context,
                                        AsyncSnapshot<
                                                DocumentSnapshot<
                                                    Map<String, dynamic>>>
                                            item) {
                                      if (!item.hasData) {
                                        return const SizedBox();
                                      }
                                      return Container(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "ITEM NAME : ",
                                                  style: defaultStyle,
                                                ),
                                                Text(
                                                  item.data!
                                                      .data()!["itemName"],
                                                  style: defaultStyle,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  100,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "DESCRIPTION : ",
                                                    style: defaultStyle,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      item.data!.data()![
                                                          "description"],
                                                      maxLines: 5,
                                                      style: defaultStyle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  100,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "ORDER INFO : ",
                                                    style: defaultStyle,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            300,
                                                    child: Text(
                                                      item.data!
                                                          .data()!["orderInfo"],
                                                      maxLines: 5,
                                                      style: defaultStyle,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              }).toList(),
                            )
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
