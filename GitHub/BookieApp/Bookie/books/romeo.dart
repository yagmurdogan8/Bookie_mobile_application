import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_final_project/screens/Drawer.dart';

class romeo extends StatefulWidget {
  @override
  _romeoState createState() => _romeoState();
}

class _romeoState extends State<romeo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Romeo & Juliet'),
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
                Image(image: AssetImage('assets/romeo.jpg')),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 15.0,0.0, 15.0),
                  child: Divider(color: Colors.green[200], thickness: 8,),
                ),
                Text(
                  'Name of the Book: Romeo & Juliet \n\nAuthor: William Shakespeare \n\nNumber of Pages: 133',
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
