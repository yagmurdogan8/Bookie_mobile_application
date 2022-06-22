import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_final_project/APIs/circle.dart';
import 'package:mobil_final_project/books/bookDetail.dart';
import 'package:mobil_final_project/screens/LastMonth.dart';
import 'package:mobil_final_project/screens/Rate.dart';
import 'package:mobil_final_project/APIs/RoutingButton.dart';
import '../APIs/RoutingButton.dart';
import 'AddBook.dart';
import '../APIs/Authentication.dart';
import 'Drawer.dart';
import 'package:flutter/rendering.dart';

class Dashboard extends StatelessWidget {
  Authentication _authService = Authentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Menu',
            style: TextStyle(fontSize: 23.0),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
              height: MediaQuery.of(context).size.height * 1.7,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Your Completion Rate:',
                        style: TextStyle(
                            color: Colors.green[800],
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                  const Align(
                    alignment: Alignment.center,
                    child: circularProgress(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: Colors.green[200], thickness: 1),
                  ),
                  /** SCROLLVIEW RECOMMENDED BOOKS **/
                  Center(
                    child: SizedBox(
                      child: Text(
                        'Recommended Books:',
                        style: TextStyle(
                            color: Colors.green[800],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(color: Colors.green[200], thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 200,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 140,
                                child: IconButton(
                                  icon: Image.asset('assets/1984.jpg'),
                                  iconSize: 200,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const BookDetail(
                                              name: '1984',
                                              cover: AssetImage(
                                                  'assets/1984.jpg'),
                                              author: 'George Orwell',
                                              page: '352')),
                                    );
                                  },
                                )),
                            SizedBox(
                                width: 150,
                                child: IconButton(
                                  icon: Image.asset('assets/anna.jpg'),
                                  iconSize: 200,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const BookDetail(
                                              name: 'Anna Karenina',
                                              cover: AssetImage(
                                                  'assets/anna.jpg'),
                                              author: 'Lev Tolstoy',
                                              page: '1062')),
                                    );
                                  },
                                )),
                            SizedBox(
                                width: 140,
                                child: IconButton(
                                  icon: Image.asset('assets/romeo.jpg'),
                                  iconSize: 200,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const BookDetail(
                                              name: 'Romeo & Juliet',
                                              cover: AssetImage(
                                                  'assets/romeo.jpg'),
                                              author: 'William Shakespeare',
                                              page: '133')),
                                    );
                                  },
                                )),
                            SizedBox(
                                width: 150,
                                child: IconButton(
                                  icon: Image.asset('assets/dortler.jpg'),
                                  iconSize: 200,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const BookDetail(
                                              name: 'Dörtlerin İmzası',
                                              cover: AssetImage(
                                                  'assets/dortler.jpg'),
                                              author:
                                              'Sir Arthur Conan Doyle',
                                              page: '176')),
                                    );
                                  },
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(color: Colors.green[200], thickness: 2),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20.0,
                        children: <Widget>[
                          /** ADD & DISPLAY BOOK CARD **/
                          RoutingButton(
                              icon: Icons.menu_book,
                              text: "Add & Display Books",
                              onTapFunc: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddBook()),
                                );
                              }),
                          /** RATE CARD **/
                          RoutingButton(
                              text: 'Rate',
                              icon: Icons.star_rate,
                              onTapFunc: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => rate()),
                                );
                              }),
                          /** LAST MONTH CARD **/
                          RoutingButton(
                            icon: Icons.hourglass_top,
                            text: 'Last Month',
                            onTapFunc: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                  builder: (context) => LastMonth()),
                              );
                            }),
                          /** LOGOUT CARD **/
                          RoutingButton(
                            icon: Icons.login_outlined,
                            text: 'Logout',
                            onTapFunc: () {
                              _authService.signOut();
                              Navigator.pop(context);
                            },
                          ),

                        ],
                      ),
                    ),
                  )
                  // )
                ],
              )),
        ));
  }
}
