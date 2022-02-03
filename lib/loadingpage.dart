import 'package:flutter/material.dart';
import 'dart:async';
import 'main.dart';
import 'layout/HomePage.dart';

class loadingpage extends StatefulWidget {
  const loadingpage({Key? key, String? title}) : super(key: key);

  @override
  _loadingpageState createState() => _loadingpageState();
}

class _loadingpageState extends State<loadingpage> {
  int currenttime = 10;
  late Timer t;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    t = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        currenttime--;
      });
      if (currenttime <= 0) {
        JumpToMainPage();
      }
    });
  }

  void JumpToMainPage() {
    t.cancel();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MyHomePage(title: 'roommagement'),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Image.asset('assets/images/back.png',
             fit: BoxFit.cover,
             width: MediaQuery.of(context).size.width,
             )
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 5,
            child: InkWell(
              child: _clipButton(),
              onTap: JumpToMainPage,
            ),
          )
        ],
      ),
    );
  }

  Widget _clipButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Exit',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text('${currenttime}s',
                style: TextStyle(color: Colors.white, fontSize: 12))
          ],
        ),
      ),
    );
  }
}
