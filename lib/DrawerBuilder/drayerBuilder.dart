import 'package:flutter/material.dart';

getDrawerItems(model, context) {
  List<Widget> drawerItems = [];
  drawerItems.add(
    drawerHeader(model['drawer']['drawerHeader']),
  );
  model['drawer']["menuItems"].forEach((entity) {
    drawerItems.add(
      menuItem(entity, context),
    );
  });
  return drawerItems;
}

getEndDrawerItems(model, context) {
  List<Widget> drawerItems = [];
  // drawerItems.add(
  //   drawerHeader(model['drawer']['drawerHeader']),
  // );
  model['drawer']["menuItems"].forEach((entity) {
    drawerItems.add(
      menuItem(entity, context),
    );
  });
  return drawerItems;
}

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

menuItem(entity, context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: ListTile(
      trailing: Icon(entity['trailingIcon']),
      leading: Icon(entity['leadingIcon']),
      title: Text(
        entity['title'],
        style: entity['titleStyle'],
      ),
      onTap: () {
        Navigator.pop(context);
      },
    ),
  );
}
