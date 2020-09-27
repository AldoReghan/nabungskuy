import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Welcome Aldo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total uang keseluruhan : ',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Rp. 50.000.000',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50)),
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "Tambah",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))
                            ],
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: Container(
                    alignment: Alignment.center,
                    height: 70,
                    margin: EdgeInsets.only(top: 100),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 40, top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.arrow_downward, color: Colors.green,),
                                  Text('Pemasukan', style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold
                                  ),),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Rp. 10.000.000', style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 40, top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.arrow_upward, color: Colors.red,),
                                  Text('Pengeluaran', style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold
                                  ),),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Rp. 11.000.000',style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                child: Row(
                  children: [
                    Text(
                      "Activity",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Spacer(),
                    Text(
                      "Show All",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:16.0, right: 16.0),
              child: Container(
                height: 430,
                color: Colors.red,
                child: ListView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
