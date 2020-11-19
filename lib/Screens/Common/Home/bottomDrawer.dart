import 'package:flutter/material.dart';

getBottomDrawer(bool drawerEnabled, context) {
  return AnimatedPositioned(
    duration: Duration(milliseconds: 250),
    curve: Curves.fastOutSlowIn,
    bottom: !drawerEnabled ? -(MediaQuery.of(context).size.height) : 0,
    child: ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        color: Colors.grey[300],
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 25,
              color: Colors.white,
            )
          ],
        ),
      ),
    ),
  );
}
