import 'package:flutter/material.dart';

Widget cardList(String namaTabungan, String kategori, String deskripsi, int nominals) {
  String nominal = nominals.toString();
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
                  namaTabungan,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(kategori),
                SizedBox(height: 5),
                Text(
                  deskripsi,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            "Rp."+nominal,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
