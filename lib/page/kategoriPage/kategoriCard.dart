import 'package:flutter/material.dart';
import 'package:nabungskuy/model/kategoriModel.dart';

Card cardo(KategoriModel kategoriModel){
  return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red,
          child: Icon(Icons.people),
        ),
        title: Text(
          kategoriModel.title,
        ),
      ),
    );
}