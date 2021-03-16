import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nabungskuy/db/dbprovider.dart';
import 'package:nabungskuy/model/kategoriModel.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabungan Fom',
      home: TabunganForm(),
    );
  }
}

class TabunganForm extends StatefulWidget {
  @override
  _TabunganFormState createState() => _TabunganFormState();
}

class _TabunganFormState extends State<TabunganForm> {
  List<DropdownMenuItem<String>> list;

  checkPress() {
    list = [];
    NabungskuyDB.db.getData();
    NabungskuyDB.db.getData().then((listmap) {
      listmap.map((map) {
        return getDropdownWidget(map);
      }).forEach((dropdownitem) {
        setState(() {
          list.add(dropdownitem);
        });
      });
    });
  }

  DropdownMenuItem<String> getDropdownWidget(Map<String, dynamic> map) {
    return DropdownMenuItem<String>(
      value: map['title'],
      child: Text(map['title']),
    );
  }

  @override
  void initState() {
    super.initState();
    checkPress();
  }

  // List _myFriends = ["uang a", "uang b", "uang c"];
  String _valKategori;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Tabungan'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Title',
                    fillColor: Colors.blue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Text(
                      'Kategori',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Spacer(),
                    Container(
                      height: 40,
                      width: 150,
                      padding: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                        hint: Text("Pilih Kategori"),
                        isExpanded: true,
                        underline: SizedBox(),
                        value: _valKategori,
                        items: list,
                        onChanged: (value) {
                          setState(() {
                            _valKategori = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nominal',
                    fillColor: Colors.blue,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                    labelText: 'Deskripsi',
                    fillColor: Colors.blue,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  checkPress();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.send, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
