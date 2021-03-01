import 'package:flutter/material.dart';
import 'package:nabungskuy/components/cardItems.dart';
import 'package:nabungskuy/page/tabunganPage/tabunganForm.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabungan List',
      home: TabunganList(),
    );
  }
}

class TabunganList extends StatefulWidget {
  @override
  _TabunganListState createState() => _TabunganListState();
}

class _TabunganListState extends State<TabunganList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabungan List'),
      ),
      body: Padding(
              padding: const EdgeInsets.only(top: 8, left: 8.0, right: 8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                child: ListView(
                  children: [
                    CardItems(
                      judul: 'uang Pendidikan',
                      deskripsi: 'Uang kuliah bulan februari',
                      nominal: 50000,
                      backgroundcolor: Colors.red,
                    ),
                    CardItems(
                      judul: 'uang Pendidikan',
                      deskripsi: 'Uang kuliah bulan februari',
                      nominal: 50000,
                      backgroundcolor: Colors.blue,
                    ),
                    CardItems(
                      judul: 'uang Pendidikan',
                      deskripsi: 'Uang kuliah bulan februari',
                      nominal: 50000,
                      backgroundcolor: Colors.orange,
                    )
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TabunganForm()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}