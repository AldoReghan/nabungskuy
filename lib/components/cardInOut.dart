import 'package:flutter/material.dart';

class CardInOut extends StatelessWidget {

  final int nominalPemasukan;
  final int nominalKeluaran;

  const CardInOut({Key key, this.nominalPemasukan, this.nominalKeluaran}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.only(left: 30, right: 30, top: 10),
    child: Container(
      alignment: Alignment.center,
      height: 70,
      margin: EdgeInsets.only(top: 100),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 40, top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_downward,
                      color: Colors.green,
                    ),
                    Text(
                      'Pemasukan',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Rp. "+nominalPemasukan.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: 40, top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.red,
                    ),
                    Text(
                      'Pengeluaran',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Rp. '+nominalKeluaran.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );

  }
}