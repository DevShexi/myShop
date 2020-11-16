import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model.dart';
import '../../../DrawerBuilder/drayerBuilder.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool search = false;
  @override
  initState() {
    fetchUser();
    super.initState();
  }

  fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('username');
    });
  }

  String userName;
  String title = 'Dashboard';
  static int _selectedindex = 0;
  List<Widget> options = <Widget>[
    Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Dash Board'),
        ),
      ),
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

  navItem(IconData icon, IconData activeIcon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        //color: Colors.grey,
      ),
      activeIcon: Icon(
        activeIcon,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          search == false
              ? Builder(
                  builder: (context) => IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
                )
              : SizedBox(),
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
                //style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.all(12),
                  fillColor: Colors.grey[200],
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
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
          children: getDrawerItems(drawerModel, context),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: getEndDrawerItems(drawerModel, context),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          color: Colors.white,
        ),
        unselectedItemColor: Colors.blueGrey,
        unselectedLabelStyle: TextStyle(
          color: Colors.blueGrey,
        ),
        items: <BottomNavigationBarItem>[
          navItem(Icons.dashboard, Icons.dashboard, 'Dashboard'),
          navItem(Icons.message, Icons.message, 'Messages'),
          navItem(Icons.attach_money, Icons.attach_money, 'Accounts'),
          navItem(Icons.settings, Icons.settings, 'Settings'),
        ],
        currentIndex: _selectedindex,
        onTap: onItemTap,
      ),
    );
  }
}
