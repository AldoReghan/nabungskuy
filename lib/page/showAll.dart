import 'package:flutter/material.dart';
import 'package:nabungskuy/components/cardItems.dart';
import 'package:nabungskuy/page/showAllPages/pemasukanPage.dart';
import 'package:nabungskuy/page/showAllPages/pengeluaranPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'show all',
      home: ShowAll(),
    );
  }
}

class ShowAll extends StatefulWidget {
  @override
  _ShowAllState createState() => _ShowAllState();
}

class _ShowAllState extends State<ShowAll> {
  int touchedIndex;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Pemasukan'),
    Tab(text: 'Pengeluaran'),
  ];

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: myTabs.length,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Show All'),
            bottom: TabBar(
              tabs: myTabs,
            ),
          ),
          body: TabBarView(
            children: [PemasukanPage(), PengeluaranPage()],
          ),
        ));
  }
}
