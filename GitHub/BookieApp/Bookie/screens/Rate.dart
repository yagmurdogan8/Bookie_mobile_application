import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_final_project/screens/Drawer.dart';

class rate extends StatefulWidget {
  @override
  _rateState createState() => _rateState();
}

class _rateState extends State<rate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
      appBar: AppBar(
        leading: BackButton(),
        title: const Text('Rate'),
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
                  padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                  child: Divider(color: Colors.green[200], thickness: 5),
                ),
                Text(
                  'Name of the Book: Anna Karenina \n\nAuthor: Lev Tolstoy '
                      '\n\nNumber of Pages: 1062\n',
                  style: TextStyle(color: Colors.green[800], fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                Divider(color: Colors.green[200], thickness: 5),
                Center(
                  child: Row(
                    children: [
                      Icon(Icons.star_rate, color: Colors.green[800], size: 30),
                      Icon(Icons.star_rate, color: Colors.green[800], size: 30),
                      Icon(Icons.star_rate, color: Colors.green[800], size: 30),
                      Icon(Icons.star_rate, color: Colors.grey, size: 30),
                      Icon(Icons.star_rate, color: Colors.grey, size: 30),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
