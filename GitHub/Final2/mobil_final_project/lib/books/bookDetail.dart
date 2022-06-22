import 'package:flutter/material.dart';
import 'package:mobil_final_project/screens/Drawer.dart';

class BookDetail extends StatelessWidget {
  final String name;
  final AssetImage cover;
  final String author;
  final String page;

  const BookDetail(
      {Key? key,
        required this.name,
        required this.cover,
        required this.author,
        required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(name),
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
                Image(image: cover),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                  child: Divider(
                    color: Colors.green[200],
                    thickness: 4,
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(
                      'Name of the book: ',
                      style: Theme.of(context).textTheme.bodyText1
                  ),
                  Text(name,
                      style: Theme.of(context).textTheme.bodyText2)
                ]),
                const Divider(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(
                    'Author: ',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(author,
                      style: Theme.of(context).textTheme.bodyText2)
                ]),
                const Divider(),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(
                    'Number of pages: ',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                      '133',
                      style: Theme.of(context).textTheme.bodyText2
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
