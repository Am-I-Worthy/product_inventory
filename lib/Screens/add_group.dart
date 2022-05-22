import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_inventory/Utils/appbar.dart';
import 'package:product_inventory/Utils/header.dart';

// class ItemStore{
//    late String name;
//   late String id;
//   ItemStore(name,id){
//     this.id;
//     this.name;
//   }
// }
class AddGroup extends StatefulWidget {
  final String id;
  const AddGroup({Key? key, required this.id}) : super(key: key);

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  String dropdownvalue = "ADD A ITEM";

  List<String> items = [
    "ADD A ITEM",
  ];

  // List<ItemStore> itemStore =[];

  Future<void> getItemCollection() async {
    await FirebaseFirestore.instance.collection("Item").get().then((value) => {
          for (int i = 0; i < value.docs.length; i++)
            {
              setState(() {
                items.add(value.docs[i].data()["itemName"]);
                // itemStore.add(ItemStore(value.docs[i].data()["itemName"], value.docs[i].id ));
              })
            }
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getItemCollection();
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomBar(),
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
                    "CREATE NEW GROUP",
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
                        ),
                      ),
                      Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width - 200 - 36,
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "GROUP NAME",
                              style: GoogleFonts.montserrat(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: TextField(
                                maxLines: 1,
                                controller: controller,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  // labelText: 'User Name',
                                  // hintText: 'Enter Your Name',
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    "ITEM INFORMATION",
                    style: GoogleFonts.montserrat(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  DropdownButton(
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: GoogleFonts.montserrat(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) async {
                      await FirebaseFirestore.instance
                          .collection("Group")
                          .doc(widget.id)
                          .get()
                          .then((itemData) {
                        List<dynamic> a = itemData.data()!["items"].toList();
                        FirebaseFirestore.instance
                            .collection("Item")
                            .where("itemName", isEqualTo: newValue)
                            .get()
                            .then((value) => {
                                  a.add(value.docs.first.id),
                                  FirebaseFirestore.instance
                                      .collection("Group")
                                      .doc(widget.id)
                                      .set({
                                    "items": a,
                                  }, SetOptions(merge: true))
                                });

                        // a.add("/Item/${}");
                      });
                    },
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("Group")
                          .doc(widget.id)
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                              itemData) {
                        if (!itemData.hasData) return const SizedBox();

                        return Column(
                          children: itemData.data!.data()!["items"].map<Widget>(
                            (e) {
                              // return SizedBox();
                              return Container(
                                width: MediaQuery.of(context).size.width - 150,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 16.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    width: 1.2,
                                    color: Colors.black54,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete_rounded,
                                      color: Colors.red[600],
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection("Item")
                                            .doc(e)
                                            .snapshots(),
                                        builder: (context,
                                            AsyncSnapshot<
                                                    DocumentSnapshot<
                                                        Map<String, dynamic>>>
                                                snapshot) {
                                          if (!snapshot.hasData)
                                            return const SizedBox();
                                          return Text(
                                            snapshot.data!.data()!["itemName"],
                                            style: GoogleFonts.montserrat(
                                              color: Colors.blue[700],
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      await FirebaseFirestore.instance
                          .collection("Group")
                          .doc(widget.id)
                          .set({
                        "name": controller.text
                      }, SetOptions(merge: true)).then(
                              (value) => Navigator.pop(context));
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
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
