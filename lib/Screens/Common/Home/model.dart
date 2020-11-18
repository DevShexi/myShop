import 'package:flutter/material.dart';

//Homapage Model contains model data for Side Drawer, End Drawer, Bottom Navigation, Tabs etc
Map commonModel = {
  "drawer": {
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
  },
  "bottomNav": {
    "bottomNavAttributes": {
      "backgroundColor": Colors.blueGrey[800],
      "type": BottomNavigationBarType.fixed,
      "selectedItemColor": Colors.white,
      "selectedLabelStyle": TextStyle(
        color: Colors.white,
      ),
      "unselectedItemColor": Colors.blueGrey,
      "unselectedLabelStyle": TextStyle(
        color: Colors.blueGrey,
      ),
    },
    "navBarItems": [
      {
        "icon": Icon(
          Icons.dashboard,
          color: Colors.blueGrey,
        ),
        "activeIcon": Icon(Icons.dashboard, color: Colors.white),
        "label": "Dashboard"
      },
      {
        "icon": Icon(
          Icons.message,
          color: Colors.blueGrey,
        ),
        "activeIcon": Icon(Icons.message, color: Colors.white),
        "label": "Messages"
      },
      {
        "icon": Icon(
          Icons.attach_money,
          color: Colors.blueGrey,
        ),
        "activeIcon": Icon(Icons.attach_money, color: Colors.white),
        "label": "Accounts"
      },
      {
        "icon": Icon(
          Icons.settings,
          color: Colors.blueGrey,
        ),
        "activeIcon": Icon(Icons.settings, color: Colors.white),
        "label": "Settings"
      }
    ]
  },
  "tabs": [
    Tab(
      icon: Icon(Icons.attach_money),
    ),
    Tab(
      icon: Icon(Icons.shopping_cart),
    ),
    Tab(
      icon: Icon(Icons.list_alt),
    ),
    Tab(
      icon: Icon(Icons.history),
    ),
  ],
};
