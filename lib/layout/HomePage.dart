import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../element/card.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<String> getData() async {
      String data = await rootBundle.loadString('assets/data.json');
      return data;
    }

    return Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = json.decode(snapshot.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return RoomCard(
                      data[index]['roomNum'],
                      data[index]['peopleNum'],
                      data[index]['price'],
                    );
                  },
                  itemCount: data.length,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
            future: getData(),
          ),
        ));
  }
}
