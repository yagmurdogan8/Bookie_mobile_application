import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_final_project/screens/Drawer.dart';

class anna extends StatefulWidget {
  @override
  _annaState createState() => _annaState();
}

class _annaState extends State<anna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Anna Karenina'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                Image(image: AssetImage('assets/anna.jpg')),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 15.0,0.0, 15.0),
                  child: Divider(color: Colors.green[200], thickness: 8,),
                ),
                Text(
                  'Name of the Book: Anna Karenina \n\nAuthor: Lev Tolstoy '
                      '\n\nNumber of Pages: 1062',
                  style: TextStyle(color: Colors.green[800], fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
