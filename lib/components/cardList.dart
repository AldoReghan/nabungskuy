import 'package:flutter/material.dart';

Widget cardList() {
  return GestureDetector(
    onTap: () => print("object"),
    child: Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Uang kuliah",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text("pendidikan"),
                SizedBox(height: 5),
                Text(
                  "uang kuliah bulan oktober",
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "Rp.5.600.0000",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
