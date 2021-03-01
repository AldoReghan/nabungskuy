import 'package:flutter/material.dart';

class CardItems extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final int nominal;
  final backgroundcolor;
  final textcolor;

  const CardItems(
      {Key key,
      this.judul,
      this.deskripsi,
      this.nominal,
      this.backgroundcolor,
      this.textcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
      color: backgroundcolor,
      elevation: 3.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: deskripsi == null || nominal == null ? 20 : 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    judul,
                    style: TextStyle(
                        color: textcolor, fontWeight: FontWeight.bold),
                  )),
                  deskripsi == null || nominal == null
                      ? Container()
                      : Expanded(
                          child: Text(
                          deskripsi,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(color: textcolor),
                        )),
                ],
              ),
            ),
            Spacer(),
            deskripsi == null || nominal == null
                ? Container()
                : Text('Rp. ' + nominal.toString(),
                    style: TextStyle(
                        color: textcolor, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    ));
  }
}
