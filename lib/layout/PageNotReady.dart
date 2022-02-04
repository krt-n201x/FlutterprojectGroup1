import 'package:flutter/material.dart';

class pagenotready extends StatefulWidget {
  const pagenotready({Key? key}) : super(key: key);

  @override
  _pagenotreadyState createState() => _pagenotreadyState();
}

class _pagenotreadyState extends State<pagenotready> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 4),
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(" ",
                        style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                            color: Colors.deepPurple[400])),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.deepPurple[400],
                      size: 50.0,
                    ),
                    Text("Oops!, This page is not ready",
                        style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontSize: 12,
                            color: Colors.deepPurple[400])),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(" ",
                    style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 12,
                        color: Colors.deepPurple[400])),
              ),
            ],
          ),
        ));
  }
}
