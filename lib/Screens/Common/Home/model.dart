import 'package:flutter/material.dart';

Map drawerModel = {
  "attributes": {},
  "drawerHeader": {
    "headercolor": Colors.blueGrey[800],
    "headerIcon": Icons.account_circle,
    "name": "User Name",
    "email": "shahzad@tanbits.com"
  },
  "menuItems": [
    {
      "title": "Profile",
      "titleStyle": TextStyle(
        color: Colors.blueGrey[900],
      ),
      "subtitle": " ",
      "leadingIcon": Icons.account_circle,
      "trailingIcon": Icons.more_vert,
    },
    {
      "title": "Business",
      "titleStyle": TextStyle(
        color: Colors.blueGrey[900],
      ),
      "subtitle": " ",
      "leadingIcon": Icons.card_travel,
      "trailingIcon": Icons.more_vert,
    },
    {
      "title": "Logout",
      "titleStyle": TextStyle(
        color: Colors.blueGrey[900],
      ),
      "subtitle": " ",
      "leadingIcon": Icons.exit_to_app,
      "trailingIcon": Icons.more_vert,
    }
  ],
};
