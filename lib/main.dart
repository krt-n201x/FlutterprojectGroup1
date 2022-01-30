import 'dart:convert';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Room management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Room management'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(15),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: FutureBuilder(
                builder: (context, snapshot) {
                  var data = json.decode(snapshot.data.toString());
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RoomCard(data[index]['roomNum'],
                          data[index]['peopleNum'], data[index]['price']);
                    },
                    
                  );
                },
                future:
                    DefaultAssetBundle.of(context).loadString('assets/data.json'),
              ),
            )),
      ),
    );
  }
}

Widget RoomCard(String roomNum, String peopleNum, String price) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
    height: 91,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 10,
          // offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      ),
      padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Room",
                    style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 16,
                        color: Colors.deepPurple[400])),
                Text(roomNum,
                    style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 48,
                        color: Colors.deepPurple[400],
                        height: 0.95,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_alt,
                      color: Colors.deepPurple[400],
                      size: 35.0,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(peopleNum,
                        style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontSize: 16,
                            color: Colors.deepPurple[400])),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text("Price: " + price + " Baht",
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 16,
                    color: Colors.deepPurple[400])),
          ),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.settings_outlined,
                    color: Colors.deepPurple[400],
                    size: 35.0,
                  ),
                ],
              ))

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Text(
          //       subtitle,
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //           fontSize: 15,
          //           color: Colors.grey,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ],
          // )
        ],
      ),
    ),
  );
}
