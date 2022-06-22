import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_final_project/screens/LastMonth.dart';
import 'package:mobil_final_project/screens/Rate.dart';
import 'AddBook.dart';
import '../APIs/Authentication.dart';
import 'Menu.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Authentication _authService = Authentication();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.green,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/book.png'),
              ),
            ),
            const Divider(color: Colors.white54, thickness: 20),
            ListTile(
              leading: Icon(Icons.menu, color: Colors.white, size: 30),
              title: const Text(
                'Main Menu',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Dashboard(),
                ));
              },
            ),
            Divider(
              color: Colors.white54,
              thickness: 3,
            ),
            ListTile(
              leading:
              Icon(Icons.menu_book, color: Colors.white, size: 30),
              title: const Text(
                'Add & Display Books',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddBook(),
                ));
              },
            ),
            ListTile(
              leading:
              Icon(Icons.star_rate, color: Colors.white, size: 30),
              title: const Text(
                'Rate',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => rate(),
                ));
              },
            ),
            ListTile(
              leading:
              Icon(Icons.hourglass_top, color: Colors.white, size: 30),
              title: const Text(
                'Last Month',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LastMonth(),
                ));
              },
            ),
            Divider(
              color: Colors.white54,
              thickness: 3,
            ),
            ListTile(
              leading:
              Icon(Icons.logout_outlined, color: Colors.white, size: 30),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                _authService.signOut();
                Navigator.pop(context);
                _authService.signOut();
                Navigator.pop(context);
              },
            ),
           ],
        ),
       ),
    );
  }
}
