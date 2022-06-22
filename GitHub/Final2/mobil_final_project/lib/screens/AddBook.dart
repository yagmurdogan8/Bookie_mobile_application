import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobil_final_project/screens/Drawer.dart';

class AddBook extends StatefulWidget {
  @override
  _AddBookState createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  late Query ref = FirebaseFirestore.instance
      .collection('books')
      .where('uid', isEqualTo: auth.currentUser?.uid);
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Scaffold(
              endDrawer: MyDrawer(),
              appBar: AppBar(
                leading: BackButton(),
                title: const Text('Add & Display Books'),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AddBookName()));
                },
              ),
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: StreamBuilder(
                    stream: ref.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return ListView.builder(
                          itemCount:
                              snapshot.hasData ? snapshot.data?.docs.length : 0,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => EditBook(
                                            docToEdit: (snapshot.data!
                                                    as QuerySnapshot)
                                                .docs[index])));
                              },
                              child: Container(
                                margin: EdgeInsets.all(20),
                                color: Colors.white70,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Text('  Name of the Book: ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 3),
                                    Text(
                                        '   ' +
                                            snapshot.data?.docs[index]['name'],
                                        style: TextStyle(fontSize: 15)),
                                    SizedBox(height: 15),
                                    Text('  Number of Pages: ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 3),
                                    Text(
                                        '   ' +
                                            snapshot.data?.docs[index]['pages'],
                                        style: TextStyle(fontSize: 15)),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              ));
        });
  }
}

class AddBookName extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController pages = TextEditingController();
  TextEditingController uid = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('books');
  FirebaseAuth auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Add'),
        actions: [
          FlatButton(
              onPressed: () async {
                FirebaseFirestore.instance
                    .collection("books")
                    .doc(name.text)
                    .set({
                  'uid': auth.currentUser?.uid,
                  'name': name.text,
                  'pages': pages.text,
                }).whenComplete(() => Navigator.pop(context));
              },
              child: Text('Save'),
              textColor: Colors.white)
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.green),
                  color: Colors.white70,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: uid,
                    decoration: InputDecoration(hintText: "  Name of the user"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.green),
                  color: Colors.white70,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(hintText: " Name of the book"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white70),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: pages,
                    decoration: InputDecoration(hintText: " Number of Pages"),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus &&
                          currentFocus.focusedChild != null) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditBook extends StatefulWidget {
  DocumentSnapshot docToEdit;

  EditBook({required this.docToEdit});

  @override
  _EditBookState createState() => _EditBookState();
}

class _EditBookState extends State<EditBook> {
  TextEditingController name = TextEditingController();
  TextEditingController pages = TextEditingController();

  @override
  void initState() {
    name = TextEditingController(text: widget.docToEdit['name']);
    pages = TextEditingController(text: widget.docToEdit['pages']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Edit'),
        actions: [
          FlatButton(
              onPressed: () {
                widget.docToEdit.reference
                    .delete()
                    .whenComplete(() => Navigator.pop(context));
              },
              child: Text('Delete'),
              textColor: Colors.white),
          FlatButton(
              onPressed: () {
                widget.docToEdit.reference.update({
                  'name': name.text,
                  'pages': pages.text
                }).whenComplete(() => Navigator.pop(context));
              },
              child: Text('Save'),
              textColor: Colors.white),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.green),
                  color: Colors.white70,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(hintText: " Name of the user"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.green),
                  color: Colors.white70,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: pages,
                    decoration: InputDecoration(hintText: " Number of Pages"),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus &&
                          currentFocus.focusedChild != null) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
