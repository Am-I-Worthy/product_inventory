import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:product_inventory/Utils/appbar.dart';
import 'package:product_inventory/Utils/header.dart';
import 'package:product_inventory/Utils/styles.dart';

class AddInventory extends StatefulWidget {
  const AddInventory({Key? key}) : super(key: key);

  @override
  State<AddInventory> createState() => _AddInventoryState();
}

class _AddInventoryState extends State<AddInventory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar,
        bottomNavigationBar: const BottomBar(),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  width: MediaQuery.of(context).size.width - 50,
                  margin: EdgeInsets.symmetric(vertical: 7.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: const Color(0xffBDE6F1),
                      border: Border.all(
                        width: 1.5,
                        color: Colors.black54,
                      )),
                  child: Text(
                    "ADD GROUP",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Column(
                  children: const [
                    InventoryGroup(),
                    InventoryGroup(),
                    InventoryGroup(),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class InventoryGroup extends StatefulWidget {
  const InventoryGroup({Key? key}) : super(key: key);

  @override
  State<InventoryGroup> createState() => _InventoryGroupState();
}

class _InventoryGroupState extends State<InventoryGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width - 50,
      margin: EdgeInsets.symmetric(vertical: 7.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            width: 1.5,
            color: Colors.black54,
          )),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Group Name",
                style: GoogleFonts.montserrat(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.inventory_2_rounded,
                color: Colors.red,
              )
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Column(
            children: [
              const InventoryItems(),
              const InventoryItems(),
              const InventoryItems(),
            ],
          )
        ],
      ),
    );
  }
}

class InventoryItems extends StatefulWidget {
  const InventoryItems({Key? key}) : super(key: key);

  @override
  State<InventoryItems> createState() => _InventoryItemsState();
}

class _InventoryItemsState extends State<InventoryItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: const Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: Text(
          "Item 1",
          style: defaultStyle,
        ),
      ),
    );
  }
}
