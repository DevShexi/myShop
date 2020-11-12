import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  menuItem(String menuName, IconData icon, Function func) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: ListTile(
        //tileColor: kLight,
        trailing: Icon(
          icon,
          // color: kGrey,
        ),
        title: Text(
          '$menuName',
          style: TextStyle(
              //  color: kGrey,
              ),
        ),
        onTap: () {
          func();
        },
      ),
    );
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
        centerTitle: true,
        title: Text(
          '$title',
          style: TextStyle(
            color: Colors.white,
            //fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: options.elementAt(_selectedindex),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      color: Colors.white,
                      size: 80,
                    ),
                    Text(
                      '$userName'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              //decoration: BoxDecoration(color: kTeal),
            ),
            menuItem('Profile', Icons.account_box, () {
              Navigator.pushNamed(context, '/profile');
            }),
            menuItem('Products', Icons.account_box, () {
              Navigator.pop(context);
            }),
            menuItem('Categories', Icons.account_box, () {
              Navigator.pop(context);
            }),
            menuItem('Promotions', Icons.account_box, () {
              Navigator.pop(context);
            }),
            menuItem('Accounts', Icons.account_box, () {
              Navigator.pop(context);
            }),
            menuItem('Shops', Icons.account_box, () {
              Navigator.pop(context);
            }),
            menuItem('Services', Icons.account_box, () {
              Navigator.pop(context);
            }),
            menuItem('Logout', Icons.exit_to_app, onLogout),
          ],
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
