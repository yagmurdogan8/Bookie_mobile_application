import 'package:flutter/material.dart';

class circularProgress extends StatelessWidget {
  const circularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150.0,
              child: Stack(
                children: <Widget>[
                  Center(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          value: .25,
                          backgroundColor: Colors.green[700],
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.lightGreenAccent),
                        ),
                      )),
                  const Center(
                      child: Text(
                        '%75',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}