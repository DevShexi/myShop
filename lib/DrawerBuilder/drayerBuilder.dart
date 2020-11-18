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
  List<Widget> endDrawerItems = [];
  endDrawerItems.add(
    endDrawerHeader(model['drawer']['drawerHeader']),
  );
  endDrawerItems.add(Divider(
    height: 3,
    color: Colors.blueGrey[800],
  ));
  model['drawer']["menuItems"].forEach((entity) {
    endDrawerItems.add(
      menuItem(entity, context),
    );
  });
  endDrawerItems.add(Divider(
    height: 3,
    color: Colors.blueGrey[800],
  ));
  model['drawer']["menuItems"].forEach((entity) {
    endDrawerItems.add(
      menuItem(entity, context),
    );
  });
  return endDrawerItems;
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

endDrawerHeader(entity) {
  return DrawerHeader(
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
        // color: entity['headercolor'],
        ),
    child: Container(
      // color: Colors.amber[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.account_circle,
            color: Colors.blueGrey[800],
            size: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Welcome'.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.blueGrey[800],
                  ),
                ),
                Text(
                  '17 November, 2020',
                  style: TextStyle(
                    color: Colors.blueGrey[800],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
