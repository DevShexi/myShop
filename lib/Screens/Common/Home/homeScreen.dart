import 'package:flutter/material.dart';
import 'package:myShop/BottomNavigationBuilder/bottomNavigationBuilder.dart';
import 'model.dart';
import 'bottomDrawer.dart';
import '../../../DrawerBuilder/drayerBuilder.dart';
import '../../../TabsBuilder/tabsBuilder.dart';
import '../../../PopupMenuBuilder/popupMenuBuilder.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool search = false;
  bool bottomDrawer = false;
  String userName;
  String title = 'Dashboard';
  static int _selectedindex = 0;
  List<Widget> options = <Widget>[
    getTabBar(
      commonModel,
      [
        Icon(Icons.attach_money),
        Icon(Icons.shopping_cart),
        Icon(Icons.list_alt),
        Icon(Icons.history),
      ],
    ),
    Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Messages'),
        ),
      ),
    ),
    Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Accounts'),
        ),
      ),
    ),
    Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Settings'),
        ),
      ),
    )
  ];
  void onItemTap(int index) {
    List<String> titles = ['Dashboard', 'Messages', 'Accounts', 'Settings'];
    setState(() {
      _selectedindex = index;
      title = titles[index];
    });
  }

  onLogout() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        //    backgroundColor: kLight,
        title: Text(
          'You will be logged out from myShop',
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            onPressed: () => Navigator.pop(context, false),
          ),
          RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              onPressed: () async {
                Navigator.popAndPushNamed(context, '/');
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onPanEnd: (details) {
          if (details.velocity.pixelsPerSecond.dy > 100) {
            setState(() {
              bottomDrawer = false;
            });
          } else if (details.velocity.pixelsPerSecond.dy < -100) {
            setState(() {
              bottomDrawer = true;
            });
          }
        },
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: search ? false : true,
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        search = !search;
                      });
                    },
                    icon: !search ? Icon(Icons.search) : Icon(Icons.close),
                  ),
                  search == false ? getPopupManuButton() : SizedBox(),
                ],
                centerTitle: true,
                title: search == false
                    ? Text(
                        '$title',
                        style: TextStyle(
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      )
                    : TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          //filled: true,
                          isDense: true,
                          contentPadding: EdgeInsets.all(12),
                          //fillColor: Colors.grey[200],
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white54),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                        ),
                      ),
                iconTheme: new IconThemeData(color: Colors.white),
              ),
              body: Center(
                child: options.elementAt(_selectedindex),
              ),
              drawer: Drawer(
                child: ListView(
                  children: getDrawerItems(commonModel, context),
                ),
              ),
              endDrawer: Drawer(
                child: ListView(
                  children: getEndDrawerItems(commonModel, context),
                ),
              ),
              bottomNavigationBar: getBottomNavigation(
                  commonModel["bottomNav"], _selectedindex, onItemTap),
            ),
            getBottomDrawer(bottomDrawer, context)
          ],
        ),
      ),
    );
  }
}
