import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/services.dart';
import 'package:roommanagement/element/CustomAppBar.dart';
import 'package:roommanagement/layout/PageNotReady.dart';
import 'package:roommanagement/layout/ChartPage.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'element/AppbarPainter.dart';
import 'element/card.dart';
import 'layout/HomePage.dart';

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
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          backgroundColor: Colors.deepPurple[400],
          elevation: 0.0,
          title: const Text('ROOM MANAGEMENT',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'WorkSans',
                  fontWeight: FontWeight.w500)),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            Homepage(),
            pagenotready(),
            pagenotready(),
            pagenotready()
          ],
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Colors.deepPurple[400],
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.insert_chart_outlined_rounded),
              title: const Text("Consumption"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.circle_notifications),
              title: const Text("Notification"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
