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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            RoomCard("301", "1"),
          ],
        ),
      ),
    );
  }
}

Widget RoomCard(String RoomNumber, String PeopleNumber) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
    height: 91,
    width: 400,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Room",
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 16,
                    color: Colors.deepPurple[400])),
            Text(RoomNumber,
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 48,
                    color: Colors.deepPurple[400],
                    height: 0.95,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(
          width: 25,
        ),
        Column(
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
                Text(PeopleNumber,
                    style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 16,
                        color: Colors.deepPurple[400])),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 25,
        ),
        Text("Price: 3,500 Baht",
            style: TextStyle(
                fontFamily: 'WorkSans',
                fontSize: 16,
                color: Colors.deepPurple[400])),
        SizedBox(
          width: 25,
        ),
        Icon(
          Icons.settings_outlined,
          color: Colors.deepPurple[400],
          size: 35.0,
        ),
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
  );
}
