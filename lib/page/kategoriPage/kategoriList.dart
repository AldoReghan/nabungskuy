import 'package:flutter/material.dart';
import 'package:nabungskuy/components/cardItems.dart';
import 'package:nabungskuy/page/kategoriPage/kategoriForm.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kategori list',
      home: KategoriList(),
    );
  }
}

class KategoriList extends StatefulWidget {
  @override
  _KategoriListState createState() => _KategoriListState();
}

class _KategoriListState extends State<KategoriList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Kategori List'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:8, left: 8.0, right: 8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              CardItems(
                judul: 'Uang Pendidikan',
                deskripsi: '',
                nominal: null,
                backgroundcolor: Colors.red,
              ),
              CardItems(
                judul: 'Uang Darurat',
                deskripsi: '',
                nominal: null,
                backgroundcolor: Colors.blue,
              ),
              CardItems(
                judul: 'Uang Harian',
                deskripsi: '',
                nominal: null,
                backgroundcolor: Colors.orange,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => KategoriForm()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
