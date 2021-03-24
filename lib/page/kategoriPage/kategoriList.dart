import 'package:flutter/material.dart';
import 'package:nabungskuy/components/cardItems.dart';
import 'package:nabungskuy/db/dbprovider.dart';
import 'package:nabungskuy/model/kategoriModel.dart';
import 'package:nabungskuy/page/kategoriPage/kategoriEditForm.dart';
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
  Future future = NabungskuyDB.db.getKategoriList();
  List<KategoriModel> testKategori = [
    KategoriModel(
        title: 'uang bulanan',
        backgroundColor: '0xffffff',
        textColor: '0xffb74094')
  ];

  Future<void> _updateData() async {
    setState(() {
      future = NabungskuyDB.db.getKategoriList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Kategori List'),
      ),
      body: Container(
        height: 550,
        child: FutureBuilder<List<KategoriModel>>(
          future: future,
          builder: (BuildContext context,
              AsyncSnapshot<List<KategoriModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  KategoriModel item = snapshot.data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KategoriFormEdit(
                                    kategori: item,
                                    reload: _updateData,
                                  )));
                    },
                    child: Dismissible(
                      key: UniqueKey(),
                      background: Container(color: Colors.red),
                      onDismissed: (direction) {
                        NabungskuyDB.db.deleteKategori(item.idkategori);
                      },
                      child: CardItems(
                        judul: item.title,
                        deskripsi: '',
                        nominal: null,
                        backgroundcolor: Color(int.parse(item.backgroundColor)),
                        textcolor: Color(int.parse(item.textColor)),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => KategoriForm(
                        reload: _updateData,
                      )));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
