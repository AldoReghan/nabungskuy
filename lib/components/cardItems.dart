import 'package:flutter/material.dart';

class CardItems extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final int nominal;
  final colors;

  const CardItems(
      {Key key, this.judul, this.deskripsi, this.nominal, this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      color: colors,
      elevation: 3.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    judul,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                  Expanded(
                      child: Text(
                    deskripsi,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(color: Colors.white),
                  )),
                ],
              ),
            ),
            Spacer(),
            Text('Rp. ' + nominal.toString(),
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    ));
  }
}
