import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kategori Form',
      home: KategoriForm(),
    );
  }
}

class KategoriForm extends StatefulWidget {
  @override
  _KategoriFormState createState() => _KategoriFormState();
}

class _KategoriFormState extends State<KategoriForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Add Kategori'),
      ),
    );
  }
}