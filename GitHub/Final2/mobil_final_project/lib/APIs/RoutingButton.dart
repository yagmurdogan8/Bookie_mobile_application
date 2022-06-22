import 'package:flutter/material.dart';

class RoutingButton extends StatelessWidget {
  final Function onTapFunc;
  final IconData icon;
  final String text;
  const RoutingButton({Key? key, required this.onTapFunc, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 180.0,
        height: 120.0,
        child: GestureDetector(
          onTap: () {
            this.onTapFunc();},
          child: Card(
            color: Colors.green[100],
            elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        this.icon,
                        color: Colors.green[800],
                        size: 50.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        this.text,
                        style: TextStyle(
                            color: Colors.green[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}