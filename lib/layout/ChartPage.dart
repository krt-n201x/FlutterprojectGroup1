// ignore_for_file: prefer_final_fields, camel_case_types, import_of_legacy_library_into_null_safe, unnecessary_import, unused_import

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echart/flutter_echart.dart';
import 'package:roommanagement/element/chart.dart';

// Color mainColor = Color(0xff7E57C2);

class chartpage extends StatefulWidget {
  const chartpage({Key? key}) : super(key: key);

  @override
  _chartpageState createState() => _chartpageState();
}

class _chartpageState extends State<chartpage> {
  Future<String> getData() async {
    String data = await rootBundle.loadString('assets/consumption.json');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Stack(
          // alignment: Alignment.center,
          children: [
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = json.decode(snapshot.data.toString());
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                          child: Column(
                            children: [
                              Text(data[index]['mount'].toString(),
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontFamily: 'WorkSans',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.deepPurple[400])),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 260,
                                child: buildPieChatWidget(
                                  int.parse(data[index]['water']),
                                  int.parse(data[index]['electricity']),
                                  int.parse(data[index]['internet']),
                                  int.parse(data[index]['property']),
                                ),
                              ),
                            ],
                          ));
                    },
                    itemCount: data.length,
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
              future: getData(),
            ),
            // Container(

            //   width: MediaQuery.of(context).size.width,
            //   child: buildPieChatWidget(_dataList),
            // ),
          ],
        ),
      ),
    );
  }
}
