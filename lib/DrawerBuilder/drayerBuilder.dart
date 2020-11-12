import 'package:flutter/material.dart';

getDrawer() {
  List<Widget> drawerItems = [];
}

Map drawer = {
  "attributes": {},
  "drawerHeader": {
    "headercolor": Colors.blueGrey[800],
    "headerIcon": Icons.check,
    "name": "Shahzad",
    "email": "shahzad@tanbits.com"
  }
};

drawerHeader(entity) {
  return DrawerHeader(
    decoration: BoxDecoration(
      color: entity['headercolor'],
    ),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            entity['headerIcon'],
            color: Colors.white,
            size: 80,
          ),
          Text(
            '${entity['name']}'.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    ),
  );
}
