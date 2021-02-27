import 'package:flutter/material.dart';

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
  String _valFriends;
  List _myFriends = [
    "Uang tabungan",
    "Uang darurat",
    "Uang kuliah",
    "Uang harian dan ngops",
  ];

  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Tabungan'),
      ),
      body: Column(
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
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
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
                      value: _valFriends,
                      items: _myFriends.map((value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _valFriends = value;
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
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
