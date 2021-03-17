import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:nabungskuy/db/dbprovider.dart';
import 'package:nabungskuy/model/kategoriModel.dart';
import 'package:nabungskuy/model/pemasukanModel.dart';

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

  TextEditingController titleController = TextEditingController();
  TextEditingController nominalController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  //setup dropdown list from sqlite
  List<DropdownMenuItem<String>> list;
  List listAll;
  String _valKategori;

  checkPress() {
    list = [];
    listAll = [];
    NabungskuyDB.db.getData();
    NabungskuyDB.db.getData().then((listmap) {
      listmap.map((map) {
        return getDropdownWidget(map);
      }).forEach((dropdownitem) {
        setState(() {
          list.add(dropdownitem);
          listAll.add(dropdownitem);
        });
      });
    });
  }

  DropdownMenuItem<String> getDropdownWidget(Map<String, dynamic> map) {
    return DropdownMenuItem<String>(
      value: map['idkategori'].toString(),
      child: Text(map['title']),
    );
  }
  //end of setup dropdowwnlist

  snackBar(String title, String message){
    Flushbar(
      title: title,
      message: message,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(8),
      borderRadius: 8,
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.blue[300],
      ),
      leftBarIndicatorColor: Colors.blue[300],
    )..show(context);
  }

  insertExecute(){
    final datalist = PemasukanModel(
      title: titleController.text,
      idkategori: int.parse(_valKategori),
      nominal: nominalController.text,
      deskripsi: deskripsiController.text
    );

    if(titleController.text == ""){
      snackBar("Title","Title tidak boleh kosong");
    }if(_valKategori == null){
      snackBar("Kategori","Kategori tidak boleh kosong");
    }if(nominalController.text == ""){
      snackBar("Nominal","Nominal tidak boleh kosong");
    }if(deskripsiController.text == ""){
      snackBar("Deskripsi","Deskripsi tidak boleh kosong");
    }else {
      NabungskuyDB.db.insertPemasukan(datalist);
      print('sukses insert');
    }

  }

  @override
  void initState() {
    super.initState();
    checkPress();
  }

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
                controller: titleController,
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
                controller: nominalController,
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
                controller: deskripsiController,
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
                  insertExecute();
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
