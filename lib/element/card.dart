import 'package:flutter/material.dart';

Widget RoomCard(String roomNum, String peopleNum, String price) {
  return Container(
    margin: const EdgeInsets.only(top: 4),
    padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
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
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
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
                        fontSize: 12,
                        color: Colors.deepPurple[400])),
                Text(roomNum,
                    style: TextStyle(
                        fontFamily: 'WorkSans',
                        fontSize: 36,
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
                      size: 30.0,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(peopleNum,
                        style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontSize: 12,
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
                    fontSize: 12,
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
                    size: 30.0,
                  ),
                ],
              ))
        ],
      ),
    ),
  );
}
