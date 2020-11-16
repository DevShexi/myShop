import 'package:flutter/material.dart';

getBottomNavigation(model, _selectedindex, onItemTap) {
  return BottomNavigationBar(
    backgroundColor: model["bottomNavAttributes"]["backgroundColor"],
    type: model["bottomNavAttributes"]["type"],
    selectedItemColor: model["bottomNavAttributes"]["selectedItemColor"],
    selectedLabelStyle: model["bottomNavAttributes"]["selectedLabelStyle"],
    unselectedItemColor: model["bottomNavAttributes"]["unselectedItemColor"],
    unselectedLabelStyle: model["bottomNavAttributes"]["unselectedLabelStyle"],
    items: getBottomNavigationBarItem(model['navBarItems']),
    currentIndex: _selectedindex,
    onTap: onItemTap,
  );
}

List<BottomNavigationBarItem> getBottomNavigationBarItem(items) {
  List<BottomNavigationBarItem> _items = [];
  items.forEach(
    (item) {
      _items.add(
        BottomNavigationBarItem(
          icon: item["icon"],
          activeIcon: item["activeIcon"],
          label: item["label"],
        ),
      );
    },
  );
  return _items;
}
