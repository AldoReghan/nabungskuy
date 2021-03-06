import 'package:flutter/material.dart';
import 'package:nabungskuy/components/cardInOut.dart';

Widget stackHeaderList(BuildContext context, int nominals) {
  String nominal = nominals.toString();
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'Total uang keseluruhan : ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Rp. '+nominal,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
      CardInOut(nominalPemasukan: 100000, nominalKeluaran: 25000000,)
    ],
  );
}
