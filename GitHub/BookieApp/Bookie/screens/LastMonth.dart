import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_final_project/screens/Drawer.dart';

class LastMonth extends StatefulWidget {
  @override
  _LastMonthState createState() => _LastMonthState();
}

class _LastMonthState extends State<LastMonth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Last Month'),
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
                Text(
                  '''Last Month You've read: ''', style: TextStyle(
                  color: Colors.green[800], fontSize: 25, fontWeight: FontWeight.bold
                ),
                ),
                Divider(color: Colors.green[200], thickness: 8),
                Text(
                  '\nSimyaci \n\nFahrenheit \n\nAnna Karenina',
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
