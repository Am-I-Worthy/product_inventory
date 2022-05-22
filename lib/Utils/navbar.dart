import 'package:flutter/material.dart';
import 'package:product_inventory/Utils/styles.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // const DrawerHeader(
          //   child: Text(
          //     'Side menu',
          //     style: TextStyle(color: Colors.white, fontSize: 25),
          //   ),
          // ),
          ListTile(
            leading: const Icon(Icons.home_rounded),
            title: Text(
              'HOME',
              style: defaultStyle,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.person_rounded),
            title: Text(
              'ACCOUNTS',
              style: defaultStyle,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.add_rounded),
            title: Text(
              'ADD ITEM',
              style: defaultStyle,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.add_rounded),
            title: Text(
              'ADD USER',
              style: defaultStyle,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.add_rounded),
            title: Text(
              'ADD GROUP',
              style: defaultStyle,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.lock_clock_rounded),
            title: Text(
              'ADD ORDER REMINDER',
              style: defaultStyle,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.lock_clock_rounded),
            title: Text(
              'ADD INVENTORY REMINDER',
              style: defaultStyle,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.inventory_2_rounded),
            title: Text(
              'START INVENTORY',
              style: defaultStyle,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.card_travel_rounded),
            title: Text(
              'PREVIOUS INVENTORY',
              style: defaultStyle,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.card_travel_rounded),
            title: Text(
              'INVENTORY ARCHIVE',
              style: defaultStyle,
            ),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
